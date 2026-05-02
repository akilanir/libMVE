package org.apache.commons.validator.routines;

import java.text.Format;
import java.util.Locale;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/DoubleValidator.class */
public class DoubleValidator extends AbstractNumberValidator {
    private static final long serialVersionUID = 5867946581318211330L;
    private static final DoubleValidator VALIDATOR = new DoubleValidator();

    public static DoubleValidator getInstance() {
        return VALIDATOR;
    }

    public DoubleValidator() {
        this(true, 0);
    }

    public DoubleValidator(boolean strict, int formatType) {
        super(strict, formatType, true);
    }

    public Double validate(String value) {
        return (Double) parse(value, (String) null, (Locale) null);
    }

    public Double validate(String value, String pattern) {
        return (Double) parse(value, pattern, (Locale) null);
    }

    public Double validate(String value, Locale locale) {
        return (Double) parse(value, (String) null, locale);
    }

    public Double validate(String value, String pattern, Locale locale) {
        return (Double) parse(value, pattern, locale);
    }

    public boolean isInRange(double value, double min, double max) {
        return value >= min && value <= max;
    }

    public boolean isInRange(Double value, double min, double max) {
        return isInRange(value.doubleValue(), min, max);
    }

    public boolean minValue(double value, double min) {
        return value >= min;
    }

    public boolean minValue(Double value, double min) {
        return minValue(value.doubleValue(), min);
    }

    public boolean maxValue(double value, double max) {
        return value <= max;
    }

    public boolean maxValue(Double value, double max) {
        return maxValue(value.doubleValue(), max);
    }

    @Override // org.apache.commons.validator.routines.AbstractNumberValidator, org.apache.commons.validator.routines.AbstractFormatValidator
    protected Object processParsedValue(Object value, Format formatter) {
        if (value instanceof Double) {
            return value;
        }
        return new Double(((Number) value).doubleValue());
    }
}
