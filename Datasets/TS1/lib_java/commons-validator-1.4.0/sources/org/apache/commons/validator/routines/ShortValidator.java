package org.apache.commons.validator.routines;

import java.text.Format;
import java.util.Locale;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/ShortValidator.class */
public class ShortValidator extends AbstractNumberValidator {
    private static final long serialVersionUID = -5227510699747787066L;
    private static final ShortValidator VALIDATOR = new ShortValidator();

    public static ShortValidator getInstance() {
        return VALIDATOR;
    }

    public ShortValidator() {
        this(true, 0);
    }

    public ShortValidator(boolean strict, int formatType) {
        super(strict, formatType, false);
    }

    public Short validate(String value) {
        return (Short) parse(value, (String) null, (Locale) null);
    }

    public Short validate(String value, String pattern) {
        return (Short) parse(value, pattern, (Locale) null);
    }

    public Short validate(String value, Locale locale) {
        return (Short) parse(value, (String) null, locale);
    }

    public Short validate(String value, String pattern, Locale locale) {
        return (Short) parse(value, pattern, locale);
    }

    public boolean isInRange(short value, short min, short max) {
        return value >= min && value <= max;
    }

    public boolean isInRange(Short value, short min, short max) {
        return isInRange(value.shortValue(), min, max);
    }

    public boolean minValue(short value, short min) {
        return value >= min;
    }

    public boolean minValue(Short value, short min) {
        return minValue(value.shortValue(), min);
    }

    public boolean maxValue(short value, short max) {
        return value <= max;
    }

    public boolean maxValue(Short value, short max) {
        return maxValue(value.shortValue(), max);
    }

    @Override // org.apache.commons.validator.routines.AbstractNumberValidator, org.apache.commons.validator.routines.AbstractFormatValidator
    protected Object processParsedValue(Object value, Format formatter) {
        long longValue = ((Number) value).longValue();
        if (longValue < -32768 || longValue > 32767) {
            return null;
        }
        return new Short((short) longValue);
    }
}
