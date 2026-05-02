package org.joda.time.chrono;

import java.util.concurrent.ConcurrentHashMap;
import org.joda.time.Chronology;
import org.joda.time.DateTime;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeZone;
import org.joda.time.chrono.AssembledChronology;
import org.joda.time.field.SkipDateTimeField;

/* loaded from: joda-time-2.6.jar:org/joda/time/chrono/EthiopicChronology.class */
public final class EthiopicChronology extends BasicFixedMonthChronology {
    private static final long serialVersionUID = -5972804258688333942L;
    public static final int EE = 1;
    private static final int MIN_YEAR = -292269337;
    private static final int MAX_YEAR = 292272984;
    private static final DateTimeField ERA_FIELD = new BasicSingleEraDateTimeField("EE");
    private static final ConcurrentHashMap<DateTimeZone, EthiopicChronology[]> cCache = new ConcurrentHashMap<>();
    private static final EthiopicChronology INSTANCE_UTC = getInstance(DateTimeZone.UTC);

    public static EthiopicChronology getInstanceUTC() {
        return INSTANCE_UTC;
    }

    public static EthiopicChronology getInstance() {
        return getInstance(DateTimeZone.getDefault(), 4);
    }

    public static EthiopicChronology getInstance(DateTimeZone dateTimeZone) {
        return getInstance(dateTimeZone, 4);
    }

    public static EthiopicChronology getInstance(DateTimeZone dateTimeZone, int i) {
        if (dateTimeZone == null) {
            dateTimeZone = DateTimeZone.getDefault();
        }
        EthiopicChronology[] ethiopicChronologyArr = cCache.get(dateTimeZone);
        if (ethiopicChronologyArr == null) {
            ethiopicChronologyArr = new EthiopicChronology[7];
            EthiopicChronology[] putIfAbsent = cCache.putIfAbsent(dateTimeZone, ethiopicChronologyArr);
            if (putIfAbsent != null) {
                ethiopicChronologyArr = putIfAbsent;
            }
        }
        try {
            EthiopicChronology ethiopicChronology = ethiopicChronologyArr[i - 1];
            if (ethiopicChronology == null) {
                synchronized (ethiopicChronologyArr) {
                    ethiopicChronology = ethiopicChronologyArr[i - 1];
                    if (ethiopicChronology == null) {
                        if (dateTimeZone == DateTimeZone.UTC) {
                            EthiopicChronology ethiopicChronology2 = new EthiopicChronology(null, null, i);
                            ethiopicChronology = new EthiopicChronology(LimitChronology.getInstance(ethiopicChronology2, new DateTime(1, 1, 1, 0, 0, 0, 0, ethiopicChronology2), null), null, i);
                        } else {
                            ethiopicChronology = new EthiopicChronology(ZonedChronology.getInstance(getInstance(DateTimeZone.UTC, i), dateTimeZone), null, i);
                        }
                        ethiopicChronologyArr[i - 1] = ethiopicChronology;
                    }
                }
            }
            return ethiopicChronology;
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new IllegalArgumentException("Invalid min days in first week: " + i);
        }
    }

    EthiopicChronology(Chronology chronology, Object obj, int i) {
        super(chronology, obj, i);
    }

    private Object readResolve() {
        Chronology base = getBase();
        return base == null ? getInstance(DateTimeZone.UTC, getMinimumDaysInFirstWeek()) : getInstance(base.getZone(), getMinimumDaysInFirstWeek());
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
        int i3 = i - 1963;
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
        return 30962844000000L;
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
