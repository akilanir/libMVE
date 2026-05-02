package org.joda.time;

/* loaded from: joda-time-2.6.jar:org/joda/time/ReadWritablePeriod.class */
public interface ReadWritablePeriod extends ReadablePeriod {
    void clear();

    void setValue(int i, int i2);

    void set(DurationFieldType durationFieldType, int i);

    void setPeriod(ReadablePeriod readablePeriod);

    void setPeriod(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8);

    void setPeriod(ReadableInterval readableInterval);

    void add(DurationFieldType durationFieldType, int i);

    void add(ReadablePeriod readablePeriod);

    void add(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8);

    void add(ReadableInterval readableInterval);

    void setYears(int i);

    void addYears(int i);

    void setMonths(int i);

    void addMonths(int i);

    void setWeeks(int i);

    void addWeeks(int i);

    void setDays(int i);

    void addDays(int i);

    void setHours(int i);

    void addHours(int i);

    void setMinutes(int i);

    void addMinutes(int i);

    void setSeconds(int i);

    void addSeconds(int i);

    void setMillis(int i);

    void addMillis(int i);
}
