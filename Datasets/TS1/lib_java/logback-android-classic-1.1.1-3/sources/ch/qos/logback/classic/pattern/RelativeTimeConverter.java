package ch.qos.logback.classic.pattern;

import ch.qos.logback.classic.spi.ILoggingEvent;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/pattern/RelativeTimeConverter.class */
public class RelativeTimeConverter extends ClassicConverter {
    long lastTimestamp = -1;
    String timesmapCache = null;

    public String convert(ILoggingEvent iLoggingEvent) {
        String str;
        long timeStamp = iLoggingEvent.getTimeStamp();
        synchronized (this) {
            if (timeStamp != this.lastTimestamp) {
                this.lastTimestamp = timeStamp;
                this.timesmapCache = Long.toString(timeStamp - iLoggingEvent.getLoggerContextVO().getBirthTime());
            }
            str = this.timesmapCache;
        }
        return str;
    }
}
