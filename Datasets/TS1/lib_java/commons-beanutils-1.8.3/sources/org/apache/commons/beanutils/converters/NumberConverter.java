package org.apache.commons.beanutils.converters;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.text.ParsePosition;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import org.apache.commons.beanutils.ConversionException;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/NumberConverter.class */
public abstract class NumberConverter extends AbstractConverter {
    private static final Integer ZERO = new Integer(0);
    private static final Integer ONE = new Integer(1);
    private String pattern;
    private boolean allowDecimals;
    private boolean useLocaleFormat;
    private Locale locale;
    static Class class$java$lang$Long;
    static Class class$java$lang$Byte;
    static Class class$java$lang$Short;
    static Class class$java$lang$Integer;
    static Class class$java$lang$Float;
    static Class class$java$lang$Double;
    static Class class$java$math$BigDecimal;
    static Class class$java$math$BigInteger;

    public NumberConverter(boolean allowDecimals) {
        this.allowDecimals = allowDecimals;
    }

    public NumberConverter(boolean allowDecimals, Object defaultValue) {
        this.allowDecimals = allowDecimals;
        setDefaultValue(defaultValue);
    }

    public boolean isAllowDecimals() {
        return this.allowDecimals;
    }

    public void setUseLocaleFormat(boolean useLocaleFormat) {
        this.useLocaleFormat = useLocaleFormat;
    }

    public String getPattern() {
        return this.pattern;
    }

    public void setPattern(String pattern) {
        this.pattern = pattern;
        setUseLocaleFormat(true);
    }

    public Locale getLocale() {
        return this.locale;
    }

    public void setLocale(Locale locale) {
        this.locale = locale;
        setUseLocaleFormat(true);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected String convertToString(Object value) throws Throwable {
        String result;
        if (this.useLocaleFormat && (value instanceof Number)) {
            NumberFormat format = getFormat();
            format.setGroupingUsed(false);
            result = format.format(value);
            if (log().isDebugEnabled()) {
                log().debug(new StringBuffer().append("    Converted  to String using format '").append(result).append("'").toString());
            }
        } else {
            result = value.toString();
            if (log().isDebugEnabled()) {
                log().debug(new StringBuffer().append("    Converted  to String using toString() '").append(result).append("'").toString());
            }
        }
        return result;
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Object convertToType(Class targetType, Object value) throws Throwable {
        Number number;
        Class cls;
        Class cls2;
        Class sourceType = value.getClass();
        if (value instanceof Number) {
            return toNumber(sourceType, targetType, (Number) value);
        }
        if (value instanceof Boolean) {
            return toNumber(sourceType, targetType, ((Boolean) value).booleanValue() ? ONE : ZERO);
        }
        if (value instanceof Date) {
            if (class$java$lang$Long == null) {
                cls2 = class$("java.lang.Long");
                class$java$lang$Long = cls2;
            } else {
                cls2 = class$java$lang$Long;
            }
            if (cls2.equals(targetType)) {
                return new Long(((Date) value).getTime());
            }
        }
        if (value instanceof Calendar) {
            if (class$java$lang$Long == null) {
                cls = class$("java.lang.Long");
                class$java$lang$Long = cls;
            } else {
                cls = class$java$lang$Long;
            }
            if (cls.equals(targetType)) {
                return new Long(((Calendar) value).getTime().getTime());
            }
        }
        String stringValue = value.toString().trim();
        if (stringValue.length() == 0) {
            return handleMissing(targetType);
        }
        if (this.useLocaleFormat) {
            NumberFormat format = getFormat();
            number = parse(sourceType, targetType, stringValue, format);
        } else {
            if (log().isDebugEnabled()) {
                log().debug("    No NumberFormat, using default conversion");
            }
            number = toNumber(sourceType, targetType, stringValue);
        }
        return toNumber(sourceType, targetType, number);
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    private Number toNumber(Class sourceType, Class targetType, Number value) {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        Class cls5;
        Class cls6;
        Class cls7;
        Class cls8;
        if (targetType.equals(value.getClass())) {
            return value;
        }
        if (class$java$lang$Byte == null) {
            cls = class$("java.lang.Byte");
            class$java$lang$Byte = cls;
        } else {
            cls = class$java$lang$Byte;
        }
        if (targetType.equals(cls)) {
            long longValue = value.longValue();
            if (longValue > 127) {
                throw new ConversionException(new StringBuffer().append(toString(sourceType)).append(" value '").append(value).append("' is too large for ").append(toString(targetType)).toString());
            }
            if (longValue < -128) {
                throw new ConversionException(new StringBuffer().append(toString(sourceType)).append(" value '").append(value).append("' is too small ").append(toString(targetType)).toString());
            }
            return new Byte(value.byteValue());
        }
        if (class$java$lang$Short == null) {
            cls2 = class$("java.lang.Short");
            class$java$lang$Short = cls2;
        } else {
            cls2 = class$java$lang$Short;
        }
        if (targetType.equals(cls2)) {
            long longValue2 = value.longValue();
            if (longValue2 > 32767) {
                throw new ConversionException(new StringBuffer().append(toString(sourceType)).append(" value '").append(value).append("' is too large for ").append(toString(targetType)).toString());
            }
            if (longValue2 < -32768) {
                throw new ConversionException(new StringBuffer().append(toString(sourceType)).append(" value '").append(value).append("' is too small ").append(toString(targetType)).toString());
            }
            return new Short(value.shortValue());
        }
        if (class$java$lang$Integer == null) {
            cls3 = class$("java.lang.Integer");
            class$java$lang$Integer = cls3;
        } else {
            cls3 = class$java$lang$Integer;
        }
        if (targetType.equals(cls3)) {
            long longValue3 = value.longValue();
            if (longValue3 > 2147483647L) {
                throw new ConversionException(new StringBuffer().append(toString(sourceType)).append(" value '").append(value).append("' is too large for ").append(toString(targetType)).toString());
            }
            if (longValue3 < -2147483648L) {
                throw new ConversionException(new StringBuffer().append(toString(sourceType)).append(" value '").append(value).append("' is too small ").append(toString(targetType)).toString());
            }
            return new Integer(value.intValue());
        }
        if (class$java$lang$Long == null) {
            cls4 = class$("java.lang.Long");
            class$java$lang$Long = cls4;
        } else {
            cls4 = class$java$lang$Long;
        }
        if (targetType.equals(cls4)) {
            return new Long(value.longValue());
        }
        if (class$java$lang$Float == null) {
            cls5 = class$("java.lang.Float");
            class$java$lang$Float = cls5;
        } else {
            cls5 = class$java$lang$Float;
        }
        if (targetType.equals(cls5)) {
            if (value.doubleValue() > 3.4028234663852886E38d) {
                throw new ConversionException(new StringBuffer().append(toString(sourceType)).append(" value '").append(value).append("' is too large for ").append(toString(targetType)).toString());
            }
            return new Float(value.floatValue());
        }
        if (class$java$lang$Double == null) {
            cls6 = class$("java.lang.Double");
            class$java$lang$Double = cls6;
        } else {
            cls6 = class$java$lang$Double;
        }
        if (targetType.equals(cls6)) {
            return new Double(value.doubleValue());
        }
        if (class$java$math$BigDecimal == null) {
            cls7 = class$("java.math.BigDecimal");
            class$java$math$BigDecimal = cls7;
        } else {
            cls7 = class$java$math$BigDecimal;
        }
        if (targetType.equals(cls7)) {
            if ((value instanceof Float) || (value instanceof Double)) {
                return new BigDecimal(value.toString());
            }
            if (value instanceof BigInteger) {
                return new BigDecimal((BigInteger) value);
            }
            return BigDecimal.valueOf(value.longValue());
        }
        if (class$java$math$BigInteger == null) {
            cls8 = class$("java.math.BigInteger");
            class$java$math$BigInteger = cls8;
        } else {
            cls8 = class$java$math$BigInteger;
        }
        if (targetType.equals(cls8)) {
            if (value instanceof BigDecimal) {
                return ((BigDecimal) value).toBigInteger();
            }
            return BigInteger.valueOf(value.longValue());
        }
        String msg = new StringBuffer().append(toString(getClass())).append(" cannot handle conversion to '").append(toString(targetType)).append("'").toString();
        if (log().isWarnEnabled()) {
            log().warn(new StringBuffer().append("    ").append(msg).toString());
        }
        throw new ConversionException(msg);
    }

    private Number toNumber(Class sourceType, Class targetType, String value) {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        Class cls5;
        Class cls6;
        Class cls7;
        Class cls8;
        if (class$java$lang$Byte == null) {
            cls = class$("java.lang.Byte");
            class$java$lang$Byte = cls;
        } else {
            cls = class$java$lang$Byte;
        }
        if (targetType.equals(cls)) {
            return new Byte(value);
        }
        if (class$java$lang$Short == null) {
            cls2 = class$("java.lang.Short");
            class$java$lang$Short = cls2;
        } else {
            cls2 = class$java$lang$Short;
        }
        if (targetType.equals(cls2)) {
            return new Short(value);
        }
        if (class$java$lang$Integer == null) {
            cls3 = class$("java.lang.Integer");
            class$java$lang$Integer = cls3;
        } else {
            cls3 = class$java$lang$Integer;
        }
        if (targetType.equals(cls3)) {
            return new Integer(value);
        }
        if (class$java$lang$Long == null) {
            cls4 = class$("java.lang.Long");
            class$java$lang$Long = cls4;
        } else {
            cls4 = class$java$lang$Long;
        }
        if (targetType.equals(cls4)) {
            return new Long(value);
        }
        if (class$java$lang$Float == null) {
            cls5 = class$("java.lang.Float");
            class$java$lang$Float = cls5;
        } else {
            cls5 = class$java$lang$Float;
        }
        if (targetType.equals(cls5)) {
            return new Float(value);
        }
        if (class$java$lang$Double == null) {
            cls6 = class$("java.lang.Double");
            class$java$lang$Double = cls6;
        } else {
            cls6 = class$java$lang$Double;
        }
        if (targetType.equals(cls6)) {
            return new Double(value);
        }
        if (class$java$math$BigDecimal == null) {
            cls7 = class$("java.math.BigDecimal");
            class$java$math$BigDecimal = cls7;
        } else {
            cls7 = class$java$math$BigDecimal;
        }
        if (targetType.equals(cls7)) {
            return new BigDecimal(value);
        }
        if (class$java$math$BigInteger == null) {
            cls8 = class$("java.math.BigInteger");
            class$java$math$BigInteger = cls8;
        } else {
            cls8 = class$java$math$BigInteger;
        }
        if (targetType.equals(cls8)) {
            return new BigInteger(value);
        }
        String msg = new StringBuffer().append(toString(getClass())).append(" cannot handle conversion from '").append(toString(sourceType)).append("' to '").append(toString(targetType)).append("'").toString();
        if (log().isWarnEnabled()) {
            log().warn(new StringBuffer().append("    ").append(msg).toString());
        }
        throw new ConversionException(msg);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    public String toString() {
        StringBuffer buffer = new StringBuffer();
        buffer.append(toString(getClass()));
        buffer.append("[UseDefault=");
        buffer.append(isUseDefault());
        buffer.append(", UseLocaleFormat=");
        buffer.append(this.useLocaleFormat);
        if (this.pattern != null) {
            buffer.append(", Pattern=");
            buffer.append(this.pattern);
        }
        if (this.locale != null) {
            buffer.append(", Locale=");
            buffer.append(this.locale);
        }
        buffer.append(']');
        return buffer.toString();
    }

    private NumberFormat getFormat() {
        NumberFormat format;
        if (this.pattern != null) {
            if (this.locale == null) {
                if (log().isDebugEnabled()) {
                    log().debug(new StringBuffer().append("    Using pattern '").append(this.pattern).append("'").toString());
                }
                format = new DecimalFormat(this.pattern);
            } else {
                if (log().isDebugEnabled()) {
                    log().debug(new StringBuffer().append("    Using pattern '").append(this.pattern).append("'").append(" with Locale[").append(this.locale).append("]").toString());
                }
                DecimalFormatSymbols symbols = new DecimalFormatSymbols(this.locale);
                format = new DecimalFormat(this.pattern, symbols);
            }
        } else if (this.locale == null) {
            if (log().isDebugEnabled()) {
                log().debug("    Using default Locale format");
            }
            format = NumberFormat.getInstance();
        } else {
            if (log().isDebugEnabled()) {
                log().debug(new StringBuffer().append("    Using Locale[").append(this.locale).append("] format").toString());
            }
            format = NumberFormat.getInstance(this.locale);
        }
        if (!this.allowDecimals) {
            format.setParseIntegerOnly(true);
        }
        return format;
    }

    private Number parse(Class sourceType, Class targetType, String value, NumberFormat format) {
        ParsePosition pos = new ParsePosition(0);
        Number parsedNumber = format.parse(value, pos);
        if (pos.getErrorIndex() >= 0 || pos.getIndex() != value.length() || parsedNumber == null) {
            String msg = new StringBuffer().append("Error converting from '").append(toString(sourceType)).append("' to '").append(toString(targetType)).append("'").toString();
            if (format instanceof DecimalFormat) {
                msg = new StringBuffer().append(msg).append(" using pattern '").append(((DecimalFormat) format).toPattern()).append("'").toString();
            }
            if (this.locale != null) {
                msg = new StringBuffer().append(msg).append(" for locale=[").append(this.locale).append("]").toString();
            }
            if (log().isDebugEnabled()) {
                log().debug(new StringBuffer().append("    ").append(msg).toString());
            }
            throw new ConversionException(msg);
        }
        return parsedNumber;
    }
}
