package org.springframework.util;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;

/* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/util/NumberUtils.class */
public abstract class NumberUtils {
    /* JADX WARN: Multi-variable type inference failed */
    public static <T extends Number> T convertNumberToTargetClass(Number number, Class<T> targetClass) throws IllegalArgumentException {
        Assert.notNull(number, "Number must not be null");
        Assert.notNull(targetClass, "Target class must not be null");
        if (targetClass.isInstance(number)) {
            return number;
        }
        if (targetClass.equals(Byte.class)) {
            long value = number.longValue();
            if (value < -128 || value > 127) {
                raiseOverflowException(number, targetClass);
            }
            return new Byte(number.byteValue());
        }
        if (targetClass.equals(Short.class)) {
            long value2 = number.longValue();
            if (value2 < -32768 || value2 > 32767) {
                raiseOverflowException(number, targetClass);
            }
            return new Short(number.shortValue());
        }
        if (targetClass.equals(Integer.class)) {
            long value3 = number.longValue();
            if (value3 < -2147483648L || value3 > 2147483647L) {
                raiseOverflowException(number, targetClass);
            }
            return new Integer(number.intValue());
        }
        if (targetClass.equals(Long.class)) {
            return new Long(number.longValue());
        }
        if (targetClass.equals(BigInteger.class)) {
            if (number instanceof BigDecimal) {
                return ((BigDecimal) number).toBigInteger();
            }
            return BigInteger.valueOf(number.longValue());
        }
        if (targetClass.equals(Float.class)) {
            return new Float(number.floatValue());
        }
        if (targetClass.equals(Double.class)) {
            return new Double(number.doubleValue());
        }
        if (targetClass.equals(BigDecimal.class)) {
            return new BigDecimal(number.toString());
        }
        throw new IllegalArgumentException("Could not convert number [" + number + "] of type [" + number.getClass().getName() + "] to unknown target class [" + targetClass.getName() + "]");
    }

    private static void raiseOverflowException(Number number, Class<?> targetClass) {
        throw new IllegalArgumentException("Could not convert number [" + number + "] of type [" + number.getClass().getName() + "] to target class [" + targetClass.getName() + "]: overflow");
    }

    public static <T extends Number> T parseNumber(String text, Class<T> targetClass) {
        Assert.notNull(text, "Text must not be null");
        Assert.notNull(targetClass, "Target class must not be null");
        String trimmed = StringUtils.trimAllWhitespace(text);
        if (targetClass.equals(Byte.class)) {
            return isHexNumber(trimmed) ? Byte.decode(trimmed) : Byte.valueOf(trimmed);
        }
        if (targetClass.equals(Short.class)) {
            return isHexNumber(trimmed) ? Short.decode(trimmed) : Short.valueOf(trimmed);
        }
        if (targetClass.equals(Integer.class)) {
            return isHexNumber(trimmed) ? Integer.decode(trimmed) : Integer.valueOf(trimmed);
        }
        if (targetClass.equals(Long.class)) {
            return isHexNumber(trimmed) ? Long.decode(trimmed) : Long.valueOf(trimmed);
        }
        if (targetClass.equals(BigInteger.class)) {
            return isHexNumber(trimmed) ? decodeBigInteger(trimmed) : new BigInteger(trimmed);
        }
        if (targetClass.equals(Float.class)) {
            return Float.valueOf(trimmed);
        }
        if (targetClass.equals(Double.class)) {
            return Double.valueOf(trimmed);
        }
        if (targetClass.equals(BigDecimal.class) || targetClass.equals(Number.class)) {
            return new BigDecimal(trimmed);
        }
        throw new IllegalArgumentException("Cannot convert String [" + text + "] to target class [" + targetClass.getName() + "]");
    }

    public static <T extends Number> T parseNumber(String str, Class<T> cls, NumberFormat numberFormat) {
        if (numberFormat != null) {
            Assert.notNull(str, "Text must not be null");
            Assert.notNull(cls, "Target class must not be null");
            DecimalFormat decimalFormat = null;
            boolean z = false;
            if (numberFormat instanceof DecimalFormat) {
                decimalFormat = (DecimalFormat) numberFormat;
                if (BigDecimal.class.equals(cls) && !decimalFormat.isParseBigDecimal()) {
                    decimalFormat.setParseBigDecimal(true);
                    z = true;
                }
            }
            try {
                try {
                    T t = (T) convertNumberToTargetClass(numberFormat.parse(StringUtils.trimAllWhitespace(str)), cls);
                    if (z) {
                        decimalFormat.setParseBigDecimal(false);
                    }
                    return t;
                } catch (ParseException e) {
                    throw new IllegalArgumentException("Could not parse number: " + e.getMessage());
                }
            } catch (Throwable th) {
                if (z) {
                    decimalFormat.setParseBigDecimal(false);
                }
                throw th;
            }
        }
        return (T) parseNumber(str, cls);
    }

    private static boolean isHexNumber(String value) {
        int index = value.startsWith("-") ? 1 : 0;
        return value.startsWith("0x", index) || value.startsWith("0X", index) || value.startsWith("#", index);
    }

    private static BigInteger decodeBigInteger(String value) {
        int radix = 10;
        int index = 0;
        boolean negative = false;
        if (value.startsWith("-")) {
            negative = true;
            index = 0 + 1;
        }
        if (value.startsWith("0x", index) || value.startsWith("0X", index)) {
            index += 2;
            radix = 16;
        } else if (value.startsWith("#", index)) {
            index++;
            radix = 16;
        } else if (value.startsWith("0", index) && value.length() > 1 + index) {
            index++;
            radix = 8;
        }
        BigInteger result = new BigInteger(value.substring(index), radix);
        return negative ? result.negate() : result;
    }
}
