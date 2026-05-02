package ch.qos.logback.classic.filter;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.filter.Filter;
import ch.qos.logback.core.spi.FilterReply;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/filter/ThresholdFilter.class */
public class ThresholdFilter extends Filter<ILoggingEvent> {
    Level level;

    public FilterReply decide(ILoggingEvent iLoggingEvent) {
        if (isStarted() && !iLoggingEvent.getLevel().isGreaterOrEqual(this.level)) {
            return FilterReply.DENY;
        }
        return FilterReply.NEUTRAL;
    }

    public void setLevel(String str) {
        this.level = Level.toLevel(str);
    }

    public void start() {
        if (this.level != null) {
            super.start();
        }
    }
}
