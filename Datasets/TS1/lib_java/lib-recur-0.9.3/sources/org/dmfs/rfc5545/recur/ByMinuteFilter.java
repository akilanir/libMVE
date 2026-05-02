package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/ByMinuteFilter.class */
final class ByMinuteFilter extends ByFilter {
    private final int[] mMinutes;

    public ByMinuteFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) {
        super(calendarMetrics);
        this.mMinutes = StaticUtils.ListToArray(recurrenceRule.getByPart(RecurrenceRule.Part.BYMINUTE));
    }

    @Override // org.dmfs.rfc5545.recur.ByFilter
    boolean filter(long j) {
        return StaticUtils.linearSearch(this.mMinutes, Instance.minute(j)) < 0;
    }
}
