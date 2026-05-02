package uk.co.senab.photoview.log;

/* loaded from: com.github.chrisbanes.PhotoView.1.2.6.jar:uk/co/senab/photoview/log/LogManager.class */
public final class LogManager {
    private static Logger logger = new LoggerDefault();

    public static void setLogger(Logger newLogger) {
        logger = newLogger;
    }

    public static Logger getLogger() {
        return logger;
    }
}
