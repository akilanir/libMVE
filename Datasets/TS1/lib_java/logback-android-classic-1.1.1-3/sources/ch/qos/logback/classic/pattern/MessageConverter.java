package ch.qos.logback.classic.pattern;

import ch.qos.logback.classic.spi.ILoggingEvent;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/pattern/MessageConverter.class */
public class MessageConverter extends ClassicConverter {
    public String convert(ILoggingEvent iLoggingEvent) {
        return iLoggingEvent.getFormattedMessage();
    }
}
