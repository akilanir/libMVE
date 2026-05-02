package org.dmfs.rfc5545.recur;

import java.util.List;
import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.recur.ByExpander;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/ByDayFilter.class */
final class ByDayFilter extends ByFilter {
    private final ByExpander.Scope mScope;
    private final boolean mHasPositions;
    private final int[] mPackedDays;

    private static int packWeekday(int i, int i2) {
        return (i << 8) + i2;
    }

    private static int unpackWeekday(int i) {
        return i & 255;
    }

    private static int unpackPos(int i) {
        return i >>> 8;
    }

    public ByDayFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) {
        super(calendarMetrics);
        List<RecurrenceRule.WeekdayNum> byDayPart = recurrenceRule.getByDayPart();
        boolean hasPart = recurrenceRule.hasPart(RecurrenceRule.Part.BYMONTH);
        Freq freq = recurrenceRule.getFreq();
        this.mScope = (recurrenceRule.hasPart(RecurrenceRule.Part.BYWEEKNO) || freq == Freq.WEEKLY) ? (hasPart || freq == Freq.MONTHLY) ? ByExpander.Scope.WEEKLY_AND_MONTHLY : ByExpander.Scope.WEEKLY : (hasPart || freq == Freq.MONTHLY) ? ByExpander.Scope.MONTHLY : ByExpander.Scope.YEARLY;
        boolean z = false;
        this.mPackedDays = new int[byDayPart.size()];
        int i = 0;
        for (RecurrenceRule.WeekdayNum weekdayNum : byDayPart) {
            if (weekdayNum.pos != 0) {
                z = true;
            }
            this.mPackedDays[i] = packWeekday(weekdayNum.pos, weekdayNum.weekday.ordinal());
            i++;
        }
        this.mHasPositions = z;
    }

    @Override // org.dmfs.rfc5545.recur.ByFilter
    boolean filter(long j) {
        int year = Instance.year(j);
        int month = Instance.month(j);
        int dayOfMonth = Instance.dayOfMonth(j);
        CalendarMetrics calendarMetrics = this.mCalendarMetrics;
        int dayOfWeek = calendarMetrics.getDayOfWeek(year, month, dayOfMonth);
        int[] iArr = this.mPackedDays;
        if (!this.mHasPositions) {
            return StaticUtils.linearSearch(iArr, packWeekday(0, dayOfWeek)) < 0;
        }
        switch (this.mScope) {
            case WEEKLY:
                if (StaticUtils.linearSearch(iArr, packWeekday(0, dayOfWeek)) < 0) {
                }
                break;
            case WEEKLY_AND_MONTHLY:
            case MONTHLY:
                int i = ((dayOfMonth - 1) / 7) + 1;
                int daysPerPackedMonth = ((dayOfMonth - calendarMetrics.getDaysPerPackedMonth(year, month)) / 7) - 1;
                if ((i <= 0 || StaticUtils.linearSearch(iArr, packWeekday(i, dayOfWeek)) < 0) && (daysPerPackedMonth >= 0 || StaticUtils.linearSearch(iArr, packWeekday(daysPerPackedMonth, dayOfWeek)) < 0)) {
                }
                break;
            case YEARLY:
                int dayOfYear = calendarMetrics.getDayOfYear(year, month, dayOfMonth);
                int i2 = ((dayOfYear - 1) / 7) + 1;
                int daysPerYear = ((dayOfYear - calendarMetrics.getDaysPerYear(year)) / 7) - 1;
                if ((i2 <= 0 || StaticUtils.linearSearch(iArr, packWeekday(i2, dayOfWeek)) < 0) && (daysPerYear >= 0 || StaticUtils.linearSearch(iArr, packWeekday(daysPerYear, dayOfWeek)) < 0)) {
                }
                break;
        }
        return false;
    }
}
