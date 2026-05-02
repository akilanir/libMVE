package ch.qos.logback.classic.pattern;

import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.CoreConstants;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/pattern/LineSeparatorConverter.class */
public class LineSeparatorConverter extends ClassicConverter {
    public String convert(ILoggingEvent iLoggingEvent) {
        return CoreConstants.LINE_SEPARATOR;
    }
}
