package ch.qos.logback.classic.filter;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.filter.AbstractMatcherFilter;
import ch.qos.logback.core.spi.FilterReply;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/filter/LevelFilter.class */
public class LevelFilter extends AbstractMatcherFilter<ILoggingEvent> {
    Level level;

    public FilterReply decide(ILoggingEvent iLoggingEvent) {
        return !isStarted() ? FilterReply.NEUTRAL : iLoggingEvent.getLevel().equals(this.level) ? this.onMatch : this.onMismatch;
    }

    public void setLevel(Level level) {
        this.level = level;
    }

    public void start() {
        if (this.level != null) {
            super.start();
        }
    }
}
