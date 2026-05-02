package ch.qos.logback.classic.pattern;

import ch.qos.logback.classic.spi.ILoggingEvent;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/pattern/LocalSequenceNumberConverter.class */
public class LocalSequenceNumberConverter extends ClassicConverter {
    AtomicLong sequenceNumber = new AtomicLong(System.currentTimeMillis());

    public String convert(ILoggingEvent iLoggingEvent) {
        return Long.toString(this.sequenceNumber.getAndIncrement());
    }
}
