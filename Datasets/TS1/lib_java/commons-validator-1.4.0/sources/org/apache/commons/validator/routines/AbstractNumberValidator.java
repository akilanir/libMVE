package org.apache.commons.validator.routines;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.Format;
import java.text.NumberFormat;
import java.util.Locale;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/AbstractNumberValidator.class */
public abstract class AbstractNumberValidator extends AbstractFormatValidator {
    private static final long serialVersionUID = -3088817875906765463L;
    public static final int STANDARD_FORMAT = 0;
    public static final int CURRENCY_FORMAT = 1;
    public static final int PERCENT_FORMAT = 2;
    private final boolean allowFractions;
    private final int formatType;

    @Override // org.apache.commons.validator.routines.AbstractFormatValidator
    protected abstract Object processParsedValue(Object obj, Format format);

    public AbstractNumberValidator(boolean strict, int formatType, boolean allowFractions) {
        super(strict);
        this.allowFractions = allowFractions;
        this.formatType = formatType;
    }

    public boolean isAllowFractions() {
        return this.allowFractions;
    }

    public int getFormatType() {
        return this.formatType;
    }

    @Override // org.apache.commons.validator.routines.AbstractFormatValidator
    public boolean isValid(String value, String pattern, Locale locale) {
        Object parsedValue = parse(value, pattern, locale);
        return parsedValue != null;
    }

    public boolean isInRange(Number value, Number min, Number max) {
        return minValue(value, min) && maxValue(value, max);
    }

    public boolean minValue(Number value, Number min) {
        return isAllowFractions() ? value.doubleValue() >= min.doubleValue() : value.longValue() >= min.longValue();
    }

    public boolean maxValue(Number value, Number max) {
        return isAllowFractions() ? value.doubleValue() <= max.doubleValue() : value.longValue() <= max.longValue();
    }

    protected Object parse(String value, String pattern, Locale locale) {
        String value2 = value == null ? null : value.trim();
        if (value2 == null || value2.length() == 0) {
            return null;
        }
        Format formatter = getFormat(pattern, locale);
        return parse(value2, formatter);
    }

    @Override // org.apache.commons.validator.routines.AbstractFormatValidator
    protected Format getFormat(String pattern, Locale locale) {
        NumberFormat formatter;
        boolean usePattern = pattern != null && pattern.length() > 0;
        if (!usePattern) {
            formatter = (NumberFormat) getFormat(locale);
        } else if (locale == null) {
            formatter = new DecimalFormat(pattern);
        } else {
            DecimalFormatSymbols symbols = new DecimalFormatSymbols(locale);
            formatter = new DecimalFormat(pattern, symbols);
        }
        if (determineScale(formatter) == 0) {
            formatter.setParseIntegerOnly(true);
        }
        return formatter;
    }

    protected int determineScale(NumberFormat format) {
        if (!isStrict()) {
            return -1;
        }
        if (!isAllowFractions() || format.isParseIntegerOnly()) {
            return 0;
        }
        int minimumFraction = format.getMinimumFractionDigits();
        int maximumFraction = format.getMaximumFractionDigits();
        if (minimumFraction != maximumFraction) {
            return -1;
        }
        int scale = minimumFraction;
        if (format instanceof DecimalFormat) {
            int multiplier = ((DecimalFormat) format).getMultiplier();
            if (multiplier == 100) {
                scale += 2;
            } else if (multiplier == 1000) {
                scale += 3;
            }
        } else if (this.formatType == 2) {
            scale += 2;
        }
        return scale;
    }

    protected Format getFormat(Locale locale) {
        NumberFormat formatter;
        switch (this.formatType) {
            case 1:
                if (locale == null) {
                    formatter = NumberFormat.getCurrencyInstance();
                    break;
                } else {
                    formatter = NumberFormat.getCurrencyInstance(locale);
                    break;
                }
            case 2:
                if (locale == null) {
                    formatter = NumberFormat.getPercentInstance();
                    break;
                } else {
                    formatter = NumberFormat.getPercentInstance(locale);
                    break;
                }
            default:
                if (locale == null) {
                    formatter = NumberFormat.getInstance();
                    break;
                } else {
                    formatter = NumberFormat.getInstance(locale);
                    break;
                }
        }
        return formatter;
    }
}
