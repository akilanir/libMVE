package org.dmfs.rfc5545.calendarmetrics;

import java.util.TimeZone;
import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.Weekday;

/* loaded from: rfc5545-datetime-0.2.4.jar:org/dmfs/rfc5545/calendarmetrics/CalendarMetrics.class */
public abstract class CalendarMetrics {
    public final Weekday weekStart;
    public final int weekStartInt;
    public final int minDaysInFirstWeek;

    /* loaded from: rfc5545-datetime-0.2.4.jar:org/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory.class */
    public static abstract class CalendarMetricsFactory {
        public abstract CalendarMetrics getCalendarMetrics(Weekday weekday);
    }

    public CalendarMetrics(Weekday weekday, int i) {
        this.weekStart = weekday;
        this.weekStartInt = weekday.ordinal();
        this.minDaysInFirstWeek = i;
    }

    public int packedMonth(String str) {
        if (str == null) {
            throw new IllegalArgumentException("month strings must not be null");
        }
        int length = str.length();
        if (length == 0 || length > 3) {
            throw new IllegalArgumentException("illegal month string " + str);
        }
        char charAt = str.charAt(length - 1);
        int i = (charAt == 'L' || charAt == 'l') ? 1 : 0;
        try {
            return (Integer.parseInt(str.substring(0, length - i)) - 1) << (1 + i);
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("illegal month string " + str, e);
        }
    }

    public String packedMonthToString(int i) {
        return (i & 1) == 1 ? String.valueOf(i >>> 1) + "L" : String.valueOf(i >>> 1);
    }

    public int packedMonth(int i, boolean z) {
        return z ? i << 2 : i << 1;
    }

    public boolean isLeapMonth(int i) {
        return (i & 1) == 1;
    }

    public int monthNum(int i) {
        return i >>> 1;
    }

    public static int monthAndDay(int i, int i2) {
        return (i << 8) + i2;
    }

    public static int packedMonth(int i) {
        return i >> 8;
    }

    public static int dayOfMonth(int i) {
        return i & 255;
    }

    public abstract int getMaxMonthDayNum();

    public abstract int getMaxYearDayNum();

    public abstract int getMaxWeekNoNum();

    public abstract int getDaysPerPackedMonth(int i, int i2);

    public abstract int getPackedMonthOfYearDay(int i, int i2);

    public abstract int getDayOfMonthOfYearDay(int i, int i2);

    public abstract int getMonthAndDayOfYearDay(int i, int i2);

    public abstract int getYearDaysForPackedMonth(int i, int i2);

    public abstract int getMonthsPerYear(int i);

    public abstract int getDaysPerYear(int i);

    public abstract int getWeeksPerYear(int i);

    public int getWeekOfYear(int i, int i2, int i3) {
        return getWeekOfYear(i, getDayOfYear(i, i2, i3));
    }

    public abstract int getWeekOfYear(int i, int i2);

    public int getDayOfWeek(int i, int i2) {
        return ((getWeekDayOfFirstYearDay(i) + i2) - 1) % 7;
    }

    public int getDayOfWeek(int i, int i2, int i3) {
        return getDayOfWeek(i, getDayOfYear(i, i2, i3));
    }

    public abstract int getDayOfYear(int i, int i2, int i3);

    public abstract int getYearDayOfIsoYear(int i, int i2, int i3);

    public abstract int getWeekDayOfFirstYearDay(int i);

    public abstract int getYearDayOfFirstWeekStart(int i);

    public abstract int getYearDayOfWeekStart(int i, int i2);

    public long toMillis(long j, TimeZone timeZone) {
        return toMillis((timeZone == null || "UTC".equals(timeZone.getID())) ? null : timeZone, Instance.year(j), Instance.month(j), Instance.dayOfMonth(j), Instance.hour(j), Instance.minute(j), Instance.second(j), 0);
    }

    public abstract long toMillis(TimeZone timeZone, int i, int i2, int i3, int i4, int i5, int i6, int i7);

    public abstract long toInstance(long j, TimeZone timeZone);

    public boolean validate(long j) {
        int dayOfMonth;
        int hour;
        int minute;
        int second;
        int year = Instance.year(j);
        int month = Instance.month(j);
        return month >= 0 && month < getMonthsPerYear(year) && (dayOfMonth = Instance.dayOfMonth(j)) >= 1 && dayOfMonth <= getDaysPerPackedMonth(year, month) && (hour = Instance.hour(j)) >= 0 && hour <= 23 && (minute = Instance.minute(j)) >= 0 && minute <= 59 && (second = Instance.second(j)) >= 0 && second <= 59;
    }

    public abstract long nextMonth(long j);

    public abstract long nextMonth(long j, int i);

    public abstract long prevMonth(long j);

    public abstract long prevMonth(long j, int i);

    public abstract long nextDay(long j);

    public abstract long nextDay(long j, int i);

    public abstract long prevDay(long j);

    public abstract long prevDay(long j, int i);

    public long startOfWeek(long j) {
        int dayOfWeek = ((this.weekStartInt - getDayOfWeek(Instance.year(j), Instance.month(j), Instance.dayOfMonth(j))) - 7) % 7;
        return dayOfWeek == 0 ? j : dayOfWeek == -1 ? prevDay(j) : prevDay(j, -dayOfWeek);
    }

    public long setDayOfWeek(long j, int i) {
        int dayOfWeek = (((this.weekStartInt - getDayOfWeek(Instance.year(j), Instance.month(j), Instance.dayOfMonth(j))) - 7) % 7) + (((i - this.weekStartInt) + 7) % 7);
        switch (dayOfWeek) {
            case -6:
            case -5:
            case -4:
            case -3:
            case -2:
                return prevDay(j, -dayOfWeek);
            case -1:
                return prevDay(j);
            case 0:
                return j;
            case 1:
                return nextDay(j);
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
                return nextDay(j, dayOfWeek);
            default:
                return j;
        }
    }

    public int hashCode() {
        return getClass().hashCode();
    }

    public boolean equals(Object obj) {
        return (obj instanceof CalendarMetrics) && getClass() == obj.getClass() && this.minDaysInFirstWeek == ((CalendarMetrics) obj).minDaysInFirstWeek && this.weekStart == ((CalendarMetrics) obj).weekStart;
    }

    public boolean scaleEquals(CalendarMetrics calendarMetrics) {
        return getClass() == calendarMetrics.getClass();
    }
}
