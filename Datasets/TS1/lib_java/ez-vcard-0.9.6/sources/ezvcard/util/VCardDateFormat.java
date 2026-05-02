package ezvcard.util;

import java.text.DateFormat;
import java.text.FieldPosition;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import java.util.regex.Pattern;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/VCardDateFormat.class */
public enum VCardDateFormat {
    DATE_BASIC("\\d{8}", "yyyyMMdd"),
    DATE_EXTENDED("\\d{4}-\\d{2}-\\d{2}", "yyyy-MM-dd"),
    DATE_TIME_BASIC("\\d{8}T\\d{6}[-\\+]\\d{4}", "yyyyMMdd'T'HHmmssZ"),
    DATE_TIME_EXTENDED("\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}[-\\+]\\d{2}:\\d{2}", "yyyy-MM-dd'T'HH:mm:ssZ") { // from class: ezvcard.util.VCardDateFormat.1
        @Override // ezvcard.util.VCardDateFormat
        public DateFormat getDateFormat(TimeZone timezone) {
            DateFormat df = new SimpleDateFormat(this.formatStr) { // from class: ezvcard.util.VCardDateFormat.1.1
                @Override // java.text.DateFormat
                public Date parse(String str) throws ParseException {
                    int index = str.lastIndexOf(58);
                    return super.parse(str.substring(0, index) + str.substring(index + 1));
                }

                @Override // java.text.SimpleDateFormat, java.text.DateFormat
                public StringBuffer format(Date date, StringBuffer toAppendTo, FieldPosition fieldPosition) {
                    StringBuffer sb = super.format(date, toAppendTo, fieldPosition);
                    sb.insert(sb.length() - 2, ':');
                    return sb;
                }
            };
            if (timezone != null) {
                df.setTimeZone(timezone);
            }
            return df;
        }
    },
    UTC_DATE_TIME_BASIC("\\d{8}T\\d{6}Z", "yyyyMMdd'T'HHmmss'Z'") { // from class: ezvcard.util.VCardDateFormat.2
        @Override // ezvcard.util.VCardDateFormat
        public DateFormat getDateFormat(TimeZone timezone) {
            TimeZone timezone2 = TimeZone.getTimeZone("UTC");
            return super.getDateFormat(timezone2);
        }
    },
    UTC_DATE_TIME_EXTENDED("\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}Z", "yyyy-MM-dd'T'HH:mm:ss'Z'") { // from class: ezvcard.util.VCardDateFormat.3
        @Override // ezvcard.util.VCardDateFormat
        public DateFormat getDateFormat(TimeZone timezone) {
            TimeZone timezone2 = TimeZone.getTimeZone("UTC");
            return super.getDateFormat(timezone2);
        }
    },
    HCARD_DATE_TIME("\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}[-\\+]\\d{2}:?\\d{2}", "yyyy-MM-dd'T'HH:mm:ssZ") { // from class: ezvcard.util.VCardDateFormat.4
        @Override // ezvcard.util.VCardDateFormat
        public DateFormat getDateFormat(TimeZone timezone) {
            DateFormat df = new SimpleDateFormat(this.formatStr) { // from class: ezvcard.util.VCardDateFormat.4.1
                @Override // java.text.DateFormat
                public Date parse(String str) throws ParseException {
                    return super.parse(str.replaceAll("([-\\+]\\d{2}):(\\d{2})$", "$1$2"));
                }
            };
            if (timezone != null) {
                df.setTimeZone(timezone);
            }
            return df;
        }
    };

    private final Pattern pattern;
    protected final String formatStr;

    VCardDateFormat(String regex, String formatStr) {
        this.pattern = Pattern.compile(regex);
        this.formatStr = formatStr;
    }

    public boolean matches(String dateStr) {
        return this.pattern.matcher(dateStr).matches();
    }

    public DateFormat getDateFormat() {
        return getDateFormat(null);
    }

    public DateFormat getDateFormat(TimeZone timezone) {
        DateFormat df = new SimpleDateFormat(this.formatStr);
        if (timezone != null) {
            df.setTimeZone(timezone);
        }
        return df;
    }

    public String format(Date date) {
        return format(date, null);
    }

    public String format(Date date, TimeZone timezone) {
        DateFormat df = getDateFormat(timezone);
        return df.format(date);
    }

    public static VCardDateFormat find(String dateStr) {
        VCardDateFormat[] arr$ = values();
        for (VCardDateFormat format : arr$) {
            if (format.matches(dateStr)) {
                return format;
            }
        }
        return null;
    }

    public static Date parse(String dateStr) {
        VCardDateFormat format = find(dateStr);
        if (format == null) {
            throw parseException(dateStr);
        }
        DateFormat df = format.getDateFormat();
        try {
            return df.parse(dateStr);
        } catch (ParseException e) {
            throw parseException(dateStr);
        }
    }

    public static boolean dateHasTime(String dateStr) {
        return dateStr.contains("T");
    }

    public static boolean dateHasTimezone(String dateStr) {
        return dateStr.endsWith("Z") || dateStr.matches(".*?[-+]\\d\\d:?\\d\\d");
    }

    public static TimeZone parseTimeZoneId(String timezoneId) {
        TimeZone timezone = TimeZone.getTimeZone(timezoneId);
        if ("GMT".equals(timezone.getID())) {
            return null;
        }
        return timezone;
    }

    private static IllegalArgumentException parseException(String dateStr) {
        return new IllegalArgumentException("Date string \"" + dateStr + "\" is not in a valid ISO-8601 format.");
    }
}
