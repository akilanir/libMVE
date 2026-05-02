package ezvcard.util;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/PartialDate.class */
public final class PartialDate {
    private static final String timezoneRegex = "(([-+]\\d{1,2}):?(\\d{2})?)?";
    final Integer[] components;
    private static final int YEAR = 0;
    private static final int MONTH = 1;
    private static final int DATE = 2;
    private static final Format[] dateFormats = {new Format("(\\d{4})", YEAR), new Format("(\\d{4})-(\\d{2})", YEAR, MONTH), new Format("(\\d{4})-?(\\d{2})-?(\\d{2})", YEAR, MONTH, DATE), new Format("--(\\d{2})-?(\\d{2})", MONTH, DATE), new Format("--(\\d{2})", MONTH), new Format("---(\\d{2})", DATE)};
    private static final int HOUR = 3;
    private static final int SKIP = -1;
    private static final int TIMEZONE_HOUR = 6;
    private static final int TIMEZONE_MINUTE = 7;
    private static final int MINUTE = 4;
    private static final int SECOND = 5;
    private static final Format[] timeFormats = {new Format("(\\d{2})(([-+]\\d{1,2}):?(\\d{2})?)?", HOUR, SKIP, TIMEZONE_HOUR, TIMEZONE_MINUTE), new Format("(\\d{2}):?(\\d{2})(([-+]\\d{1,2}):?(\\d{2})?)?", HOUR, MINUTE, SKIP, TIMEZONE_HOUR, TIMEZONE_MINUTE), new Format("(\\d{2}):?(\\d{2}):?(\\d{2})(([-+]\\d{1,2}):?(\\d{2})?)?", HOUR, MINUTE, SECOND, SKIP, TIMEZONE_HOUR, TIMEZONE_MINUTE), new Format("-(\\d{2}):?(\\d{2})(([-+]\\d{1,2}):?(\\d{2})?)?", MINUTE, SECOND, SKIP, TIMEZONE_HOUR, TIMEZONE_MINUTE), new Format("-(\\d{2})(([-+]\\d{1,2}):?(\\d{2})?)?", MINUTE, SKIP, TIMEZONE_HOUR, TIMEZONE_MINUTE), new Format("--(\\d{2})(([-+]\\d{1,2}):?(\\d{2})?)?", SECOND, SKIP, TIMEZONE_HOUR, TIMEZONE_MINUTE)};

    public static PartialDate date(Integer year, Integer month, Integer date) {
        return new PartialDate(year, month, date, null, null, null, null);
    }

    public static PartialDate time(Integer hour, Integer minute, Integer second) {
        return time(hour, minute, second, null);
    }

    public static PartialDate time(Integer hour, Integer minute, Integer second, UtcOffset offset) {
        return new PartialDate(null, null, null, hour, minute, second, offset);
    }

    public static PartialDate dateTime(Integer year, Integer month, Integer date, Integer hour, Integer minute, Integer second) {
        return dateTime(year, month, date, hour, minute, second, null);
    }

    public static PartialDate dateTime(Integer year, Integer month, Integer date, Integer hour, Integer minute, Integer second, UtcOffset offset) {
        return new PartialDate(year, month, date, hour, minute, second, offset);
    }

    public PartialDate(Integer year, Integer month, Integer date, Integer hour, Integer minute, Integer second, UtcOffset offset) {
        this.components = new Integer[8];
        if (month != null && (month.intValue() < MONTH || month.intValue() > 12)) {
            throw new IllegalArgumentException("Month must be between 1 and 12 inclusive.");
        }
        if (date != null && (date.intValue() < MONTH || date.intValue() > 31)) {
            throw new IllegalArgumentException("Date must be between 1 and 31 inclusive.");
        }
        if (hour != null && (hour.intValue() < 0 || hour.intValue() > 23)) {
            throw new IllegalArgumentException("Hour must be between 0 and 23 inclusive.");
        }
        if (minute != null && (minute.intValue() < 0 || minute.intValue() > 59)) {
            throw new IllegalArgumentException("Minute must be between 0 and 59 inclusive.");
        }
        if (second != null && (second.intValue() < 0 || second.intValue() > 59)) {
            throw new IllegalArgumentException("Second must be between 0 and 59 inclusive.");
        }
        if (offset != null && (offset.getMinute() < 0 || offset.getMinute() > 59)) {
            throw new IllegalArgumentException("Timezone minute must be between 0 and 59 inclusive.");
        }
        if (year != null && month == null && date != null) {
            throw new IllegalArgumentException("Invalid date component combination: year, date");
        }
        if (hour != null && minute == null && second != null) {
            throw new IllegalArgumentException("Invalid time component combination: hour, second");
        }
        this.components[YEAR] = year;
        this.components[MONTH] = month;
        this.components[DATE] = date;
        this.components[HOUR] = hour;
        this.components[MINUTE] = minute;
        this.components[SECOND] = second;
        this.components[TIMEZONE_HOUR] = offset == null ? null : Integer.valueOf(offset.getHour());
        this.components[TIMEZONE_MINUTE] = offset == null ? null : Integer.valueOf(offset.getMinute());
    }

    public PartialDate(String string) {
        boolean success;
        this.components = new Integer[8];
        String[] split = string.split("T");
        if (split.length == MONTH) {
            success = parseDate(string) || parseTime(string);
        } else if (split[YEAR].length() == 0) {
            success = parseTime(split[MONTH]);
        } else {
            success = parseDate(split[YEAR]) && parseTime(split[MONTH]);
        }
        if (!success) {
            throw new IllegalArgumentException("Could not parse date: " + string);
        }
    }

    private boolean parseDate(String value) {
        Format[] arr$ = dateFormats;
        int len$ = arr$.length;
        for (int i$ = YEAR; i$ < len$; i$ += MONTH) {
            Format regex = arr$[i$];
            if (regex.parse(this, value)) {
                return true;
            }
        }
        return false;
    }

    private boolean parseTime(String value) {
        Format[] arr$ = timeFormats;
        int len$ = arr$.length;
        for (int i$ = YEAR; i$ < len$; i$ += MONTH) {
            Format regex = arr$[i$];
            if (regex.parse(this, value)) {
                return true;
            }
        }
        return false;
    }

    public Integer getYear() {
        return this.components[YEAR];
    }

    private boolean hasYear() {
        return getYear() != null;
    }

    public Integer getMonth() {
        return this.components[MONTH];
    }

    private boolean hasMonth() {
        return getMonth() != null;
    }

    public Integer getDate() {
        return this.components[DATE];
    }

    private boolean hasDate() {
        return getDate() != null;
    }

    public Integer getHour() {
        return this.components[HOUR];
    }

    private boolean hasHour() {
        return getHour() != null;
    }

    public Integer getMinute() {
        return this.components[MINUTE];
    }

    private boolean hasMinute() {
        return getMinute() != null;
    }

    public Integer getSecond() {
        return this.components[SECOND];
    }

    private boolean hasSecond() {
        return getSecond() != null;
    }

    public Integer[] getTimezone() {
        if (!hasTimezone()) {
            return null;
        }
        return new Integer[]{this.components[TIMEZONE_HOUR], this.components[TIMEZONE_MINUTE]};
    }

    private boolean hasTimezone() {
        return this.components[TIMEZONE_HOUR] != null;
    }

    public boolean hasDateComponent() {
        return hasYear() || hasMonth() || hasDate();
    }

    public boolean hasTimeComponent() {
        return hasHour() || hasMinute() || hasSecond();
    }

    public String toDateAndOrTime(boolean extended) {
        StringBuilder sb = new StringBuilder();
        NumberFormat nf = new DecimalFormat("00");
        String yearStr = hasYear() ? getYear().toString() : null;
        String monthStr = hasMonth() ? nf.format(getMonth()) : null;
        String dateStr = hasDate() ? nf.format(getDate()) : null;
        String dash = extended ? "-" : "";
        if (hasYear() && !hasMonth() && !hasDate()) {
            sb.append(yearStr);
        } else if (!hasYear() && hasMonth() && !hasDate()) {
            sb.append("--").append(monthStr);
        } else if (!hasYear() && !hasMonth() && hasDate()) {
            sb.append("---").append(dateStr);
        } else if (hasYear() && hasMonth() && !hasDate()) {
            sb.append(yearStr).append("-").append(monthStr);
        } else if (!hasYear() && hasMonth() && hasDate()) {
            sb.append("--").append(monthStr).append(dash).append(dateStr);
        } else {
            if (hasYear() && !hasMonth() && hasDate()) {
                throw new IllegalStateException("Invalid date component combination: year, date");
            }
            if (hasYear() && hasMonth() && hasDate()) {
                sb.append(yearStr).append(dash).append(monthStr).append(dash).append(dateStr);
            }
        }
        if (hasTimeComponent()) {
            sb.append('T');
            String hourStr = hasHour() ? nf.format(getHour()) : null;
            String minuteStr = hasMinute() ? nf.format(getMinute()) : null;
            String secondStr = hasSecond() ? nf.format(getSecond()) : null;
            String dash2 = extended ? ":" : "";
            if (hasHour() && !hasMinute() && !hasSecond()) {
                sb.append(hourStr);
            } else if (!hasHour() && hasMinute() && !hasSecond()) {
                sb.append("-").append(minuteStr);
            } else if (!hasHour() && !hasMinute() && hasSecond()) {
                sb.append("--").append(secondStr);
            } else if (hasHour() && hasMinute() && !hasSecond()) {
                sb.append(hourStr).append(dash2).append(minuteStr);
            } else if (!hasHour() && hasMinute() && hasSecond()) {
                sb.append("-").append(minuteStr).append(dash2).append(secondStr);
            } else {
                if (hasHour() && !hasMinute() && hasSecond()) {
                    throw new IllegalStateException("Invalid time component combination: hour, second");
                }
                if (hasHour() && hasMinute() && hasSecond()) {
                    sb.append(hourStr).append(dash2).append(minuteStr).append(dash2).append(secondStr);
                }
            }
            if (hasTimezone()) {
                Integer[] timezone = getTimezone();
                if (timezone[MONTH] == null) {
                    timezone[MONTH] = Integer.valueOf(YEAR);
                }
                sb.append(new UtcOffset(timezone[YEAR].intValue(), timezone[MONTH].intValue()).toString(extended));
            }
        }
        return sb.toString();
    }

    public int hashCode() {
        int result = (31 * MONTH) + Arrays.hashCode(this.components);
        return result;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        PartialDate other = (PartialDate) obj;
        if (!Arrays.equals(this.components, other.components)) {
            return false;
        }
        return true;
    }

    public String toString() {
        return toDateAndOrTime(true);
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/PartialDate$Format.class */
    private static class Format {
        private Pattern regex;
        private int[] componentIndexes;

        public Format(String regex, int... componentIndexes) {
            this.regex = Pattern.compile("^" + regex + "$");
            this.componentIndexes = componentIndexes;
        }

        public boolean parse(PartialDate partialDate, String value) {
            Matcher m = this.regex.matcher(value);
            if (m.find()) {
                for (int i = PartialDate.YEAR; i < this.componentIndexes.length; i += PartialDate.MONTH) {
                    int index = this.componentIndexes[i];
                    if (index != PartialDate.SKIP) {
                        int group = i + PartialDate.MONTH;
                        String groupStr = m.group(group);
                        if (groupStr != null) {
                            if (groupStr.startsWith("+")) {
                                groupStr = groupStr.substring(PartialDate.MONTH);
                            }
                            partialDate.components[index] = Integer.valueOf(groupStr);
                        }
                    }
                }
                return true;
            }
            return false;
        }
    }
}
