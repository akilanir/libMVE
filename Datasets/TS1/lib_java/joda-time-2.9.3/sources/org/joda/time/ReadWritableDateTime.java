package org.joda.time;

/* loaded from: joda-time-2.9.3.jar:org/joda/time/ReadWritableDateTime.class */
public interface ReadWritableDateTime extends ReadableDateTime, ReadWritableInstant {
    void setYear(int i);

    void addYears(int i);

    void setWeekyear(int i);

    void addWeekyears(int i);

    void setMonthOfYear(int i);

    void addMonths(int i);

    void setWeekOfWeekyear(int i);

    void addWeeks(int i);

    void setDayOfYear(int i);

    void setDayOfMonth(int i);

    void setDayOfWeek(int i);

    void addDays(int i);

    void setHourOfDay(int i);

    void addHours(int i);

    void setMinuteOfDay(int i);

    void setMinuteOfHour(int i);

    void addMinutes(int i);

    void setSecondOfDay(int i);

    void setSecondOfMinute(int i);

    void addSeconds(int i);

    void setMillisOfDay(int i);

    void setMillisOfSecond(int i);

    void addMillis(int i);

    void setDate(int i, int i2, int i3);

    void setTime(int i, int i2, int i3, int i4);

    void setDateTime(int i, int i2, int i3, int i4, int i5, int i6, int i7);
}
