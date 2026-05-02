package org.apache.commons.validator.routines;

import java.text.DecimalFormat;
import java.text.Format;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/CurrencyValidator.class */
public class CurrencyValidator extends BigDecimalValidator {
    private static final long serialVersionUID = -4201640771171486514L;
    private static final CurrencyValidator VALIDATOR = new CurrencyValidator();
    private static final char CURRENCY_SYMBOL = 164;

    public static BigDecimalValidator getInstance() {
        return VALIDATOR;
    }

    public CurrencyValidator() {
        this(true, true);
    }

    public CurrencyValidator(boolean strict, boolean allowFractions) {
        super(strict, 1, allowFractions);
    }

    @Override // org.apache.commons.validator.routines.AbstractFormatValidator
    protected Object parse(String value, Format formatter) {
        Object parsedValue = super.parse(value, formatter);
        if (parsedValue != null || !(formatter instanceof DecimalFormat)) {
            return parsedValue;
        }
        DecimalFormat decimalFormat = (DecimalFormat) formatter;
        String pattern = decimalFormat.toPattern();
        if (pattern.indexOf(CURRENCY_SYMBOL) >= 0) {
            StringBuffer buffer = new StringBuffer(pattern.length());
            for (int i = 0; i < pattern.length(); i++) {
                if (pattern.charAt(i) != CURRENCY_SYMBOL) {
                    buffer.append(pattern.charAt(i));
                }
            }
            decimalFormat.applyPattern(buffer.toString());
            parsedValue = super.parse(value, decimalFormat);
        }
        return parsedValue;
    }
}
