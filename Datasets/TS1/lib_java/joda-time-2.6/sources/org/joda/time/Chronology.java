package org.joda.time;

/* loaded from: joda-time-2.6.jar:org/joda/time/Chronology.class */
public abstract class Chronology {
    public abstract DateTimeZone getZone();

    public abstract Chronology withUTC();

    public abstract Chronology withZone(DateTimeZone dateTimeZone);

    public abstract long getDateTimeMillis(int i, int i2, int i3, int i4);

    public abstract long getDateTimeMillis(int i, int i2, int i3, int i4, int i5, int i6, int i7);

    public abstract long getDateTimeMillis(long j, int i, int i2, int i3, int i4);

    public abstract void validate(ReadablePartial readablePartial, int[] iArr);

    public abstract int[] get(ReadablePartial readablePartial, long j);

    public abstract long set(ReadablePartial readablePartial, long j);

    public abstract int[] get(ReadablePeriod readablePeriod, long j, long j2);

    public abstract int[] get(ReadablePeriod readablePeriod, long j);

    public abstract long add(ReadablePeriod readablePeriod, long j, int i);

    public abstract long add(long j, long j2, int i);

    public abstract DurationField millis();

    public abstract DateTimeField millisOfSecond();

    public abstract DateTimeField millisOfDay();

    public abstract DurationField seconds();

    public abstract DateTimeField secondOfMinute();

    public abstract DateTimeField secondOfDay();

    public abstract DurationField minutes();

    public abstract DateTimeField minuteOfHour();

    public abstract DateTimeField minuteOfDay();

    public abstract DurationField hours();

    public abstract DateTimeField hourOfDay();

    public abstract DateTimeField clockhourOfDay();

    public abstract DurationField halfdays();

    public abstract DateTimeField hourOfHalfday();

    public abstract DateTimeField clockhourOfHalfday();

    public abstract DateTimeField halfdayOfDay();

    public abstract DurationField days();

    public abstract DateTimeField dayOfWeek();

    public abstract DateTimeField dayOfMonth();

    public abstract DateTimeField dayOfYear();

    public abstract DurationField weeks();

    public abstract DateTimeField weekOfWeekyear();

    public abstract DurationField weekyears();

    public abstract DateTimeField weekyear();

    public abstract DateTimeField weekyearOfCentury();

    public abstract DurationField months();

    public abstract DateTimeField monthOfYear();

    public abstract DurationField years();

    public abstract DateTimeField year();

    public abstract DateTimeField yearOfEra();

    public abstract DateTimeField yearOfCentury();

    public abstract DurationField centuries();

    public abstract DateTimeField centuryOfEra();

    public abstract DurationField eras();

    public abstract DateTimeField era();

    public abstract String toString();
}
