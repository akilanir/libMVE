package org.joda.time.format;

import java.util.Arrays;
import java.util.Locale;
import org.joda.time.Chronology;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeFieldType;
import org.joda.time.DateTimeUtils;
import org.joda.time.DateTimeZone;
import org.joda.time.DurationField;
import org.joda.time.DurationFieldType;
import org.joda.time.IllegalFieldValueException;
import org.joda.time.IllegalInstantException;

/* loaded from: joda-time-2.6.jar:org/joda/time/format/DateTimeParserBucket.class */
public class DateTimeParserBucket {
    private final Chronology iChrono;
    private final long iMillis;
    private final Locale iLocale;
    private final int iDefaultYear;
    private final DateTimeZone iDefaultZone;
    private final Integer iDefaultPivotYear;
    private DateTimeZone iZone;
    private Integer iOffset;
    private Integer iPivotYear;
    private SavedField[] iSavedFields;
    private int iSavedFieldsCount;
    private boolean iSavedFieldsShared;
    private Object iSavedState;

    @Deprecated
    public DateTimeParserBucket(long j, Chronology chronology, Locale locale) {
        this(j, chronology, locale, null, 2000);
    }

    @Deprecated
    public DateTimeParserBucket(long j, Chronology chronology, Locale locale, Integer num) {
        this(j, chronology, locale, num, 2000);
    }

    public DateTimeParserBucket(long j, Chronology chronology, Locale locale, Integer num, int i) {
        Chronology chronology2 = DateTimeUtils.getChronology(chronology);
        this.iMillis = j;
        this.iDefaultZone = chronology2.getZone();
        this.iChrono = chronology2.withUTC();
        this.iLocale = locale == null ? Locale.getDefault() : locale;
        this.iDefaultYear = i;
        this.iDefaultPivotYear = num;
        this.iZone = this.iDefaultZone;
        this.iPivotYear = this.iDefaultPivotYear;
        this.iSavedFields = new SavedField[8];
    }

    public void reset() {
        this.iZone = this.iDefaultZone;
        this.iOffset = null;
        this.iPivotYear = this.iDefaultPivotYear;
        this.iSavedFieldsCount = 0;
        this.iSavedFieldsShared = false;
        this.iSavedState = null;
    }

    public long parseMillis(DateTimeParser dateTimeParser, CharSequence charSequence) {
        reset();
        return doParseMillis(DateTimeParserInternalParser.of(dateTimeParser), charSequence);
    }

    long doParseMillis(InternalParser internalParser, CharSequence charSequence) {
        int parseInto = internalParser.parseInto(this, charSequence, 0);
        if (parseInto >= 0) {
            if (parseInto >= charSequence.length()) {
                return computeMillis(true, charSequence);
            }
        } else {
            parseInto ^= -1;
        }
        throw new IllegalArgumentException(FormatUtils.createErrorMessage(charSequence.toString(), parseInto));
    }

    public Chronology getChronology() {
        return this.iChrono;
    }

    public Locale getLocale() {
        return this.iLocale;
    }

    public DateTimeZone getZone() {
        return this.iZone;
    }

    public void setZone(DateTimeZone dateTimeZone) {
        this.iSavedState = null;
        this.iZone = dateTimeZone;
    }

    @Deprecated
    public int getOffset() {
        if (this.iOffset != null) {
            return this.iOffset.intValue();
        }
        return 0;
    }

    public Integer getOffsetInteger() {
        return this.iOffset;
    }

    @Deprecated
    public void setOffset(int i) {
        this.iSavedState = null;
        this.iOffset = Integer.valueOf(i);
    }

    public void setOffset(Integer num) {
        this.iSavedState = null;
        this.iOffset = num;
    }

    public Integer getPivotYear() {
        return this.iPivotYear;
    }

    @Deprecated
    public void setPivotYear(Integer num) {
        this.iPivotYear = num;
    }

    public void saveField(DateTimeField dateTimeField, int i) {
        obtainSaveField().init(dateTimeField, i);
    }

    public void saveField(DateTimeFieldType dateTimeFieldType, int i) {
        obtainSaveField().init(dateTimeFieldType.getField(this.iChrono), i);
    }

    public void saveField(DateTimeFieldType dateTimeFieldType, String str, Locale locale) {
        obtainSaveField().init(dateTimeFieldType.getField(this.iChrono), str, locale);
    }

    private SavedField obtainSaveField() {
        SavedField[] savedFieldArr = this.iSavedFields;
        int i = this.iSavedFieldsCount;
        if (i == savedFieldArr.length || this.iSavedFieldsShared) {
            SavedField[] savedFieldArr2 = new SavedField[i == savedFieldArr.length ? i * 2 : savedFieldArr.length];
            System.arraycopy(savedFieldArr, 0, savedFieldArr2, 0, i);
            savedFieldArr = savedFieldArr2;
            this.iSavedFields = savedFieldArr2;
            this.iSavedFieldsShared = false;
        }
        this.iSavedState = null;
        SavedField savedField = savedFieldArr[i];
        if (savedField == null) {
            SavedField savedField2 = new SavedField();
            savedFieldArr[i] = savedField2;
            savedField = savedField2;
        }
        this.iSavedFieldsCount = i + 1;
        return savedField;
    }

    public Object saveState() {
        if (this.iSavedState == null) {
            this.iSavedState = new SavedState();
        }
        return this.iSavedState;
    }

    public boolean restoreState(Object obj) {
        if ((obj instanceof SavedState) && ((SavedState) obj).restoreState(this)) {
            this.iSavedState = obj;
            return true;
        }
        return false;
    }

    public long computeMillis() {
        return computeMillis(false, (CharSequence) null);
    }

    public long computeMillis(boolean z) {
        return computeMillis(z, (CharSequence) null);
    }

    public long computeMillis(boolean z, String str) {
        return computeMillis(z, (CharSequence) str);
    }

    public long computeMillis(boolean z, CharSequence charSequence) {
        SavedField[] savedFieldArr = this.iSavedFields;
        int i = this.iSavedFieldsCount;
        if (this.iSavedFieldsShared) {
            SavedField[] savedFieldArr2 = (SavedField[]) this.iSavedFields.clone();
            savedFieldArr = savedFieldArr2;
            this.iSavedFields = savedFieldArr2;
            this.iSavedFieldsShared = false;
        }
        sort(savedFieldArr, i);
        if (i > 0) {
            DurationField field = DurationFieldType.months().getField(this.iChrono);
            DurationField field2 = DurationFieldType.days().getField(this.iChrono);
            DurationField durationField = savedFieldArr[0].iField.getDurationField();
            if (compareReverse(durationField, field) >= 0 && compareReverse(durationField, field2) <= 0) {
                saveField(DateTimeFieldType.year(), this.iDefaultYear);
                return computeMillis(z, charSequence);
            }
        }
        long j = this.iMillis;
        for (int i2 = 0; i2 < i; i2++) {
            try {
                j = savedFieldArr[i2].set(j, z);
            } catch (IllegalFieldValueException e) {
                if (charSequence != null) {
                    e.prependMessage("Cannot parse \"" + ((Object) charSequence) + '\"');
                }
                throw e;
            }
        }
        if (z) {
            int i3 = 0;
            while (i3 < i) {
                j = savedFieldArr[i3].set(j, i3 == i - 1);
                i3++;
            }
        }
        if (this.iOffset != null) {
            j -= this.iOffset.intValue();
        } else if (this.iZone != null) {
            int offsetFromLocal = this.iZone.getOffsetFromLocal(j);
            j -= offsetFromLocal;
            if (offsetFromLocal != this.iZone.getOffset(j)) {
                String str = "Illegal instant due to time zone offset transition (" + this.iZone + ')';
                if (charSequence != null) {
                    str = "Cannot parse \"" + ((Object) charSequence) + "\": " + str;
                }
                throw new IllegalInstantException(str);
            }
        }
        return j;
    }

    private static void sort(SavedField[] savedFieldArr, int i) {
        if (i > 10) {
            Arrays.sort(savedFieldArr, 0, i);
            return;
        }
        for (int i2 = 0; i2 < i; i2++) {
            for (int i3 = i2; i3 > 0 && savedFieldArr[i3 - 1].compareTo(savedFieldArr[i3]) > 0; i3--) {
                SavedField savedField = savedFieldArr[i3];
                savedFieldArr[i3] = savedFieldArr[i3 - 1];
                savedFieldArr[i3 - 1] = savedField;
            }
        }
    }

    /* loaded from: joda-time-2.6.jar:org/joda/time/format/DateTimeParserBucket$SavedState.class */
    class SavedState {
        final DateTimeZone iZone;
        final Integer iOffset;
        final SavedField[] iSavedFields;
        final int iSavedFieldsCount;

        SavedState() {
            this.iZone = DateTimeParserBucket.this.iZone;
            this.iOffset = DateTimeParserBucket.this.iOffset;
            this.iSavedFields = DateTimeParserBucket.this.iSavedFields;
            this.iSavedFieldsCount = DateTimeParserBucket.this.iSavedFieldsCount;
        }

        boolean restoreState(DateTimeParserBucket dateTimeParserBucket) {
            if (dateTimeParserBucket == DateTimeParserBucket.this) {
                dateTimeParserBucket.iZone = this.iZone;
                dateTimeParserBucket.iOffset = this.iOffset;
                dateTimeParserBucket.iSavedFields = this.iSavedFields;
                if (this.iSavedFieldsCount < dateTimeParserBucket.iSavedFieldsCount) {
                    dateTimeParserBucket.iSavedFieldsShared = true;
                }
                dateTimeParserBucket.iSavedFieldsCount = this.iSavedFieldsCount;
                return true;
            }
            return false;
        }
    }

    /* loaded from: joda-time-2.6.jar:org/joda/time/format/DateTimeParserBucket$SavedField.class */
    static class SavedField implements Comparable<SavedField> {
        DateTimeField iField;
        int iValue;
        String iText;
        Locale iLocale;

        SavedField() {
        }

        void init(DateTimeField dateTimeField, int i) {
            this.iField = dateTimeField;
            this.iValue = i;
            this.iText = null;
            this.iLocale = null;
        }

        void init(DateTimeField dateTimeField, String str, Locale locale) {
            this.iField = dateTimeField;
            this.iValue = 0;
            this.iText = str;
            this.iLocale = locale;
        }

        long set(long j, boolean z) {
            long j2;
            if (this.iText == null) {
                j2 = this.iField.set(j, this.iValue);
            } else {
                j2 = this.iField.set(j, this.iText, this.iLocale);
            }
            if (z) {
                j2 = this.iField.roundFloor(j2);
            }
            return j2;
        }

        @Override // java.lang.Comparable
        public int compareTo(SavedField savedField) {
            DateTimeField dateTimeField = savedField.iField;
            int compareReverse = DateTimeParserBucket.compareReverse(this.iField.getRangeDurationField(), dateTimeField.getRangeDurationField());
            if (compareReverse != 0) {
                return compareReverse;
            }
            return DateTimeParserBucket.compareReverse(this.iField.getDurationField(), dateTimeField.getDurationField());
        }
    }

    static int compareReverse(DurationField durationField, DurationField durationField2) {
        if (durationField == null || !durationField.isSupported()) {
            if (durationField2 == null || !durationField2.isSupported()) {
                return 0;
            }
            return -1;
        }
        if (durationField2 == null || !durationField2.isSupported()) {
            return 1;
        }
        return -durationField.compareTo(durationField2);
    }
}
