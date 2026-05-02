package org.joda.time;

/* loaded from: joda-time-2.9.3.jar:org/joda/time/ReadableDuration.class */
public interface ReadableDuration extends Comparable<ReadableDuration> {
    long getMillis();

    Duration toDuration();

    Period toPeriod();

    boolean isEqual(ReadableDuration readableDuration);

    boolean isLongerThan(ReadableDuration readableDuration);

    boolean isShorterThan(ReadableDuration readableDuration);

    boolean equals(Object obj);

    int hashCode();

    String toString();
}
