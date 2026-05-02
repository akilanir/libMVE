package org.apache.commons.lang3.time;

import java.text.ParseException;
import java.text.ParsePosition;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: commons-lang3-3.4.jar:org/apache/commons/lang3/time/DateParser.class */
public interface DateParser {
    Date parse(String str) throws ParseException;

    Date parse(String str, ParsePosition parsePosition);

    String getPattern();

    TimeZone getTimeZone();

    Locale getLocale();

    Object parseObject(String str) throws ParseException;

    Object parseObject(String str, ParsePosition parsePosition);
}
