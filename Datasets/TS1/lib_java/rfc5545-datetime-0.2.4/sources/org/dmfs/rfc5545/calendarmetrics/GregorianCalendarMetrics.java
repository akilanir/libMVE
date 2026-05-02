package org.dmfs.rfc5545.calendarmetrics;

import java.util.TimeZone;
import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.Weekday;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;

/* loaded from: rfc5545-datetime-0.2.4.jar:org/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics.class */
public class GregorianCalendarMetrics extends NoLeapMonthCalendarMetrics {
    public static final String CALENDAR_SCALE_ALIAS = "GREGORIAN";
    public static final String CALENDAR_SCALE_NAME = "GREGORY";
    public static final CalendarMetrics.CalendarMetricsFactory FACTORY = new CalendarMetrics.CalendarMetricsFactory() { // from class: org.dmfs.rfc5545.calendarmetrics.GregorianCalendarMetrics.1
        @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics.CalendarMetricsFactory
        public CalendarMetrics getCalendarMetrics(Weekday weekday) {
            return new GregorianCalendarMetrics(weekday, 4);
        }

        public String toString() {
            return GregorianCalendarMetrics.CALENDAR_SCALE_ALIAS;
        }
    };
    private static final int[] DAYS_PER_MONTH = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    private static final int[] YEARDAYS_PER_MONTH = {0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334};
    public static final Weekday[] WEEKDAYS = Weekday.values();

    public GregorianCalendarMetrics(Weekday weekday, int i) {
        super(weekday, i);
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getMaxMonthDayNum() {
        return 31;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getMaxYearDayNum() {
        return 366;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getMaxWeekNoNum() {
        return 53;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getDaysPerPackedMonth(int i, int i2) {
        return (i2 == 1 && isLeapYear(i)) ? DAYS_PER_MONTH[i2] + 1 : DAYS_PER_MONTH[i2];
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getYearDaysForPackedMonth(int i, int i2) {
        return (i2 <= 1 || !isLeapYear(i)) ? YEARDAYS_PER_MONTH[i2] : YEARDAYS_PER_MONTH[i2] + 1;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.NoLeapMonthCalendarMetrics
    public int getMonthsPerYear() {
        return 12;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getDaysPerYear(int i) {
        return isLeapYear(i) ? 366 : 365;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getWeeksPerYear(int i) {
        int daysPerYear = (getDaysPerYear(i) - getYearDayOfFirstWeekStart(i)) + 1;
        int i2 = daysPerYear / 7;
        return 7 - (daysPerYear % 7) >= this.minDaysInFirstWeek ? i2 : i2 + 1;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getWeekOfYear(int i, int i2) {
        int yearDayOfFirstWeekStart = getYearDayOfFirstWeekStart(i);
        if (i2 < yearDayOfFirstWeekStart) {
            return getWeeksPerYear(i - 1);
        }
        int i3 = ((i2 - yearDayOfFirstWeekStart) / 7) + 1;
        int weeksPerYear = getWeeksPerYear(i);
        return i3 > weeksPerYear ? i3 - weeksPerYear : i3;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getDayOfYear(int i, int i2, int i3) {
        return getYearDaysForPackedMonth(i, i2) + i3;
    }

    boolean isLeapYear(int i) {
        return ((i & 3) == 0 && i % 100 != 0) || i % 400 == 0;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getWeekDayOfFirstYearDay(int i) {
        int i2 = i - 1;
        return (((1 + (5 * (i2 & 3))) + (4 * (i2 % 100))) + (6 * (i2 % 400))) % 7;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getYearDayOfFirstWeekStart(int i) {
        int weekDayOfFirstYearDay = 1 + (this.weekStartInt - getWeekDayOfFirstYearDay(i));
        return weekDayOfFirstYearDay > this.minDaysInFirstWeek ? weekDayOfFirstYearDay - 7 : weekDayOfFirstYearDay < this.minDaysInFirstWeek - 6 ? weekDayOfFirstYearDay + 7 : weekDayOfFirstYearDay;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getPackedMonthOfYearDay(int i, int i2) {
        while (i2 < 1) {
            i--;
            i2 += getDaysPerYear(i);
        }
        while (true) {
            int i3 = i2;
            int daysPerYear = getDaysPerYear(i);
            if (i3 <= daysPerYear) {
                break;
            }
            i++;
            i2 -= daysPerYear;
        }
        int i4 = (i2 >> 5) + 1;
        if (i4 < 12 && getYearDaysForPackedMonth(i, i4) < i2) {
            i4++;
        }
        return i4 - 1;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getDayOfMonthOfYearDay(int i, int i2) {
        return i2 - getYearDaysForPackedMonth(i, getPackedMonthOfYearDay(i, i2));
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getMonthAndDayOfYearDay(int i, int i2) {
        while (i2 < 1) {
            i--;
            i2 += getDaysPerYear(i);
        }
        while (true) {
            int i3 = i2;
            int daysPerYear = getDaysPerYear(i);
            if (i3 <= daysPerYear) {
                break;
            }
            i++;
            i2 -= daysPerYear;
        }
        int i4 = (i2 >> 5) + 1;
        if (i4 < 12 && getYearDaysForPackedMonth(i, i4) < i2) {
            i4++;
        }
        int i5 = i4 - 1;
        return monthAndDay(i5, i2 - getYearDaysForPackedMonth(i, i5));
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getYearDayOfIsoYear(int i, int i2, int i3) {
        return ((i2 * 7) - 7) + (((i3 - this.weekStartInt) + 7) % 7) + getYearDayOfFirstWeekStart(i);
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getYearDayOfWeekStart(int i, int i2) {
        return getYearDayOfFirstWeekStart(i) + ((i2 - 1) * 7);
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public long toMillis(TimeZone timeZone, int i, int i2, int i3, int i4, int i5, int i6, int i7) {
        int i8 = (((((i4 * 60) + i5) * 60) + i6) * 1000) + i7;
        int dayOfWeek = getDayOfWeek(i, i2, i3);
        int offset = timeZone == null ? 0 : timeZone.getOffset(1, i, i2, i3, dayOfWeek + 1, i8) - timeZone.getRawOffset();
        long timeStamp = getTimeStamp(i, getDayOfYear(i, i2, i3), i4, i5, i6, i7);
        int i9 = i8 - offset;
        if (i9 < 0) {
            i9 += 86400000;
            i3--;
            if (i3 == 0) {
                i2--;
                if (i2 < 0) {
                    i--;
                    i2 = getMonthsPerYear(i) - 1;
                }
                i3 = getDaysPerPackedMonth(i, i2);
                dayOfWeek = (dayOfWeek + 6) % 7;
            }
        } else if (i9 >= 86400000) {
            i9 -= 86400000;
            i3++;
            if (i3 > getDaysPerPackedMonth(i, i2)) {
                i2++;
                if (i2 >= getMonthsPerYear(i)) {
                    i++;
                    i2 = 0;
                }
                i3 = 1;
                dayOfWeek = (dayOfWeek + 1) % 7;
            }
        }
        return timeStamp - (timeZone == null ? 0 : timeZone.getOffset(1, i, i2, i3, dayOfWeek + 1, i9));
    }

    long getTimeStamp(int i, int i2, int i3, int i4, int i5, int i6) {
        return ((((((((((((i - 1970) * 365) + i2) - 1) + numLeapDaysSince1970(i)) * 24) + i3) * 60) + i4) * 60) + i5) * 1000) + i6;
    }

    int numLeapDaysSince1970(int i) {
        int i2 = i - 1;
        int i3 = i2 >> 2;
        int i4 = i2 / 100;
        return ((i3 - 492) - (i4 - 19)) + ((i4 >> 2) - 4);
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public long toInstance(long j, TimeZone timeZone) {
        long j2 = j;
        if (timeZone != null) {
            j2 += timeZone.getOffset(j);
        }
        int i = (int) (j2 % IslamicCalendarMetrics.MILLIS_PER_DAY);
        long j3 = j2 - i;
        if (i < 0) {
            i += 86400000;
            j3 -= IslamicCalendarMetrics.MILLIS_PER_DAY;
        }
        int i2 = (int) ((j3 / IslamicCalendarMetrics.MILLIS_PER_DAY) + 718685 + 477);
        int i3 = i2 / 146097;
        int i4 = i2 % 146097;
        int min = Math.min(i4 / 36524, 3);
        int i5 = i4 - (min * 36524);
        int min2 = Math.min(i5 / 1461, 24);
        int i6 = i5 - (min2 * 1461);
        int min3 = Math.min(i6 / 365, 3);
        int i7 = (i6 - (365 * min3)) + 1;
        int i8 = (((i3 << 2) + min) * 100) + (min2 << 2) + min3 + 1;
        int monthAndDayOfYearDay = getMonthAndDayOfYearDay(i8, i7);
        int i9 = i / 60000;
        return Instance.make(i8, packedMonth(monthAndDayOfYearDay), dayOfMonth(monthAndDayOfYearDay), i9 / 60, i9 % 60, (i / 1000) % 60);
    }
}
