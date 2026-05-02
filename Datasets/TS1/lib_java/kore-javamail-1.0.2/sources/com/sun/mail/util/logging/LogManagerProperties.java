package com.sun.mail.util.logging;

import java.io.ObjectStreamException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.security.AccessController;
import java.security.PrivilegedAction;
import java.util.Collections;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Locale;
import java.util.Properties;
import java.util.logging.ErrorManager;
import java.util.logging.Filter;
import java.util.logging.Formatter;
import java.util.logging.LogManager;
import java.util.logging.LogRecord;
import korex.mail.Authenticator;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/logging/LogManagerProperties.class */
final class LogManagerProperties extends Properties {
    private static final long serialVersionUID = -2239983349056806252L;
    private static final LogManager LOG_MANAGER;
    private static volatile String[] REFLECT_NAMES;
    private final String prefix;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !LogManagerProperties.class.desiredAssertionStatus();
        LOG_MANAGER = LogManager.getLogManager();
    }

    static LogManager getLogManager() {
        return LOG_MANAGER;
    }

    static String toLanguageTag(Locale locale) {
        String l = locale.getLanguage();
        String c = locale.getCountry();
        String v = locale.getVariant();
        char[] b = new char[l.length() + c.length() + v.length() + 2];
        int count = l.length();
        l.getChars(0, count, b, 0);
        if (c.length() != 0 || (l.length() != 0 && v.length() != 0)) {
            b[count] = '-';
            int count2 = count + 1;
            c.getChars(0, c.length(), b, count2);
            count = count2 + c.length();
        }
        if (v.length() != 0 && (l.length() != 0 || c.length() != 0)) {
            b[count] = '-';
            int count3 = count + 1;
            v.getChars(0, v.length(), b, count3);
            count = count3 + v.length();
        }
        return String.valueOf(b, 0, count);
    }

    static Filter newFilter(String name) throws Exception {
        return (Filter) newObjectFrom(name, Filter.class);
    }

    static Formatter newFormatter(String name) throws Exception {
        return (Formatter) newObjectFrom(name, Formatter.class);
    }

    static Comparator<? super LogRecord> newComparator(String name) throws Exception {
        return (Comparator) newObjectFrom(name, Comparator.class);
    }

    static <T> Comparator<T> reverseOrder(Comparator<T> c) {
        if (c == null) {
            throw new NullPointerException();
        }
        Comparator<T> reverse = null;
        try {
            Method m = c.getClass().getMethod("reversed", new Class[0]);
            if (!Modifier.isStatic(m.getModifiers()) && Comparator.class.isAssignableFrom(m.getReturnType())) {
                try {
                    reverse = (Comparator) m.invoke(c, new Object[0]);
                } catch (ExceptionInInitializerError eiie) {
                    throw wrapOrThrow(eiie);
                }
            }
        } catch (IllegalAccessException e) {
        } catch (NoSuchMethodException e2) {
        } catch (RuntimeException e3) {
        } catch (InvocationTargetException ite) {
            paramOrError(ite);
        }
        if (reverse == null) {
            reverse = Collections.reverseOrder(c);
        }
        return reverse;
    }

    static ErrorManager newErrorManager(String name) throws Exception {
        return (ErrorManager) newObjectFrom(name, ErrorManager.class);
    }

    static Authenticator newAuthenticator(String name) throws Exception {
        return (Authenticator) newObjectFrom(name, Authenticator.class);
    }

    static boolean isStaticUtilityClass(String name) throws Exception {
        boolean util;
        Class<?> c = findClass(name);
        Method[] methods = c.getMethods();
        if (c != Object.class && methods.length != 0) {
            util = true;
            int length = methods.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    break;
                }
                Method m = methods[i];
                if (m.getDeclaringClass() == Object.class || Modifier.isStatic(m.getModifiers())) {
                    i++;
                } else {
                    util = false;
                    break;
                }
            }
        } else {
            util = false;
        }
        return util;
    }

    static boolean isReflectionClass(String name) throws Exception {
        String[] strArr = REFLECT_NAMES;
        String[] names = strArr;
        if (strArr == null) {
            String[] reflectionClassNames = reflectionClassNames();
            names = reflectionClassNames;
            REFLECT_NAMES = reflectionClassNames;
        }
        for (String rf : names) {
            if (name.equals(rf)) {
                return true;
            }
        }
        findClass(name);
        return false;
    }

    private static String[] reflectionClassNames() throws Exception {
        if (!$assertionsDisabled && !Modifier.isFinal(LogManagerProperties.class.getModifiers())) {
            throw new AssertionError(LogManagerProperties.class);
        }
        try {
            HashSet<String> traces = new HashSet<>();
            Throwable t = (Throwable) Throwable.class.getConstructor(new Class[0]).newInstance(new Object[0]);
            for (StackTraceElement ste : t.getStackTrace()) {
                if (LogManagerProperties.class.getName().equals(ste.getClassName())) {
                    break;
                }
                traces.add(ste.getClassName());
            }
            Throwable.class.getMethod("fillInStackTrace", new Class[0]).invoke(t, new Object[0]);
            for (StackTraceElement ste2 : t.getStackTrace()) {
                if (LogManagerProperties.class.getName().equals(ste2.getClassName())) {
                    break;
                }
                traces.add(ste2.getClassName());
            }
            return (String[]) traces.toArray(new String[traces.size()]);
        } catch (InvocationTargetException ITE) {
            throw paramOrError(ITE);
        }
    }

    private static <T> T newObjectFrom(String name, Class<T> type) throws Exception {
        try {
            Class<?> clazz = findClass(name);
            if (type.isAssignableFrom(clazz)) {
                try {
                    return type.cast(clazz.getConstructor(new Class[0]).newInstance(new Object[0]));
                } catch (InvocationTargetException ITE) {
                    throw paramOrError(ITE);
                }
            }
            throw new ClassCastException(clazz.getName() + " cannot be cast to " + type.getName());
        } catch (ExceptionInInitializerError EIIE) {
            throw wrapOrThrow(EIIE);
        } catch (NoClassDefFoundError NCDFE) {
            throw new ClassNotFoundException(NCDFE.toString(), NCDFE);
        }
    }

    private static Exception paramOrError(InvocationTargetException ite) {
        Throwable cause = ite.getCause();
        if (cause != null && ((cause instanceof VirtualMachineError) || (cause instanceof ThreadDeath))) {
            throw ((Error) cause);
        }
        return ite;
    }

    private static InvocationTargetException wrapOrThrow(ExceptionInInitializerError eiie) {
        if (eiie.getCause() instanceof Error) {
            throw eiie;
        }
        return new InvocationTargetException(eiie);
    }

    private static Class<?> findClass(String name) throws ClassNotFoundException {
        Class<?> clazz;
        ClassLoader[] loaders = getClassLoaders();
        if (!$assertionsDisabled && loaders.length != 2) {
            throw new AssertionError(loaders.length);
        }
        if (loaders[0] != null) {
            try {
                clazz = Class.forName(name, false, loaders[0]);
            } catch (ClassNotFoundException e) {
                clazz = tryLoad(name, loaders[1]);
            }
        } else {
            clazz = tryLoad(name, loaders[1]);
        }
        return clazz;
    }

    private static Class<?> tryLoad(String name, ClassLoader l) throws ClassNotFoundException {
        if (l != null) {
            return Class.forName(name, false, l);
        }
        return Class.forName(name);
    }

    private static ClassLoader[] getClassLoaders() {
        return (ClassLoader[]) AccessController.doPrivileged(new PrivilegedAction<ClassLoader[]>() { // from class: com.sun.mail.util.logging.LogManagerProperties.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.security.PrivilegedAction
            public ClassLoader[] run() {
                ClassLoader[] loaders = new ClassLoader[2];
                try {
                    loaders[0] = ClassLoader.getSystemClassLoader();
                } catch (SecurityException e) {
                    loaders[0] = null;
                }
                try {
                    loaders[1] = Thread.currentThread().getContextClassLoader();
                } catch (SecurityException e2) {
                    loaders[1] = null;
                }
                return loaders;
            }
        });
    }

    LogManagerProperties(Properties parent, String prefix) {
        super(parent);
        parent.isEmpty();
        if (prefix == null) {
            throw new NullPointerException();
        }
        this.prefix = prefix;
        super.isEmpty();
    }

    @Override // java.util.Hashtable
    public synchronized Object clone() {
        return exportCopy(this.defaults);
    }

    @Override // java.util.Properties
    public synchronized String getProperty(String key) {
        String value = this.defaults.getProperty(key);
        if (value == null) {
            LogManager manager = getLogManager();
            if (key.length() > 0) {
                value = manager.getProperty(this.prefix + '.' + key);
            }
            if (value == null) {
                value = manager.getProperty(key);
            }
            if (value != null) {
                super.put(key, value);
            } else {
                Object v = super.get(key);
                value = v instanceof String ? (String) v : null;
            }
        }
        return value;
    }

    @Override // java.util.Properties
    public String getProperty(String key, String def) {
        String value = getProperty(key);
        return value == null ? def : value;
    }

    @Override // java.util.Hashtable, java.util.Dictionary, java.util.Map
    public Object get(Object key) {
        if (key instanceof String) {
            return getProperty((String) key);
        }
        return super.get(key);
    }

    @Override // java.util.Hashtable, java.util.Dictionary, java.util.Map
    public synchronized Object put(Object key, Object value) {
        Object def = preWrite(key);
        Object man = super.put(key, value);
        return man == null ? def : man;
    }

    @Override // java.util.Properties
    public Object setProperty(String key, String value) {
        return put(key, value);
    }

    @Override // java.util.Hashtable, java.util.Map
    public boolean containsKey(Object key) {
        if (key instanceof String) {
            return getProperty((String) key) != null;
        }
        return super.containsKey(key);
    }

    @Override // java.util.Hashtable, java.util.Dictionary, java.util.Map
    public synchronized Object remove(Object key) {
        Object def = preWrite(key);
        Object man = super.remove(key);
        return man == null ? def : man;
    }

    @Override // java.util.Properties
    public Enumeration<?> propertyNames() {
        if ($assertionsDisabled) {
            return super.propertyNames();
        }
        throw new AssertionError();
    }

    @Override // java.util.Hashtable, java.util.Map
    public boolean equals(Object o) {
        if (o == null) {
            return false;
        }
        if (o == this) {
            return true;
        }
        if (!(o instanceof Properties)) {
            return false;
        }
        if ($assertionsDisabled) {
            return super.equals(o);
        }
        throw new AssertionError(this.prefix);
    }

    @Override // java.util.Hashtable, java.util.Map
    public int hashCode() {
        if ($assertionsDisabled) {
            return super.hashCode();
        }
        throw new AssertionError(this.prefix.hashCode());
    }

    private Object preWrite(Object key) {
        Object value;
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        if ((key instanceof String) && !super.containsKey(key)) {
            value = getProperty((String) key);
        } else {
            value = null;
        }
        return value;
    }

    private Properties exportCopy(Properties parent) {
        Thread.holdsLock(this);
        Properties child = new Properties(parent);
        child.putAll(this);
        return child;
    }

    private synchronized Object writeReplace() throws ObjectStreamException {
        if ($assertionsDisabled) {
            return exportCopy((Properties) this.defaults.clone());
        }
        throw new AssertionError();
    }
}
