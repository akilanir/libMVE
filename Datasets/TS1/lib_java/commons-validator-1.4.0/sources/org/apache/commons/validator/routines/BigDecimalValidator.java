package org.apache.commons.validator.routines;

import java.math.BigDecimal;
import java.text.Format;
import java.text.NumberFormat;
import java.util.Locale;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/BigDecimalValidator.class */
public class BigDecimalValidator extends AbstractNumberValidator {
    private static final long serialVersionUID = -670320911490506772L;
    private static final BigDecimalValidator VALIDATOR = new BigDecimalValidator();

    public static BigDecimalValidator getInstance() {
        return VALIDATOR;
    }

    public BigDecimalValidator() {
        this(true);
    }

    public BigDecimalValidator(boolean strict) {
        this(strict, 0, true);
    }

    protected BigDecimalValidator(boolean strict, int formatType, boolean allowFractions) {
        super(strict, formatType, allowFractions);
    }

    public BigDecimal validate(String value) {
        return (BigDecimal) parse(value, (String) null, (Locale) null);
    }

    public BigDecimal validate(String value, String pattern) {
        return (BigDecimal) parse(value, pattern, (Locale) null);
    }

    public BigDecimal validate(String value, Locale locale) {
        return (BigDecimal) parse(value, (String) null, locale);
    }

    public BigDecimal validate(String value, String pattern, Locale locale) {
        return (BigDecimal) parse(value, pattern, locale);
    }

    public boolean isInRange(BigDecimal value, double min, double max) {
        return value.doubleValue() >= min && value.doubleValue() <= max;
    }

    public boolean minValue(BigDecimal value, double min) {
        return value.doubleValue() >= min;
    }

    public boolean maxValue(BigDecimal value, double max) {
        return value.doubleValue() <= max;
    }

    @Override // org.apache.commons.validator.routines.AbstractNumberValidator, org.apache.commons.validator.routines.AbstractFormatValidator
    protected Object processParsedValue(Object value, Format formatter) {
        BigDecimal decimal;
        if (value instanceof Long) {
            decimal = BigDecimal.valueOf(((Long) value).longValue());
        } else {
            decimal = new BigDecimal(value.toString());
        }
        int scale = determineScale((NumberFormat) formatter);
        if (scale >= 0) {
            decimal = decimal.setScale(scale, 1);
        }
        return decimal;
    }
}
