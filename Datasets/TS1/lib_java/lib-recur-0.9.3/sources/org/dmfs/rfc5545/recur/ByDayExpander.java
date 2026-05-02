package org.dmfs.rfc5545.recur;

import java.util.List;
import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.recur.ByExpander;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/ByDayExpander.class */
final class ByDayExpander extends ByExpander {
    private final int[] mByDay;
    private final ByExpander.Scope mScope;
    private final int[] mMonths;

    private static int packWeekday(int i, int i2) {
        return (i << 8) + i2;
    }

    private static int unpackWeekday(int i) {
        return i & 255;
    }

    private static int unpackPos(int i) {
        return i >> 8;
    }

    public ByDayExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j) {
        super(ruleIterator, calendarMetrics, j);
        List<RecurrenceRule.WeekdayNum> byDayPart = recurrenceRule.getByDayPart();
        this.mByDay = new int[byDayPart.size()];
        int size = byDayPart.size();
        for (int i = 0; i < size; i++) {
            RecurrenceRule.WeekdayNum weekdayNum = byDayPart.get(i);
            this.mByDay[i] = packWeekday(weekdayNum.pos, weekdayNum.weekday.ordinal());
        }
        boolean hasPart = recurrenceRule.hasPart(RecurrenceRule.Part.BYMONTH);
        Freq freq = recurrenceRule.getFreq();
        this.mScope = (recurrenceRule.hasPart(RecurrenceRule.Part.BYWEEKNO) || freq == Freq.WEEKLY) ? (hasPart || freq == Freq.MONTHLY) ? ByExpander.Scope.WEEKLY_AND_MONTHLY : ByExpander.Scope.WEEKLY : (hasPart || freq == Freq.MONTHLY) ? ByExpander.Scope.MONTHLY : ByExpander.Scope.YEARLY;
        if (this.mScope == ByExpander.Scope.WEEKLY_AND_MONTHLY && hasPart) {
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
        for (int i : this.mByDay) {
            int unpackPos = unpackPos(i);
            int unpackWeekday = unpackWeekday(i);
            switch (this.mScope) {
                case WEEKLY:
                    if (unpackPos != 0 && unpackPos != 1) {
                        break;
                    } else {
                        addInstance(calendarMetrics.setDayOfWeek(j, unpackWeekday));
                        break;
                    }
                    break;
                case WEEKLY_AND_MONTHLY:
                    if (unpackPos != 0 && unpackPos != 1) {
                        break;
                    } else {
                        long dayOfWeek = calendarMetrics.setDayOfWeek(j, unpackWeekday);
                        int month2 = Instance.month(dayOfWeek);
                        if ((this.mMonths == null || StaticUtils.linearSearch(this.mMonths, month2) <= 0) && (this.mMonths != null || month2 != month)) {
                            break;
                        } else {
                            addInstance(dayOfWeek);
                            break;
                        }
                    }
                    break;
                case MONTHLY:
                    int dayOfWeek2 = calendarMetrics.getDayOfWeek(year, month, 1);
                    int daysPerPackedMonth = calendarMetrics.getDaysPerPackedMonth(year, month);
                    int i2 = (((unpackWeekday - dayOfWeek2) + 7) % 7) + 1;
                    if (unpackPos == 0) {
                        for (int i3 = i2; i3 <= daysPerPackedMonth; i3 += 7) {
                            addInstance(Instance.setDayOfMonth(j, i3));
                        }
                        break;
                    } else {
                        int i4 = 1 + ((daysPerPackedMonth - i2) / 7);
                        if ((unpackPos <= 0 || unpackPos > i4) && (unpackPos >= 0 || unpackPos + i4 + 1 <= 0)) {
                            break;
                        } else {
                            addInstance(Instance.setDayOfMonth(j, i2 + ((unpackPos > 0 ? unpackPos - 1 : unpackPos + i4) * 7)));
                            break;
                        }
                    }
                    break;
                case YEARLY:
                    int weekDayOfFirstYearDay = (((unpackWeekday - calendarMetrics.getWeekDayOfFirstYearDay(year)) + 7) % 7) + 1;
                    int daysPerYear = calendarMetrics.getDaysPerYear(year);
                    if (unpackPos == 0) {
                        for (int i5 = weekDayOfFirstYearDay; i5 <= daysPerYear; i5 += 7) {
                            int monthAndDayOfYearDay = calendarMetrics.getMonthAndDayOfYearDay(year, i5);
                            addInstance(Instance.setMonthAndDayOfMonth(j, CalendarMetrics.packedMonth(monthAndDayOfYearDay), CalendarMetrics.dayOfMonth(monthAndDayOfYearDay)));
                        }
                        break;
                    } else if (unpackPos > 0) {
                        int i6 = weekDayOfFirstYearDay + ((unpackPos - 1) * 7);
                        if (i6 <= daysPerYear) {
                            int monthAndDayOfYearDay2 = calendarMetrics.getMonthAndDayOfYearDay(year, i6);
                            addInstance(Instance.setMonthAndDayOfMonth(j, CalendarMetrics.packedMonth(monthAndDayOfYearDay2), CalendarMetrics.dayOfMonth(monthAndDayOfYearDay2)));
                            break;
                        } else {
                            break;
                        }
                    } else {
                        int i7 = (weekDayOfFirstYearDay + daysPerYear) - (daysPerYear % 7);
                        if (i7 > daysPerYear) {
                            i7 -= 7;
                        }
                        int i8 = i7 + ((unpackPos + 1) * 7);
                        if (i8 > 0) {
                            int monthAndDayOfYearDay3 = calendarMetrics.getMonthAndDayOfYearDay(year, i8);
                            addInstance(Instance.setMonthAndDayOfMonth(j, CalendarMetrics.packedMonth(monthAndDayOfYearDay3), CalendarMetrics.dayOfMonth(monthAndDayOfYearDay3)));
                            break;
                        } else {
                            break;
                        }
                    }
            }
        }
    }
}
