package freemarker.log;

import java.util.logging.Level;

/* loaded from: freemarker-2.3.20.jar:freemarker/log/_JDK14LoggerFactory.class */
public class _JDK14LoggerFactory implements LoggerFactory {
    @Override // freemarker.log.LoggerFactory
    public Logger getLogger(String category) {
        return new JDK14Logger(java.util.logging.Logger.getLogger(category));
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/log/_JDK14LoggerFactory$JDK14Logger.class */
    private static class JDK14Logger extends Logger {
        private final java.util.logging.Logger logger;

        JDK14Logger(java.util.logging.Logger logger) {
            this.logger = logger;
        }

        @Override // freemarker.log.Logger
        public void debug(String message) {
            this.logger.log(Level.FINE, message);
        }

        @Override // freemarker.log.Logger
        public void debug(String message, Throwable t) {
            this.logger.log(Level.FINE, message, t);
        }

        @Override // freemarker.log.Logger
        public void error(String message) {
            this.logger.log(Level.SEVERE, message);
        }

        @Override // freemarker.log.Logger
        public void error(String message, Throwable t) {
            this.logger.log(Level.SEVERE, message, t);
        }

        @Override // freemarker.log.Logger
        public void info(String message) {
            this.logger.log(Level.INFO, message);
        }

        @Override // freemarker.log.Logger
        public void info(String message, Throwable t) {
            this.logger.log(Level.INFO, message, t);
        }

        @Override // freemarker.log.Logger
        public void warn(String message) {
            this.logger.log(Level.WARNING, message);
        }

        @Override // freemarker.log.Logger
        public void warn(String message, Throwable t) {
            this.logger.log(Level.WARNING, message, t);
        }

        @Override // freemarker.log.Logger
        public boolean isDebugEnabled() {
            return this.logger.isLoggable(Level.FINE);
        }

        @Override // freemarker.log.Logger
        public boolean isInfoEnabled() {
            return this.logger.isLoggable(Level.INFO);
        }

        @Override // freemarker.log.Logger
        public boolean isWarnEnabled() {
            return this.logger.isLoggable(Level.WARNING);
        }

        @Override // freemarker.log.Logger
        public boolean isErrorEnabled() {
            return this.logger.isLoggable(Level.SEVERE);
        }

        @Override // freemarker.log.Logger
        public boolean isFatalEnabled() {
            return this.logger.isLoggable(Level.SEVERE);
        }
    }
}
