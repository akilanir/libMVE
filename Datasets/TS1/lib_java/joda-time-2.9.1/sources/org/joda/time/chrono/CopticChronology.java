package org.joda.time.chrono;

import java.util.concurrent.ConcurrentHashMap;
import org.joda.time.Chronology;
import org.joda.time.DateTime;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeZone;
import org.joda.time.chrono.AssembledChronology;
import org.joda.time.field.SkipDateTimeField;

/* loaded from: joda-time-2.9.1.jar:org/joda/time/chrono/CopticChronology.class */
public final class CopticChronology extends BasicFixedMonthChronology {
    private static final long serialVersionUID = -5972804258688333942L;
    public static final int AM = 1;
    private static final int MIN_YEAR = -292269337;
    private static final int MAX_YEAR = 292272708;
    private static final DateTimeField ERA_FIELD = new BasicSingleEraDateTimeField("AM");
    private static final ConcurrentHashMap<DateTimeZone, CopticChronology[]> cCache = new ConcurrentHashMap<>();
    private static final CopticChronology INSTANCE_UTC = getInstance(DateTimeZone.UTC);

    public static CopticChronology getInstanceUTC() {
        return INSTANCE_UTC;
    }

    public static CopticChronology getInstance() {
        return getInstance(DateTimeZone.getDefault(), 4);
    }

    public static CopticChronology getInstance(DateTimeZone dateTimeZone) {
        return getInstance(dateTimeZone, 4);
    }

    public static CopticChronology getInstance(DateTimeZone dateTimeZone, int i) {
        if (dateTimeZone == null) {
            dateTimeZone = DateTimeZone.getDefault();
        }
        CopticChronology[] copticChronologyArr = cCache.get(dateTimeZone);
        if (copticChronologyArr == null) {
            copticChronologyArr = new CopticChronology[7];
            CopticChronology[] putIfAbsent = cCache.putIfAbsent(dateTimeZone, copticChronologyArr);
            if (putIfAbsent != null) {
                copticChronologyArr = putIfAbsent;
            }
        }
        try {
            CopticChronology copticChronology = copticChronologyArr[i - 1];
            if (copticChronology == null) {
                synchronized (copticChronologyArr) {
                    copticChronology = copticChronologyArr[i - 1];
                    if (copticChronology == null) {
                        if (dateTimeZone == DateTimeZone.UTC) {
                            CopticChronology copticChronology2 = new CopticChronology(null, null, i);
                            copticChronology = new CopticChronology(LimitChronology.getInstance(copticChronology2, new DateTime(1, 1, 1, 0, 0, 0, 0, copticChronology2), null), null, i);
                        } else {
                            copticChronology = new CopticChronology(ZonedChronology.getInstance(getInstance(DateTimeZone.UTC, i), dateTimeZone), null, i);
                        }
                        copticChronologyArr[i - 1] = copticChronology;
                    }
                }
            }
            return copticChronology;
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new IllegalArgumentException("Invalid min days in first week: " + i);
        }
    }

    CopticChronology(Chronology chronology, Object obj, int i) {
        super(chronology, obj, i);
    }

    private Object readResolve() {
        Chronology base = getBase();
        int minimumDaysInFirstWeek = getMinimumDaysInFirstWeek();
        int i = minimumDaysInFirstWeek == 0 ? 4 : minimumDaysInFirstWeek;
        return base == null ? getInstance(DateTimeZone.UTC, i) : getInstance(base.getZone(), i);
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public Chronology withUTC() {
        return INSTANCE_UTC;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public Chronology withZone(DateTimeZone dateTimeZone) {
        if (dateTimeZone == null) {
            dateTimeZone = DateTimeZone.getDefault();
        }
        if (dateTimeZone == getZone()) {
            return this;
        }
        return getInstance(dateTimeZone);
    }

    @Override // org.joda.time.chrono.BasicChronology
    boolean isLeapDay(long j) {
        return dayOfMonth().get(j) == 6 && monthOfYear().isLeap(j);
    }

    @Override // org.joda.time.chrono.BasicChronology
    long calculateFirstDayOfYearMillis(int i) {
        int i2;
        int i3 = i - 1687;
        if (i3 <= 0) {
            i2 = (i3 + 3) >> 2;
        } else {
            i2 = i3 >> 2;
            if (!isLeapYear(i)) {
                i2++;
            }
        }
        return (((i3 * 365) + i2) * 86400000) + 21859200000L;
    }

    @Override // org.joda.time.chrono.BasicChronology
    int getMinYear() {
        return MIN_YEAR;
    }

    @Override // org.joda.time.chrono.BasicChronology
    int getMaxYear() {
        return MAX_YEAR;
    }

    @Override // org.joda.time.chrono.BasicChronology
    long getApproxMillisAtEpochDividedByTwo() {
        return 26607895200000L;
    }

    @Override // org.joda.time.chrono.BasicChronology, org.joda.time.chrono.AssembledChronology
    protected void assemble(AssembledChronology.Fields fields) {
        if (getBase() == null) {
            super.assemble(fields);
            fields.year = new SkipDateTimeField(this, fields.year);
            fields.weekyear = new SkipDateTimeField(this, fields.weekyear);
            fields.era = ERA_FIELD;
            fields.monthOfYear = new BasicMonthOfYearDateTimeField(this, 13);
            fields.months = fields.monthOfYear.getDurationField();
        }
    }
}
