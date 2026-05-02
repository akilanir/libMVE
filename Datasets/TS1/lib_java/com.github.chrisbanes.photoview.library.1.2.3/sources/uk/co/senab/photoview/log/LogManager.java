package uk.co.senab.photoview.log;

/* loaded from: com.github.chrisbanes.photoview.library.1.2.3.jar:uk/co/senab/photoview/log/LogManager.class */
public final class LogManager {
    private static Logger logger = new LoggerDefault();

    public static void setLogger(Logger newLogger) {
        logger = newLogger;
    }

    public static Logger getLogger() {
        return logger;
    }
}
