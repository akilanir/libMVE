package org.apache.commons.validator.routines;

import java.text.DateFormat;
import java.text.DateFormatSymbols;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/AbstractCalendarValidator.class */
public abstract class AbstractCalendarValidator extends AbstractFormatValidator {
    private static final long serialVersionUID = -1410008585975827379L;
    private final int dateStyle;
    private final int timeStyle;

    @Override // org.apache.commons.validator.routines.AbstractFormatValidator
    protected abstract Object processParsedValue(Object obj, Format format);

    public AbstractCalendarValidator(boolean strict, int dateStyle, int timeStyle) {
        super(strict);
        this.dateStyle = dateStyle;
        this.timeStyle = timeStyle;
    }

    @Override // org.apache.commons.validator.routines.AbstractFormatValidator
    public boolean isValid(String value, String pattern, Locale locale) {
        Object parsedValue = parse(value, pattern, locale, (TimeZone) null);
        return parsedValue != null;
    }

    public String format(Object value, TimeZone timeZone) {
        return format(value, (String) null, (Locale) null, timeZone);
    }

    public String format(Object value, String pattern, TimeZone timeZone) {
        return format(value, pattern, (Locale) null, timeZone);
    }

    public String format(Object value, Locale locale, TimeZone timeZone) {
        return format(value, (String) null, locale, timeZone);
    }

    @Override // org.apache.commons.validator.routines.AbstractFormatValidator
    public String format(Object value, String pattern, Locale locale) {
        return format(value, pattern, locale, (TimeZone) null);
    }

    public String format(Object value, String pattern, Locale locale, TimeZone timeZone) {
        DateFormat formatter = (DateFormat) getFormat(pattern, locale);
        if (timeZone != null) {
            formatter.setTimeZone(timeZone);
        } else if (value instanceof Calendar) {
            formatter.setTimeZone(((Calendar) value).getTimeZone());
        }
        return format(value, formatter);
    }

    @Override // org.apache.commons.validator.routines.AbstractFormatValidator
    protected String format(Object value, Format formatter) {
        if (value == null) {
            return null;
        }
        if (value instanceof Calendar) {
            value = ((Calendar) value).getTime();
        }
        return formatter.format(value);
    }

    protected Object parse(String value, String pattern, Locale locale, TimeZone timeZone) {
        String value2 = value == null ? null : value.trim();
        if (value2 == null || value2.length() == 0) {
            return null;
        }
        DateFormat formatter = (DateFormat) getFormat(pattern, locale);
        if (timeZone != null) {
            formatter.setTimeZone(timeZone);
        }
        return parse(value2, formatter);
    }

    @Override // org.apache.commons.validator.routines.AbstractFormatValidator
    protected Format getFormat(String pattern, Locale locale) {
        DateFormat formatter;
        boolean usePattern = pattern != null && pattern.length() > 0;
        if (!usePattern) {
            formatter = (DateFormat) getFormat(locale);
        } else if (locale == null) {
            formatter = new SimpleDateFormat(pattern);
        } else {
            DateFormatSymbols symbols = new DateFormatSymbols(locale);
            formatter = new SimpleDateFormat(pattern, symbols);
        }
        formatter.setLenient(false);
        return formatter;
    }

    protected Format getFormat(Locale locale) {
        DateFormat formatter;
        if (this.dateStyle >= 0 && this.timeStyle >= 0) {
            if (locale == null) {
                formatter = DateFormat.getDateTimeInstance(this.dateStyle, this.timeStyle);
            } else {
                formatter = DateFormat.getDateTimeInstance(this.dateStyle, this.timeStyle, locale);
            }
        } else if (this.timeStyle >= 0) {
            if (locale == null) {
                formatter = DateFormat.getTimeInstance(this.timeStyle);
            } else {
                formatter = DateFormat.getTimeInstance(this.timeStyle, locale);
            }
        } else {
            int useDateStyle = this.dateStyle >= 0 ? this.dateStyle : 3;
            if (locale == null) {
                formatter = DateFormat.getDateInstance(useDateStyle);
            } else {
                formatter = DateFormat.getDateInstance(useDateStyle, locale);
            }
        }
        formatter.setLenient(false);
        return formatter;
    }

    protected int compare(Calendar value, Calendar compare, int field) {
        int result = calculateCompareResult(value, compare, 1);
        if (result != 0 || field == 1) {
            return result;
        }
        if (field == 3) {
            return calculateCompareResult(value, compare, 3);
        }
        if (field == 6) {
            return calculateCompareResult(value, compare, 6);
        }
        int result2 = calculateCompareResult(value, compare, 2);
        if (result2 != 0 || field == 2) {
            return result2;
        }
        if (field == 4) {
            return calculateCompareResult(value, compare, 4);
        }
        int result3 = calculateCompareResult(value, compare, 5);
        if (result3 != 0 || field == 5 || field == 7 || field == 8) {
            return result3;
        }
        return compareTime(value, compare, field);
    }

    protected int compareTime(Calendar value, Calendar compare, int field) {
        int result = calculateCompareResult(value, compare, 11);
        if (result != 0 || field == 10 || field == 11) {
            return result;
        }
        int result2 = calculateCompareResult(value, compare, 12);
        if (result2 != 0 || field == 12) {
            return result2;
        }
        int result3 = calculateCompareResult(value, compare, 13);
        if (result3 != 0 || field == 13) {
            return result3;
        }
        if (field == 14) {
            return calculateCompareResult(value, compare, 14);
        }
        throw new IllegalArgumentException(new StringBuffer().append("Invalid field: ").append(field).toString());
    }

    protected int compareQuarters(Calendar value, Calendar compare, int monthOfFirstQuarter) {
        int valueQuarter = calculateQuarter(value, monthOfFirstQuarter);
        int compareQuarter = calculateQuarter(compare, monthOfFirstQuarter);
        if (valueQuarter < compareQuarter) {
            return -1;
        }
        if (valueQuarter > compareQuarter) {
            return 1;
        }
        return 0;
    }

    private int calculateQuarter(Calendar calendar, int monthOfFirstQuarter) {
        int year = calendar.get(1);
        int month = calendar.get(2) + 1;
        int relativeMonth = month >= monthOfFirstQuarter ? month - monthOfFirstQuarter : month + (12 - monthOfFirstQuarter);
        int quarter = (relativeMonth / 3) + 1;
        if (month < monthOfFirstQuarter) {
            year--;
        }
        return (year * 10) + quarter;
    }

    private int calculateCompareResult(Calendar value, Calendar compare, int field) {
        int difference = value.get(field) - compare.get(field);
        if (difference < 0) {
            return -1;
        }
        if (difference > 0) {
            return 1;
        }
        return 0;
    }
}
