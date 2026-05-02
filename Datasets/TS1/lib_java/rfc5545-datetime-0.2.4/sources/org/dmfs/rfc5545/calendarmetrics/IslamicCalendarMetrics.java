package org.dmfs.rfc5545.calendarmetrics;

import java.util.TimeZone;
import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.Weekday;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;

/* loaded from: rfc5545-datetime-0.2.4.jar:org/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics.class */
public class IslamicCalendarMetrics extends NoLeapMonthCalendarMetrics {
    public static final long DAYS_PER_CYCLE = 10631;
    public static final long MILLIS_PER_DAY = 86400000;
    public static final long MILLIS_PER_CYCLE = 918518400000L;
    public static final long MILLIS_TO_1389_10_22C = 42521587200000L;
    public static final String CALENDAR_SCALE_TLBA = "ISLAMIC-TLBA";
    public static final String CALENDAR_SCALE_CIVIL = "ISLAMIC-CIVIL";
    private final int mLeapYearPatternIndex;
    private final boolean mCivil;
    public static final int[] LEAP_YEAR_PATTERNS = {623158436, 623191204, 690562340, 1227434276};
    public static final byte[][] LEAP_YEAR_COUNT = {new byte[]{0, 0, 1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 6, 6, 6, 7, 7, 7, 8, 8, 8, 9, 9, 10, 10, 10, 11, 11}, new byte[]{0, 0, 1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 7, 7, 7, 8, 8, 8, 9, 9, 10, 10, 10, 11, 11}, new byte[]{0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 8, 8, 8, 9, 9, 9, 10, 10, 11, 11}, new byte[]{0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 8, 8, 8, 9, 9, 9, 10, 10, 10, 11}};
    public static final Weekday[] WEEKDAYS = Weekday.values();
    private static final CalendarMetrics GREGORIAN_METRICS = GregorianCalendarMetrics.FACTORY.getCalendarMetrics(Weekday.SU);

    /* loaded from: rfc5545-datetime-0.2.4.jar:org/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$IslamicCalendarMetricsFactory.class */
    public static final class IslamicCalendarMetricsFactory extends CalendarMetrics.CalendarMetricsFactory {
        private final String mName;
        private final LeapYearPattern mPattern;
        private final boolean mCivil;

        public IslamicCalendarMetricsFactory(String str, LeapYearPattern leapYearPattern, boolean z) {
            this.mName = str;
            this.mPattern = leapYearPattern;
            this.mCivil = z;
        }

        @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics.CalendarMetricsFactory
        public CalendarMetrics getCalendarMetrics(Weekday weekday) {
            return new IslamicCalendarMetrics(weekday, 4, this.mPattern, this.mCivil);
        }

        public String toString() {
            return this.mName;
        }
    }

    /* loaded from: rfc5545-datetime-0.2.4.jar:org/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern.class */
    public enum LeapYearPattern {
        I,
        II,
        III,
        IV
    }

    public IslamicCalendarMetrics(Weekday weekday, int i, LeapYearPattern leapYearPattern, boolean z) {
        super(weekday, i);
        this.mLeapYearPatternIndex = leapYearPattern.ordinal();
        this.mCivil = z;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getMaxMonthDayNum() {
        return 30;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getMaxYearDayNum() {
        return 355;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getMaxWeekNoNum() {
        return 52;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getDaysPerPackedMonth(int i, int i2) {
        if (i2 == 11 && isLeapYear(i)) {
            return 30;
        }
        return 30 - (i2 & 1);
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getYearDaysForPackedMonth(int i, int i2) {
        return (i2 * 29) + ((i2 + 1) >>> 1);
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.NoLeapMonthCalendarMetrics
    public int getMonthsPerYear() {
        return 12;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getDaysPerYear(int i) {
        return isLeapYear(i) ? 355 : 354;
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
        return (LEAP_YEAR_PATTERNS[this.mLeapYearPatternIndex] & (1 << (((i - 1) % 30) + 1))) != 0;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getWeekDayOfFirstYearDay(int i) {
        int i2 = i - 1;
        int i3 = i2 % 30;
        return (((5 + (5 * (i2 / 30))) + (4 * i3)) + LEAP_YEAR_COUNT[this.mLeapYearPatternIndex][i3]) % 7;
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
        if (i2 == 355) {
            return 11;
        }
        return ((i2 - 1) * 2) / 59;
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
        int i4 = i2 == 355 ? 11 : ((i2 - 1) * 2) / 59;
        return monthAndDay(i4, i2 - getYearDaysForPackedMonth(i, i4));
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
        long gregorian = toGregorian(Instance.make(i, i2, i3, 0, 0, 0));
        return GREGORIAN_METRICS.toMillis(timeZone, Instance.year(gregorian), Instance.month(gregorian), Instance.dayOfMonth(gregorian), i4, i5, i6, i7);
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public long toInstance(long j, TimeZone timeZone) {
        long j2 = j;
        if (timeZone != null) {
            j2 += timeZone.getOffset(j);
        }
        long j3 = j2 + (this.mCivil ? MILLIS_TO_1389_10_22C : 42521673600000L);
        int i = (int) (j3 % MILLIS_PER_DAY);
        long j4 = j3 / MILLIS_PER_DAY;
        if (i < 0) {
            i += 86400000;
            j4--;
        }
        int i2 = (int) (j4 / DAYS_PER_CYCLE);
        long j5 = j4 % DAYS_PER_CYCLE;
        int i3 = ((int) (j5 - ((r0 * 354) + LEAP_YEAR_COUNT[this.mLeapYearPatternIndex][r0]))) + 1;
        int i4 = ((int) (j5 / 355)) + 1;
        if (i3 > 355 || (i3 == 355 && !isLeapYear(i4))) {
            i3 -= getDaysPerYear(i4);
            i4++;
        }
        int i5 = i / 60000;
        int monthAndDayOfYearDay = getMonthAndDayOfYearDay(i4, i3);
        return Instance.make((30 * i2) + i4, packedMonth(monthAndDayOfYearDay), dayOfMonth(monthAndDayOfYearDay), i5 / 60, i5 % 60, (i / 1000) % 60);
    }

    public long toGregorian(long j) {
        int year = (Instance.year(j) - 1) % 30;
        long dayOfYear = ((((((r0 - 1) / 30) * DAYS_PER_CYCLE) + ((354 * year) + LEAP_YEAR_COUNT[this.mLeapYearPatternIndex][year])) + getDayOfYear(r0, Instance.month(j), Instance.dayOfMonth(j))) - 1) * 24 * 3600 * 1000;
        return GREGORIAN_METRICS.toInstance(this.mCivil ? dayOfYear - MILLIS_TO_1389_10_22C : (dayOfYear - MILLIS_TO_1389_10_22C) - MILLIS_PER_DAY, null);
    }
}
