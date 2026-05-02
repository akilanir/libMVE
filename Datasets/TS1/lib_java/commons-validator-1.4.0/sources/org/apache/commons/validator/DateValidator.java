package org.apache.commons.validator;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/DateValidator.class */
public class DateValidator {
    private static final DateValidator DATE_VALIDATOR = new DateValidator();

    public static DateValidator getInstance() {
        return DATE_VALIDATOR;
    }

    protected DateValidator() {
    }

    public boolean isValid(String value, String datePattern, boolean strict) {
        if (value == null || datePattern == null || datePattern.length() <= 0) {
            return false;
        }
        SimpleDateFormat formatter = new SimpleDateFormat(datePattern);
        formatter.setLenient(false);
        try {
            formatter.parse(value);
            if (strict && datePattern.length() != value.length()) {
                return false;
            }
            return true;
        } catch (ParseException e) {
            return false;
        }
    }

    public boolean isValid(String value, Locale locale) {
        DateFormat formatter;
        if (value == null) {
            return false;
        }
        if (locale != null) {
            formatter = DateFormat.getDateInstance(3, locale);
        } else {
            formatter = DateFormat.getDateInstance(3, Locale.getDefault());
        }
        formatter.setLenient(false);
        try {
            formatter.parse(value);
            return true;
        } catch (ParseException e) {
            return false;
        }
    }
}
