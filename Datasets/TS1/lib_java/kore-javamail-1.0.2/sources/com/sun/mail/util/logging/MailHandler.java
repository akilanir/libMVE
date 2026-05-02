package com.sun.mail.util.logging;

import com.sun.mail.imap.IMAPStore;
import com.sun.mail.smtp.SMTPTransport;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.net.InetAddress;
import java.net.URLConnection;
import java.net.UnknownHostException;
import java.nio.charset.Charset;
import java.security.AccessController;
import java.security.PrivilegedAction;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.ResourceBundle;
import java.util.logging.ErrorManager;
import java.util.logging.Filter;
import java.util.logging.Formatter;
import java.util.logging.Handler;
import java.util.logging.Level;
import java.util.logging.LogManager;
import java.util.logging.LogRecord;
import java.util.logging.SimpleFormatter;
import korex.activation.DataHandler;
import korex.activation.DataSource;
import korex.activation.FileTypeMap;
import korex.mail.Address;
import korex.mail.Authenticator;
import korex.mail.Message;
import korex.mail.MessagingException;
import korex.mail.Multipart;
import korex.mail.Part;
import korex.mail.PasswordAuthentication;
import korex.mail.SendFailedException;
import korex.mail.Session;
import korex.mail.Transport;
import korex.mail.internet.AddressException;
import korex.mail.internet.ContentType;
import korex.mail.internet.InternetAddress;
import korex.mail.internet.MimeBodyPart;
import korex.mail.internet.MimeMessage;
import korex.mail.internet.MimeMultipart;
import korex.mail.internet.MimePart;
import korex.mail.internet.MimeUtility;
import korex.mail.util.ByteArrayDataSource;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/logging/MailHandler.class */
public class MailHandler extends Handler {
    private static final Filter[] EMPTY_FILTERS;
    private static final Formatter[] EMPTY_FORMATTERS;
    private static final int MIN_HEADER_SIZE = 1024;
    private static final int offValue;
    private static final GetAndSetContext GET_AND_SET_CCL;
    private static final ThreadLocal<Level> MUTEX;
    private static final Level MUTEX_PUBLISH;
    private static final Level MUTEX_REPORT;
    private volatile boolean sealed;
    private boolean isWriting;
    private Properties mailProps;
    private Authenticator auth;
    private Session session;
    private LogRecord[] data;
    private int size;
    private int capacity;
    private Comparator<? super LogRecord> comparator;
    private Formatter subjectFormatter;
    private Level pushLevel;
    private Filter pushFilter;
    private volatile Filter[] attachmentFilters;
    private Formatter[] attachmentFormatters;
    private Formatter[] attachmentNames;
    private FileTypeMap contentTypes;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !MailHandler.class.desiredAssertionStatus();
        EMPTY_FILTERS = new Filter[0];
        EMPTY_FORMATTERS = new Formatter[0];
        offValue = Level.OFF.intValue();
        GET_AND_SET_CCL = new GetAndSetContext(MailHandler.class);
        MUTEX = new ThreadLocal<>();
        MUTEX_PUBLISH = Level.ALL;
        MUTEX_REPORT = Level.OFF;
    }

    public MailHandler() {
        init((Properties) null);
        this.sealed = true;
    }

    public MailHandler(int capacity) {
        init((Properties) null);
        this.sealed = true;
        setCapacity0(capacity);
    }

    public MailHandler(Properties props) {
        if (props == null) {
            throw new NullPointerException();
        }
        init(props);
        this.sealed = true;
        setMailProperties0(props);
    }

    @Override // java.util.logging.Handler
    public boolean isLoggable(LogRecord record) {
        int levelValue = getLevel().intValue();
        if (record.getLevel().intValue() < levelValue || levelValue == offValue) {
            return false;
        }
        Filter body = getFilter();
        if (body == null || body.isLoggable(record)) {
            return true;
        }
        return isAttachmentLoggable(record);
    }

    @Override // java.util.logging.Handler
    public void publish(LogRecord record) {
        if (tryMutex()) {
            try {
                if (isLoggable(record)) {
                    record.getSourceMethodName();
                    publish0(record);
                }
                return;
            } finally {
                releaseMutex();
            }
        }
        reportUnPublishedError(record);
    }

    private void publish0(LogRecord record) {
        boolean priority;
        Message msg;
        synchronized (this) {
            if (this.size == this.data.length && this.size < this.capacity) {
                grow();
            }
            if (this.size < this.data.length) {
                this.data[this.size] = record;
                this.size++;
                priority = isPushable(record);
                if (priority || this.size >= this.capacity) {
                    msg = writeLogRecords(1);
                } else {
                    msg = null;
                }
            } else {
                priority = false;
                msg = null;
            }
        }
        if (msg != null) {
            send(msg, priority, 1);
        }
    }

    /* JADX WARN: Finally extract failed */
    private void reportUnPublishedError(LogRecord record) {
        String msg;
        if (MUTEX_PUBLISH.equals(MUTEX.get())) {
            MUTEX.set(MUTEX_REPORT);
            if (record != null) {
                try {
                    SimpleFormatter f = new SimpleFormatter();
                    msg = "Log record " + record.getSequenceNumber() + " was not published. " + head(f) + format(f, record) + tail(f, "");
                } catch (Throwable th) {
                    MUTEX.set(MUTEX_PUBLISH);
                    throw th;
                }
            } else {
                msg = null;
            }
            Exception e = new IllegalStateException("Recursive publish detected by thread " + Thread.currentThread());
            reportError(msg, e, 1);
            MUTEX.set(MUTEX_PUBLISH);
        }
    }

    private boolean tryMutex() {
        if (MUTEX.get() == null) {
            MUTEX.set(MUTEX_PUBLISH);
            return true;
        }
        return false;
    }

    private void releaseMutex() {
        MUTEX.remove();
    }

    public void push() {
        push(true, 2);
    }

    @Override // java.util.logging.Handler
    public void flush() {
        push(false, 2);
    }

    @Override // java.util.logging.Handler
    public void close() {
        Message msg;
        checkAccess();
        Object ccl = getAndSetContextClassLoader();
        try {
            synchronized (this) {
                try {
                    msg = writeLogRecords(3);
                    super.setLevel(Level.OFF);
                    if (this.capacity > 0) {
                        this.capacity = -this.capacity;
                    }
                    if (this.size == 0 && this.data.length != 1) {
                        this.data = new LogRecord[1];
                    }
                } catch (Throwable th) {
                    super.setLevel(Level.OFF);
                    if (this.capacity > 0) {
                        this.capacity = -this.capacity;
                    }
                    if (this.size == 0 && this.data.length != 1) {
                        this.data = new LogRecord[1];
                    }
                    throw th;
                }
            }
            if (msg != null) {
                send(msg, false, 3);
            }
        } finally {
            setContextClassLoader(ccl);
        }
    }

    @Override // java.util.logging.Handler
    public synchronized void setLevel(Level newLevel) {
        if (this.capacity > 0) {
            super.setLevel(newLevel);
        } else {
            if (newLevel == null) {
                throw new NullPointerException();
            }
            checkAccess();
        }
    }

    public final synchronized Level getPushLevel() {
        return this.pushLevel;
    }

    public final synchronized void setPushLevel(Level level) {
        checkAccess();
        if (level == null) {
            throw new NullPointerException();
        }
        if (this.isWriting) {
            throw new IllegalStateException();
        }
        this.pushLevel = level;
    }

    public final synchronized Filter getPushFilter() {
        return this.pushFilter;
    }

    public final synchronized void setPushFilter(Filter filter) {
        checkAccess();
        if (this.isWriting) {
            throw new IllegalStateException();
        }
        this.pushFilter = filter;
    }

    public final synchronized Comparator<? super LogRecord> getComparator() {
        return this.comparator;
    }

    public final synchronized void setComparator(Comparator<? super LogRecord> c) {
        checkAccess();
        if (this.isWriting) {
            throw new IllegalStateException();
        }
        this.comparator = c;
    }

    public final synchronized int getCapacity() {
        if ($assertionsDisabled || !(this.capacity == Integer.MIN_VALUE || this.capacity == 0)) {
            return Math.abs(this.capacity);
        }
        throw new AssertionError(this.capacity);
    }

    public final synchronized Authenticator getAuthenticator() {
        checkAccess();
        return this.auth;
    }

    public final void setAuthenticator(Authenticator auth) {
        setAuthenticator0(auth);
    }

    public final void setAuthenticator(char... password) {
        if (password == null) {
            setAuthenticator0((Authenticator) null);
        } else {
            setAuthenticator0(new DefaultAuthenticator(new String(password)));
        }
    }

    private void setAuthenticator0(Authenticator auth) {
        Session settings;
        checkAccess();
        synchronized (this) {
            if (this.isWriting) {
                throw new IllegalStateException();
            }
            this.auth = auth;
            settings = fixUpSession();
        }
        verifySettings(settings);
    }

    public final void setMailProperties(Properties props) {
        setMailProperties0(props);
    }

    private void setMailProperties0(Properties props) {
        Session settings;
        checkAccess();
        Properties props2 = (Properties) props.clone();
        synchronized (this) {
            if (this.isWriting) {
                throw new IllegalStateException();
            }
            this.mailProps = props2;
            settings = fixUpSession();
        }
        verifySettings(settings);
    }

    public final Properties getMailProperties() {
        Properties props;
        checkAccess();
        synchronized (this) {
            props = this.mailProps;
        }
        return (Properties) props.clone();
    }

    public final Filter[] getAttachmentFilters() {
        return (Filter[]) readOnlyAttachmentFilters().clone();
    }

    public final void setAttachmentFilters(Filter... filters) {
        checkAccess();
        Filter[] filters2 = (Filter[]) copyOf(filters, filters.length, Filter[].class);
        synchronized (this) {
            if (this.attachmentFormatters.length != filters2.length) {
                throw attachmentMismatch(this.attachmentFormatters.length, filters2.length);
            }
            if (this.isWriting) {
                throw new IllegalStateException();
            }
            this.attachmentFilters = filters2;
        }
    }

    public final Formatter[] getAttachmentFormatters() {
        Formatter[] formatters;
        synchronized (this) {
            formatters = this.attachmentFormatters;
        }
        return (Formatter[]) formatters.clone();
    }

    public final void setAttachmentFormatters(Formatter... formatters) {
        Formatter[] formatters2;
        checkAccess();
        if (formatters.length == 0) {
            formatters2 = emptyFormatterArray();
        } else {
            formatters2 = (Formatter[]) copyOf(formatters, formatters.length, Formatter[].class);
            for (int i = 0; i < formatters2.length; i++) {
                if (formatters2[i] == null) {
                    throw new NullPointerException(atIndexMsg(i));
                }
            }
        }
        synchronized (this) {
            if (this.isWriting) {
                throw new IllegalStateException();
            }
            this.attachmentFormatters = formatters2;
            fixUpAttachmentFilters();
            fixUpAttachmentNames();
        }
    }

    public final Formatter[] getAttachmentNames() {
        Formatter[] formatters;
        synchronized (this) {
            formatters = this.attachmentNames;
        }
        return (Formatter[]) formatters.clone();
    }

    public final void setAttachmentNames(String... names) {
        Formatter[] formatters;
        checkAccess();
        if (names.length == 0) {
            formatters = emptyFormatterArray();
        } else {
            formatters = new Formatter[names.length];
        }
        for (int i = 0; i < names.length; i++) {
            String name = names[i];
            if (name != null) {
                if (name.length() > 0) {
                    formatters[i] = new TailNameFormatter(name);
                } else {
                    throw new IllegalArgumentException(atIndexMsg(i));
                }
            } else {
                throw new NullPointerException(atIndexMsg(i));
            }
        }
        synchronized (this) {
            if (this.attachmentFormatters.length != names.length) {
                throw attachmentMismatch(this.attachmentFormatters.length, names.length);
            }
            if (this.isWriting) {
                throw new IllegalStateException();
            }
            this.attachmentNames = formatters;
        }
    }

    public final void setAttachmentNames(Formatter... formatters) {
        checkAccess();
        Formatter[] formatters2 = (Formatter[]) copyOf(formatters, formatters.length, Formatter[].class);
        for (int i = 0; i < formatters2.length; i++) {
            if (formatters2[i] == null) {
                throw new NullPointerException(atIndexMsg(i));
            }
        }
        synchronized (this) {
            if (this.attachmentFormatters.length != formatters2.length) {
                throw attachmentMismatch(this.attachmentFormatters.length, formatters2.length);
            }
            if (this.isWriting) {
                throw new IllegalStateException();
            }
            this.attachmentNames = formatters2;
        }
    }

    public final synchronized Formatter getSubject() {
        return this.subjectFormatter;
    }

    public final void setSubject(String subject) {
        if (subject != null) {
            setSubject(new TailNameFormatter(subject));
        } else {
            checkAccess();
            throw new NullPointerException();
        }
    }

    public final void setSubject(Formatter format) {
        checkAccess();
        if (format == null) {
            throw new NullPointerException();
        }
        synchronized (this) {
            if (this.isWriting) {
                throw new IllegalStateException();
            }
            this.subjectFormatter = format;
        }
    }

    @Override // java.util.logging.Handler
    protected void reportError(String msg, Exception ex, int code) {
        if (msg != null) {
            super.reportError(Level.SEVERE.getName() + ": " + msg, ex, code);
        } else {
            super.reportError((String) null, ex, code);
        }
    }

    final void checkAccess() {
        if (this.sealed) {
            LogManagerProperties.getLogManager().checkAccess();
        }
    }

    final String contentTypeOf(String head) {
        if (!isEmpty(head)) {
            if (head.length() > 25) {
                head = head.substring(0, 25);
            }
            try {
                String encoding = getEncodingName();
                ByteArrayInputStream in = new ByteArrayInputStream(head.getBytes(encoding));
                if ($assertionsDisabled || in.markSupported()) {
                    return URLConnection.guessContentTypeFromStream(in);
                }
                throw new AssertionError(in.getClass().getName());
            } catch (IOException IOE) {
                reportError(IOE.getMessage(), IOE, 5);
                return null;
            }
        }
        return null;
    }

    final boolean isMissingContent(Message msg, Throwable t) {
        Throwable cause = t.getCause();
        while (true) {
            Throwable cause2 = cause;
            if (cause2 != null) {
                t = cause2;
                cause = cause2.getCause();
            } else {
                try {
                    msg.writeTo(new ByteArrayOutputStream(MIN_HEADER_SIZE));
                    return false;
                } catch (RuntimeException RE) {
                    throw RE;
                } catch (Exception noContent) {
                    String txt = noContent.getMessage();
                    if (!isEmpty(txt) && noContent.getClass() == t.getClass()) {
                        return txt.equals(t.getMessage());
                    }
                    return false;
                }
            }
        }
    }

    private void reportError(Message msg, Exception ex, int code) {
        try {
            super.reportError(toRawString(msg), ex, code);
        } catch (IOException rawIo) {
            reportError(toMsgString(rawIo), ex, code);
        } catch (MessagingException rawMe) {
            reportError(toMsgString(rawMe), ex, code);
        }
    }

    private String getContentType(String name) {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        String type = this.contentTypes.getContentType(name);
        if ("application/octet-stream".equalsIgnoreCase(type)) {
            return null;
        }
        return type;
    }

    private String getEncodingName() {
        String encoding = getEncoding();
        if (encoding == null) {
            encoding = MimeUtility.getDefaultJavaCharset();
        }
        return encoding;
    }

    private void setContent(MimeBodyPart part, CharSequence buf, String type) throws MessagingException {
        String encoding = getEncodingName();
        if (type != null && !"text/plain".equalsIgnoreCase(type)) {
            try {
                DataSource source = new ByteArrayDataSource(buf.toString(), contentWithEncoding(type, encoding));
                part.setDataHandler(new DataHandler(source));
                return;
            } catch (IOException IOE) {
                reportError(IOE.getMessage(), IOE, 5);
                part.setText(buf.toString(), encoding);
                return;
            }
        }
        part.setText(buf.toString(), MimeUtility.mimeCharset(encoding));
    }

    private String contentWithEncoding(String type, String encoding) {
        if (!$assertionsDisabled && encoding == null) {
            throw new AssertionError();
        }
        try {
            ContentType ct = new ContentType(type);
            ct.setParameter("charset", MimeUtility.mimeCharset(encoding));
            String encoding2 = ct.toString();
            if (!isEmpty(encoding2)) {
                type = encoding2;
            }
        } catch (MessagingException ME) {
            reportError(type, ME, 5);
        }
        return type;
    }

    private synchronized void setCapacity0(int newCapacity) {
        if (newCapacity <= 0) {
            throw new IllegalArgumentException("Capacity must be greater than zero.");
        }
        if (this.isWriting) {
            throw new IllegalStateException();
        }
        if (this.capacity < 0) {
            this.capacity = -newCapacity;
        } else {
            this.capacity = newCapacity;
        }
    }

    private Filter[] readOnlyAttachmentFilters() {
        return this.attachmentFilters;
    }

    private static Formatter[] emptyFormatterArray() {
        return EMPTY_FORMATTERS;
    }

    private static Filter[] emptyFilterArray() {
        return EMPTY_FILTERS;
    }

    private boolean fixUpAttachmentNames() {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        boolean fixed = false;
        int expect = this.attachmentFormatters.length;
        int current = this.attachmentNames.length;
        if (current != expect) {
            this.attachmentNames = (Formatter[]) copyOf(this.attachmentNames, expect);
            fixed = current != 0;
        }
        if (expect == 0) {
            this.attachmentNames = emptyFormatterArray();
            if (!$assertionsDisabled && this.attachmentNames.length != 0) {
                throw new AssertionError();
            }
        } else {
            for (int i = 0; i < expect; i++) {
                if (this.attachmentNames[i] == null) {
                    this.attachmentNames[i] = new TailNameFormatter(toString(this.attachmentFormatters[i]));
                }
            }
        }
        return fixed;
    }

    private boolean fixUpAttachmentFilters() {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        boolean fixed = false;
        int expect = this.attachmentFormatters.length;
        int current = this.attachmentFilters.length;
        if (current != expect) {
            this.attachmentFilters = (Filter[]) copyOf(this.attachmentFilters, expect);
            fixed = current != 0;
            Filter body = super.getFilter();
            if (body != null) {
                for (int i = current; i < expect; i++) {
                    this.attachmentFilters[i] = body;
                }
            }
        }
        if (expect == 0) {
            this.attachmentFilters = emptyFilterArray();
            if (!$assertionsDisabled && this.attachmentFilters.length != 0) {
                throw new AssertionError();
            }
        }
        return fixed;
    }

    private static <T> T[] copyOf(T[] tArr, int i) {
        return (T[]) copyOf(tArr, i, tArr.getClass());
    }

    private static <T, U> T[] copyOf(U[] uArr, int i, Class<? extends T[]> cls) {
        T[] tArr = (T[]) ((Object[]) Array.newInstance(cls.getComponentType(), i));
        System.arraycopy(uArr, 0, tArr, 0, Math.min(i, uArr.length));
        return tArr;
    }

    private void reset() {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        if (this.size < this.data.length) {
            Arrays.fill(this.data, 0, this.size, (Object) null);
        } else {
            Arrays.fill(this.data, (Object) null);
        }
        this.size = 0;
    }

    private void grow() {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        int len = this.data.length;
        int newCapacity = len + (len >> 1) + 1;
        if (newCapacity > this.capacity || newCapacity < len) {
            newCapacity = this.capacity;
        }
        if (!$assertionsDisabled && len == this.capacity) {
            throw new AssertionError(len);
        }
        this.data = (LogRecord[]) copyOf(this.data, newCapacity);
    }

    private synchronized void init(Properties props) {
        LogManager manager = LogManagerProperties.getLogManager();
        String p = getClass().getName();
        this.mailProps = new Properties();
        this.contentTypes = FileTypeMap.getDefaultFileTypeMap();
        initErrorManager(manager, p);
        initLevel(manager, p);
        initFilter(manager, p);
        initCapacity(manager, p);
        initAuthenticator(manager, p);
        initEncoding(manager, p);
        initFormatter(manager, p);
        initComparator(manager, p);
        initPushLevel(manager, p);
        initPushFilter(manager, p);
        initSubject(manager, p);
        initAttachmentFormaters(manager, p);
        initAttachmentFilters(manager, p);
        initAttachmentNames(manager, p);
        if (props == null && manager.getProperty(p.concat(".verify")) != null) {
            verifySettings(initSession());
        }
        intern();
    }

    private void intern() {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        try {
            Map<Object, Object> seen = new HashMap<>();
            try {
                intern(seen, super.getErrorManager());
            } catch (SecurityException se) {
                reportError(se.getMessage(), se, 4);
            }
            try {
                Object canidate = super.getFilter();
                Object result = intern(seen, canidate);
                if (result != canidate) {
                    super.setFilter((Filter) Filter.class.cast(result));
                }
                Object canidate2 = super.getFormatter();
                Object result2 = intern(seen, canidate2);
                if (result2 != canidate2) {
                    super.setFormatter((Formatter) Formatter.class.cast(result2));
                }
            } catch (SecurityException se2) {
                reportError(se2.getMessage(), se2, 4);
            }
            Object canidate3 = this.subjectFormatter;
            Object result3 = intern(seen, canidate3);
            if (result3 != canidate3) {
                this.subjectFormatter = (Formatter) Formatter.class.cast(result3);
            }
            Object canidate4 = this.pushFilter;
            Object result4 = intern(seen, canidate4);
            if (result4 != canidate4) {
                this.pushFilter = (Filter) Filter.class.cast(result4);
            }
            for (int i = 0; i < this.attachmentFormatters.length; i++) {
                Object canidate5 = this.attachmentFormatters[i];
                Object result5 = intern(seen, canidate5);
                if (result5 != canidate5) {
                    this.attachmentFormatters[i] = (Formatter) Formatter.class.cast(result5);
                }
                Object canidate6 = this.attachmentFilters[i];
                Object result6 = intern(seen, canidate6);
                if (result6 != canidate6) {
                    this.attachmentFilters[i] = (Filter) Filter.class.cast(result6);
                }
                Object canidate7 = this.attachmentNames[i];
                Object result7 = intern(seen, canidate7);
                if (result7 != canidate7) {
                    this.attachmentNames[i] = (Formatter) Formatter.class.cast(result7);
                }
            }
        } catch (Exception skip) {
            reportError(skip.getMessage(), skip, 4);
        }
    }

    private Object intern(Map<Object, Object> m, Object o) throws Exception {
        Object key;
        Object use;
        if (o == null) {
            return null;
        }
        if (o.getClass().getName().equals(TailNameFormatter.class.getName())) {
            key = o;
        } else {
            key = o.getClass().getConstructor(new Class[0]).newInstance(new Object[0]);
        }
        if (key.getClass() == o.getClass()) {
            Object found = m.get(key);
            if (found == null) {
                boolean right = key.equals(o);
                boolean left = o.equals(key);
                if (right && left) {
                    Object found2 = m.put(o, o);
                    if (found2 != null) {
                        reportNonDiscriminating(key, found2);
                        Object found3 = m.remove(key);
                        if (found3 != o) {
                            reportNonDiscriminating(key, found3);
                            m.clear();
                        }
                    }
                } else if (right != left) {
                    reportNonSymmetric(o, key);
                }
                use = o;
            } else if (o.getClass() == found.getClass()) {
                use = found;
            } else {
                reportNonDiscriminating(o, found);
                use = o;
            }
        } else {
            use = o;
        }
        return use;
    }

    private static boolean isEmpty(String s) {
        return s == null || s.length() == 0;
    }

    private static boolean hasValue(String name) {
        return (isEmpty(name) || "null".equalsIgnoreCase(name)) ? false : true;
    }

    private void initAttachmentFilters(LogManager manager, String p) {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        if (!$assertionsDisabled && this.attachmentFormatters == null) {
            throw new AssertionError();
        }
        String list = manager.getProperty(p.concat(".attachment.filters"));
        if (!isEmpty(list)) {
            String[] names = list.split(",");
            Filter[] a = new Filter[names.length];
            for (int i = 0; i < a.length; i++) {
                names[i] = names[i].trim();
                if (!"null".equalsIgnoreCase(names[i])) {
                    try {
                        a[i] = LogManagerProperties.newFilter(names[i]);
                    } catch (SecurityException SE) {
                        throw SE;
                    } catch (Exception E) {
                        reportError(E.getMessage(), E, 4);
                    }
                }
            }
            this.attachmentFilters = a;
            if (fixUpAttachmentFilters()) {
                reportError("Attachment filters.", attachmentMismatch("Length mismatch."), 4);
                return;
            }
            return;
        }
        this.attachmentFilters = emptyFilterArray();
        fixUpAttachmentFilters();
    }

    private void initAttachmentFormaters(LogManager manager, String p) {
        Formatter[] a;
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        String list = manager.getProperty(p.concat(".attachment.formatters"));
        if (!isEmpty(list)) {
            String[] names = list.split(",");
            if (names.length == 0) {
                a = emptyFormatterArray();
            } else {
                a = new Formatter[names.length];
            }
            for (int i = 0; i < a.length; i++) {
                names[i] = names[i].trim();
                if (!"null".equalsIgnoreCase(names[i])) {
                    try {
                        a[i] = LogManagerProperties.newFormatter(names[i]);
                        if (a[i] instanceof TailNameFormatter) {
                            Exception CNFE = new ClassNotFoundException(a[i].toString());
                            reportError("Attachment formatter.", CNFE, 4);
                            a[i] = new SimpleFormatter();
                        }
                    } catch (SecurityException SE) {
                        throw SE;
                    } catch (Exception E) {
                        reportError(E.getMessage(), E, 4);
                        a[i] = new SimpleFormatter();
                    }
                } else {
                    Exception NPE = new NullPointerException(atIndexMsg(i));
                    reportError("Attachment formatter.", NPE, 4);
                    a[i] = new SimpleFormatter();
                }
            }
            this.attachmentFormatters = a;
            return;
        }
        this.attachmentFormatters = emptyFormatterArray();
    }

    private void initAttachmentNames(LogManager manager, String p) {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        if (!$assertionsDisabled && this.attachmentFormatters == null) {
            throw new AssertionError();
        }
        String list = manager.getProperty(p.concat(".attachment.names"));
        if (!isEmpty(list)) {
            String[] names = list.split(",");
            Formatter[] a = new Formatter[names.length];
            for (int i = 0; i < a.length; i++) {
                names[i] = names[i].trim();
                if (!"null".equalsIgnoreCase(names[i])) {
                    try {
                        try {
                            a[i] = LogManagerProperties.newFormatter(names[i]);
                        } catch (ClassCastException e) {
                            a[i] = new TailNameFormatter(names[i]);
                        } catch (ClassNotFoundException e2) {
                            a[i] = new TailNameFormatter(names[i]);
                        }
                    } catch (SecurityException SE) {
                        throw SE;
                    } catch (Exception E) {
                        reportError(E.getMessage(), E, 4);
                    }
                } else {
                    Exception NPE = new NullPointerException(atIndexMsg(i));
                    reportError("Attachment names.", NPE, 4);
                }
            }
            this.attachmentNames = a;
            if (fixUpAttachmentNames()) {
                reportError("Attachment names.", attachmentMismatch("Length mismatch."), 4);
                return;
            }
            return;
        }
        this.attachmentNames = emptyFormatterArray();
        fixUpAttachmentNames();
    }

    private void initAuthenticator(LogManager manager, String p) {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        String name = manager.getProperty(p.concat(".authenticator"));
        if (hasValue(name)) {
            try {
                this.auth = LogManagerProperties.newAuthenticator(name);
            } catch (ClassCastException e) {
                this.auth = new DefaultAuthenticator(name);
            } catch (ClassNotFoundException e2) {
                this.auth = new DefaultAuthenticator(name);
            } catch (SecurityException SE) {
                throw SE;
            } catch (Exception E) {
                reportError(E.getMessage(), E, 4);
            }
        }
    }

    private void initLevel(LogManager manager, String p) {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        try {
            String val = manager.getProperty(p.concat(".level"));
            if (val != null) {
                super.setLevel(Level.parse(val));
            } else {
                super.setLevel(Level.WARNING);
            }
        } catch (SecurityException SE) {
            throw SE;
        } catch (RuntimeException RE) {
            reportError(RE.getMessage(), RE, 4);
            try {
                super.setLevel(Level.WARNING);
            } catch (RuntimeException fail) {
                reportError(fail.getMessage(), fail, 4);
            }
        }
    }

    private void initFilter(LogManager manager, String p) {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        try {
            String name = manager.getProperty(p.concat(".filter"));
            if (hasValue(name)) {
                super.setFilter(LogManagerProperties.newFilter(name));
            }
        } catch (SecurityException SE) {
            throw SE;
        } catch (Exception E) {
            reportError(E.getMessage(), E, 4);
        }
    }

    private void initCapacity(LogManager manager, String p) {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        try {
            String value = manager.getProperty(p.concat(".capacity"));
            if (value != null) {
                setCapacity0(Integer.parseInt(value));
            } else {
                setCapacity0(IMAPStore.RESPONSE);
            }
        } catch (RuntimeException RE) {
            reportError(RE.getMessage(), RE, 4);
        }
        if (this.capacity <= 0) {
            this.capacity = IMAPStore.RESPONSE;
        }
        this.data = new LogRecord[1];
    }

    private void initEncoding(LogManager manager, String p) {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        try {
            super.setEncoding(manager.getProperty(p.concat(".encoding")));
        } catch (UnsupportedEncodingException UEE) {
            reportError(UEE.getMessage(), UEE, 4);
        } catch (SecurityException SE) {
            throw SE;
        } catch (RuntimeException RE) {
            reportError(RE.getMessage(), RE, 4);
        }
    }

    private void initErrorManager(LogManager manager, String p) {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        String name = manager.getProperty(p.concat(".errorManager"));
        if (name != null) {
            try {
                ErrorManager em = LogManagerProperties.newErrorManager(name);
                super.setErrorManager(em);
            } catch (SecurityException SE) {
                throw SE;
            } catch (Exception E) {
                reportError(E.getMessage(), E, 4);
            }
        }
    }

    private void initFormatter(LogManager manager, String p) {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        String name = manager.getProperty(p.concat(".formatter"));
        if (hasValue(name)) {
            try {
                Formatter formatter = LogManagerProperties.newFormatter(name);
                if (!$assertionsDisabled && formatter == null) {
                    throw new AssertionError();
                }
                if (!(formatter instanceof TailNameFormatter)) {
                    super.setFormatter(formatter);
                } else {
                    super.setFormatter(new SimpleFormatter());
                }
                return;
            } catch (SecurityException SE) {
                throw SE;
            } catch (Exception E) {
                reportError(E.getMessage(), E, 4);
                try {
                    super.setFormatter(new SimpleFormatter());
                    return;
                } catch (RuntimeException fail) {
                    reportError(fail.getMessage(), fail, 4);
                    return;
                }
            }
        }
        super.setFormatter(new SimpleFormatter());
    }

    private void initComparator(LogManager manager, String p) {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        String name = manager.getProperty(p.concat(".comparator"));
        String reverse = manager.getProperty(p.concat(".comparator.reverse"));
        try {
            if (hasValue(name)) {
                this.comparator = LogManagerProperties.newComparator(name);
                if (Boolean.parseBoolean(reverse)) {
                    if (!$assertionsDisabled && this.comparator == null) {
                        throw new AssertionError("null");
                    }
                    this.comparator = LogManagerProperties.reverseOrder(this.comparator);
                }
            } else if (!isEmpty(reverse)) {
                throw new IllegalArgumentException("No comparator to reverse.");
            }
        } catch (SecurityException SE) {
            throw SE;
        } catch (Exception E) {
            reportError(E.getMessage(), E, 4);
        }
    }

    private void initPushLevel(LogManager manager, String p) {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        try {
            String val = manager.getProperty(p.concat(".pushLevel"));
            if (val != null) {
                this.pushLevel = Level.parse(val);
            }
        } catch (RuntimeException RE) {
            reportError(RE.getMessage(), RE, 4);
        }
        if (this.pushLevel == null) {
            this.pushLevel = Level.OFF;
        }
    }

    private void initPushFilter(LogManager manager, String p) {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        String name = manager.getProperty(p.concat(".pushFilter"));
        if (hasValue(name)) {
            try {
                this.pushFilter = LogManagerProperties.newFilter(name);
            } catch (SecurityException SE) {
                throw SE;
            } catch (Exception E) {
                reportError(E.getMessage(), E, 4);
            }
        }
    }

    private void initSubject(LogManager manager, String p) {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        String name = manager.getProperty(p.concat(".subject"));
        if (hasValue(name)) {
            try {
                this.subjectFormatter = LogManagerProperties.newFormatter(name);
            } catch (ClassCastException e) {
                this.subjectFormatter = new TailNameFormatter(name);
            } catch (ClassNotFoundException e2) {
                this.subjectFormatter = new TailNameFormatter(name);
            } catch (SecurityException SE) {
                throw SE;
            } catch (Exception E) {
                this.subjectFormatter = new TailNameFormatter(name);
                reportError(E.getMessage(), E, 4);
            }
        } else if (name != null) {
            this.subjectFormatter = new TailNameFormatter(name);
        }
        if (this.subjectFormatter == null) {
            this.subjectFormatter = new TailNameFormatter("");
        }
    }

    private boolean isAttachmentLoggable(LogRecord record) {
        Filter[] filters = readOnlyAttachmentFilters();
        for (Filter f : filters) {
            if (f == null || f.isLoggable(record)) {
                return true;
            }
        }
        return false;
    }

    private boolean isPushable(LogRecord record) {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        int value = getPushLevel().intValue();
        if (value == offValue || record.getLevel().intValue() < value) {
            return false;
        }
        Filter filter = getPushFilter();
        return filter == null || filter.isLoggable(record);
    }

    private void push(boolean priority, int code) {
        if (tryMutex()) {
            try {
                Message msg = writeLogRecords(code);
                if (msg != null) {
                    send(msg, priority, code);
                }
                return;
            } finally {
                releaseMutex();
            }
        }
        reportUnPublishedError(null);
    }

    private void send(Message msg, boolean priority, int code) {
        try {
            envelopeFor(msg, priority);
            Transport.send(msg);
        } catch (Exception E) {
            reportError(msg, E, code);
        }
    }

    private void sort() {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        if (this.comparator != null) {
            try {
                if (this.size != 1) {
                    Arrays.sort(this.data, 0, this.size, this.comparator);
                } else {
                    this.comparator.compare(this.data[0], this.data[0]);
                }
            } catch (RuntimeException RE) {
                reportError(RE.getMessage(), RE, 5);
            }
        }
    }

    private synchronized Message writeLogRecords(int code) {
        if (this.size == 0 || this.isWriting) {
            return null;
        }
        this.isWriting = true;
        try {
            try {
                try {
                    sort();
                    if (this.session == null) {
                        initSession();
                    }
                    MimeMessage msg = new MimeMessage(this.session);
                    msg.setDescription(descriptionFrom(this.comparator, this.pushLevel, this.pushFilter));
                    MimeBodyPart[] parts = new MimeBodyPart[this.attachmentFormatters.length];
                    StringBuilder[] buffers = new StringBuilder[parts.length];
                    String contentType = null;
                    StringBuilder buf = null;
                    appendSubject(msg, head(this.subjectFormatter));
                    MimeBodyPart body = createBodyPart();
                    Formatter bodyFormat = getFormatter();
                    Filter bodyFilter = getFilter();
                    Object lastLocale = null;
                    for (int ix = 0; ix < this.size; ix++) {
                        boolean formatted = false;
                        LogRecord r = this.data[ix];
                        this.data[ix] = null;
                        Locale locale = localeFor(r);
                        appendSubject(msg, format(this.subjectFormatter, r));
                        if (bodyFilter == null || bodyFilter.isLoggable(r)) {
                            if (buf == null) {
                                buf = new StringBuilder();
                                String head = head(bodyFormat);
                                buf.append(head);
                                contentType = contentTypeOf(head);
                            }
                            formatted = true;
                            buf.append(format(bodyFormat, r));
                            if (locale != null && !locale.equals(lastLocale)) {
                                appendContentLang(body, locale);
                            }
                        }
                        for (int i = 0; i < parts.length; i++) {
                            Filter af = this.attachmentFilters[i];
                            if (af == null || af.isLoggable(r)) {
                                if (parts[i] == null) {
                                    parts[i] = createBodyPart(i);
                                    buffers[i] = new StringBuilder();
                                    buffers[i].append(head(this.attachmentFormatters[i]));
                                    appendFileName(parts[i], head(this.attachmentNames[i]));
                                }
                                formatted = true;
                                appendFileName(parts[i], format(this.attachmentNames[i], r));
                                buffers[i].append(format(this.attachmentFormatters[i], r));
                                if (locale != null && !locale.equals(lastLocale)) {
                                    appendContentLang(parts[i], locale);
                                }
                            }
                        }
                        if (!formatted) {
                            reportFilterError(r);
                        } else if (locale != null && !locale.equals(lastLocale)) {
                            appendContentLang(msg, locale);
                        }
                        lastLocale = locale;
                    }
                    this.size = 0;
                    for (int i2 = parts.length - 1; i2 >= 0; i2--) {
                        if (parts[i2] != null) {
                            appendFileName(parts[i2], tail(this.attachmentNames[i2], "err"));
                            buffers[i2].append(tail(this.attachmentFormatters[i2], ""));
                            if (buffers[i2].length() > 0) {
                                String name = parts[i2].getFileName();
                                if (isEmpty(name)) {
                                    name = toString(this.attachmentFormatters[i2]);
                                    parts[i2].setFileName(name);
                                }
                                setContent(parts[i2], buffers[i2], getContentType(name));
                            } else {
                                setIncompleteCopy(msg);
                                parts[i2] = null;
                            }
                            buffers[i2] = null;
                        }
                    }
                    if (buf != null) {
                        buf.append(tail(bodyFormat, ""));
                    } else {
                        buf = new StringBuilder(0);
                    }
                    appendSubject(msg, tail(this.subjectFormatter, ""));
                    MimeMultipart multipart = new MimeMultipart();
                    String altType = getContentType(bodyFormat.getClass().getName());
                    setContent(body, buf, altType == null ? contentType : altType);
                    multipart.addBodyPart(body);
                    for (int i3 = 0; i3 < parts.length; i3++) {
                        if (parts[i3] != null) {
                            multipart.addBodyPart(parts[i3]);
                        }
                    }
                    msg.setContent(multipart);
                    this.isWriting = false;
                    if (this.size > 0) {
                        reset();
                    }
                    return msg;
                } catch (RuntimeException re) {
                    reportError(re.getMessage(), re, code);
                    this.isWriting = false;
                    if (this.size <= 0) {
                        return null;
                    }
                    reset();
                    return null;
                }
            } catch (Exception e) {
                reportError(e.getMessage(), e, code);
                this.isWriting = false;
                if (this.size <= 0) {
                    return null;
                }
                reset();
                return null;
            }
        } catch (Throwable th) {
            this.isWriting = false;
            if (this.size > 0) {
                reset();
            }
            throw th;
        }
    }

    private void verifySettings(Session session) {
        if (session != null) {
            Properties props = session.getProperties();
            Object check = props.put("verify", "");
            if (check instanceof String) {
                String value = (String) check;
                if (hasValue(value)) {
                    verifySettings0(session, value);
                    return;
                }
                return;
            }
            if (check != null) {
                verifySettings0(session, check.getClass().toString());
            }
        }
    }

    private void verifySettings0(Session session, String verify) {
        String msg;
        Transport t;
        Address[] any;
        if (!$assertionsDisabled && verify == null) {
            throw new AssertionError((String) null);
        }
        if (!"local".equals(verify) && !"remote".equals(verify) && !"limited".equals(verify) && !"resolve".equals(verify)) {
            reportError("Verify must be 'limited', local', 'resolve' or 'remote'.", new IllegalArgumentException(verify), 4);
            return;
        }
        MimeMessage abort = new MimeMessage(session);
        if (!"limited".equals(verify)) {
            msg = "Local address is " + InternetAddress.getLocalAddress(session) + '.';
            try {
                Charset.forName(getEncodingName());
            } catch (RuntimeException RE) {
                UnsupportedEncodingException UEE = new UnsupportedEncodingException(RE.toString());
                UEE.initCause(RE);
                reportError(msg, UEE, 5);
            }
        } else {
            msg = "Skipping local address check.";
        }
        synchronized (this) {
            appendSubject(abort, head(this.subjectFormatter));
            appendSubject(abort, tail(this.subjectFormatter, ""));
        }
        setIncompleteCopy(abort);
        envelopeFor(abort, true);
        try {
            abort.saveChanges();
        } catch (MessagingException ME) {
            reportError(msg, ME, 5);
        }
        try {
            Address[] all = abort.getAllRecipients();
            if (all == null) {
                all = new InternetAddress[0];
            }
            try {
                any = all.length != 0 ? all : abort.getFrom();
            } catch (MessagingException protocol) {
                try {
                    t = session.getTransport();
                } catch (MessagingException fail) {
                    throw attach(protocol, fail);
                }
            }
            if (any != null && any.length != 0) {
                t = session.getTransport(any[0]);
                session.getProperty("mail.transport.protocol");
                String local = null;
                if ("remote".equals(verify)) {
                    Exception closed = null;
                    t.connect();
                    try {
                        try {
                            if (t instanceof SMTPTransport) {
                                local = ((SMTPTransport) t).getLocalHost();
                            }
                            t.sendMessage(abort, all);
                            try {
                            } catch (MessagingException ME2) {
                                closed = ME2;
                            }
                            reportUnexpectedSend(abort, verify, null);
                        } finally {
                            try {
                                t.close();
                            } catch (MessagingException e) {
                            }
                        }
                    } catch (SendFailedException sfe) {
                        Address[] recip = sfe.getInvalidAddresses();
                        if (recip != null && recip.length != 0) {
                            fixUpContent(abort, verify, sfe);
                            reportError(abort, sfe, 4);
                        }
                        Address[] recip2 = sfe.getValidSentAddresses();
                        if (recip2 != null && recip2.length != 0) {
                            reportUnexpectedSend(abort, verify, sfe);
                        }
                    } catch (MessagingException ME3) {
                        if (!isMissingContent(abort, ME3)) {
                            fixUpContent(abort, verify, ME3);
                            reportError(abort, ME3, 4);
                        }
                    }
                    if (closed != null) {
                        fixUpContent(abort, verify, closed);
                        reportError(abort, closed, 3);
                    }
                } else {
                    String protocol2 = t.getURLName().getProtocol();
                    session.getProperty("mail.host");
                    session.getProperty("mail.user");
                    session.getProperty("mail." + protocol2 + ".host");
                    session.getProperty("mail." + protocol2 + ".port");
                    session.getProperty("mail." + protocol2 + ".user");
                    local = session.getProperty("mail." + protocol2 + ".localhost");
                    if (isEmpty(local)) {
                        local = session.getProperty("mail." + protocol2 + ".localaddress");
                    }
                    if ("resolve".equals(verify)) {
                        try {
                            verifyHost(t.getURLName().getHost());
                        } catch (IOException IOE) {
                            Exception ME4 = new MessagingException(msg, IOE);
                            fixUpContent(abort, verify, ME4);
                            reportError(abort, ME4, 4);
                        } catch (RuntimeException RE2) {
                            Exception ME5 = new MessagingException(msg, RE2);
                            fixUpContent(abort, verify, RE2);
                            reportError(abort, ME5, 4);
                        }
                    }
                }
                if (!"limited".equals(verify)) {
                    try {
                        if (!"remote".equals(verify) && (t instanceof SMTPTransport)) {
                            local = ((SMTPTransport) t).getLocalHost();
                        }
                        verifyHost(local);
                    } catch (IOException IOE2) {
                        Exception ME6 = new MessagingException(msg, IOE2);
                        fixUpContent(abort, verify, ME6);
                        reportError(abort, ME6, 4);
                    } catch (RuntimeException RE3) {
                        Exception ME7 = new MessagingException(msg, RE3);
                        fixUpContent(abort, verify, ME7);
                        reportError(abort, ME7, 4);
                    }
                    try {
                        Multipart multipart = new MimeMultipart();
                        MimeBodyPart body = new MimeBodyPart();
                        body.setDisposition(Part.INLINE);
                        body.setDescription(verify);
                        setAcceptLang(body);
                        setContent(body, "", "text/plain");
                        multipart.addBodyPart(body);
                        abort.setContent(multipart);
                        abort.saveChanges();
                        abort.writeTo(new ByteArrayOutputStream(MIN_HEADER_SIZE));
                    } catch (IOException IOE3) {
                        Exception ME8 = new MessagingException(msg, IOE3);
                        fixUpContent(abort, verify, ME8);
                        reportError(abort, ME8, 5);
                    }
                }
                if (all.length != 0) {
                    verifyAddresses(all);
                    Address[] from = abort.getFrom();
                    Object sender = abort.getSender();
                    if (sender instanceof InternetAddress) {
                        ((InternetAddress) sender).validate();
                    }
                    if (abort.getHeader("From", ",") != null && from.length != 0) {
                        verifyAddresses(from);
                        for (Address address : from) {
                            if (address.equals(sender)) {
                                MessagingException ME9 = new MessagingException("Sender address '" + sender + "' equals from address.");
                                throw new MessagingException(msg, ME9);
                            }
                        }
                    } else if (sender == null) {
                        MessagingException ME10 = new MessagingException("No from or sender address.");
                        throw new MessagingException(msg, ME10);
                    }
                    verifyAddresses(abort.getReplyTo());
                    return;
                }
                throw new MessagingException("No recipient addresses.");
            }
            Exception me = new MessagingException("No recipient or from address.");
            reportError(msg, me, 4);
            throw me;
        } catch (RuntimeException RE4) {
            fixUpContent(abort, verify, RE4);
            reportError(abort, RE4, 4);
        } catch (MessagingException ME11) {
            fixUpContent(abort, verify, ME11);
            reportError(abort, ME11, 4);
        }
    }

    private static InetAddress verifyHost(String host) throws IOException {
        InetAddress a;
        if (isEmpty(host)) {
            a = InetAddress.getLocalHost();
        } else {
            a = InetAddress.getByName(host);
        }
        if (a.getCanonicalHostName().length() == 0) {
            throw new UnknownHostException();
        }
        return a;
    }

    private static void verifyAddresses(Address[] all) throws AddressException {
        if (all != null) {
            for (Address a : all) {
                if (a instanceof InternetAddress) {
                    ((InternetAddress) a).validate();
                }
            }
        }
    }

    private void reportUnexpectedSend(MimeMessage msg, String verify, Exception cause) {
        MessagingException write = new MessagingException("An empty message was sent.", cause);
        fixUpContent(msg, verify, write);
        reportError(msg, write, 4);
    }

    private void fixUpContent(MimeMessage msg, String verify, Throwable t) {
        MimeBodyPart body;
        String msgDesc;
        String subjectType;
        String name;
        try {
            synchronized (this) {
                body = createBodyPart();
                msgDesc = descriptionFrom(this.comparator, this.pushLevel, this.pushFilter);
                subjectType = getClassId(this.subjectFormatter);
            }
            StringBuilder append = new StringBuilder().append("Formatted using ");
            if (t == null) {
                name = Throwable.class.getName();
            } else {
                name = t.getClass().getName();
            }
            body.setDescription(append.append(name).append(", filtered with ").append(verify).append(", and named by ").append(subjectType).append('.').toString());
            setContent(body, toMsgString(t), "text/plain");
            MimeMultipart multipart = new MimeMultipart();
            multipart.addBodyPart(body);
            msg.setContent(multipart);
            msg.setDescription(msgDesc);
            setAcceptLang(msg);
            msg.saveChanges();
        } catch (RuntimeException RE) {
            reportError("Unable to create body.", RE, 4);
        } catch (MessagingException ME) {
            reportError("Unable to create body.", ME, 4);
        }
    }

    private Session fixUpSession() {
        Session settings;
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        if (this.mailProps.getProperty("verify") != null) {
            settings = initSession();
            if (!$assertionsDisabled && settings != this.session) {
                throw new AssertionError();
            }
        } else {
            this.session = null;
            settings = null;
        }
        return settings;
    }

    private Session initSession() {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        String p = getClass().getName();
        LogManagerProperties proxy = new LogManagerProperties(this.mailProps, p);
        this.session = Session.getInstance(proxy, this.auth);
        return this.session;
    }

    private void envelopeFor(Message msg, boolean priority) {
        setAcceptLang(msg);
        setFrom(msg);
        if (!setRecipient(msg, "mail.to", Message.RecipientType.TO)) {
            setDefaultRecipient(msg, Message.RecipientType.TO);
        }
        setRecipient(msg, "mail.cc", Message.RecipientType.CC);
        setRecipient(msg, "mail.bcc", Message.RecipientType.BCC);
        setReplyTo(msg);
        setSender(msg);
        setMailer(msg);
        setAutoSubmitted(msg);
        if (priority) {
            setPriority(msg);
        }
        try {
            msg.setSentDate(new Date());
        } catch (MessagingException ME) {
            reportError(ME.getMessage(), ME, 5);
        }
    }

    private MimeBodyPart createBodyPart() throws MessagingException {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        MimeBodyPart part = new MimeBodyPart();
        part.setDisposition(Part.INLINE);
        part.setDescription(descriptionFrom(getFormatter(), getFilter(), this.subjectFormatter));
        setAcceptLang(part);
        return part;
    }

    private MimeBodyPart createBodyPart(int index) throws MessagingException {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        MimeBodyPart part = new MimeBodyPart();
        part.setDisposition(Part.ATTACHMENT);
        part.setDescription(descriptionFrom(this.attachmentFormatters[index], this.attachmentFilters[index], this.attachmentNames[index]));
        setAcceptLang(part);
        return part;
    }

    private String descriptionFrom(Comparator<?> c, Level l, Filter f) {
        return "Sorted using " + (c == null ? "no comparator" : c.getClass().getName()) + ", pushed when " + l.getName() + ", and " + (f == null ? "no push filter" : f.getClass().getName()) + '.';
    }

    private String descriptionFrom(Formatter f, Filter filter, Formatter name) {
        return "Formatted using " + getClassId(f) + ", filtered with " + (filter == null ? "no filter" : filter.getClass().getName()) + ", and named by " + getClassId(name) + '.';
    }

    private String getClassId(Formatter f) {
        if (f instanceof TailNameFormatter) {
            return String.class.getName();
        }
        return f.getClass().getName();
    }

    private String toString(Formatter f) {
        String name = f.toString();
        if (!isEmpty(name)) {
            return name;
        }
        return getClassId(f);
    }

    private void appendFileName(Part part, String chunk) {
        if (chunk != null) {
            if (chunk.length() > 0) {
                appendFileName0(part, chunk);
                return;
            }
            return;
        }
        reportNullError(5);
    }

    private void appendFileName0(Part part, String chunk) {
        try {
            String chunk2 = chunk.replaceAll("[\\x00-\\x1F\\x7F]+", "");
            String old = part.getFileName();
            part.setFileName(old != null ? old.concat(chunk2) : chunk2);
        } catch (MessagingException ME) {
            reportError(ME.getMessage(), ME, 5);
        }
    }

    private void appendSubject(Message msg, String chunk) {
        if (chunk != null) {
            if (chunk.length() > 0) {
                appendSubject0(msg, chunk);
                return;
            }
            return;
        }
        reportNullError(5);
    }

    private void appendSubject0(Message msg, String chunk) {
        try {
            String chunk2 = chunk.replaceAll("[\\x00-\\x1F\\x7F]+", "");
            String encoding = getEncodingName();
            String old = msg.getSubject();
            if (!$assertionsDisabled && !(msg instanceof MimeMessage)) {
                throw new AssertionError();
            }
            ((MimeMessage) msg).setSubject(old != null ? old.concat(chunk2) : chunk2, MimeUtility.mimeCharset(encoding));
        } catch (MessagingException ME) {
            reportError(ME.getMessage(), ME, 5);
        }
    }

    private Locale localeFor(LogRecord r) {
        Locale l;
        ResourceBundle rb = r.getResourceBundle();
        if (rb != null) {
            l = rb.getLocale();
            if (l == null || isEmpty(l.getLanguage())) {
                l = Locale.getDefault();
            }
        } else {
            l = null;
        }
        return l;
    }

    private void appendContentLang(MimePart p, Locale l) {
        int len;
        String header;
        try {
            String lang = LogManagerProperties.toLanguageTag(l);
            if (lang.length() != 0) {
                String header2 = p.getHeader("Content-Language", null);
                if (isEmpty(header2)) {
                    p.setHeader("Content-Language", lang);
                } else if (!header2.equalsIgnoreCase(lang)) {
                    String lang2 = ",".concat(lang);
                    int idx = 0;
                    do {
                        int indexOf = header2.indexOf(lang2, idx);
                        idx = indexOf;
                        if (indexOf <= -1) {
                            break;
                        }
                        idx += lang2.length();
                        if (idx == header2.length()) {
                            break;
                        }
                    } while (header2.charAt(idx) != ',');
                    if (idx < 0) {
                        int len2 = header2.lastIndexOf("\r\n\t");
                        if (len2 < 0) {
                            len = 20 + header2.length();
                        } else {
                            len = (header2.length() - len2) + 8;
                        }
                        if (len + lang2.length() > 76) {
                            header = header2.concat("\r\n\t".concat(lang2));
                        } else {
                            header = header2.concat(lang2);
                        }
                        p.setHeader("Content-Language", header);
                    }
                }
            }
        } catch (MessagingException ME) {
            reportError(ME.getMessage(), ME, 5);
        }
    }

    private void setAcceptLang(Part p) {
        try {
            String lang = LogManagerProperties.toLanguageTag(Locale.getDefault());
            if (lang.length() != 0) {
                p.setHeader("Accept-Language", lang);
            }
        } catch (MessagingException ME) {
            reportError(ME.getMessage(), ME, 5);
        }
    }

    private void reportFilterError(LogRecord record) {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        SimpleFormatter f = new SimpleFormatter();
        String msg = "Log record " + record.getSequenceNumber() + " was filtered from all message parts.  " + head(f) + format(f, record) + tail(f, "");
        String txt = getFilter() + ", " + Arrays.asList(readOnlyAttachmentFilters());
        reportError(msg, new IllegalArgumentException(txt), 5);
    }

    private void reportNonSymmetric(Object o, Object found) {
        reportError("Non symmetric equals implementation.", new IllegalArgumentException(o.getClass().getName() + " is not equal to " + found.getClass().getName()), 4);
    }

    private void reportNonDiscriminating(Object o, Object found) {
        reportError("Non discriminating equals implementation.", new IllegalArgumentException(o.getClass().getName() + " should not be equal to " + found.getClass().getName()), 4);
    }

    private void reportNullError(int code) {
        reportError("null", new NullPointerException(), code);
    }

    private String head(Formatter f) {
        try {
            return f.getHead(this);
        } catch (RuntimeException RE) {
            reportError(RE.getMessage(), RE, 5);
            return "";
        }
    }

    private String format(Formatter f, LogRecord r) {
        try {
            return f.format(r);
        } catch (RuntimeException RE) {
            reportError(RE.getMessage(), RE, 5);
            return "";
        }
    }

    private String tail(Formatter f, String def) {
        try {
            return f.getTail(this);
        } catch (RuntimeException RE) {
            reportError(RE.getMessage(), RE, 5);
            return def;
        }
    }

    private void setMailer(Message msg) {
        String value;
        String value2;
        try {
            Class<?> k = getClass();
            if (k == MailHandler.class) {
                value2 = MailHandler.class.getName();
            } else {
                try {
                    value = MimeUtility.encodeText(k.getName());
                } catch (UnsupportedEncodingException E) {
                    reportError(E.getMessage(), E, 5);
                    value = k.getName().replaceAll("[^\\x00-\\x7F]", "\u001a");
                }
                value2 = MimeUtility.fold(10, MailHandler.class.getName() + " using the " + value + " extension.");
            }
            msg.setHeader("X-Mailer", value2);
        } catch (MessagingException ME) {
            reportError(ME.getMessage(), ME, 5);
        }
    }

    private void setPriority(Message msg) {
        try {
            msg.setHeader("Importance", "High");
            msg.setHeader("Priority", "urgent");
            msg.setHeader("X-Priority", "2");
        } catch (MessagingException ME) {
            reportError(ME.getMessage(), ME, 5);
        }
    }

    private void setIncompleteCopy(Message msg) {
        try {
            msg.setHeader("Incomplete-Copy", "");
        } catch (MessagingException ME) {
            reportError(ME.getMessage(), ME, 5);
        }
    }

    private void setAutoSubmitted(Message msg) {
        try {
            msg.setHeader("auto-submitted", "auto-generated");
        } catch (MessagingException ME) {
            reportError(ME.getMessage(), ME, 5);
        }
    }

    private void setFrom(Message msg) {
        String from = msg.getSession().getProperty("mail.from");
        if (from != null) {
            try {
                Address[] address = InternetAddress.parse(from, false);
                if (address.length > 0) {
                    if (address.length == 1) {
                        msg.setFrom(address[0]);
                    } else {
                        msg.addFrom(address);
                    }
                }
                return;
            } catch (MessagingException ME) {
                reportError(ME.getMessage(), ME, 5);
                setDefaultFrom(msg);
                return;
            }
        }
        setDefaultFrom(msg);
    }

    private void setDefaultFrom(Message msg) {
        try {
            msg.setFrom();
        } catch (MessagingException ME) {
            reportError(ME.getMessage(), ME, 5);
        }
    }

    private void setDefaultRecipient(Message msg, Message.RecipientType type) {
        try {
            Address a = InternetAddress.getLocalAddress(msg.getSession());
            if (a != null) {
                msg.setRecipient(type, a);
            } else {
                MimeMessage m = new MimeMessage(msg.getSession());
                m.setFrom();
                Address[] from = m.getFrom();
                if (from.length > 0) {
                    msg.setRecipients(type, from);
                } else {
                    throw new MessagingException("No local address.");
                }
            }
        } catch (RuntimeException RE) {
            reportError("Unable to compute a default recipient.", RE, 5);
        } catch (MessagingException ME) {
            reportError("Unable to compute a default recipient.", ME, 5);
        }
    }

    private void setReplyTo(Message msg) {
        String reply = msg.getSession().getProperty("mail.reply.to");
        if (!isEmpty(reply)) {
            try {
                Address[] address = InternetAddress.parse(reply, false);
                if (address.length > 0) {
                    msg.setReplyTo(address);
                }
            } catch (MessagingException ME) {
                reportError(ME.getMessage(), ME, 5);
            }
        }
    }

    private void setSender(Message msg) {
        if (!$assertionsDisabled && !(msg instanceof MimeMessage)) {
            throw new AssertionError(msg);
        }
        String sender = msg.getSession().getProperty("mail.sender");
        if (!isEmpty(sender)) {
            try {
                InternetAddress[] address = InternetAddress.parse(sender, false);
                if (address.length > 0) {
                    ((MimeMessage) msg).setSender(address[0]);
                    if (address.length > 1) {
                        reportError("Ignoring other senders.", tooManyAddresses(address, 1), 5);
                    }
                }
            } catch (MessagingException ME) {
                reportError(ME.getMessage(), ME, 5);
            }
        }
    }

    private AddressException tooManyAddresses(Address[] address, int offset) {
        Object l = Arrays.asList(address).subList(offset, address.length);
        return new AddressException(l.toString());
    }

    private boolean setRecipient(Message msg, String key, Message.RecipientType type) {
        String value = msg.getSession().getProperty(key);
        boolean containsKey = value != null;
        if (!isEmpty(value)) {
            try {
                Address[] address = InternetAddress.parse(value, false);
                if (address.length > 0) {
                    msg.setRecipients(type, address);
                }
            } catch (MessagingException ME) {
                reportError(ME.getMessage(), ME, 5);
            }
        }
        return containsKey;
    }

    private String toRawString(Message msg) throws MessagingException, IOException {
        if (msg != null) {
            int nbytes = Math.max(msg.getSize() + MIN_HEADER_SIZE, MIN_HEADER_SIZE);
            ByteArrayOutputStream out = new ByteArrayOutputStream(nbytes);
            msg.writeTo(out);
            return out.toString("US-ASCII");
        }
        return null;
    }

    private String toMsgString(Throwable t) {
        if (t == null) {
            return "null";
        }
        String encoding = getEncodingName();
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream(MIN_HEADER_SIZE);
            PrintWriter pw = new PrintWriter(new OutputStreamWriter(out, encoding));
            pw.println(t.getMessage());
            t.printStackTrace(pw);
            pw.flush();
            pw.close();
            return out.toString(encoding);
        } catch (IOException badMimeCharset) {
            return t.toString() + ' ' + badMimeCharset.toString();
        }
    }

    private Object getAndSetContextClassLoader() {
        try {
            return AccessController.doPrivileged(GET_AND_SET_CCL);
        } catch (SecurityException e) {
            return GET_AND_SET_CCL;
        }
    }

    private void setContextClassLoader(Object ccl) {
        if (ccl == null || (ccl instanceof ClassLoader)) {
            AccessController.doPrivileged(new GetAndSetContext(ccl));
        }
    }

    private static RuntimeException attachmentMismatch(String msg) {
        return new IndexOutOfBoundsException(msg);
    }

    private static RuntimeException attachmentMismatch(int expected, int found) {
        return attachmentMismatch("Attachments mismatched, expected " + expected + " but given " + found + '.');
    }

    private static MessagingException attach(MessagingException required, Exception optional) {
        if (optional != null && !required.setNextException(optional) && (optional instanceof MessagingException)) {
            MessagingException head = (MessagingException) optional;
            if (head.setNextException(required)) {
                return head;
            }
        }
        return required;
    }

    private static String atIndexMsg(int i) {
        return "At index: " + i + '.';
    }

    /* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/logging/MailHandler$DefaultAuthenticator.class */
    private static final class DefaultAuthenticator extends Authenticator {
        private final String pass;
        static final /* synthetic */ boolean $assertionsDisabled;

        static {
            $assertionsDisabled = !MailHandler.class.desiredAssertionStatus();
        }

        DefaultAuthenticator(String pass) {
            if (!$assertionsDisabled && pass == null) {
                throw new AssertionError();
            }
            this.pass = pass;
        }

        @Override // korex.mail.Authenticator
        protected final PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(getDefaultUserName(), this.pass);
        }
    }

    /* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/logging/MailHandler$GetAndSetContext.class */
    private static final class GetAndSetContext implements PrivilegedAction<Object> {
        private final Object source;
        static final /* synthetic */ boolean $assertionsDisabled;

        static {
            $assertionsDisabled = !MailHandler.class.desiredAssertionStatus();
        }

        GetAndSetContext(Object source) {
            this.source = source;
        }

        @Override // java.security.PrivilegedAction
        public final Object run() {
            ClassLoader loader;
            Thread current = Thread.currentThread();
            ClassLoader ccl = current.getContextClassLoader();
            if (this.source == null) {
                loader = null;
            } else if (this.source instanceof ClassLoader) {
                loader = (ClassLoader) this.source;
            } else if (this.source instanceof Class) {
                loader = ((Class) this.source).getClassLoader();
            } else {
                if (!$assertionsDisabled && (this.source instanceof Class)) {
                    throw new AssertionError(this.source);
                }
                loader = this.source.getClass().getClassLoader();
            }
            if (ccl != loader) {
                current.setContextClassLoader(loader);
                return ccl;
            }
            return this;
        }
    }

    /* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/logging/MailHandler$TailNameFormatter.class */
    private static final class TailNameFormatter extends Formatter {
        private final String name;
        static final /* synthetic */ boolean $assertionsDisabled;

        static {
            $assertionsDisabled = !MailHandler.class.desiredAssertionStatus();
        }

        TailNameFormatter(String name) {
            if (!$assertionsDisabled && name == null) {
                throw new AssertionError();
            }
            this.name = name;
        }

        @Override // java.util.logging.Formatter
        public final String format(LogRecord record) {
            return "";
        }

        @Override // java.util.logging.Formatter
        public final String getTail(Handler h) {
            return this.name;
        }

        public final boolean equals(Object o) {
            if (o instanceof TailNameFormatter) {
                return this.name.equals(((TailNameFormatter) o).name);
            }
            return false;
        }

        public final int hashCode() {
            return getClass().hashCode() + this.name.hashCode();
        }

        public final String toString() {
            return this.name;
        }
    }
}
