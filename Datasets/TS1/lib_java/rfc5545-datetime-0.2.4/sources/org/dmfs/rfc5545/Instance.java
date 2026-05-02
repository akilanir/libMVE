package org.dmfs.rfc5545;

import java.io.IOException;
import java.io.Writer;

/* loaded from: rfc5545-datetime-0.2.4.jar:org/dmfs/rfc5545/Instance.class */
public final class Instance {
    private static final int YEAR_BITS = 18;
    private static final int MONTH_BITS = 8;
    private static final int DAY_BITS = 7;
    private static final int HOUR_BITS = 5;
    private static final int MINUTE_BITS = 6;
    private static final int SECOND_BITS = 6;
    private static final int WEEKDAY_BITS = 4;
    private static final int WEEKDAY_POS = 0;
    private static final int SECOND_POS = 4;
    private static final int MINUTE_POS = 10;
    private static final int HOUR_POS = 16;
    private static final int DAY_POS = 21;
    private static final int MONTH_POS = 28;
    private static final int YEAR_POS = 36;
    private static final long SECOND_MASK = 1008;
    private static final long MINUTE_MASK = 64512;
    private static final long HOUR_MASK = 2031616;
    private static final long WEEKDAY_MASK = 15;
    private static final long DAY_MASK = 266338304;
    private static final long MONTH_MASK = 68451041280L;
    private static final long YEAR_MASK = 18014329790005248L;
    private static final int YEAR_BIAS = 0;
    private static final int DAY_BIAS = 64;

    private Instance() {
    }

    public static long make(int i, int i2, int i3, int i4, int i5, int i6, int i7) {
        return ((i + 0) << 36) | (i2 << 28) | ((i3 + 64) << 21) | (i7 << 0) | (i4 << 16) | (i5 << 10) | (i6 << 4);
    }

    public static long make(int i, int i2, int i3, int i4, int i5, int i6) {
        return ((i + 0) << 36) | (i2 << 28) | ((i3 + 64) << 21) | (i4 << 16) | (i5 << 10) | (i6 << 4);
    }

    public static long setYear(long j, int i) {
        return (j & (-18014329790005249L)) | ((i + 0) << 36);
    }

    public static long setMonth(long j, int i) {
        return (j & (-68451041281L)) | (i << 28);
    }

    public static long setDayOfMonth(long j, int i) {
        return (j & (-266338305)) | ((i + 64) << 21);
    }

    public static long setDayOfWeek(long j, int i) {
        return (j & (-16)) | (i << 0);
    }

    public static long setMonthAndDayOfMonth(long j, int i, int i2) {
        return (j & (-68717379585L)) | (i << 28) | ((i2 + 64) << 21);
    }

    public static long setHour(long j, int i) {
        return (j & (-2031617)) | (i << 16);
    }

    public static long setMinute(long j, int i) {
        return (j & (-64513)) | (i << 10);
    }

    public static long setSecond(long j, int i) {
        return (j & (-1009)) | (i << 4);
    }

    public static long maskWeekday(long j) {
        return j & (-16);
    }

    public static int year(long j) {
        return ((int) ((j & YEAR_MASK) >>> 36)) - 0;
    }

    public static int month(long j) {
        return (int) ((j & MONTH_MASK) >>> 28);
    }

    public static int dayOfMonth(long j) {
        return ((int) ((j & DAY_MASK) >>> 21)) - DAY_BIAS;
    }

    public static int hour(long j) {
        return (int) ((j & HOUR_MASK) >>> 16);
    }

    public static int minute(long j) {
        return (int) ((j & MINUTE_MASK) >>> 10);
    }

    public static int second(long j) {
        return (int) ((j & SECOND_MASK) >>> 4);
    }

    public static int dayOfWeek(long j) {
        return (int) ((j & WEEKDAY_MASK) >>> 0);
    }

    public static String toString(long j) {
        return toString(j, false);
    }

    public static String toString(long j, boolean z) {
        StringBuilder sb = new StringBuilder(HOUR_POS);
        writeTo(sb, j, z);
        return sb.toString();
    }

    private static void writeDigits(StringBuilder sb, int i) {
        sb.append((char) (((i / MINUTE_POS) % MINUTE_POS) + 48));
        sb.append((char) ((i % MINUTE_POS) + 48));
    }

    public static void writeTo(StringBuilder sb, long j) {
        writeTo(sb, j, false);
    }

    public static void writeTo(StringBuilder sb, long j, boolean z) {
        int year = year(j);
        writeDigits(sb, year / 100);
        writeDigits(sb, year % 100);
        writeDigits(sb, month(j) + 1);
        writeDigits(sb, dayOfMonth(j));
        if (z) {
            return;
        }
        sb.append('T');
        writeDigits(sb, hour(j));
        writeDigits(sb, minute(j));
        writeDigits(sb, second(j));
    }

    public static void writeTo(Writer writer, long j) throws IOException {
        writeTo(writer, j, false);
    }

    public static void writeTo(Writer writer, long j, boolean z) throws IOException {
        int year = year(j);
        writeDigits(writer, year / 100);
        writeDigits(writer, year % 100);
        writeDigits(writer, month(j) + 1);
        writeDigits(writer, dayOfMonth(j));
        if (z) {
            return;
        }
        writer.append('T');
        writeDigits(writer, hour(j));
        writeDigits(writer, minute(j));
        writeDigits(writer, second(j));
    }

    private static void writeDigits(Writer writer, int i) throws IOException {
        writer.write(((i / MINUTE_POS) % MINUTE_POS) + 48);
        writer.write((i % MINUTE_POS) + 48);
    }
}
