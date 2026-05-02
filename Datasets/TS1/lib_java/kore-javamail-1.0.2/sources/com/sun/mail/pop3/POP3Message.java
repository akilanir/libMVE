package com.sun.mail.pop3;

import com.sun.mail.util.ReadableMime;
import java.io.BufferedOutputStream;
import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.SoftReference;
import java.util.Enumeration;
import java.util.logging.Level;
import korex.mail.Flags;
import korex.mail.Folder;
import korex.mail.FolderClosedException;
import korex.mail.IllegalWriteException;
import korex.mail.MessageRemovedException;
import korex.mail.MessagingException;
import korex.mail.internet.InternetHeaders;
import korex.mail.internet.MimeMessage;
import korex.mail.internet.SharedInputStream;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/pop3/POP3Message.class */
public class POP3Message extends MimeMessage implements ReadableMime {
    static final String UNKNOWN = "UNKNOWN";
    private POP3Folder folder;
    private int hdrSize;
    private int msgSize;
    String uid;
    private SoftReference rawData;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !POP3Message.class.desiredAssertionStatus();
    }

    public POP3Message(Folder folder, int msgno) throws MessagingException {
        super(folder, msgno);
        this.hdrSize = -1;
        this.msgSize = -1;
        this.uid = UNKNOWN;
        this.rawData = new SoftReference(null);
        if (!$assertionsDisabled && !(folder instanceof POP3Folder)) {
            throw new AssertionError();
        }
        this.folder = (POP3Folder) folder;
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Message
    public synchronized void setFlags(Flags newFlags, boolean set) throws MessagingException {
        Flags oldFlags = (Flags) this.flags.clone();
        super.setFlags(newFlags, set);
        if (!this.flags.equals(oldFlags)) {
            this.folder.notifyMessageChangedListeners(1, this);
        }
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public int getSize() throws MessagingException {
        int i;
        try {
            synchronized (this) {
                if (this.msgSize > 0) {
                    return this.msgSize;
                }
                if (this.headers == null) {
                    loadHeaders();
                }
                synchronized (this) {
                    if (this.msgSize < 0) {
                        this.msgSize = this.folder.getProtocol().list(this.msgnum) - this.hdrSize;
                    }
                    i = this.msgSize;
                }
                return i;
            }
        } catch (EOFException eex) {
            this.folder.close(false);
            throw new FolderClosedException(this.folder, eex.toString());
        } catch (IOException ex) {
            throw new MessagingException("error getting size", ex);
        }
    }

    private InputStream getRawStream(boolean skipHeader) throws MessagingException {
        InputStream rawcontent;
        int len;
        try {
            synchronized (this) {
                rawcontent = (InputStream) this.rawData.get();
                if (rawcontent == null) {
                    TempFile cache = this.folder.getFileCache();
                    if (cache != null) {
                        if (this.folder.logger.isLoggable(Level.FINE)) {
                            this.folder.logger.fine("caching message #" + this.msgnum + " in temp file");
                        }
                        AppendStream os = cache.getAppendStream();
                        BufferedOutputStream bos = new BufferedOutputStream(os);
                        try {
                            this.folder.getProtocol().retr(this.msgnum, bos);
                            bos.close();
                            rawcontent = os.getInputStream();
                        } catch (Throwable th) {
                            bos.close();
                            throw th;
                        }
                    } else {
                        rawcontent = this.folder.getProtocol().retr(this.msgnum, this.msgSize > 0 ? this.msgSize + this.hdrSize : 0);
                    }
                    if (rawcontent == null) {
                        this.expunged = true;
                        throw new MessageRemovedException("can't retrieve message #" + this.msgnum + " in POP3Message.getContentStream");
                    }
                    if (this.headers == null || ((POP3Store) this.folder.getStore()).forgetTopHeaders) {
                        this.headers = new InternetHeaders(rawcontent);
                        this.hdrSize = (int) ((SharedInputStream) rawcontent).getPosition();
                    } else {
                        do {
                            len = 0;
                            while (true) {
                                int c1 = rawcontent.read();
                                if (c1 < 0 || c1 == 10) {
                                    break;
                                }
                                if (c1 == 13) {
                                    if (rawcontent.available() > 0) {
                                        rawcontent.mark(1);
                                        if (rawcontent.read() != 10) {
                                            rawcontent.reset();
                                        }
                                    }
                                } else {
                                    len++;
                                }
                            }
                            if (rawcontent.available() == 0) {
                                break;
                            }
                        } while (len != 0);
                        this.hdrSize = (int) ((SharedInputStream) rawcontent).getPosition();
                    }
                    this.msgSize = rawcontent.available();
                    this.rawData = new SoftReference(rawcontent);
                }
            }
            return ((SharedInputStream) rawcontent).newStream(skipHeader ? this.hdrSize : 0L, -1L);
        } catch (EOFException eex) {
            this.folder.close(false);
            throw new FolderClosedException(this.folder, eex.toString());
        } catch (IOException ex) {
            throw new MessagingException("error fetching POP3 content", ex);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // korex.mail.internet.MimeMessage
    protected synchronized InputStream getContentStream() throws MessagingException {
        if (this.contentStream != null) {
            return ((SharedInputStream) this.contentStream).newStream(0L, -1L);
        }
        InputStream rawStream = getRawStream(true);
        TempFile cache = this.folder.getFileCache();
        if (cache != null || ((POP3Store) this.folder.getStore()).keepMessageContent) {
            this.contentStream = ((SharedInputStream) rawStream).newStream(0L, -1L);
        }
        return rawStream;
    }

    @Override // com.sun.mail.util.ReadableMime
    public InputStream getMimeStream() throws MessagingException {
        return getRawStream(false);
    }

    public synchronized void invalidate(boolean invalidateHeaders) {
        this.content = null;
        InputStream rstream = (InputStream) this.rawData.get();
        if (rstream != null) {
            try {
                rstream.close();
            } catch (IOException e) {
            }
            this.rawData = new SoftReference(null);
        }
        if (this.contentStream != null) {
            try {
                this.contentStream.close();
            } catch (IOException e2) {
            }
            this.contentStream = null;
        }
        this.msgSize = -1;
        if (invalidateHeaders) {
            this.headers = null;
            this.hdrSize = -1;
        }
    }

    public InputStream top(int n) throws MessagingException {
        InputStream pVar;
        try {
            synchronized (this) {
                pVar = this.folder.getProtocol().top(this.msgnum, n);
            }
            return pVar;
        } catch (EOFException eex) {
            this.folder.close(false);
            throw new FolderClosedException(this.folder, eex.toString());
        } catch (IOException ex) {
            throw new MessagingException("error getting size", ex);
        }
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public String[] getHeader(String name) throws MessagingException {
        if (this.headers == null) {
            loadHeaders();
        }
        return this.headers.getHeader(name);
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.internet.MimePart
    public String getHeader(String name, String delimiter) throws MessagingException {
        if (this.headers == null) {
            loadHeaders();
        }
        return this.headers.getHeader(name, delimiter);
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public void setHeader(String name, String value) throws MessagingException {
        throw new IllegalWriteException("POP3 messages are read-only");
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public void addHeader(String name, String value) throws MessagingException {
        throw new IllegalWriteException("POP3 messages are read-only");
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public void removeHeader(String name) throws MessagingException {
        throw new IllegalWriteException("POP3 messages are read-only");
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public Enumeration getAllHeaders() throws MessagingException {
        if (this.headers == null) {
            loadHeaders();
        }
        return this.headers.getAllHeaders();
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public Enumeration getMatchingHeaders(String[] names) throws MessagingException {
        if (this.headers == null) {
            loadHeaders();
        }
        return this.headers.getMatchingHeaders(names);
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public Enumeration getNonMatchingHeaders(String[] names) throws MessagingException {
        if (this.headers == null) {
            loadHeaders();
        }
        return this.headers.getNonMatchingHeaders(names);
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.internet.MimePart
    public void addHeaderLine(String line) throws MessagingException {
        throw new IllegalWriteException("POP3 messages are read-only");
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.internet.MimePart
    public Enumeration getAllHeaderLines() throws MessagingException {
        if (this.headers == null) {
            loadHeaders();
        }
        return this.headers.getAllHeaderLines();
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.internet.MimePart
    public Enumeration getMatchingHeaderLines(String[] names) throws MessagingException {
        if (this.headers == null) {
            loadHeaders();
        }
        return this.headers.getMatchingHeaderLines(names);
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.internet.MimePart
    public Enumeration getNonMatchingHeaderLines(String[] names) throws MessagingException {
        if (this.headers == null) {
            loadHeaders();
        }
        return this.headers.getNonMatchingHeaderLines(names);
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Message
    public void saveChanges() throws MessagingException {
        throw new IllegalWriteException("POP3 messages are read-only");
    }

    @Override // korex.mail.internet.MimeMessage
    public synchronized void writeTo(OutputStream os, String[] ignoreList) throws IOException, MessagingException {
        Closeable closeable = (InputStream) this.rawData.get();
        if (closeable == null && ignoreList == null && !((POP3Store) this.folder.getStore()).cacheWriteTo) {
            if (this.folder.logger.isLoggable(Level.FINE)) {
                this.folder.logger.fine("streaming msg " + this.msgnum);
            }
            if (!this.folder.getProtocol().retr(this.msgnum, os)) {
                this.expunged = true;
                throw new MessageRemovedException("can't retrieve message #" + this.msgnum + " in POP3Message.writeTo");
            }
            return;
        }
        if (closeable != null && ignoreList == null) {
            InputStream in = ((SharedInputStream) closeable).newStream(0L, -1L);
            try {
                byte[] buf = new byte[16384];
                while (true) {
                    int len = in.read(buf);
                    if (len <= 0) {
                        break;
                    } else {
                        os.write(buf, 0, len);
                    }
                }
                if (in != null) {
                    try {
                    } catch (IOException e) {
                        return;
                    }
                }
                return;
            } finally {
                if (in != null) {
                    try {
                        in.close();
                    } catch (IOException e2) {
                    }
                }
            }
        }
        super.writeTo(os, ignoreList);
    }

    private void loadHeaders() throws MessagingException {
        InputStream hdrs;
        if (!$assertionsDisabled && Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        boolean fetchContent = false;
        try {
            synchronized (this) {
                if (this.headers != null) {
                    return;
                }
                if (((POP3Store) this.folder.getStore()).disableTop || (hdrs = this.folder.getProtocol().top(this.msgnum, 0)) == null) {
                    fetchContent = true;
                } else {
                    try {
                        this.hdrSize = hdrs.available();
                        this.headers = new InternetHeaders(hdrs);
                        hdrs.close();
                    } catch (Throwable th) {
                        hdrs.close();
                        throw th;
                    }
                }
                if (fetchContent) {
                    InputStream cs = null;
                    try {
                        cs = getContentStream();
                        if (cs != null) {
                            cs.close();
                        }
                    } catch (Throwable th2) {
                        if (cs != null) {
                            cs.close();
                        }
                        throw th2;
                    }
                }
            }
        } catch (EOFException eex) {
            this.folder.close(false);
            throw new FolderClosedException(this.folder, eex.toString());
        } catch (IOException ex) {
            throw new MessagingException("error loading POP3 headers", ex);
        }
    }
}
