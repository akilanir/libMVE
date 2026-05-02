package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/ByHourFilter.class */
final class ByHourFilter extends ByFilter {
    private final int[] mHours;

    public ByHourFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) {
        super(calendarMetrics);
        this.mHours = StaticUtils.ListToArray(recurrenceRule.getByPart(RecurrenceRule.Part.BYHOUR));
    }

    @Override // org.dmfs.rfc5545.recur.ByFilter
    boolean filter(long j) {
        return StaticUtils.linearSearch(this.mHours, Instance.hour(j)) < 0;
    }
}
