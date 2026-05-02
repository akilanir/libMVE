package org.joda.time.convert;

import org.joda.time.Chronology;
import org.joda.time.PeriodType;
import org.joda.time.ReadWritablePeriod;

/* loaded from: joda-time-2.6.jar:org/joda/time/convert/PeriodConverter.class */
public interface PeriodConverter extends Converter {
    void setInto(ReadWritablePeriod readWritablePeriod, Object obj, Chronology chronology);

    PeriodType getPeriodType(Object obj);
}
