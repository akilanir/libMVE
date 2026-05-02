package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.recur.ByExpander;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/ByYearDayExpander.class */
final class ByYearDayExpander extends ByExpander {
    private final int[] mYearDays;
    private final ByExpander.Scope mScope;
    private final int[] mMonths;

    public ByYearDayExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j) {
        super(ruleIterator, calendarMetrics, j);
        this.mYearDays = StaticUtils.ListToSortedArray(recurrenceRule.getByPart(RecurrenceRule.Part.BYYEARDAY));
        this.mScope = (recurrenceRule.getFreq() == Freq.WEEKLY || recurrenceRule.hasPart(RecurrenceRule.Part.BYWEEKNO)) ? recurrenceRule.hasPart(RecurrenceRule.Part.BYMONTH) ? ByExpander.Scope.WEEKLY_AND_MONTHLY : ByExpander.Scope.WEEKLY : (recurrenceRule.getFreq() != Freq.YEARLY || recurrenceRule.hasPart(RecurrenceRule.Part.BYMONTH)) ? ByExpander.Scope.MONTHLY : ByExpander.Scope.YEARLY;
        if (this.mScope == ByExpander.Scope.WEEKLY_AND_MONTHLY && recurrenceRule.hasPart(RecurrenceRule.Part.BYMONTH)) {
            this.mMonths = StaticUtils.ListToArray(recurrenceRule.getByPart(RecurrenceRule.Part.BYMONTH));
        } else {
            this.mMonths = null;
        }
    }

    @Override // org.dmfs.rfc5545.recur.ByExpander
    void expand(long j, long j2) {
        int monthAndDayOfYearDay;
        int packedMonth;
        int year = Instance.year(j);
        int month = Instance.month(j);
        int dayOfMonth = Instance.dayOfMonth(j);
        int hour = Instance.hour(j);
        int minute = Instance.minute(j);
        int second = Instance.second(j);
        int daysPerYear = this.mCalendarMetrics.getDaysPerYear(year);
        int dayOfYear = this.mCalendarMetrics.getDayOfYear(Instance.year(j2), Instance.month(j2), Instance.dayOfMonth(j2));
        for (int i : this.mYearDays) {
            int i2 = i;
            if (i < 0) {
                i2 = i + daysPerYear + 1;
            }
            switch (this.mScope) {
                case WEEKLY:
                    int daysPerYear2 = this.mCalendarMetrics.getDaysPerYear(year - 1);
                    int daysPerYear3 = this.mCalendarMetrics.getDaysPerYear(year + 1);
                    int i3 = i;
                    int i4 = i;
                    if (i < 0) {
                        i3 = i + daysPerYear2 + 1;
                        i4 = i + daysPerYear3 + 1;
                    }
                    int weekOfYear = this.mCalendarMetrics.getWeekOfYear(year, month, dayOfMonth);
                    int weekOfYear2 = this.mCalendarMetrics.getWeekOfYear(year, i2);
                    if (0 >= i2 || i2 > daysPerYear || weekOfYear2 != weekOfYear) {
                        if (0 >= i4 || i4 > daysPerYear3 || i4 >= 7) {
                            if (0 >= i3 || i3 > daysPerYear2 || i3 <= daysPerYear2 - 7 || this.mCalendarMetrics.getWeekOfYear(year - 1, i3) != weekOfYear) {
                                break;
                            } else {
                                int monthAndDayOfYearDay2 = this.mCalendarMetrics.getMonthAndDayOfYearDay(year - 1, i3);
                                addInstance(Instance.make(year - 1, CalendarMetrics.packedMonth(monthAndDayOfYearDay2), CalendarMetrics.dayOfMonth(monthAndDayOfYearDay2), hour, minute, second));
                                break;
                            }
                        } else if (this.mCalendarMetrics.getWeekOfYear(year + 1, i4) == weekOfYear) {
                            int monthAndDayOfYearDay3 = this.mCalendarMetrics.getMonthAndDayOfYearDay(year + 1, i4);
                            addInstance(Instance.make(year + 1, CalendarMetrics.packedMonth(monthAndDayOfYearDay3), CalendarMetrics.dayOfMonth(monthAndDayOfYearDay3), hour, minute, second));
                            break;
                        } else {
                            break;
                        }
                    } else {
                        int monthAndDayOfYearDay4 = this.mCalendarMetrics.getMonthAndDayOfYearDay(year, i2);
                        addInstance(Instance.setMonthAndDayOfMonth(year, CalendarMetrics.packedMonth(monthAndDayOfYearDay4), CalendarMetrics.dayOfMonth(monthAndDayOfYearDay4)));
                        break;
                    }
                    break;
                case WEEKLY_AND_MONTHLY:
                    int daysPerYear4 = this.mCalendarMetrics.getDaysPerYear(year - 1);
                    int daysPerYear5 = this.mCalendarMetrics.getDaysPerYear(year + 1);
                    int i5 = i;
                    int i6 = i;
                    if (i < 0) {
                        i5 = i + daysPerYear4 + 1;
                        i6 = i + daysPerYear5 + 1;
                    }
                    int weekOfYear3 = this.mCalendarMetrics.getWeekOfYear(year, month, dayOfMonth);
                    int weekOfYear4 = this.mCalendarMetrics.getWeekOfYear(year, i2);
                    if (0 >= i2 || i2 > daysPerYear || weekOfYear4 != weekOfYear3) {
                        if (0 >= i6 || i6 > daysPerYear5 || i6 >= 7) {
                            if (0 >= i5 || i5 > daysPerYear4 || i5 <= daysPerYear4 - 7) {
                                break;
                            } else {
                                int weekOfYear5 = this.mCalendarMetrics.getWeekOfYear(year - 1, i5);
                                int monthAndDayOfYearDay5 = this.mCalendarMetrics.getMonthAndDayOfYearDay(year - 1, i5);
                                int packedMonth2 = CalendarMetrics.packedMonth(monthAndDayOfYearDay5);
                                if ((weekOfYear5 != weekOfYear3 || this.mMonths == null || StaticUtils.linearSearch(this.mMonths, packedMonth2) < 0) && (this.mMonths != null || packedMonth2 != month)) {
                                    break;
                                } else {
                                    addInstance(Instance.make(year - 1, packedMonth2, CalendarMetrics.dayOfMonth(monthAndDayOfYearDay5), hour, minute, second));
                                    break;
                                }
                            }
                        } else {
                            int weekOfYear6 = this.mCalendarMetrics.getWeekOfYear(year + 1, i6);
                            int monthAndDayOfYearDay6 = this.mCalendarMetrics.getMonthAndDayOfYearDay(year + 1, i6);
                            int packedMonth3 = CalendarMetrics.packedMonth(monthAndDayOfYearDay6);
                            if ((weekOfYear6 != weekOfYear3 || this.mMonths == null || StaticUtils.linearSearch(this.mMonths, packedMonth3) < 0) && (this.mMonths != null || packedMonth3 != month)) {
                                break;
                            } else {
                                addInstance(Instance.make(year + 1, packedMonth3, CalendarMetrics.dayOfMonth(monthAndDayOfYearDay6), hour, minute, second));
                                break;
                            }
                        }
                    } else {
                        int monthAndDayOfYearDay7 = this.mCalendarMetrics.getMonthAndDayOfYearDay(year, i2);
                        int packedMonth4 = CalendarMetrics.packedMonth(monthAndDayOfYearDay7);
                        if ((this.mMonths == null || StaticUtils.linearSearch(this.mMonths, packedMonth4) < 0) && (this.mMonths != null || packedMonth4 != month)) {
                            break;
                        } else {
                            addInstance(Instance.setMonthAndDayOfMonth(year, packedMonth4, CalendarMetrics.dayOfMonth(monthAndDayOfYearDay7)));
                            break;
                        }
                    }
                    break;
                case MONTHLY:
                    if (0 >= i2 || i2 > daysPerYear || ((i2 < dayOfYear && year == Instance.year(j2)) || (packedMonth = CalendarMetrics.packedMonth((monthAndDayOfYearDay = this.mCalendarMetrics.getMonthAndDayOfYearDay(year, i2)))) != month)) {
                        break;
                    } else {
                        addInstance(Instance.setMonthAndDayOfMonth(j, packedMonth, CalendarMetrics.dayOfMonth(monthAndDayOfYearDay)));
                        break;
                    }
                case YEARLY:
                    if (0 >= i2 || i2 > daysPerYear || (i2 < dayOfYear && year == Instance.year(j2))) {
                        break;
                    } else {
                        int monthAndDayOfYearDay8 = this.mCalendarMetrics.getMonthAndDayOfYearDay(year, i2);
                        addInstance(Instance.setMonthAndDayOfMonth(j, CalendarMetrics.packedMonth(monthAndDayOfYearDay8), CalendarMetrics.dayOfMonth(monthAndDayOfYearDay8)));
                        break;
                    }
            }
        }
    }
}
