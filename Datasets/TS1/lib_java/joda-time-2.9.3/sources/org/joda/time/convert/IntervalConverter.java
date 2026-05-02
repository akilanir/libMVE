package org.joda.time.convert;

import org.joda.time.Chronology;
import org.joda.time.ReadWritableInterval;

/* loaded from: joda-time-2.9.3.jar:org/joda/time/convert/IntervalConverter.class */
public interface IntervalConverter extends Converter {
    boolean isReadableInterval(Object obj, Chronology chronology);

    void setInto(ReadWritableInterval readWritableInterval, Object obj, Chronology chronology);
}
