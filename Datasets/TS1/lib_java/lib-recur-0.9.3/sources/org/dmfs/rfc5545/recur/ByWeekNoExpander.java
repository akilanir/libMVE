package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.recur.ByExpander;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/ByWeekNoExpander.class */
final class ByWeekNoExpander extends ByExpander {
    private final int[] mByWeekNo;
    private final ByExpander.Scope mScope;
    private final boolean mAllowOverlappingWeeks;

    public ByWeekNoExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j) {
        super(ruleIterator, calendarMetrics, j);
        this.mByWeekNo = StaticUtils.ListToSortedArray(recurrenceRule.getByPart(RecurrenceRule.Part.BYWEEKNO));
        this.mScope = recurrenceRule.hasPart(RecurrenceRule.Part.BYMONTH) ? ByExpander.Scope.MONTHLY : ByExpander.Scope.YEARLY;
        this.mAllowOverlappingWeeks = this.mScope == ByExpander.Scope.MONTHLY && (recurrenceRule.hasPart(RecurrenceRule.Part.BYDAY) || recurrenceRule.hasPart(RecurrenceRule.Part.BYMONTHDAY) || recurrenceRule.hasPart(RecurrenceRule.Part.BYYEARDAY));
    }

    @Override // org.dmfs.rfc5545.recur.ByExpander
    void expand(long j, long j2) {
        int monthAndDayOfYearDay;
        int packedMonth;
        int year = Instance.year(j);
        int month = Instance.month(j);
        int hour = Instance.hour(j);
        int minute = Instance.minute(j);
        int second = Instance.second(j);
        int dayOfWeek = Instance.dayOfWeek(j);
        int weeksPerYear = this.mCalendarMetrics.getWeeksPerYear(year);
        for (int i : this.mByWeekNo) {
            int i2 = i;
            if (i < 0) {
                i2 = weeksPerYear + i + 1;
            }
            if (i2 > 0 && i2 <= weeksPerYear) {
                if (this.mScope == ByExpander.Scope.MONTHLY && this.mAllowOverlappingWeeks) {
                    int monthAndDayOfYearDay2 = this.mCalendarMetrics.getMonthAndDayOfYearDay(year, this.mCalendarMetrics.getYearDayOfIsoYear(year, i2, dayOfWeek));
                    int packedMonth2 = CalendarMetrics.packedMonth(monthAndDayOfYearDay2);
                    if (packedMonth2 == month) {
                        addInstance(Instance.make(year, packedMonth2, CalendarMetrics.dayOfMonth(monthAndDayOfYearDay2), hour, minute, second));
                    } else {
                        int i3 = this.mCalendarMetrics.weekStartInt;
                        int yearDayOfIsoYear = this.mCalendarMetrics.getYearDayOfIsoYear(year, i2, i3);
                        if (yearDayOfIsoYear >= 1 && yearDayOfIsoYear <= this.mCalendarMetrics.getDaysPerYear(year)) {
                            int monthAndDayOfYearDay3 = this.mCalendarMetrics.getMonthAndDayOfYearDay(year, yearDayOfIsoYear);
                            if (CalendarMetrics.packedMonth(monthAndDayOfYearDay3) == month) {
                                addInstance(Instance.make(year, month, CalendarMetrics.dayOfMonth(monthAndDayOfYearDay3) + (((dayOfWeek - i3) + 7) % 7), hour, minute, second));
                            } else {
                                int yearDayOfIsoYear2 = this.mCalendarMetrics.getYearDayOfIsoYear(year, i2, (i3 + 6) % 7);
                                if (yearDayOfIsoYear2 >= 1 && yearDayOfIsoYear2 <= this.mCalendarMetrics.getDaysPerYear(year)) {
                                    int monthAndDayOfYearDay4 = this.mCalendarMetrics.getMonthAndDayOfYearDay(year, yearDayOfIsoYear2);
                                    if (CalendarMetrics.packedMonth(monthAndDayOfYearDay4) == month) {
                                        addInstance(Instance.make(year, month, CalendarMetrics.dayOfMonth(monthAndDayOfYearDay4) + (((dayOfWeek - i3) - 6) % 7), hour, minute, second));
                                    }
                                }
                            }
                        }
                    }
                } else if (this.mScope == ByExpander.Scope.MONTHLY) {
                    int yearDayOfIsoYear3 = this.mCalendarMetrics.getYearDayOfIsoYear(year, i2, dayOfWeek);
                    if (yearDayOfIsoYear3 >= 1 && yearDayOfIsoYear3 <= this.mCalendarMetrics.getDaysPerYear(year) && (packedMonth = CalendarMetrics.packedMonth((monthAndDayOfYearDay = this.mCalendarMetrics.getMonthAndDayOfYearDay(year, yearDayOfIsoYear3)))) == month) {
                        addInstance(Instance.setMonthAndDayOfMonth(j, packedMonth, CalendarMetrics.dayOfMonth(monthAndDayOfYearDay)));
                    }
                } else {
                    int yearDayOfIsoYear4 = this.mCalendarMetrics.getYearDayOfIsoYear(year, i2, dayOfWeek);
                    if (yearDayOfIsoYear4 < 1) {
                        year--;
                        yearDayOfIsoYear4 += this.mCalendarMetrics.getDaysPerYear(year);
                    } else if (yearDayOfIsoYear4 > this.mCalendarMetrics.getDaysPerYear(year)) {
                        yearDayOfIsoYear4 -= this.mCalendarMetrics.getDaysPerYear(year);
                        year++;
                    }
                    int monthAndDayOfYearDay5 = this.mCalendarMetrics.getMonthAndDayOfYearDay(year, yearDayOfIsoYear4);
                    addInstance(Instance.setMonthAndDayOfMonth(j, CalendarMetrics.packedMonth(monthAndDayOfYearDay5), CalendarMetrics.dayOfMonth(monthAndDayOfYearDay5)));
                }
            }
        }
    }
}
