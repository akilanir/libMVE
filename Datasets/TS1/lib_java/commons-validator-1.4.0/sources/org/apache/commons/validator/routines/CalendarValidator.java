package org.apache.commons.validator.routines;

import java.text.DateFormat;
import java.text.Format;
import java.util.Calendar;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/CalendarValidator.class */
public class CalendarValidator extends AbstractCalendarValidator {
    private static final long serialVersionUID = 9109652318762134167L;
    private static final CalendarValidator VALIDATOR = new CalendarValidator();

    public static CalendarValidator getInstance() {
        return VALIDATOR;
    }

    public CalendarValidator() {
        this(true, 3);
    }

    public CalendarValidator(boolean strict, int dateStyle) {
        super(strict, dateStyle, -1);
    }

    public Calendar validate(String value) {
        return (Calendar) parse(value, (String) null, (Locale) null, (TimeZone) null);
    }

    public Calendar validate(String value, TimeZone timeZone) {
        return (Calendar) parse(value, (String) null, (Locale) null, timeZone);
    }

    public Calendar validate(String value, String pattern) {
        return (Calendar) parse(value, pattern, (Locale) null, (TimeZone) null);
    }

    public Calendar validate(String value, String pattern, TimeZone timeZone) {
        return (Calendar) parse(value, pattern, (Locale) null, timeZone);
    }

    public Calendar validate(String value, Locale locale) {
        return (Calendar) parse(value, (String) null, locale, (TimeZone) null);
    }

    public Calendar validate(String value, Locale locale, TimeZone timeZone) {
        return (Calendar) parse(value, (String) null, locale, timeZone);
    }

    public Calendar validate(String value, String pattern, Locale locale) {
        return (Calendar) parse(value, pattern, locale, (TimeZone) null);
    }

    public Calendar validate(String value, String pattern, Locale locale, TimeZone timeZone) {
        return (Calendar) parse(value, pattern, locale, timeZone);
    }

    public static void adjustToTimeZone(Calendar value, TimeZone timeZone) {
        if (value.getTimeZone().hasSameRules(timeZone)) {
            value.setTimeZone(timeZone);
            return;
        }
        int year = value.get(1);
        int month = value.get(2);
        int date = value.get(5);
        int hour = value.get(11);
        int minute = value.get(12);
        value.setTimeZone(timeZone);
        value.set(year, month, date, hour, minute);
    }

    public int compareDates(Calendar value, Calendar compare) {
        return compare(value, compare, 5);
    }

    public int compareWeeks(Calendar value, Calendar compare) {
        return compare(value, compare, 3);
    }

    public int compareMonths(Calendar value, Calendar compare) {
        return compare(value, compare, 2);
    }

    public int compareQuarters(Calendar value, Calendar compare) {
        return compareQuarters(value, compare, 1);
    }

    @Override // org.apache.commons.validator.routines.AbstractCalendarValidator
    public int compareQuarters(Calendar value, Calendar compare, int monthOfFirstQuarter) {
        return super.compareQuarters(value, compare, monthOfFirstQuarter);
    }

    public int compareYears(Calendar value, Calendar compare) {
        return compare(value, compare, 1);
    }

    @Override // org.apache.commons.validator.routines.AbstractCalendarValidator, org.apache.commons.validator.routines.AbstractFormatValidator
    protected Object processParsedValue(Object value, Format formatter) {
        return ((DateFormat) formatter).getCalendar();
    }
}
