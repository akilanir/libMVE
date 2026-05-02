package org.dmfs.rfc5545.calendarmetrics;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.Weekday;

/* loaded from: rfc5545-datetime-0.2.4.jar:org/dmfs/rfc5545/calendarmetrics/NoLeapMonthCalendarMetrics.class */
public abstract class NoLeapMonthCalendarMetrics extends CalendarMetrics {
    public NoLeapMonthCalendarMetrics(Weekday weekday, int i) {
        super(weekday, i);
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int packedMonth(String str) {
        try {
            int parseInt = Integer.parseInt(str) - 1;
            if (parseInt < 0 || parseInt >= getMonthsPerYear()) {
                throw new IllegalArgumentException("month " + str + " is out of range 1.." + getMonthsPerYear());
            }
            return parseInt;
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("illegal month string " + str, e);
        }
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public String packedMonthToString(int i) {
        return String.valueOf(i + 1);
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int packedMonth(int i, boolean z) {
        return i;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public boolean isLeapMonth(int i) {
        return false;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int monthNum(int i) {
        return i;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getMonthsPerYear(int i) {
        return getMonthsPerYear();
    }

    public abstract int getMonthsPerYear();

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public long nextMonth(long j) {
        int month = Instance.month(j) + 1;
        return month < getMonthsPerYear() ? Instance.setMonth(j, month) : Instance.setYear(Instance.setMonth(j, 0), Instance.year(j) + 1);
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public long nextMonth(long j, int i) {
        if (i < 0) {
            throw new IllegalArgumentException("n must be >=0");
        }
        if (i == 0) {
            return j;
        }
        int month = Instance.month(j) + i;
        int monthsPerYear = getMonthsPerYear();
        return month < monthsPerYear ? Instance.setMonth(j, month) : Instance.setYear(Instance.setMonth(j, month % monthsPerYear), Instance.year(j) + (month / monthsPerYear));
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public long prevMonth(long j) {
        int month = Instance.month(j) - 1;
        return month >= 0 ? Instance.setMonth(j, month) : Instance.setYear(Instance.setMonth(j, getMonthsPerYear() - 1), Instance.year(j) - 1);
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public long prevMonth(long j, int i) {
        if (i < 0) {
            throw new IllegalArgumentException("n must be >=0");
        }
        if (i == 0) {
            return j;
        }
        int month = Instance.month(j) - i;
        int monthsPerYear = getMonthsPerYear();
        return month >= 0 ? Instance.setMonth(j, month) : Instance.setYear(Instance.setMonth(j, (monthsPerYear + (month % monthsPerYear)) % monthsPerYear), Instance.year(j) + (month / monthsPerYear));
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public long nextDay(long j) {
        int dayOfMonth = Instance.dayOfMonth(j) + 1;
        int year = Instance.year(j);
        int month = Instance.month(j);
        if (dayOfMonth > getDaysPerPackedMonth(year, month)) {
            dayOfMonth = 1;
            int i = month + 1;
            if (i == getMonthsPerYear()) {
                j = Instance.setYear(j, year + 1);
                i = 0;
            }
            j = Instance.setMonth(j, i);
        }
        return Instance.setDayOfMonth(j, dayOfMonth);
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public long nextDay(long j, int i) {
        if (i < 0) {
            throw new IllegalArgumentException("n must be >=0");
        }
        if (i == 0) {
            return j;
        }
        int year = Instance.year(j);
        int month = Instance.month(j);
        int dayOfYear = getDayOfYear(year, month, Math.min(Instance.dayOfMonth(j), getDaysPerPackedMonth(year, month))) + i;
        while (true) {
            int i2 = dayOfYear;
            int daysPerYear = getDaysPerYear(year);
            if (i2 <= daysPerYear) {
                int monthAndDayOfYearDay = getMonthAndDayOfYearDay(year, dayOfYear);
                return Instance.setYear(Instance.setMonthAndDayOfMonth(j, packedMonth(monthAndDayOfYearDay), dayOfMonth(monthAndDayOfYearDay)), year);
            }
            dayOfYear -= daysPerYear;
            year++;
        }
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public long prevDay(long j) {
        int min = Math.min(Instance.dayOfMonth(j) - 1, getDaysPerPackedMonth(Instance.year(j), Instance.month(j)));
        if (min <= 0) {
            int year = Instance.year(j);
            int month = Instance.month(j) - 1;
            if (month <= -1) {
                year--;
                j = Instance.setYear(j, year);
                month = getMonthsPerYear() - 1;
            }
            min = getDaysPerPackedMonth(year, month);
            j = Instance.setMonth(j, month);
        }
        return Instance.setDayOfMonth(j, min);
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public long prevDay(long j, int i) {
        if (i < 0) {
            throw new IllegalArgumentException("n must be >=0");
        }
        if (i == 0) {
            return j;
        }
        int year = Instance.year(j);
        int month = Instance.month(j);
        int dayOfYear = getDayOfYear(year, month, Math.min(Instance.dayOfMonth(j), getDaysPerPackedMonth(year, month) + 1)) - i;
        while (true) {
            int i2 = dayOfYear;
            if (i2 >= 1) {
                int monthAndDayOfYearDay = getMonthAndDayOfYearDay(year, i2);
                return Instance.setYear(Instance.setMonthAndDayOfMonth(j, packedMonth(monthAndDayOfYearDay), dayOfMonth(monthAndDayOfYearDay)), year);
            }
            year--;
            dayOfYear = i2 + getDaysPerYear(year);
        }
    }
}
