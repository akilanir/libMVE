package ch.qos.logback.classic.pattern;

import ch.qos.logback.classic.spi.ILoggingEvent;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/pattern/LoggerConverter.class */
public class LoggerConverter extends NamedConverter {
    @Override // ch.qos.logback.classic.pattern.NamedConverter
    protected String getFullyQualifiedName(ILoggingEvent iLoggingEvent) {
        return iLoggingEvent.getLoggerName();
    }
}
