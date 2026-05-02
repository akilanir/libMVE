package org.joda.time.convert;

import org.joda.time.Chronology;
import org.joda.time.DateTimeZone;
import org.joda.time.ReadablePartial;
import org.joda.time.format.DateTimeFormatter;

/* loaded from: joda-time-2.9.3.jar:org/joda/time/convert/PartialConverter.class */
public interface PartialConverter extends Converter {
    Chronology getChronology(Object obj, DateTimeZone dateTimeZone);

    Chronology getChronology(Object obj, Chronology chronology);

    int[] getPartialValues(ReadablePartial readablePartial, Object obj, Chronology chronology);

    int[] getPartialValues(ReadablePartial readablePartial, Object obj, Chronology chronology, DateTimeFormatter dateTimeFormatter);
}
