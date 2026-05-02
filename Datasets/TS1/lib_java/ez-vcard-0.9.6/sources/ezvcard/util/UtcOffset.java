package ezvcard.util;

import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/UtcOffset.class */
public final class UtcOffset {
    private final int hour;
    private final int minute;

    public UtcOffset(int hour, int minute) {
        this.hour = hour;
        this.minute = minute;
    }

    public static UtcOffset parse(String text) {
        boolean positive;
        Pattern timeZoneRegex = Pattern.compile("^([-\\+])?(\\d{1,2})(:?(\\d{2}))?$");
        Matcher m = timeZoneRegex.matcher(text);
        if (!m.find()) {
            throw new IllegalArgumentException("Offset string is not in ISO8610 format: " + text);
        }
        String sign = m.group(1);
        if ("-".equals(sign)) {
            positive = false;
        } else {
            positive = true;
        }
        String hourStr = m.group(2);
        int hourOffset = Integer.parseInt(hourStr);
        if (!positive) {
            hourOffset *= -1;
        }
        String minuteStr = m.group(4);
        int minuteOffset = minuteStr == null ? 0 : Integer.parseInt(minuteStr);
        return new UtcOffset(hourOffset, minuteOffset);
    }

    public static UtcOffset parse(TimeZone timezone) {
        long offsetMs = timezone.getOffset(System.currentTimeMillis());
        int hours = (int) (((offsetMs / 1000) / 60) / 60);
        int minutes = (int) (((offsetMs / 1000) / 60) % 60);
        if (minutes < 0) {
            minutes *= -1;
        }
        return new UtcOffset(hours, minutes);
    }

    public int getHour() {
        return this.hour;
    }

    public int getMinute() {
        return this.minute;
    }

    public String toString() {
        return toString(false);
    }

    public String toString(boolean extended) {
        StringBuilder sb = new StringBuilder();
        boolean positive = this.hour >= 0;
        sb.append(positive ? '+' : '-');
        int hour = Math.abs(this.hour);
        if (hour < 10) {
            sb.append('0');
        }
        sb.append(hour);
        if (extended) {
            sb.append(':');
        }
        if (this.minute < 10) {
            sb.append('0');
        }
        sb.append(this.minute);
        return sb.toString();
    }

    public int hashCode() {
        int result = (31 * 1) + this.hour;
        return (31 * result) + this.minute;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        UtcOffset other = (UtcOffset) obj;
        if (this.hour != other.hour || this.minute != other.minute) {
            return false;
        }
        return true;
    }
}
