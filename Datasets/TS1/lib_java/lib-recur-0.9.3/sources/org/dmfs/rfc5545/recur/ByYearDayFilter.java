package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/ByYearDayFilter.class */
final class ByYearDayFilter extends ByFilter {
    private final int[] mYearDays;

    public ByYearDayFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) {
        super(calendarMetrics);
        this.mYearDays = StaticUtils.ListToArray(recurrenceRule.getByPart(RecurrenceRule.Part.BYYEARDAY));
    }

    @Override // org.dmfs.rfc5545.recur.ByFilter
    boolean filter(long j) {
        int year = Instance.year(j);
        int daysPerYear = this.mCalendarMetrics.getDaysPerYear(year);
        int dayOfYear = this.mCalendarMetrics.getDayOfYear(year, Instance.month(j), Instance.dayOfMonth(j));
        return (StaticUtils.linearSearch(this.mYearDays, dayOfYear) < 0 && StaticUtils.linearSearch(this.mYearDays, dayOfYear - daysPerYear) < 0) || dayOfYear > daysPerYear;
    }
}
