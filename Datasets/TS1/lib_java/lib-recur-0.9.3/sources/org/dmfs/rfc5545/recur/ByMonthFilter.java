package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/ByMonthFilter.class */
final class ByMonthFilter extends ByFilter {
    private final int[] mMonths;
    private final boolean mAllowOverlappingWeeks;

    public ByMonthFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) {
        super(calendarMetrics);
        this.mMonths = StaticUtils.ListToArray(recurrenceRule.getByPart(RecurrenceRule.Part.BYMONTH));
        this.mAllowOverlappingWeeks = recurrenceRule.getFreq() == Freq.WEEKLY && (recurrenceRule.hasPart(RecurrenceRule.Part.BYDAY) || recurrenceRule.hasPart(RecurrenceRule.Part.BYMONTHDAY) || recurrenceRule.hasPart(RecurrenceRule.Part.BYYEARDAY));
    }

    @Override // org.dmfs.rfc5545.recur.ByFilter
    boolean filter(long j) {
        int month = Instance.month(j);
        if (!this.mAllowOverlappingWeeks) {
            return StaticUtils.linearSearch(this.mMonths, month) < 0;
        }
        int[] iArr = this.mMonths;
        CalendarMetrics calendarMetrics = this.mCalendarMetrics;
        if (StaticUtils.linearSearch(iArr, month) >= 0) {
            return false;
        }
        long startOfWeek = calendarMetrics.startOfWeek(j);
        return StaticUtils.linearSearch(iArr, Instance.month(startOfWeek)) < 0 && StaticUtils.linearSearch(iArr, Instance.month(calendarMetrics.nextDay(startOfWeek, 6))) < 0;
    }
}
