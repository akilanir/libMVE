package org.apache.commons.validator.routines;

import java.text.Format;
import java.util.Locale;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/ByteValidator.class */
public class ByteValidator extends AbstractNumberValidator {
    private static final long serialVersionUID = 7001640945881854649L;
    private static final ByteValidator VALIDATOR = new ByteValidator();

    public static ByteValidator getInstance() {
        return VALIDATOR;
    }

    public ByteValidator() {
        this(true, 0);
    }

    public ByteValidator(boolean strict, int formatType) {
        super(strict, formatType, false);
    }

    public Byte validate(String value) {
        return (Byte) parse(value, (String) null, (Locale) null);
    }

    public Byte validate(String value, String pattern) {
        return (Byte) parse(value, pattern, (Locale) null);
    }

    public Byte validate(String value, Locale locale) {
        return (Byte) parse(value, (String) null, locale);
    }

    public Byte validate(String value, String pattern, Locale locale) {
        return (Byte) parse(value, pattern, locale);
    }

    public boolean isInRange(byte value, byte min, byte max) {
        return value >= min && value <= max;
    }

    public boolean isInRange(Byte value, byte min, byte max) {
        return isInRange(value.byteValue(), min, max);
    }

    public boolean minValue(byte value, byte min) {
        return value >= min;
    }

    public boolean minValue(Byte value, byte min) {
        return minValue(value.byteValue(), min);
    }

    public boolean maxValue(byte value, byte max) {
        return value <= max;
    }

    public boolean maxValue(Byte value, byte max) {
        return maxValue(value.byteValue(), max);
    }

    @Override // org.apache.commons.validator.routines.AbstractNumberValidator, org.apache.commons.validator.routines.AbstractFormatValidator
    protected Object processParsedValue(Object value, Format formatter) {
        long longValue = ((Number) value).longValue();
        if (longValue < -128 || longValue > 127) {
            return null;
        }
        return new Byte((byte) longValue);
    }
}
