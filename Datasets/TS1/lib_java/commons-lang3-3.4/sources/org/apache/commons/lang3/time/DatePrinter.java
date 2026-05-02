package org.apache.commons.lang3.time;

import java.text.FieldPosition;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: commons-lang3-3.4.jar:org/apache/commons/lang3/time/DatePrinter.class */
public interface DatePrinter {
    String format(long j);

    String format(Date date);

    String format(Calendar calendar);

    StringBuffer format(long j, StringBuffer stringBuffer);

    StringBuffer format(Date date, StringBuffer stringBuffer);

    StringBuffer format(Calendar calendar, StringBuffer stringBuffer);

    String getPattern();

    TimeZone getTimeZone();

    Locale getLocale();

    StringBuffer format(Object obj, StringBuffer stringBuffer, FieldPosition fieldPosition);
}
