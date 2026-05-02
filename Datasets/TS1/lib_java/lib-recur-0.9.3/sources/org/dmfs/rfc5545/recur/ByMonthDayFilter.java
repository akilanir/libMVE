package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/ByMonthDayFilter.class */
final class ByMonthDayFilter extends ByFilter {
    private final int[] mMonthDays;

    public ByMonthDayFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) {
        super(calendarMetrics);
        this.mMonthDays = StaticUtils.ListToArray(recurrenceRule.getByPart(RecurrenceRule.Part.BYMONTHDAY));
    }

    @Override // org.dmfs.rfc5545.recur.ByFilter
    boolean filter(long j) {
        int daysPerPackedMonth = this.mCalendarMetrics.getDaysPerPackedMonth(Instance.year(j), Instance.month(j));
        int dayOfMonth = Instance.dayOfMonth(j);
        return (StaticUtils.linearSearch(this.mMonthDays, dayOfMonth) < 0 && StaticUtils.linearSearch(this.mMonthDays, (dayOfMonth - 1) - daysPerPackedMonth) < 0) || dayOfMonth > daysPerPackedMonth;
    }
}
