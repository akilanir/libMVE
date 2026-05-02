package org.joda.time;

/* loaded from: joda-time-2.9.3.jar:org/joda/time/ReadableInterval.class */
public interface ReadableInterval {
    Chronology getChronology();

    long getStartMillis();

    DateTime getStart();

    long getEndMillis();

    DateTime getEnd();

    boolean contains(ReadableInstant readableInstant);

    boolean contains(ReadableInterval readableInterval);

    boolean overlaps(ReadableInterval readableInterval);

    boolean isAfter(ReadableInstant readableInstant);

    boolean isAfter(ReadableInterval readableInterval);

    boolean isBefore(ReadableInstant readableInstant);

    boolean isBefore(ReadableInterval readableInterval);

    Interval toInterval();

    MutableInterval toMutableInterval();

    Duration toDuration();

    long toDurationMillis();

    Period toPeriod();

    Period toPeriod(PeriodType periodType);

    boolean equals(Object obj);

    int hashCode();

    String toString();
}
