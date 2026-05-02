package org.joda.time.convert;

import org.joda.time.Chronology;
import org.joda.time.DateTimeZone;

/* loaded from: joda-time-2.9.3.jar:org/joda/time/convert/InstantConverter.class */
public interface InstantConverter extends Converter {
    Chronology getChronology(Object obj, DateTimeZone dateTimeZone);

    Chronology getChronology(Object obj, Chronology chronology);

    long getInstantMillis(Object obj, Chronology chronology);
}
