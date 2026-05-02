package org.apache.commons.validator.routines;

import java.text.Format;
import java.util.Locale;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/FloatValidator.class */
public class FloatValidator extends AbstractNumberValidator {
    private static final long serialVersionUID = -4513245432806414267L;
    private static final FloatValidator VALIDATOR = new FloatValidator();

    public static FloatValidator getInstance() {
        return VALIDATOR;
    }

    public FloatValidator() {
        this(true, 0);
    }

    public FloatValidator(boolean strict, int formatType) {
        super(strict, formatType, true);
    }

    public Float validate(String value) {
        return (Float) parse(value, (String) null, (Locale) null);
    }

    public Float validate(String value, String pattern) {
        return (Float) parse(value, pattern, (Locale) null);
    }

    public Float validate(String value, Locale locale) {
        return (Float) parse(value, (String) null, locale);
    }

    public Float validate(String value, String pattern, Locale locale) {
        return (Float) parse(value, pattern, locale);
    }

    public boolean isInRange(float value, float min, float max) {
        return value >= min && value <= max;
    }

    public boolean isInRange(Float value, float min, float max) {
        return isInRange(value.floatValue(), min, max);
    }

    public boolean minValue(float value, float min) {
        return value >= min;
    }

    public boolean minValue(Float value, float min) {
        return minValue(value.floatValue(), min);
    }

    public boolean maxValue(float value, float max) {
        return value <= max;
    }

    public boolean maxValue(Float value, float max) {
        return maxValue(value.floatValue(), max);
    }

    @Override // org.apache.commons.validator.routines.AbstractNumberValidator, org.apache.commons.validator.routines.AbstractFormatValidator
    protected Object processParsedValue(Object value, Format formatter) {
        double doubleValue = ((Number) value).doubleValue();
        if (doubleValue > 0.0d) {
            if (doubleValue < 1.401298464324817E-45d || doubleValue > 3.4028234663852886E38d) {
                return null;
            }
        } else if (doubleValue < 0.0d) {
            double posDouble = doubleValue * (-1.0d);
            if (posDouble < 1.401298464324817E-45d || posDouble > 3.4028234663852886E38d) {
                return null;
            }
        }
        return new Float((float) doubleValue);
    }
}
