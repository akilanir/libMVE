package org.apache.commons.validator;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/GenericTypeValidator.class */
public class GenericTypeValidator implements Serializable {
    private static final long serialVersionUID = 5487162314134261703L;
    static Class class$org$apache$commons$validator$GenericTypeValidator;

    public static Byte formatByte(String value) {
        if (value == null) {
            return null;
        }
        try {
            return new Byte(value);
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public static Byte formatByte(String value, Locale locale) {
        NumberFormat formatter;
        Byte result = null;
        if (value != null) {
            if (locale != null) {
                formatter = NumberFormat.getNumberInstance(locale);
            } else {
                formatter = NumberFormat.getNumberInstance(Locale.getDefault());
            }
            formatter.setParseIntegerOnly(true);
            ParsePosition pos = new ParsePosition(0);
            Number num = formatter.parse(value, pos);
            if (pos.getErrorIndex() == -1 && pos.getIndex() == value.length() && num.doubleValue() >= -128.0d && num.doubleValue() <= 127.0d) {
                result = new Byte(num.byteValue());
            }
        }
        return result;
    }

    public static Short formatShort(String value) {
        if (value == null) {
            return null;
        }
        try {
            return new Short(value);
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public static Short formatShort(String value, Locale locale) {
        NumberFormat formatter;
        Short result = null;
        if (value != null) {
            if (locale != null) {
                formatter = NumberFormat.getNumberInstance(locale);
            } else {
                formatter = NumberFormat.getNumberInstance(Locale.getDefault());
            }
            formatter.setParseIntegerOnly(true);
            ParsePosition pos = new ParsePosition(0);
            Number num = formatter.parse(value, pos);
            if (pos.getErrorIndex() == -1 && pos.getIndex() == value.length() && num.doubleValue() >= -32768.0d && num.doubleValue() <= 32767.0d) {
                result = new Short(num.shortValue());
            }
        }
        return result;
    }

    public static Integer formatInt(String value) {
        if (value == null) {
            return null;
        }
        try {
            return new Integer(value);
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public static Integer formatInt(String value, Locale locale) {
        NumberFormat formatter;
        Integer result = null;
        if (value != null) {
            if (locale != null) {
                formatter = NumberFormat.getNumberInstance(locale);
            } else {
                formatter = NumberFormat.getNumberInstance(Locale.getDefault());
            }
            formatter.setParseIntegerOnly(true);
            ParsePosition pos = new ParsePosition(0);
            Number num = formatter.parse(value, pos);
            if (pos.getErrorIndex() == -1 && pos.getIndex() == value.length() && num.doubleValue() >= -2.147483648E9d && num.doubleValue() <= 2.147483647E9d) {
                result = new Integer(num.intValue());
            }
        }
        return result;
    }

    public static Long formatLong(String value) {
        if (value == null) {
            return null;
        }
        try {
            return new Long(value);
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public static Long formatLong(String value, Locale locale) {
        NumberFormat formatter;
        Long result = null;
        if (value != null) {
            if (locale != null) {
                formatter = NumberFormat.getNumberInstance(locale);
            } else {
                formatter = NumberFormat.getNumberInstance(Locale.getDefault());
            }
            formatter.setParseIntegerOnly(true);
            ParsePosition pos = new ParsePosition(0);
            Number num = formatter.parse(value, pos);
            if (pos.getErrorIndex() == -1 && pos.getIndex() == value.length() && num.doubleValue() >= -9.223372036854776E18d && num.doubleValue() <= 9.223372036854776E18d) {
                result = new Long(num.longValue());
            }
        }
        return result;
    }

    public static Float formatFloat(String value) {
        if (value == null) {
            return null;
        }
        try {
            return new Float(value);
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public static Float formatFloat(String value, Locale locale) {
        NumberFormat formatter;
        Float result = null;
        if (value != null) {
            if (locale != null) {
                formatter = NumberFormat.getInstance(locale);
            } else {
                formatter = NumberFormat.getInstance(Locale.getDefault());
            }
            ParsePosition pos = new ParsePosition(0);
            Number num = formatter.parse(value, pos);
            if (pos.getErrorIndex() == -1 && pos.getIndex() == value.length() && num.doubleValue() >= -3.4028234663852886E38d && num.doubleValue() <= 3.4028234663852886E38d) {
                result = new Float(num.floatValue());
            }
        }
        return result;
    }

    public static Double formatDouble(String value) {
        if (value == null) {
            return null;
        }
        try {
            return new Double(value);
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public static Double formatDouble(String value, Locale locale) {
        NumberFormat formatter;
        Double result = null;
        if (value != null) {
            if (locale != null) {
                formatter = NumberFormat.getInstance(locale);
            } else {
                formatter = NumberFormat.getInstance(Locale.getDefault());
            }
            ParsePosition pos = new ParsePosition(0);
            Number num = formatter.parse(value, pos);
            if (pos.getErrorIndex() == -1 && pos.getIndex() == value.length() && num.doubleValue() >= -1.7976931348623157E308d && num.doubleValue() <= Double.MAX_VALUE) {
                result = new Double(num.doubleValue());
            }
        }
        return result;
    }

    public static Date formatDate(String value, Locale locale) {
        Class cls;
        DateFormat formatterShort;
        DateFormat formatterDefault;
        Date date = null;
        if (value == null) {
            return null;
        }
        try {
            if (locale != null) {
                formatterShort = DateFormat.getDateInstance(3, locale);
                formatterDefault = DateFormat.getDateInstance(2, locale);
            } else {
                formatterShort = DateFormat.getDateInstance(3, Locale.getDefault());
                formatterDefault = DateFormat.getDateInstance(2, Locale.getDefault());
            }
            formatterShort.setLenient(false);
            formatterDefault.setLenient(false);
            try {
                date = formatterShort.parse(value);
            } catch (ParseException e) {
                date = formatterDefault.parse(value);
            }
        } catch (ParseException e2) {
            if (class$org$apache$commons$validator$GenericTypeValidator == null) {
                cls = class$("org.apache.commons.validator.GenericTypeValidator");
                class$org$apache$commons$validator$GenericTypeValidator = cls;
            } else {
                cls = class$org$apache$commons$validator$GenericTypeValidator;
            }
            Log log = LogFactory.getLog(cls);
            if (log.isDebugEnabled()) {
                log.debug(new StringBuffer().append("Date parse failed value=[").append(value).append("], ").append("locale=[").append(locale).append("] ").append(e2).toString());
            }
        }
        return date;
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError().initCause(x1);
        }
    }

    public static Date formatDate(String value, String datePattern, boolean strict) {
        Class cls;
        Date date = null;
        if (value == null || datePattern == null || datePattern.length() == 0) {
            return null;
        }
        try {
            SimpleDateFormat formatter = new SimpleDateFormat(datePattern);
            formatter.setLenient(false);
            date = formatter.parse(value);
            if (strict) {
                if (datePattern.length() != value.length()) {
                    date = null;
                }
            }
        } catch (ParseException e) {
            if (class$org$apache$commons$validator$GenericTypeValidator == null) {
                cls = class$("org.apache.commons.validator.GenericTypeValidator");
                class$org$apache$commons$validator$GenericTypeValidator = cls;
            } else {
                cls = class$org$apache$commons$validator$GenericTypeValidator;
            }
            Log log = LogFactory.getLog(cls);
            if (log.isDebugEnabled()) {
                log.debug(new StringBuffer().append("Date parse failed value=[").append(value).append("], ").append("pattern=[").append(datePattern).append("], ").append("strict=[").append(strict).append("] ").append(e).toString());
            }
        }
        return date;
    }

    public static Long formatCreditCard(String value) {
        if (GenericValidator.isCreditCard(value)) {
            return new Long(value);
        }
        return null;
    }
}
