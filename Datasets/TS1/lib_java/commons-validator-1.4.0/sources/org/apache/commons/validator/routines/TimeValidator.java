package org.apache.commons.validator.routines;

import java.text.DateFormat;
import java.text.Format;
import java.util.Calendar;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/TimeValidator.class */
public class TimeValidator extends AbstractCalendarValidator {
    private static final long serialVersionUID = 3494007492269691581L;
    private static final TimeValidator VALIDATOR = new TimeValidator();

    public static TimeValidator getInstance() {
        return VALIDATOR;
    }

    public TimeValidator() {
        this(true, 3);
    }

    public TimeValidator(boolean strict, int timeStyle) {
        super(strict, -1, timeStyle);
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

    public int compareTime(Calendar value, Calendar compare) {
        return compareTime(value, compare, 14);
    }

    public int compareSeconds(Calendar value, Calendar compare) {
        return compareTime(value, compare, 13);
    }

    public int compareMinutes(Calendar value, Calendar compare) {
        return compareTime(value, compare, 12);
    }

    public int compareHours(Calendar value, Calendar compare) {
        return compareTime(value, compare, 11);
    }

    @Override // org.apache.commons.validator.routines.AbstractCalendarValidator, org.apache.commons.validator.routines.AbstractFormatValidator
    protected Object processParsedValue(Object value, Format formatter) {
        return ((DateFormat) formatter).getCalendar();
    }
}
