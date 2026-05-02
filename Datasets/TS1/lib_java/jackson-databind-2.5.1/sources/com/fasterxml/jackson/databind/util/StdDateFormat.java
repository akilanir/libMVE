package com.fasterxml.jackson.databind.util;

import com.fasterxml.jackson.core.io.NumberInput;
import java.text.DateFormat;
import java.text.FieldPosition;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/util/StdDateFormat.class */
public class StdDateFormat extends DateFormat {
    protected static final DateFormat DATE_FORMAT_ISO8601;
    protected static final DateFormat DATE_FORMAT_ISO8601_Z;
    protected static final DateFormat DATE_FORMAT_PLAIN;
    public static final StdDateFormat instance;
    protected transient TimeZone _timezone;
    protected final Locale _locale;
    protected transient DateFormat _formatRFC1123;
    protected transient DateFormat _formatISO8601;
    protected transient DateFormat _formatISO8601_z;
    protected transient DateFormat _formatPlain;
    protected static final String DATE_FORMAT_STR_ISO8601 = "yyyy-MM-dd'T'HH:mm:ss.SSSZ";
    protected static final String DATE_FORMAT_STR_ISO8601_Z = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
    protected static final String DATE_FORMAT_STR_RFC1123 = "EEE, dd MMM yyyy HH:mm:ss zzz";
    protected static final String DATE_FORMAT_STR_PLAIN = "yyyy-MM-dd";
    protected static final String[] ALL_FORMATS = {DATE_FORMAT_STR_ISO8601, DATE_FORMAT_STR_ISO8601_Z, DATE_FORMAT_STR_RFC1123, DATE_FORMAT_STR_PLAIN};
    private static final TimeZone DEFAULT_TIMEZONE = TimeZone.getTimeZone("GMT");
    private static final Locale DEFAULT_LOCALE = Locale.US;
    protected static final DateFormat DATE_FORMAT_RFC1123 = new SimpleDateFormat(DATE_FORMAT_STR_RFC1123, DEFAULT_LOCALE);

    static {
        DATE_FORMAT_RFC1123.setTimeZone(DEFAULT_TIMEZONE);
        DATE_FORMAT_ISO8601 = new SimpleDateFormat(DATE_FORMAT_STR_ISO8601, DEFAULT_LOCALE);
        DATE_FORMAT_ISO8601.setTimeZone(DEFAULT_TIMEZONE);
        DATE_FORMAT_ISO8601_Z = new SimpleDateFormat(DATE_FORMAT_STR_ISO8601_Z, DEFAULT_LOCALE);
        DATE_FORMAT_ISO8601_Z.setTimeZone(DEFAULT_TIMEZONE);
        DATE_FORMAT_PLAIN = new SimpleDateFormat(DATE_FORMAT_STR_PLAIN, DEFAULT_LOCALE);
        DATE_FORMAT_PLAIN.setTimeZone(DEFAULT_TIMEZONE);
        instance = new StdDateFormat();
    }

    public StdDateFormat() {
        this._locale = DEFAULT_LOCALE;
    }

    @Deprecated
    public StdDateFormat(TimeZone tz) {
        this(tz, DEFAULT_LOCALE);
    }

    public StdDateFormat(TimeZone tz, Locale loc) {
        this._timezone = tz;
        this._locale = loc;
    }

    public static TimeZone getDefaultTimeZone() {
        return DEFAULT_TIMEZONE;
    }

    public StdDateFormat withTimeZone(TimeZone tz) {
        if (tz == null) {
            tz = DEFAULT_TIMEZONE;
        }
        if (tz.equals(this._timezone)) {
            return this;
        }
        return new StdDateFormat(tz, this._locale);
    }

    public StdDateFormat withLocale(Locale loc) {
        if (loc.equals(this._locale)) {
            return this;
        }
        return new StdDateFormat(this._timezone, loc);
    }

    @Override // java.text.DateFormat, java.text.Format
    public StdDateFormat clone() {
        return new StdDateFormat(this._timezone, this._locale);
    }

    @Deprecated
    public static DateFormat getBlueprintISO8601Format() {
        return DATE_FORMAT_ISO8601;
    }

    @Deprecated
    public static DateFormat getISO8601Format(TimeZone tz) {
        return getISO8601Format(tz, DEFAULT_LOCALE);
    }

    public static DateFormat getISO8601Format(TimeZone tz, Locale loc) {
        return _cloneFormat(DATE_FORMAT_ISO8601, DATE_FORMAT_STR_ISO8601, tz, loc);
    }

    @Deprecated
    public static DateFormat getBlueprintRFC1123Format() {
        return DATE_FORMAT_RFC1123;
    }

    public static DateFormat getRFC1123Format(TimeZone tz, Locale loc) {
        return _cloneFormat(DATE_FORMAT_RFC1123, DATE_FORMAT_STR_RFC1123, tz, loc);
    }

    @Deprecated
    public static DateFormat getRFC1123Format(TimeZone tz) {
        return getRFC1123Format(tz, DEFAULT_LOCALE);
    }

    @Override // java.text.DateFormat
    public void setTimeZone(TimeZone tz) {
        if (!tz.equals(this._timezone)) {
            this._formatRFC1123 = null;
            this._formatISO8601 = null;
            this._formatISO8601_z = null;
            this._formatPlain = null;
            this._timezone = tz;
        }
    }

    @Override // java.text.DateFormat
    public Date parse(String dateStr) throws ParseException {
        String dateStr2 = dateStr.trim();
        ParsePosition pos = new ParsePosition(0);
        Date result = parse(dateStr2, pos);
        if (result != null) {
            return result;
        }
        StringBuilder sb = new StringBuilder();
        String[] arr$ = ALL_FORMATS;
        for (String f : arr$) {
            if (sb.length() > 0) {
                sb.append("\", \"");
            } else {
                sb.append('\"');
            }
            sb.append(f);
        }
        sb.append('\"');
        throw new ParseException(String.format("Can not parse date \"%s\": not compatible with any of standard forms (%s)", dateStr2, sb.toString()), pos.getErrorIndex());
    }

    @Override // java.text.DateFormat
    public Date parse(String dateStr, ParsePosition pos) {
        if (looksLikeISO8601(dateStr)) {
            return parseAsISO8601(dateStr, pos);
        }
        int i = dateStr.length();
        while (true) {
            i--;
            if (i < 0) {
                break;
            }
            char ch = dateStr.charAt(i);
            if (ch < '0' || ch > '9') {
                if (i > 0 || ch != '-') {
                    break;
                }
            }
        }
        if (i < 0 && (dateStr.charAt(0) == '-' || NumberInput.inLongRange(dateStr, false))) {
            return new Date(Long.parseLong(dateStr));
        }
        return parseAsRFC1123(dateStr, pos);
    }

    @Override // java.text.DateFormat
    public StringBuffer format(Date date, StringBuffer toAppendTo, FieldPosition fieldPosition) {
        if (this._formatISO8601 == null) {
            this._formatISO8601 = _cloneFormat(DATE_FORMAT_ISO8601, DATE_FORMAT_STR_ISO8601, this._timezone, this._locale);
        }
        return this._formatISO8601.format(date, toAppendTo, fieldPosition);
    }

    public String toString() {
        String str = "DateFormat " + getClass().getName();
        TimeZone tz = this._timezone;
        if (tz != null) {
            str = str + " (timezone: " + tz + ")";
        }
        return str + "(locale: " + this._locale + ")";
    }

    protected boolean looksLikeISO8601(String dateStr) {
        if (dateStr.length() >= 5 && Character.isDigit(dateStr.charAt(0)) && Character.isDigit(dateStr.charAt(3)) && dateStr.charAt(4) == '-') {
            return true;
        }
        return false;
    }

    protected Date parseAsISO8601(String dateStr, ParsePosition pos) {
        DateFormat df;
        int len = dateStr.length();
        char c = dateStr.charAt(len - 1);
        if (len <= 10 && Character.isDigit(c)) {
            df = this._formatPlain;
            if (df == null) {
                DateFormat _cloneFormat = _cloneFormat(DATE_FORMAT_PLAIN, DATE_FORMAT_STR_PLAIN, this._timezone, this._locale);
                this._formatPlain = _cloneFormat;
                df = _cloneFormat;
            }
        } else if (c == 'Z') {
            df = this._formatISO8601_z;
            if (df == null) {
                DateFormat _cloneFormat2 = _cloneFormat(DATE_FORMAT_ISO8601_Z, DATE_FORMAT_STR_ISO8601_Z, this._timezone, this._locale);
                this._formatISO8601_z = _cloneFormat2;
                df = _cloneFormat2;
            }
            if (dateStr.charAt(len - 4) == ':') {
                StringBuilder sb = new StringBuilder(dateStr);
                sb.insert(len - 1, ".000");
                dateStr = sb.toString();
            }
        } else if (hasTimeZone(dateStr)) {
            char c2 = dateStr.charAt(len - 3);
            if (c2 == ':') {
                StringBuilder sb2 = new StringBuilder(dateStr);
                sb2.delete(len - 3, len - 2);
                dateStr = sb2.toString();
            } else if (c2 == '+' || c2 == '-') {
                dateStr = dateStr + "00";
            }
            int len2 = dateStr.length();
            int timeLen = (len2 - dateStr.lastIndexOf(84)) - 6;
            if (timeLen < 12) {
                int offset = len2 - 5;
                StringBuilder sb3 = new StringBuilder(dateStr);
                switch (timeLen) {
                    case 6:
                        sb3.insert(offset, "00.000");
                    case 5:
                        sb3.insert(offset, ":00.000");
                        break;
                    case 8:
                        sb3.insert(offset, ".000");
                        break;
                    case 9:
                        sb3.insert(offset, "000");
                        break;
                    case 10:
                        sb3.insert(offset, "00");
                        break;
                    case 11:
                        sb3.insert(offset, '0');
                        break;
                }
                dateStr = sb3.toString();
            }
            df = this._formatISO8601;
            if (this._formatISO8601 == null) {
                DateFormat _cloneFormat3 = _cloneFormat(DATE_FORMAT_ISO8601, DATE_FORMAT_STR_ISO8601, this._timezone, this._locale);
                this._formatISO8601 = _cloneFormat3;
                df = _cloneFormat3;
            }
        } else {
            StringBuilder sb4 = new StringBuilder(dateStr);
            int timeLen2 = (len - dateStr.lastIndexOf(84)) - 1;
            if (timeLen2 < 12) {
                switch (timeLen2) {
                    case 11:
                        sb4.append('0');
                    case 10:
                        sb4.append('0');
                    case 9:
                        sb4.append('0');
                        break;
                    default:
                        sb4.append(".000");
                        break;
                }
            }
            sb4.append('Z');
            dateStr = sb4.toString();
            df = this._formatISO8601_z;
            if (df == null) {
                DateFormat _cloneFormat4 = _cloneFormat(DATE_FORMAT_ISO8601_Z, DATE_FORMAT_STR_ISO8601_Z, this._timezone, this._locale);
                this._formatISO8601_z = _cloneFormat4;
                df = _cloneFormat4;
            }
        }
        return df.parse(dateStr, pos);
    }

    protected Date parseAsRFC1123(String dateStr, ParsePosition pos) {
        if (this._formatRFC1123 == null) {
            this._formatRFC1123 = _cloneFormat(DATE_FORMAT_RFC1123, DATE_FORMAT_STR_RFC1123, this._timezone, this._locale);
        }
        return this._formatRFC1123.parse(dateStr, pos);
    }

    private static final boolean hasTimeZone(String str) {
        char c;
        char c2;
        int len = str.length();
        if (len >= 6) {
            char c3 = str.charAt(len - 6);
            return c3 == '+' || c3 == '-' || (c = str.charAt(len - 5)) == '+' || c == '-' || (c2 = str.charAt(len - 3)) == '+' || c2 == '-';
        }
        return false;
    }

    private static final DateFormat _cloneFormat(DateFormat df, String format, TimeZone tz, Locale loc) {
        DateFormat df2;
        if (!loc.equals(DEFAULT_LOCALE)) {
            df2 = new SimpleDateFormat(format, loc);
            df2.setTimeZone(tz == null ? DEFAULT_TIMEZONE : tz);
        } else {
            df2 = (DateFormat) df.clone();
            if (tz != null) {
                df2.setTimeZone(tz);
            }
        }
        return df2;
    }
}
