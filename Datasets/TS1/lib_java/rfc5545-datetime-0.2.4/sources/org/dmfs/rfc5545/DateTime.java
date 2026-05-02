package org.dmfs.rfc5545;

import java.io.IOException;
import java.io.Writer;
import java.util.TimeZone;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.calendarmetrics.GregorianCalendarMetrics;

/* loaded from: rfc5545-datetime-0.2.4.jar:org/dmfs/rfc5545/DateTime.class */
public final class DateTime {
    public static final CalendarMetrics GREGORIAN_CALENDAR_SCALE = new GregorianCalendarMetrics(Weekday.MO, 4);
    public static final TimeZone UTC = TimeZone.getTimeZone("UTC");
    private final CalendarMetrics mCalendarMetrics;
    private final TimeZone mTimezone;
    private long mTimestamp;
    private long mInstance;
    private int mWeekOfYear;
    private int mDayOfWeek;
    private final boolean mAllday;

    public static DateTime now() {
        return now(UTC);
    }

    public static DateTime nowAndHere() {
        return now(TimeZone.getDefault());
    }

    public static DateTime now(TimeZone timeZone) {
        return new DateTime(GREGORIAN_CALENDAR_SCALE, timeZone, System.currentTimeMillis());
    }

    public static DateTime today() {
        return new DateTime(GREGORIAN_CALENDAR_SCALE, null, Instance.setSecond(Instance.setMinute(Instance.setHour(GREGORIAN_CALENDAR_SCALE.toInstance(System.currentTimeMillis(), TimeZone.getDefault()), 0), 0), 0), true, Long.MAX_VALUE);
    }

    public DateTime(CalendarMetrics calendarMetrics, DateTime dateTime) {
        this.mTimestamp = Long.MAX_VALUE;
        this.mInstance = Long.MAX_VALUE;
        this.mWeekOfYear = -1;
        this.mDayOfWeek = -1;
        this.mCalendarMetrics = calendarMetrics;
        this.mTimestamp = dateTime.getTimestamp();
        this.mTimezone = dateTime.mTimezone;
        this.mAllday = dateTime.mAllday;
    }

    public DateTime(CalendarMetrics calendarMetrics, TimeZone timeZone, DateTime dateTime) {
        this.mTimestamp = Long.MAX_VALUE;
        this.mInstance = Long.MAX_VALUE;
        this.mWeekOfYear = -1;
        this.mDayOfWeek = -1;
        this.mCalendarMetrics = calendarMetrics;
        this.mTimestamp = dateTime.getTimestamp();
        if (dateTime.mAllday) {
            this.mTimezone = null;
            if (calendarMetrics.scaleEquals(dateTime.mCalendarMetrics)) {
                this.mInstance = dateTime.mInstance;
            }
        } else {
            this.mTimezone = timeZone;
        }
        this.mAllday = dateTime.mAllday;
    }

    public DateTime(long j) {
        this(GREGORIAN_CALENDAR_SCALE, UTC, j);
    }

    public DateTime(TimeZone timeZone, long j) {
        this(GREGORIAN_CALENDAR_SCALE, timeZone, j);
    }

    public DateTime(CalendarMetrics calendarMetrics, TimeZone timeZone, long j) {
        this.mTimestamp = Long.MAX_VALUE;
        this.mInstance = Long.MAX_VALUE;
        this.mWeekOfYear = -1;
        this.mDayOfWeek = -1;
        this.mCalendarMetrics = calendarMetrics;
        this.mTimestamp = j;
        this.mTimezone = timeZone;
        this.mAllday = false;
    }

    public DateTime(int i, int i2, int i3) {
        this.mTimestamp = Long.MAX_VALUE;
        this.mInstance = Long.MAX_VALUE;
        this.mWeekOfYear = -1;
        this.mDayOfWeek = -1;
        this.mCalendarMetrics = GREGORIAN_CALENDAR_SCALE;
        this.mInstance = Instance.make(i, i2, i3, 0, 0, 0);
        this.mTimezone = null;
        this.mAllday = true;
    }

    public DateTime(int i, int i2, int i3, int i4, int i5, int i6) {
        this((TimeZone) null, i, i2, i3, i4, i5, i6);
    }

    public DateTime(TimeZone timeZone, int i, int i2, int i3, int i4, int i5, int i6) {
        this.mTimestamp = Long.MAX_VALUE;
        this.mInstance = Long.MAX_VALUE;
        this.mWeekOfYear = -1;
        this.mDayOfWeek = -1;
        this.mCalendarMetrics = GREGORIAN_CALENDAR_SCALE;
        this.mInstance = Instance.make(i, i2, i3, i4, i5, i6);
        this.mTimezone = timeZone;
        this.mAllday = false;
    }

    public DateTime(String str, int i, int i2, int i3) {
        this.mTimestamp = Long.MAX_VALUE;
        this.mInstance = Long.MAX_VALUE;
        this.mWeekOfYear = -1;
        this.mDayOfWeek = -1;
        this.mCalendarMetrics = UnicodeCalendarScales.getCalendarMetricsForName(str).getCalendarMetrics(Weekday.MO);
        this.mInstance = Instance.make(i, i2, i3, 0, 0, 0);
        this.mTimezone = null;
        this.mAllday = true;
    }

    public DateTime(String str, int i, int i2, int i3, int i4, int i5, int i6) {
        this(str, (TimeZone) null, i, i2, i3, i4, i5, i6);
    }

    public DateTime(String str, TimeZone timeZone, int i, int i2, int i3, int i4, int i5, int i6) {
        this.mTimestamp = Long.MAX_VALUE;
        this.mInstance = Long.MAX_VALUE;
        this.mWeekOfYear = -1;
        this.mDayOfWeek = -1;
        this.mCalendarMetrics = UnicodeCalendarScales.getCalendarMetricsForName(str).getCalendarMetrics(Weekday.MO);
        this.mInstance = Instance.make(i, i2, i3, i4, i5, i6);
        this.mTimezone = timeZone;
        this.mAllday = false;
    }

    public DateTime(CalendarMetrics calendarMetrics, int i, int i2, int i3) {
        this.mTimestamp = Long.MAX_VALUE;
        this.mInstance = Long.MAX_VALUE;
        this.mWeekOfYear = -1;
        this.mDayOfWeek = -1;
        this.mCalendarMetrics = calendarMetrics;
        this.mInstance = Instance.make(i, i2, i3, 0, 0, 0);
        this.mTimezone = null;
        this.mAllday = true;
    }

    public DateTime(CalendarMetrics calendarMetrics, int i, int i2, int i3, int i4, int i5, int i6) {
        this(calendarMetrics, (TimeZone) null, i, i2, i3, i4, i5, i6);
    }

    public DateTime(CalendarMetrics calendarMetrics, TimeZone timeZone, int i, int i2, int i3, int i4, int i5, int i6) {
        this.mTimestamp = Long.MAX_VALUE;
        this.mInstance = Long.MAX_VALUE;
        this.mWeekOfYear = -1;
        this.mDayOfWeek = -1;
        this.mCalendarMetrics = calendarMetrics;
        this.mInstance = Instance.make(i, i2, i3, i4, i5, i6);
        this.mTimezone = timeZone;
        this.mAllday = false;
    }

    private DateTime(CalendarMetrics calendarMetrics, TimeZone timeZone, long j, boolean z, long j2) {
        this.mTimestamp = Long.MAX_VALUE;
        this.mInstance = Long.MAX_VALUE;
        this.mWeekOfYear = -1;
        this.mDayOfWeek = -1;
        this.mCalendarMetrics = calendarMetrics;
        this.mInstance = j;
        this.mTimezone = timeZone;
        this.mAllday = z;
        this.mTimestamp = j2;
    }

    public CalendarMetrics getCalendarMetrics() {
        return this.mCalendarMetrics;
    }

    public TimeZone getTimeZone() {
        return this.mTimezone;
    }

    /*  JADX ERROR: Failed to decode insn: 0x0035: MOVE_MULTI
        java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[11]
        	at java.base/java.lang.System.arraycopy(Native Method)
        	at jadx.plugins.input.java.data.code.StackState.insert(StackState.java:52)
        	at jadx.plugins.input.java.data.code.CodeDecodeState.insert(CodeDecodeState.java:137)
        	at jadx.plugins.input.java.data.code.JavaInsnsRegister.dup2x1(JavaInsnsRegister.java:313)
        	at jadx.plugins.input.java.data.code.JavaInsnData.decode(JavaInsnData.java:46)
        	at jadx.core.dex.instructions.InsnDecoder.lambda$process$0(InsnDecoder.java:50)
        	at jadx.plugins.input.java.data.code.JavaCodeReader.visitInstructions(JavaCodeReader.java:85)
        	at jadx.core.dex.instructions.InsnDecoder.process(InsnDecoder.java:46)
        	at jadx.core.dex.nodes.MethodNode.load(MethodNode.java:157)
        	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:458)
        	at jadx.core.ProcessClass.process(ProcessClass.java:69)
        	at jadx.core.ProcessClass.generateCode(ProcessClass.java:117)
        	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
        	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
        	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
        */
    public long getTimestamp() {
        /*
            r11 = this;
            r0 = r11
            long r0 = r0.mTimestamp
            r1 = 9223372036854775807(0x7fffffffffffffff, double:NaN)
            int r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r0 != 0) goto L3a
            r0 = r11
            long r0 = r0.getInstance()
            r12 = r0
            r0 = r11
            r1 = r11
            org.dmfs.rfc5545.calendarmetrics.CalendarMetrics r1 = r1.mCalendarMetrics
            r2 = r11
            java.util.TimeZone r2 = r2.mTimezone
            r3 = r12
            int r3 = org.dmfs.rfc5545.Instance.year(r3)
            r4 = r12
            int r4 = org.dmfs.rfc5545.Instance.month(r4)
            r5 = r12
            int r5 = org.dmfs.rfc5545.Instance.dayOfMonth(r5)
            r6 = r12
            int r6 = org.dmfs.rfc5545.Instance.hour(r6)
            r7 = r12
            int r7 = org.dmfs.rfc5545.Instance.minute(r7)
            r8 = r12
            int r8 = org.dmfs.rfc5545.Instance.second(r8)
            r9 = 0
            long r1 = r1.toMillis(r2, r3, r4, r5, r6, r7, r8, r9)
            // decode failed: arraycopy: source index -1 out of bounds for object array[11]
            r0.mTimestamp = r1
            return r-1
            r0 = r11
            long r0 = r0.mTimestamp
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: org.dmfs.rfc5545.DateTime.getTimestamp():long");
    }

    public DateTime toAllDay() {
        if (this.mAllday) {
            return this;
        }
        long dateTime = getInstance();
        return new DateTime(Instance.year(dateTime), Instance.month(dateTime), Instance.dayOfMonth(dateTime));
    }

    public DateTime startOfDay() {
        return (!this.mAllday && getHours() == 0 && getMinutes() == 0 && getSeconds() == 0) ? this : new DateTime(this.mCalendarMetrics, this.mTimezone, getYear(), getMonth(), getDayOfMonth(), 0, 0, 0);
    }

    public DateTime swapTimeZone(TimeZone timeZone) {
        if (this.mAllday) {
            throw new IllegalStateException("can not swap the time zone of an all-day date");
        }
        TimeZone timeZone2 = this.mTimezone;
        if ((timeZone2 == null && timeZone == null) || (timeZone2 != null && timeZone2.equals(timeZone))) {
            return this;
        }
        long j = this.mTimestamp;
        return (j == Long.MAX_VALUE || (timeZone2 != null && timeZone2.hasSameRules(timeZone)) || sameTimestamps(timeZone2, timeZone)) ? new DateTime(this.mCalendarMetrics, timeZone, getInstance(), false, j) : new DateTime(this.mCalendarMetrics, timeZone, getInstance(), false, Long.MAX_VALUE);
    }

    public DateTime shiftTimeZone(TimeZone timeZone) {
        if (this.mAllday) {
            throw new IllegalStateException("can not shift the time zone of an all-day date");
        }
        TimeZone timeZone2 = this.mTimezone;
        if ((timeZone2 == null && timeZone == null) || (timeZone2 != null && timeZone2.equals(timeZone))) {
            return this;
        }
        long j = this.mInstance;
        return (j == Long.MAX_VALUE || (timeZone2 != null && timeZone2.hasSameRules(timeZone)) || sameTimestamps(timeZone2, timeZone)) ? new DateTime(this.mCalendarMetrics, timeZone, j, false, getTimestamp()) : new DateTime(timeZone, getTimestamp());
    }

    public boolean isAllDay() {
        return this.mAllday;
    }

    public boolean isFloating() {
        return this.mTimezone == null;
    }

    public int getYear() {
        return Instance.year(getInstance());
    }

    public int getMonth() {
        return Instance.month(getInstance());
    }

    public int getWeekOfYear() {
        int i = this.mWeekOfYear;
        if (i < 0) {
            long dateTime = getInstance();
            int weekOfYear = this.mCalendarMetrics.getWeekOfYear(Instance.year(dateTime), Instance.month(dateTime), Instance.dayOfMonth(dateTime));
            i = weekOfYear;
            this.mWeekOfYear = weekOfYear;
        }
        return i;
    }

    public int getDayOfWeek() {
        int i = this.mDayOfWeek;
        if (i < 0) {
            long dateTime = getInstance();
            int dayOfWeek = this.mCalendarMetrics.getDayOfWeek(Instance.year(dateTime), Instance.month(dateTime), Instance.dayOfMonth(dateTime));
            i = dayOfWeek;
            this.mDayOfWeek = dayOfWeek;
        }
        return i;
    }

    public int getDayOfMonth() {
        return Instance.dayOfMonth(getInstance());
    }

    public int getHours() {
        return Instance.hour(getInstance());
    }

    public int getMinutes() {
        return Instance.minute(getInstance());
    }

    public int getSeconds() {
        return Instance.second(getInstance());
    }

    public DateTime addDuration(Duration duration) {
        long millis;
        if (duration == null) {
            throw new IllegalArgumentException("Duration must not be null");
        }
        if (duration.isZero()) {
            return this;
        }
        if (this.mAllday && duration.getSecondsOfDay() > 0) {
            throw new IllegalArgumentException("Can't add a duration with time to an all-day DateTime.");
        }
        long j = this.mInstance;
        if (j == Long.MAX_VALUE && (this.mTimezone == null || !this.mTimezone.useDaylightTime())) {
            return new DateTime(this.mCalendarMetrics, this.mTimezone, Long.MAX_VALUE, this.mAllday, this.mTimestamp + duration.toMillis());
        }
        if (duration.getRawDays() > 0) {
            j = duration.getSign() > 0 ? this.mCalendarMetrics.nextDay(getInstance(), duration.getRawDays()) : this.mCalendarMetrics.prevDay(getInstance(), duration.getRawDays());
        }
        if (duration.getSecondsOfDay() == 0) {
            return new DateTime(this.mCalendarMetrics, this.mTimezone, j, this.mAllday, Long.MAX_VALUE);
        }
        if (j == this.mInstance) {
            millis = getTimestamp();
        } else {
            millis = this.mCalendarMetrics.toMillis(j == Long.MAX_VALUE ? getInstance() : j, this.mTimezone);
        }
        return new DateTime(this.mCalendarMetrics, this.mTimezone, millis + (duration.getSign() * duration.getSecondsOfDay() * 1000));
    }

    /*  JADX ERROR: Failed to decode insn: 0x001D: MOVE_MULTI
        java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[6]
        	at java.base/java.lang.System.arraycopy(Native Method)
        	at jadx.plugins.input.java.data.code.StackState.insert(StackState.java:52)
        	at jadx.plugins.input.java.data.code.CodeDecodeState.insert(CodeDecodeState.java:137)
        	at jadx.plugins.input.java.data.code.JavaInsnsRegister.dup2x1(JavaInsnsRegister.java:313)
        	at jadx.plugins.input.java.data.code.JavaInsnData.decode(JavaInsnData.java:46)
        	at jadx.core.dex.instructions.InsnDecoder.lambda$process$0(InsnDecoder.java:50)
        	at jadx.plugins.input.java.data.code.JavaCodeReader.visitInstructions(JavaCodeReader.java:85)
        	at jadx.core.dex.instructions.InsnDecoder.process(InsnDecoder.java:46)
        	at jadx.core.dex.nodes.MethodNode.load(MethodNode.java:157)
        	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:458)
        	at jadx.core.ProcessClass.process(ProcessClass.java:69)
        	at jadx.core.ProcessClass.generateCode(ProcessClass.java:117)
        	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
        	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
        	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
        */
    public long getInstance() {
        /*
            r6 = this;
            r0 = r6
            long r0 = r0.mInstance
            r7 = r0
            r0 = r7
            r1 = 9223372036854775807(0x7fffffffffffffff, double:NaN)
            int r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r0 != 0) goto L22
            r0 = r6
            r1 = r6
            org.dmfs.rfc5545.calendarmetrics.CalendarMetrics r1 = r1.mCalendarMetrics
            r2 = r6
            long r2 = r2.mTimestamp
            r3 = r6
            java.util.TimeZone r3 = r3.mTimezone
            long r1 = r1.toInstance(r2, r3)
            // decode failed: arraycopy: source index -1 out of bounds for object array[6]
            r0.mInstance = r1
            return r-1
            r0 = r7
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: org.dmfs.rfc5545.DateTime.getInstance():long");
    }

    public boolean after(DateTime dateTime) {
        return (dateTime.mInstance == Long.MAX_VALUE || !((dateTime.mTimestamp == Long.MAX_VALUE || this.mInstance != Long.MAX_VALUE) && this.mCalendarMetrics.scaleEquals(dateTime.mCalendarMetrics) && this.mAllday == dateTime.mAllday && sameTimestamps(this.mTimezone, dateTime.mTimezone))) ? getTimestamp() > dateTime.getTimestamp() : getInstance() > dateTime.mInstance;
    }

    public boolean before(DateTime dateTime) {
        return (dateTime.mInstance == Long.MAX_VALUE || !((dateTime.mTimestamp == Long.MAX_VALUE || this.mInstance != Long.MAX_VALUE) && this.mCalendarMetrics.scaleEquals(dateTime.mCalendarMetrics) && this.mAllday == dateTime.mAllday && sameTimestamps(this.mTimezone, dateTime.mTimezone))) ? getTimestamp() < dateTime.getTimestamp() : getInstance() < dateTime.mInstance;
    }

    public static DateTime parse(String str) {
        return parse(GREGORIAN_CALENDAR_SCALE, (TimeZone) null, str);
    }

    public static DateTime parse(String str, String str2) {
        return parse(GREGORIAN_CALENDAR_SCALE, str == null ? null : TimeZone.getTimeZone(str), str2);
    }

    public static DateTime parse(TimeZone timeZone, String str) {
        return parse(GREGORIAN_CALENDAR_SCALE, timeZone, str);
    }

    public static DateTime parse(String str, TimeZone timeZone, String str2) {
        return parse(UnicodeCalendarScales.getCalendarMetricsForName(str).getCalendarMetrics(Weekday.MO), timeZone, str2);
    }

    public static DateTime parse(CalendarMetrics calendarMetrics, TimeZone timeZone, String str) {
        if (str == null) {
            throw new NullPointerException("a date-time string must not be null");
        }
        try {
            if (str.length() == 8) {
                return new DateTime(calendarMetrics, parseFourDigits(str, 0), parseTwoDigits(str, 4) - 1, parseTwoDigits(str, 6));
            }
            if (str.length() == 15 && str.charAt(8) == 'T') {
                return new DateTime(calendarMetrics, timeZone, parseFourDigits(str, 0), parseTwoDigits(str, 4) - 1, parseTwoDigits(str, 6), parseTwoDigits(str, 9), parseTwoDigits(str, 11), parseTwoDigits(str, 13));
            }
            if (str.length() == 16 && str.charAt(8) == 'T' && str.charAt(15) == 'Z') {
                return new DateTime(calendarMetrics, UTC, parseFourDigits(str, 0), parseTwoDigits(str, 4) - 1, parseTwoDigits(str, 6), parseTwoDigits(str, 9), parseTwoDigits(str, 11), parseTwoDigits(str, 13));
            }
            throw new IllegalArgumentException("illegal date-time string: '" + str + "'");
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("illegal characters in date-time string: '" + str + "'", e);
        }
    }

    public int hashCode() {
        return (int) getTimestamp();
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof DateTime)) {
            return false;
        }
        DateTime dateTime = (DateTime) obj;
        return (this.mInstance == Long.MAX_VALUE || dateTime.mInstance == Long.MAX_VALUE) ? this.mAllday == dateTime.mAllday && this.mCalendarMetrics.scaleEquals(dateTime.mCalendarMetrics) && getTimestamp() == dateTime.getTimestamp() && (this.mTimezone == dateTime.mTimezone || !(this.mTimezone == null || dateTime.mTimezone == null || !sameTimestamps(this.mTimezone, dateTime.mTimezone))) : this.mInstance == dateTime.mInstance && this.mAllday == dateTime.mAllday && this.mCalendarMetrics.scaleEquals(dateTime.mCalendarMetrics) && (this.mTimezone == dateTime.mTimezone || !(this.mTimezone == null || dateTime.mTimezone == null || !sameTimestamps(this.mTimezone, dateTime.mTimezone)));
    }

    public String toString() {
        long dateTime = getInstance();
        StringBuilder sb = new StringBuilder(16);
        Instance.writeTo(sb, dateTime, this.mAllday);
        TimeZone timeZone = this.mTimezone;
        if (!this.mAllday && timeZone != null && "UTC".equals(timeZone.getID())) {
            sb.append('Z');
        }
        return sb.toString();
    }

    public void writeTo(StringBuilder sb) throws IOException {
        Instance.writeTo(sb, getInstance(), this.mAllday);
        TimeZone timeZone = this.mTimezone;
        if (this.mAllday || timeZone == null || !"UTC".equals(timeZone.getID())) {
            return;
        }
        sb.append('Z');
    }

    public void writeTo(Writer writer) throws IOException {
        Instance.writeTo(writer, getInstance(), this.mAllday);
        TimeZone timeZone = this.mTimezone;
        if (this.mAllday || timeZone == null || !"UTC".equals(timeZone.getID())) {
            return;
        }
        writer.write(90);
    }

    private static boolean sameTimestamps(TimeZone timeZone, TimeZone timeZone2) {
        if (timeZone == timeZone2) {
            return true;
        }
        String id = timeZone != null ? timeZone.getID() : null;
        if (timeZone2 == null && ("UTC".equals(id) || UTC.equals(timeZone) || UTC.hasSameRules(timeZone))) {
            return true;
        }
        String id2 = timeZone2 != null ? timeZone2.getID() : null;
        if (timeZone == null && ("UTC".equals(id2) || UTC.equals(timeZone2) || UTC.hasSameRules(timeZone2))) {
            return true;
        }
        return (timeZone == null || timeZone2 == null || (!id.equals(id2) && !timeZone.equals(timeZone2) && !timeZone.hasSameRules(timeZone2))) ? false : true;
    }

    private static int parseFourDigits(String str, int i) {
        return (parseTwoDigits(str, i) * 100) + parseTwoDigits(str, i + 2);
    }

    private static int parseTwoDigits(String str, int i) {
        int charAt = str.charAt(i) - '0';
        int charAt2 = str.charAt(i + 1) - '0';
        if (charAt < 0 || charAt2 < 0 || charAt > 9 || charAt2 > 9) {
            throw new NumberFormatException("illegal digit in number " + str.substring(i, 2));
        }
        return (charAt * 10) + charAt2;
    }
}
