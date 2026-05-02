package org.joda.time;

/* loaded from: joda-time-2.6.jar:org/joda/time/ReadablePeriod.class */
public interface ReadablePeriod {
    PeriodType getPeriodType();

    int size();

    DurationFieldType getFieldType(int i);

    int getValue(int i);

    int get(DurationFieldType durationFieldType);

    boolean isSupported(DurationFieldType durationFieldType);

    Period toPeriod();

    MutablePeriod toMutablePeriod();

    boolean equals(Object obj);

    int hashCode();

    String toString();
}
