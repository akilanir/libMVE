package org.joda.time.field;

import java.util.Locale;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DurationField;
import org.joda.time.IllegalFieldValueException;
import org.joda.time.ReadablePartial;

/* loaded from: joda-time-2.6.jar:org/joda/time/field/BaseDateTimeField.class */
public abstract class BaseDateTimeField extends DateTimeField {
    private final DateTimeFieldType iType;

    @Override // org.joda.time.DateTimeField
    public abstract int get(long j);

    @Override // org.joda.time.DateTimeField
    public abstract long set(long j, int i);

    @Override // org.joda.time.DateTimeField
    public abstract DurationField getDurationField();

    @Override // org.joda.time.DateTimeField
    public abstract DurationField getRangeDurationField();

    @Override // org.joda.time.DateTimeField
    public abstract int getMinimumValue();

    @Override // org.joda.time.DateTimeField
    public abstract int getMaximumValue();

    @Override // org.joda.time.DateTimeField
    public abstract long roundFloor(long j);

    protected BaseDateTimeField(DateTimeFieldType dateTimeFieldType) {
        if (dateTimeFieldType == null) {
            throw new IllegalArgumentException("The type must not be null");
        }
        this.iType = dateTimeFieldType;
    }

    @Override // org.joda.time.DateTimeField
    public final DateTimeFieldType getType() {
        return this.iType;
    }

    @Override // org.joda.time.DateTimeField
    public final String getName() {
        return this.iType.getName();
    }

    @Override // org.joda.time.DateTimeField
    public final boolean isSupported() {
        return true;
    }

    @Override // org.joda.time.DateTimeField
    public String getAsText(long j, Locale locale) {
        return getAsText(get(j), locale);
    }

    @Override // org.joda.time.DateTimeField
    public final String getAsText(long j) {
        return getAsText(j, (Locale) null);
    }

    @Override // org.joda.time.DateTimeField
    public String getAsText(ReadablePartial readablePartial, int i, Locale locale) {
        return getAsText(i, locale);
    }

    @Override // org.joda.time.DateTimeField
    public final String getAsText(ReadablePartial readablePartial, Locale locale) {
        return getAsText(readablePartial, readablePartial.get(getType()), locale);
    }

    @Override // org.joda.time.DateTimeField
    public String getAsText(int i, Locale locale) {
        return Integer.toString(i);
    }

    @Override // org.joda.time.DateTimeField
    public String getAsShortText(long j, Locale locale) {
        return getAsShortText(get(j), locale);
    }

    @Override // org.joda.time.DateTimeField
    public final String getAsShortText(long j) {
        return getAsShortText(j, (Locale) null);
    }

    @Override // org.joda.time.DateTimeField
    public String getAsShortText(ReadablePartial readablePartial, int i, Locale locale) {
        return getAsShortText(i, locale);
    }

    @Override // org.joda.time.DateTimeField
    public final String getAsShortText(ReadablePartial readablePartial, Locale locale) {
        return getAsShortText(readablePartial, readablePartial.get(getType()), locale);
    }

    @Override // org.joda.time.DateTimeField
    public String getAsShortText(int i, Locale locale) {
        return getAsText(i, locale);
    }

    @Override // org.joda.time.DateTimeField
    public long add(long j, int i) {
        return getDurationField().add(j, i);
    }

    @Override // org.joda.time.DateTimeField
    public long add(long j, long j2) {
        return getDurationField().add(j, j2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x0093, code lost:
    
        if (r11 >= 0) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0096, code lost:
    
        r0 = getMinimumValue(r8, r10);
        r0 = r10[r9] + r11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x00ad, code lost:
    
        if (r0 < r0) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x00b0, code lost:
    
        r10[r9] = (int) r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x00bb, code lost:
    
        if (r12 != null) goto L51;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x00bf, code lost:
    
        if (r9 != 0) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x00cb, code lost:
    
        throw new java.lang.IllegalArgumentException("Maximum value exceeded for add");
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x00cc, code lost:
    
        r12 = r8.getField(r9 - 1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x00e6, code lost:
    
        if (getRangeDurationField().getType() == r12.getDurationField().getType()) goto L52;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x00f2, code lost:
    
        throw new java.lang.IllegalArgumentException("Fields invalid for add");
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x00f3, code lost:
    
        r11 = r11 - ((r0 - 1) - r10[r9]);
        r10 = r12.add(r8, r9 - 1, r10, -1);
        r10[r9] = getMaximumValue(r8, r10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0122, code lost:
    
        return set(r8, r9, r10, r10[r9]);
     */
    @Override // org.joda.time.DateTimeField
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public int[] add(org.joda.time.ReadablePartial r8, int r9, int[] r10, int r11) {
        /*
            Method dump skipped, instructions count: 291
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.joda.time.field.BaseDateTimeField.add(org.joda.time.ReadablePartial, int, int[], int):int[]");
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x00a2, code lost:
    
        if (r11 >= 0) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x00a5, code lost:
    
        r0 = getMinimumValue(r8, r10);
        r0 = r10[r9] + r11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x00bc, code lost:
    
        if (r0 < r0) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x00bf, code lost:
    
        r10[r9] = (int) r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x00ca, code lost:
    
        if (r12 != null) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x00ce, code lost:
    
        if (r9 != 0) goto L51;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x00d1, code lost:
    
        r11 = r11 - ((r0 - 1) - r10[r9]);
        r10[r9] = getMaximumValue(r8, r10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00ea, code lost:
    
        r12 = r8.getField(r9 - 1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0104, code lost:
    
        if (getRangeDurationField().getType() == r12.getDurationField().getType()) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x0110, code lost:
    
        throw new java.lang.IllegalArgumentException("Fields invalid for add");
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x0111, code lost:
    
        r11 = r11 - ((r0 - 1) - r10[r9]);
        r10 = r12.addWrapPartial(r8, r9 - 1, r10, -1);
        r10[r9] = getMaximumValue(r8, r10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0140, code lost:
    
        return set(r8, r9, r10, r10[r9]);
     */
    @Override // org.joda.time.DateTimeField
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public int[] addWrapPartial(org.joda.time.ReadablePartial r8, int r9, int[] r10, int r11) {
        /*
            Method dump skipped, instructions count: 321
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.joda.time.field.BaseDateTimeField.addWrapPartial(org.joda.time.ReadablePartial, int, int[], int):int[]");
    }

    @Override // org.joda.time.DateTimeField
    public long addWrapField(long j, int i) {
        return set(j, FieldUtils.getWrappedValue(get(j), i, getMinimumValue(j), getMaximumValue(j)));
    }

    @Override // org.joda.time.DateTimeField
    public int[] addWrapField(ReadablePartial readablePartial, int i, int[] iArr, int i2) {
        return set(readablePartial, i, iArr, FieldUtils.getWrappedValue(iArr[i], i2, getMinimumValue(readablePartial), getMaximumValue(readablePartial)));
    }

    @Override // org.joda.time.DateTimeField
    public int getDifference(long j, long j2) {
        return getDurationField().getDifference(j, j2);
    }

    @Override // org.joda.time.DateTimeField
    public long getDifferenceAsLong(long j, long j2) {
        return getDurationField().getDifferenceAsLong(j, j2);
    }

    @Override // org.joda.time.DateTimeField
    public int[] set(ReadablePartial readablePartial, int i, int[] iArr, int i2) {
        FieldUtils.verifyValueBounds(this, i2, getMinimumValue(readablePartial, iArr), getMaximumValue(readablePartial, iArr));
        iArr[i] = i2;
        for (int i3 = i + 1; i3 < readablePartial.size(); i3++) {
            DateTimeField field = readablePartial.getField(i3);
            if (iArr[i3] > field.getMaximumValue(readablePartial, iArr)) {
                iArr[i3] = field.getMaximumValue(readablePartial, iArr);
            }
            if (iArr[i3] < field.getMinimumValue(readablePartial, iArr)) {
                iArr[i3] = field.getMinimumValue(readablePartial, iArr);
            }
        }
        return iArr;
    }

    @Override // org.joda.time.DateTimeField
    public long set(long j, String str, Locale locale) {
        return set(j, convertText(str, locale));
    }

    @Override // org.joda.time.DateTimeField
    public final long set(long j, String str) {
        return set(j, str, null);
    }

    @Override // org.joda.time.DateTimeField
    public int[] set(ReadablePartial readablePartial, int i, int[] iArr, String str, Locale locale) {
        return set(readablePartial, i, iArr, convertText(str, locale));
    }

    protected int convertText(String str, Locale locale) {
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException e) {
            throw new IllegalFieldValueException(getType(), str);
        }
    }

    @Override // org.joda.time.DateTimeField
    public boolean isLeap(long j) {
        return false;
    }

    @Override // org.joda.time.DateTimeField
    public int getLeapAmount(long j) {
        return 0;
    }

    @Override // org.joda.time.DateTimeField
    public DurationField getLeapDurationField() {
        return null;
    }

    @Override // org.joda.time.DateTimeField
    public int getMinimumValue(long j) {
        return getMinimumValue();
    }

    @Override // org.joda.time.DateTimeField
    public int getMinimumValue(ReadablePartial readablePartial) {
        return getMinimumValue();
    }

    @Override // org.joda.time.DateTimeField
    public int getMinimumValue(ReadablePartial readablePartial, int[] iArr) {
        return getMinimumValue(readablePartial);
    }

    @Override // org.joda.time.DateTimeField
    public int getMaximumValue(long j) {
        return getMaximumValue();
    }

    @Override // org.joda.time.DateTimeField
    public int getMaximumValue(ReadablePartial readablePartial) {
        return getMaximumValue();
    }

    @Override // org.joda.time.DateTimeField
    public int getMaximumValue(ReadablePartial readablePartial, int[] iArr) {
        return getMaximumValue(readablePartial);
    }

    @Override // org.joda.time.DateTimeField
    public int getMaximumTextLength(Locale locale) {
        int maximumValue = getMaximumValue();
        if (maximumValue >= 0) {
            if (maximumValue < 10) {
                return 1;
            }
            if (maximumValue < 100) {
                return 2;
            }
            if (maximumValue < 1000) {
                return 3;
            }
        }
        return Integer.toString(maximumValue).length();
    }

    @Override // org.joda.time.DateTimeField
    public int getMaximumShortTextLength(Locale locale) {
        return getMaximumTextLength(locale);
    }

    @Override // org.joda.time.DateTimeField
    public long roundCeiling(long j) {
        long roundFloor = roundFloor(j);
        if (roundFloor != j) {
            j = add(roundFloor, 1);
        }
        return j;
    }

    @Override // org.joda.time.DateTimeField
    public long roundHalfFloor(long j) {
        long roundFloor = roundFloor(j);
        long roundCeiling = roundCeiling(j);
        if (j - roundFloor <= roundCeiling - j) {
            return roundFloor;
        }
        return roundCeiling;
    }

    @Override // org.joda.time.DateTimeField
    public long roundHalfCeiling(long j) {
        long roundFloor = roundFloor(j);
        long roundCeiling = roundCeiling(j);
        if (roundCeiling - j <= j - roundFloor) {
            return roundCeiling;
        }
        return roundFloor;
    }

    @Override // org.joda.time.DateTimeField
    public long roundHalfEven(long j) {
        long roundFloor = roundFloor(j);
        long roundCeiling = roundCeiling(j);
        long j2 = j - roundFloor;
        long j3 = roundCeiling - j;
        if (j2 < j3) {
            return roundFloor;
        }
        if (j3 < j2) {
            return roundCeiling;
        }
        if ((get(roundCeiling) & 1) == 0) {
            return roundCeiling;
        }
        return roundFloor;
    }

    @Override // org.joda.time.DateTimeField
    public long remainder(long j) {
        return j - roundFloor(j);
    }

    @Override // org.joda.time.DateTimeField
    public String toString() {
        return "DateTimeField[" + getName() + ']';
    }
}
