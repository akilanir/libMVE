package org.joda.time.chrono;

import org.joda.time.Chronology;

/* loaded from: joda-time-2.6.jar:org/joda/time/chrono/BasicFixedMonthChronology.class */
abstract class BasicFixedMonthChronology extends BasicChronology {
    private static final long serialVersionUID = 261387371998L;
    static final int MONTH_LENGTH = 30;
    static final long MILLIS_PER_YEAR = 31557600000L;
    static final long MILLIS_PER_MONTH = 2592000000L;

    BasicFixedMonthChronology(Chronology chronology, Object obj, int i) {
        super(chronology, obj, i);
    }

    @Override // org.joda.time.chrono.BasicChronology
    long setYear(long j, int i) {
        int dayOfYear = getDayOfYear(j, getYear(j));
        int millisOfDay = getMillisOfDay(j);
        if (dayOfYear > 365 && !isLeapYear(i)) {
            dayOfYear--;
        }
        return getYearMonthDayMillis(i, 1, dayOfYear) + millisOfDay;
    }

    @Override // org.joda.time.chrono.BasicChronology
    long getYearDifference(long j, long j2) {
        int year = getYear(j);
        int year2 = getYear(j2);
        int i = year - year2;
        if (j - getYearMillis(year) < j2 - getYearMillis(year2)) {
            i--;
        }
        return i;
    }

    @Override // org.joda.time.chrono.BasicChronology
    long getTotalMillisByYearMonth(int i, int i2) {
        return (i2 - 1) * MILLIS_PER_MONTH;
    }

    @Override // org.joda.time.chrono.BasicChronology
    int getDayOfMonth(long j) {
        return ((getDayOfYear(j) - 1) % MONTH_LENGTH) + 1;
    }

    @Override // org.joda.time.chrono.BasicChronology
    boolean isLeapYear(int i) {
        return (i & 3) == 3;
    }

    @Override // org.joda.time.chrono.BasicChronology
    int getDaysInYearMonth(int i, int i2) {
        return i2 != 13 ? MONTH_LENGTH : isLeapYear(i) ? 6 : 5;
    }

    @Override // org.joda.time.chrono.BasicChronology
    int getDaysInMonthMax() {
        return MONTH_LENGTH;
    }

    @Override // org.joda.time.chrono.BasicChronology
    int getDaysInMonthMax(int i) {
        if (i != 13) {
            return MONTH_LENGTH;
        }
        return 6;
    }

    @Override // org.joda.time.chrono.BasicChronology
    int getMonthOfYear(long j) {
        return ((getDayOfYear(j) - 1) / MONTH_LENGTH) + 1;
    }

    @Override // org.joda.time.chrono.BasicChronology
    int getMonthOfYear(long j, int i) {
        return ((int) ((j - getYearMillis(i)) / MILLIS_PER_MONTH)) + 1;
    }

    @Override // org.joda.time.chrono.BasicChronology
    int getMaxMonth() {
        return 13;
    }

    @Override // org.joda.time.chrono.BasicChronology
    long getAverageMillisPerYear() {
        return MILLIS_PER_YEAR;
    }

    @Override // org.joda.time.chrono.BasicChronology
    long getAverageMillisPerYearDividedByTwo() {
        return 15778800000L;
    }

    @Override // org.joda.time.chrono.BasicChronology
    long getAverageMillisPerMonth() {
        return MILLIS_PER_MONTH;
    }
}
