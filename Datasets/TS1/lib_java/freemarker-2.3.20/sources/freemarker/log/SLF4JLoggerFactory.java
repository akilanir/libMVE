package freemarker.log;

import org.slf4j.Marker;
import org.slf4j.spi.LocationAwareLogger;

/* loaded from: freemarker-2.3.20.jar:freemarker/log/SLF4JLoggerFactory.class */
public class SLF4JLoggerFactory implements LoggerFactory {
    static Class class$freemarker$log$SLF4JLoggerFactory$LocationAwareSLF4JLogger;

    @Override // freemarker.log.LoggerFactory
    public Logger getLogger(String category) {
        LocationAwareLogger logger = org.slf4j.LoggerFactory.getLogger(category);
        if (logger instanceof LocationAwareLogger) {
            return new LocationAwareSLF4JLogger(logger);
        }
        return new LocationUnawareSLF4JLogger(logger);
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger.class */
    private static final class LocationAwareSLF4JLogger extends Logger {
        private static final String ADAPTER_FQCN;
        private final LocationAwareLogger logger;

        static {
            Class cls;
            if (SLF4JLoggerFactory.class$freemarker$log$SLF4JLoggerFactory$LocationAwareSLF4JLogger == null) {
                cls = SLF4JLoggerFactory.class$("freemarker.log.SLF4JLoggerFactory$LocationAwareSLF4JLogger");
                SLF4JLoggerFactory.class$freemarker$log$SLF4JLoggerFactory$LocationAwareSLF4JLogger = cls;
            } else {
                cls = SLF4JLoggerFactory.class$freemarker$log$SLF4JLoggerFactory$LocationAwareSLF4JLogger;
            }
            ADAPTER_FQCN = cls.getName();
        }

        LocationAwareSLF4JLogger(LocationAwareLogger logger) {
            this.logger = logger;
        }

        @Override // freemarker.log.Logger
        public void debug(String message) {
            debug(message, null);
        }

        @Override // freemarker.log.Logger
        public void debug(String message, Throwable t) {
            this.logger.log((Marker) null, ADAPTER_FQCN, 10, message, (Object[]) null, t);
        }

        @Override // freemarker.log.Logger
        public void info(String message) {
            info(message, null);
        }

        @Override // freemarker.log.Logger
        public void info(String message, Throwable t) {
            this.logger.log((Marker) null, ADAPTER_FQCN, 20, message, (Object[]) null, t);
        }

        @Override // freemarker.log.Logger
        public void warn(String message) {
            warn(message, null);
        }

        @Override // freemarker.log.Logger
        public void warn(String message, Throwable t) {
            this.logger.log((Marker) null, ADAPTER_FQCN, 30, message, (Object[]) null, t);
        }

        @Override // freemarker.log.Logger
        public void error(String message) {
            error(message, null);
        }

        @Override // freemarker.log.Logger
        public void error(String message, Throwable t) {
            this.logger.log((Marker) null, ADAPTER_FQCN, 40, message, (Object[]) null, t);
        }

        @Override // freemarker.log.Logger
        public boolean isDebugEnabled() {
            return this.logger.isDebugEnabled();
        }

        @Override // freemarker.log.Logger
        public boolean isInfoEnabled() {
            return this.logger.isInfoEnabled();
        }

        @Override // freemarker.log.Logger
        public boolean isWarnEnabled() {
            return this.logger.isWarnEnabled();
        }

        @Override // freemarker.log.Logger
        public boolean isErrorEnabled() {
            return this.logger.isErrorEnabled();
        }

        @Override // freemarker.log.Logger
        public boolean isFatalEnabled() {
            return this.logger.isErrorEnabled();
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/log/SLF4JLoggerFactory$LocationUnawareSLF4JLogger.class */
    private static class LocationUnawareSLF4JLogger extends Logger {
        private final org.slf4j.Logger logger;

        LocationUnawareSLF4JLogger(org.slf4j.Logger logger) {
            this.logger = logger;
        }

        @Override // freemarker.log.Logger
        public void debug(String message) {
            this.logger.debug(message);
        }

        @Override // freemarker.log.Logger
        public void debug(String message, Throwable t) {
            this.logger.debug(message, t);
        }

        @Override // freemarker.log.Logger
        public void info(String message) {
            this.logger.info(message);
        }

        @Override // freemarker.log.Logger
        public void info(String message, Throwable t) {
            this.logger.info(message, t);
        }

        @Override // freemarker.log.Logger
        public void warn(String message) {
            this.logger.warn(message);
        }

        @Override // freemarker.log.Logger
        public void warn(String message, Throwable t) {
            this.logger.warn(message, t);
        }

        @Override // freemarker.log.Logger
        public void error(String message) {
            this.logger.error(message);
        }

        @Override // freemarker.log.Logger
        public void error(String message, Throwable t) {
            this.logger.error(message, t);
        }

        @Override // freemarker.log.Logger
        public boolean isDebugEnabled() {
            return this.logger.isDebugEnabled();
        }

        @Override // freemarker.log.Logger
        public boolean isInfoEnabled() {
            return this.logger.isInfoEnabled();
        }

        @Override // freemarker.log.Logger
        public boolean isWarnEnabled() {
            return this.logger.isWarnEnabled();
        }

        @Override // freemarker.log.Logger
        public boolean isErrorEnabled() {
            return this.logger.isErrorEnabled();
        }

        @Override // freemarker.log.Logger
        public boolean isFatalEnabled() {
            return this.logger.isErrorEnabled();
        }
    }
}
