package com.fasterxml.jackson.databind.util;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.FieldPosition;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/util/ISO8601DateFormat.class */
public class ISO8601DateFormat extends DateFormat {
    private static final long serialVersionUID = 1;
    private static Calendar CALENDAR = new GregorianCalendar();
    private static NumberFormat NUMBER_FORMAT = new DecimalFormat();

    public ISO8601DateFormat() {
        this.numberFormat = NUMBER_FORMAT;
        this.calendar = CALENDAR;
    }

    @Override // java.text.DateFormat
    public StringBuffer format(Date date, StringBuffer toAppendTo, FieldPosition fieldPosition) {
        String value = ISO8601Utils.format(date);
        toAppendTo.append(value);
        return toAppendTo;
    }

    @Override // java.text.DateFormat
    public Date parse(String source, ParsePosition pos) {
        try {
            return ISO8601Utils.parse(source, pos);
        } catch (ParseException e) {
            return null;
        }
    }

    @Override // java.text.DateFormat
    public Date parse(String source) throws ParseException {
        return ISO8601Utils.parse(source, new ParsePosition(0));
    }

    @Override // java.text.DateFormat, java.text.Format
    public Object clone() {
        return this;
    }

    public String toString() {
        return getClass().getName();
    }
}
