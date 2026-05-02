package org.joda.time.format;

import java.util.Locale;
import org.joda.time.ReadWritablePeriod;

/* loaded from: joda-time-2.9.1.jar:org/joda/time/format/PeriodParser.class */
public interface PeriodParser {
    int parseInto(ReadWritablePeriod readWritablePeriod, String str, int i, Locale locale);
}
