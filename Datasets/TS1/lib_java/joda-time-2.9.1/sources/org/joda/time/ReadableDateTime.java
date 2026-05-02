package org.joda.time;

import java.util.Locale;

/* loaded from: joda-time-2.9.1.jar:org/joda/time/ReadableDateTime.class */
public interface ReadableDateTime extends ReadableInstant {
    int getDayOfWeek();

    int getDayOfMonth();

    int getDayOfYear();

    int getWeekOfWeekyear();

    int getWeekyear();

    int getMonthOfYear();

    int getYear();

    int getYearOfEra();

    int getYearOfCentury();

    int getCenturyOfEra();

    int getEra();

    int getMillisOfSecond();

    int getMillisOfDay();

    int getSecondOfMinute();

    int getSecondOfDay();

    int getMinuteOfHour();

    int getMinuteOfDay();

    int getHourOfDay();

    DateTime toDateTime();

    MutableDateTime toMutableDateTime();

    String toString(String str) throws IllegalArgumentException;

    String toString(String str, Locale locale) throws IllegalArgumentException;
}
