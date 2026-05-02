package org.joda.time;

/* loaded from: joda-time-2.9.1.jar:org/joda/time/ReadablePartial.class */
public interface ReadablePartial extends Comparable<ReadablePartial> {
    int size();

    DateTimeFieldType getFieldType(int i);

    DateTimeField getField(int i);

    int getValue(int i);

    Chronology getChronology();

    int get(DateTimeFieldType dateTimeFieldType);

    boolean isSupported(DateTimeFieldType dateTimeFieldType);

    DateTime toDateTime(ReadableInstant readableInstant);

    boolean equals(Object obj);

    int hashCode();

    String toString();
}
