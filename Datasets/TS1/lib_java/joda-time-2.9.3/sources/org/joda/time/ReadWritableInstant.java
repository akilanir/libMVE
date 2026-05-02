package org.joda.time;

/* loaded from: joda-time-2.9.3.jar:org/joda/time/ReadWritableInstant.class */
public interface ReadWritableInstant extends ReadableInstant {
    void setMillis(long j);

    void setMillis(ReadableInstant readableInstant);

    void setChronology(Chronology chronology);

    void setZone(DateTimeZone dateTimeZone);

    void setZoneRetainFields(DateTimeZone dateTimeZone);

    void add(long j);

    void add(ReadableDuration readableDuration);

    void add(ReadableDuration readableDuration, int i);

    void add(ReadablePeriod readablePeriod);

    void add(ReadablePeriod readablePeriod, int i);

    void set(DateTimeFieldType dateTimeFieldType, int i);

    void add(DurationFieldType durationFieldType, int i);
}
