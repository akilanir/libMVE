package org.dmfs.rfc5545;

import java.io.IOException;
import java.io.Writer;
import java.util.TimeZone;

/* loaded from: rfc5545-datetime-0.2.4.jar:org/dmfs/rfc5545/Duration.class */
public final class Duration {
    private static final int PARSER_STATE_SIGN = 0;
    private static final int PARSER_STATE_P = 1;
    private static final int PARSER_STATE_D = 3;
    private static final int PARSER_STATE_T = 4;
    private static final int PARSER_STATE_H = 5;
    private static final int PARSER_STATE_M = 6;
    private static final int PARSER_STATE_S = 7;
    private static final int PARSER_STATE_W = 8;
    private final int mSign;
    private final int mDays;
    private final int mTime;

    public Duration(int i, int i2) {
        this(i, i2 * PARSER_STATE_S, PARSER_STATE_SIGN);
    }

    public Duration(int i, int i2, int i3, int i4, int i5) {
        this(i, i2, (i3 * 3600) + (i4 * 60) + i5);
    }

    public Duration(int i, int i2, int i3) {
        if (i != PARSER_STATE_P && i != -1) {
            throw new IllegalArgumentException("sign must be 1 or -1");
        }
        if (i2 < 0 || i3 < 0) {
            throw new IllegalArgumentException("Duration values must be >=0");
        }
        this.mSign = i;
        this.mDays = i2;
        this.mTime = i3;
    }

    public boolean isZero() {
        return this.mDays + this.mTime == 0;
    }

    public int getSign() {
        return this.mSign;
    }

    public int getWeeks() {
        return (this.mDays % PARSER_STATE_S) + this.mTime == 0 ? this.mDays / PARSER_STATE_S : PARSER_STATE_SIGN;
    }

    public int getDays() {
        return (this.mDays % PARSER_STATE_S) + this.mTime > 0 ? this.mDays : PARSER_STATE_SIGN;
    }

    public int getRawDays() {
        return this.mDays;
    }

    public int getHours() {
        return this.mTime / 3600;
    }

    public int getMinutes() {
        return (this.mTime / 60) % 60;
    }

    public int getSeconds() {
        return this.mTime % 60;
    }

    public int getSecondsOfDay() {
        return this.mTime;
    }

    public long toMillis() {
        return this.mSign * ((this.mDays * 24 * 3600) + this.mTime) * 1000;
    }

    public long addTo(TimeZone timeZone, long j) {
        return isZero() ? j : (timeZone == null || !timeZone.useDaylightTime()) ? j + toMillis() : new DateTime(timeZone, j).addDuration(this).getTimestamp();
    }

    public Duration addDuration(Duration duration) {
        if (duration == null) {
            throw new IllegalArgumentException("Duration must not be null");
        }
        if (duration.isZero()) {
            return this;
        }
        if (isZero()) {
            return duration;
        }
        if (this.mSign == duration.mSign) {
            return new Duration(this.mSign, this.mDays + duration.mDays, this.mTime + duration.mTime);
        }
        int i = (this.mSign * this.mDays) + (duration.mSign * duration.mDays);
        int i2 = (this.mSign * this.mTime) + (duration.mSign * duration.mTime);
        if (i >= 0 && i2 >= 0) {
            return new Duration(PARSER_STATE_P, i, i2);
        }
        if (i < 0 && i2 < 0) {
            return new Duration(-1, -i, -i2);
        }
        int i3 = (i * 24 * 3600) + i2;
        int i4 = i3 / 86400;
        int i5 = i3 % 86400;
        return i3 >= 0 ? new Duration(PARSER_STATE_P, i4, i5) : new Duration(-1, -i4, -i5);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0193  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x019f A[ADDED_TO_REGION, REMOVE, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r0v19 */
    /* JADX WARN: Type inference failed for: r0v26 */
    /* JADX WARN: Type inference failed for: r0v27 */
    /* JADX WARN: Type inference failed for: r0v28 */
    /* JADX WARN: Type inference failed for: r0v59 */
    /* JADX WARN: Type inference failed for: r1v17 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static org.dmfs.rfc5545.Duration parse(java.lang.String r8) {
        /*
            Method dump skipped, instructions count: 555
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.dmfs.rfc5545.Duration.parse(java.lang.String):org.dmfs.rfc5545.Duration");
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(15);
        writeTo(sb);
        return sb.toString();
    }

    public void writeTo(StringBuilder sb) {
        if (this.mSign < 0 && (this.mDays > 0 || this.mTime > 0)) {
            sb.append('-');
        }
        sb.append('P');
        int weeks = getWeeks();
        if (weeks > 0) {
            sb.append(weeks);
            sb.append('W');
            return;
        }
        if (this.mDays > 0) {
            sb.append(this.mDays);
            sb.append('D');
        }
        if (this.mTime == 0) {
            if (this.mDays == 0) {
                sb.append("0D");
                return;
            }
            return;
        }
        int hours = getHours();
        int minutes = getMinutes();
        int seconds = getSeconds();
        sb.append('T');
        if (hours > 0) {
            sb.append(hours);
            sb.append('H');
        }
        if (minutes > 0) {
            sb.append(minutes);
            sb.append('M');
        }
        if (seconds > 0) {
            sb.append(seconds);
            sb.append('S');
        }
    }

    public void writeTo(Writer writer) throws IOException {
        if (this.mSign < 0 && (this.mDays > 0 || this.mTime > 0)) {
            writer.append('-');
        }
        writer.append('P');
        int weeks = getWeeks();
        if (weeks > 0) {
            writer.write(Integer.toString(weeks));
            writer.write(87);
            return;
        }
        if (this.mDays > 0) {
            writer.write(Integer.toString(this.mDays));
            writer.write(68);
        }
        if (this.mTime == 0) {
            if (this.mDays == 0) {
                writer.write("0D");
                return;
            }
            return;
        }
        int hours = getHours();
        int minutes = getMinutes();
        int seconds = getSeconds();
        writer.write(84);
        if (hours > 0) {
            writer.write(Integer.toString(hours));
            writer.write(72);
        }
        if (minutes > 0) {
            writer.write(Integer.toString(minutes));
            writer.write(77);
        }
        if (seconds > 0) {
            writer.write(Integer.toString(seconds));
            writer.write(83);
        }
    }

    public int hashCode() {
        return this.mSign * ((this.mDays * 24 * 3600) + this.mTime);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof Duration)) {
            return false;
        }
        Duration duration = (Duration) obj;
        return this.mSign == duration.mSign && this.mDays == duration.mDays && this.mTime == duration.mTime;
    }
}
