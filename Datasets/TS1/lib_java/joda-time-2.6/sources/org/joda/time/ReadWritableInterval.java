package org.joda.time;

/* loaded from: joda-time-2.6.jar:org/joda/time/ReadWritableInterval.class */
public interface ReadWritableInterval extends ReadableInterval {
    void setInterval(long j, long j2);

    void setInterval(ReadableInterval readableInterval);

    void setInterval(ReadableInstant readableInstant, ReadableInstant readableInstant2);

    void setChronology(Chronology chronology);

    void setStartMillis(long j);

    void setStart(ReadableInstant readableInstant);

    void setEndMillis(long j);

    void setEnd(ReadableInstant readableInstant);

    void setDurationAfterStart(ReadableDuration readableDuration);

    void setDurationBeforeEnd(ReadableDuration readableDuration);

    void setPeriodAfterStart(ReadablePeriod readablePeriod);

    void setPeriodBeforeEnd(ReadablePeriod readablePeriod);
}
