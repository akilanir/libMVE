package org.joda.time;

/* loaded from: joda-time-2.9.1.jar:org/joda/time/ReadableInstant.class */
public interface ReadableInstant extends Comparable<ReadableInstant> {
    long getMillis();

    Chronology getChronology();

    DateTimeZone getZone();

    int get(DateTimeFieldType dateTimeFieldType);

    boolean isSupported(DateTimeFieldType dateTimeFieldType);

    Instant toInstant();

    boolean isEqual(ReadableInstant readableInstant);

    boolean isAfter(ReadableInstant readableInstant);

    boolean isBefore(ReadableInstant readableInstant);

    boolean equals(Object obj);

    int hashCode();

    String toString();
}
