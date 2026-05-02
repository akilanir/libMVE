package org.joda.time.format;

import java.io.IOException;
import java.io.Writer;
import java.util.Locale;
import org.joda.time.ReadablePeriod;

/* loaded from: joda-time-2.9.1.jar:org/joda/time/format/PeriodPrinter.class */
public interface PeriodPrinter {
    int calculatePrintedLength(ReadablePeriod readablePeriod, Locale locale);

    int countFieldsToPrint(ReadablePeriod readablePeriod, int i, Locale locale);

    void printTo(StringBuffer stringBuffer, ReadablePeriod readablePeriod, Locale locale);

    void printTo(Writer writer, ReadablePeriod readablePeriod, Locale locale) throws IOException;
}
