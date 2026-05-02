package org.apache.commons.validator.routines;

import java.text.Format;
import java.util.Locale;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/LongValidator.class */
public class LongValidator extends AbstractNumberValidator {
    private static final long serialVersionUID = -5117231731027866098L;
    private static final LongValidator VALIDATOR = new LongValidator();

    public static LongValidator getInstance() {
        return VALIDATOR;
    }

    public LongValidator() {
        this(true, 0);
    }

    public LongValidator(boolean strict, int formatType) {
        super(strict, formatType, false);
    }

    public Long validate(String value) {
        return (Long) parse(value, (String) null, (Locale) null);
    }

    public Long validate(String value, String pattern) {
        return (Long) parse(value, pattern, (Locale) null);
    }

    public Long validate(String value, Locale locale) {
        return (Long) parse(value, (String) null, locale);
    }

    public Long validate(String value, String pattern, Locale locale) {
        return (Long) parse(value, pattern, locale);
    }

    public boolean isInRange(long value, long min, long max) {
        return value >= min && value <= max;
    }

    public boolean isInRange(Long value, long min, long max) {
        return isInRange(value.longValue(), min, max);
    }

    public boolean minValue(long value, long min) {
        return value >= min;
    }

    public boolean minValue(Long value, long min) {
        return minValue(value.longValue(), min);
    }

    public boolean maxValue(long value, long max) {
        return value <= max;
    }

    public boolean maxValue(Long value, long max) {
        return maxValue(value.longValue(), max);
    }

    @Override // org.apache.commons.validator.routines.AbstractNumberValidator, org.apache.commons.validator.routines.AbstractFormatValidator
    protected Object processParsedValue(Object value, Format formatter) {
        if (value instanceof Long) {
            return value;
        }
        return new Long(((Number) value).longValue());
    }
}
