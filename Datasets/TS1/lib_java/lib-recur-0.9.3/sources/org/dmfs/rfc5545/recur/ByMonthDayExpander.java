package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.recur.ByExpander;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/ByMonthDayExpander.class */
final class ByMonthDayExpander extends ByExpander {
    private final int[] mMonthDays;
    private final ByExpander.Scope mScope;
    private final int[] mMonths;

    public ByMonthDayExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j) {
        super(ruleIterator, calendarMetrics, j);
        this.mMonthDays = StaticUtils.ListToSortedArray(recurrenceRule.getByPart(RecurrenceRule.Part.BYMONTHDAY));
        this.mScope = (recurrenceRule.hasPart(RecurrenceRule.Part.BYWEEKNO) || recurrenceRule.getFreq() == Freq.WEEKLY) ? (recurrenceRule.hasPart(RecurrenceRule.Part.BYMONTH) || recurrenceRule.getFreq() == Freq.MONTHLY) ? ByExpander.Scope.WEEKLY_AND_MONTHLY : ByExpander.Scope.WEEKLY : ByExpander.Scope.MONTHLY;
        if (this.mScope == ByExpander.Scope.WEEKLY_AND_MONTHLY && recurrenceRule.hasPart(RecurrenceRule.Part.BYMONTH)) {
            this.mMonths = StaticUtils.ListToArray(recurrenceRule.getByPart(RecurrenceRule.Part.BYMONTH));
        } else {
            this.mMonths = null;
        }
    }

    @Override // org.dmfs.rfc5545.recur.ByExpander
    void expand(long j, long j2) {
        CalendarMetrics calendarMetrics = this.mCalendarMetrics;
        int year = Instance.year(j);
        int month = Instance.month(j);
        int year2 = Instance.year(j2);
        int month2 = Instance.month(j2);
        if (year >= year2) {
            if (year != year2 || month >= month2) {
                int dayOfMonth = Instance.dayOfMonth(j);
                int i = 0;
                int hour = Instance.hour(j);
                int minute = Instance.minute(j);
                int second = Instance.second(j);
                int i2 = 0;
                int i3 = 0;
                if (this.mScope == ByExpander.Scope.WEEKLY || this.mScope == ByExpander.Scope.WEEKLY_AND_MONTHLY) {
                    i = calendarMetrics.getWeekOfYear(year, month, dayOfMonth);
                    i2 = month == 0 ? calendarMetrics.getDaysPerPackedMonth(year - 1, calendarMetrics.getMonthsPerYear(year - 1) - 1) : calendarMetrics.getDaysPerPackedMonth(year, month - 1);
                    i3 = month == calendarMetrics.getMonthsPerYear(year) - 1 ? calendarMetrics.getDaysPerPackedMonth(year + 1, 0) : calendarMetrics.getDaysPerPackedMonth(year, month + 1);
                }
                int daysPerPackedMonth = calendarMetrics.getDaysPerPackedMonth(year, month);
                for (int i4 : this.mMonthDays) {
                    int i5 = i4;
                    if (i4 < 0) {
                        i5 = i4 + daysPerPackedMonth + 1;
                    }
                    switch (this.mScope) {
                        case WEEKLY:
                            int i6 = i4;
                            int i7 = i4;
                            if (i4 < 0) {
                                i6 = i4 + i2 + 1;
                                i7 = i4 + i3 + 1;
                            }
                            if (0 >= i5 || i5 > daysPerPackedMonth || calendarMetrics.getWeekOfYear(year, month, i5) != i) {
                                if (0 >= i7 || i7 > i3 || i7 >= 7) {
                                    if (0 >= i6 || i6 > i2 || i6 <= i2 - 7) {
                                        break;
                                    } else if (month > 0) {
                                        if (calendarMetrics.getWeekOfYear(year, month - 1, i6) == i) {
                                            addInstance(Instance.make(year, month - 1, i6, hour, minute, second));
                                            break;
                                        } else {
                                            break;
                                        }
                                    } else if (calendarMetrics.getWeekOfYear(year - 1, calendarMetrics.getMonthsPerYear(year - 1) - 1, i6) == i) {
                                        addInstance(Instance.make(year - 1, calendarMetrics.getMonthsPerYear(year - 1) - 1, i6, hour, minute, second));
                                        break;
                                    } else {
                                        break;
                                    }
                                } else if (month < calendarMetrics.getMonthsPerYear(year) - 1) {
                                    if (calendarMetrics.getWeekOfYear(year, month + 1, i7) == i) {
                                        addInstance(Instance.make(year, month + 1, i7, hour, minute, second));
                                        break;
                                    } else {
                                        break;
                                    }
                                } else if (calendarMetrics.getWeekOfYear(year + 1, 0, i7) == i) {
                                    addInstance(Instance.make(year + 1, 0, i7, hour, minute, second));
                                    break;
                                } else {
                                    break;
                                }
                            } else {
                                addInstance(Instance.make(year, month, i5, hour, minute, second));
                                break;
                            }
                        case WEEKLY_AND_MONTHLY:
                            int i8 = i4;
                            int i9 = i4;
                            if (i4 < 0) {
                                i8 = i4 + i2 + 1;
                                i9 = i4 + i3 + 1;
                            }
                            if (0 >= i5 || i5 > daysPerPackedMonth || calendarMetrics.getWeekOfYear(year, month, i5) != i) {
                                if (0 >= i9 || i9 > i3 || i9 >= 7) {
                                    if (0 >= i8 || i8 > i2 || i8 <= i2 - 7) {
                                        break;
                                    } else if (month > 0) {
                                        if (calendarMetrics.getWeekOfYear(year, month - 1, i8) != i || this.mMonths == null || StaticUtils.linearSearch(this.mMonths, month - 1) < 0) {
                                            break;
                                        } else {
                                            addInstance(Instance.make(year, month - 1, i8, hour, minute, second));
                                            break;
                                        }
                                    } else if (calendarMetrics.getWeekOfYear(year - 1, calendarMetrics.getMonthsPerYear(year - 1) - 1, i8) != i || this.mMonths == null || StaticUtils.linearSearch(this.mMonths, calendarMetrics.getMonthsPerYear(year - 1) - 1) < 0) {
                                        break;
                                    } else {
                                        addInstance(Instance.make(year - 1, calendarMetrics.getMonthsPerYear(year - 1) - 1, i8, hour, minute, second));
                                        break;
                                    }
                                } else if (month < calendarMetrics.getMonthsPerYear(year) - 1) {
                                    if (calendarMetrics.getWeekOfYear(year, month + 1, i9) != i || this.mMonths == null || StaticUtils.linearSearch(this.mMonths, month + 1) < 0) {
                                        break;
                                    } else {
                                        addInstance(Instance.make(year, month + 1, i9, hour, minute, second));
                                        break;
                                    }
                                } else if (calendarMetrics.getWeekOfYear(year + 1, 0, i9) != i || this.mMonths == null || StaticUtils.linearSearch(this.mMonths, 0) < 0) {
                                    break;
                                } else {
                                    addInstance(Instance.make(year + 1, 0, i9, hour, minute, second));
                                    break;
                                }
                            } else if (this.mMonths == null || StaticUtils.linearSearch(this.mMonths, month) >= 0) {
                                addInstance(Instance.make(year, month, i5, hour, minute, second));
                                break;
                            } else {
                                break;
                            }
                        case MONTHLY:
                            if (0 < i5) {
                                addInstance(Instance.setDayOfMonth(j, i5));
                                break;
                            } else {
                                break;
                            }
                        default:
                            throw new IllegalStateException("invalid scope for ByMonthDayExpander: " + this.mScope);
                    }
                }
            }
        }
    }
}
