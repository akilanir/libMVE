package freemarker.log;

import freemarker.template.utility.ClassUtil;
import java.util.HashMap;
import java.util.Map;

/* loaded from: freemarker-2.3.20.jar:freemarker/log/Logger.class */
public abstract class Logger {
    public static final int LIBRARY_AUTO = -1;
    public static final int LIBRARY_NONE = 0;
    public static final int LIBRARY_JAVA = 1;
    public static final int LIBRARY_AVALON = 2;
    public static final int LIBRARY_LOG4J = 3;
    public static final int LIBRARY_COMMONS = 4;
    public static final int LIBRARY_SLF4J = 5;
    private static int logLibrary;
    private static LoggerFactory factory;
    static Class class$freemarker$log$Logger;
    private static final String[] LIBINIT = {"freemarker.log.Logger", "_Null", "java.util.logging.Logger", "_JDK14", "org.apache.log.Logger", "_Avalon", "org.apache.log4j.Logger", "_Log4J", "org.apache.commons.logging.Log", "CommonsLogging", "org.slf4j.Logger", "SLF4J"};
    private static String categoryPrefix = "";
    private static final Map loggers = new HashMap();

    public abstract void debug(String str);

    public abstract void debug(String str, Throwable th);

    public abstract void info(String str);

    public abstract void info(String str, Throwable th);

    public abstract void warn(String str);

    public abstract void warn(String str, Throwable th);

    public abstract void error(String str);

    public abstract void error(String str, Throwable th);

    public abstract boolean isDebugEnabled();

    public abstract boolean isInfoEnabled();

    public abstract boolean isWarnEnabled();

    public abstract boolean isErrorEnabled();

    public abstract boolean isFatalEnabled();

    public static void selectLoggerLibrary(int library) throws ClassNotFoundException {
        Class cls;
        if (class$freemarker$log$Logger == null) {
            cls = class$("freemarker.log.Logger");
            class$freemarker$log$Logger = cls;
        } else {
            cls = class$freemarker$log$Logger;
        }
        Class cls2 = cls;
        synchronized (cls) {
            if (library >= -1) {
                if (library * 2 < LIBINIT.length) {
                    logLibrary = library;
                    factory = createFactory();
                    return;
                }
            }
            throw new IllegalArgumentException();
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public static void setCategoryPrefix(String prefix) {
        Class cls;
        if (class$freemarker$log$Logger == null) {
            cls = class$("freemarker.log.Logger");
            class$freemarker$log$Logger = cls;
        } else {
            cls = class$freemarker$log$Logger;
        }
        Class cls2 = cls;
        synchronized (cls) {
            if (prefix == null) {
                throw new IllegalArgumentException();
            }
            categoryPrefix = prefix;
        }
    }

    public static Logger getLogger(String category) {
        Logger logger;
        Class cls;
        if (factory == null) {
            if (class$freemarker$log$Logger == null) {
                cls = class$("freemarker.log.Logger");
                class$freemarker$log$Logger = cls;
            } else {
                cls = class$freemarker$log$Logger;
            }
            Class cls2 = cls;
            synchronized (cls) {
                if (factory == null) {
                    try {
                        selectLoggerLibrary(-1);
                    } catch (ClassNotFoundException e) {
                        throw new RuntimeException(e.getMessage());
                    }
                }
            }
        }
        String category2 = new StringBuffer().append(categoryPrefix).append(category).toString();
        synchronized (loggers) {
            Logger logger2 = (Logger) loggers.get(category2);
            if (logger2 == null) {
                logger2 = factory.getLogger(category2);
                loggers.put(category2, logger2);
            }
            logger = logger2;
        }
        return logger;
    }

    private static LoggerFactory createFactory() throws ClassNotFoundException {
        if (logLibrary == -1) {
            for (int i = (LIBINIT.length / 2) - 1; i > 0; i--) {
                if (i != 5 && i != 4) {
                    try {
                        return createFactory(i);
                    } catch (ClassNotFoundException e) {
                    }
                }
            }
            System.err.println("*** WARNING: FreeMarker logging suppressed.");
            return new _NullLoggerFactory();
        }
        return createFactory(logLibrary);
    }

    private static LoggerFactory createFactory(int library) throws ClassNotFoundException {
        String loggerClassName = LIBINIT[library * 2];
        String factoryType = LIBINIT[(library * 2) + 1];
        try {
            ClassUtil.forName(loggerClassName);
            return (LoggerFactory) Class.forName(new StringBuffer().append("freemarker.log.").append(factoryType).append("LoggerFactory").toString()).newInstance();
        } catch (IllegalAccessException e) {
            throw new IllegalAccessError(e.getMessage());
        } catch (InstantiationException e2) {
            throw new InstantiationError(e2.getMessage());
        }
    }
}
