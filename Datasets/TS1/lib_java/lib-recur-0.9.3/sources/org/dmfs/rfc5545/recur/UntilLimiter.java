package org.dmfs.rfc5545.recur;

import java.util.TimeZone;
import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/UntilLimiter.class */
final class UntilLimiter extends Limiter {
    private final long mUntil;

    public UntilLimiter(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, TimeZone timeZone) {
        super(ruleIterator);
        this.mUntil = recurrenceRule.getUntil().getInstance();
    }

    @Override // org.dmfs.rfc5545.recur.Limiter
    boolean stop(long j) {
        return this.mUntil < Instance.maskWeekday(j);
    }
}
