package org.joda.time.chrono;

import java.io.IOException;
import java.io.ObjectInputStream;
import org.joda.time.Chronology;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeZone;
import org.joda.time.DurationField;

/* loaded from: joda-time-2.9.1.jar:org/joda/time/chrono/AssembledChronology.class */
public abstract class AssembledChronology extends BaseChronology {
    private static final long serialVersionUID = -6728465968995518215L;
    private final Chronology iBase;
    private final Object iParam;
    private transient DurationField iMillis;
    private transient DurationField iSeconds;
    private transient DurationField iMinutes;
    private transient DurationField iHours;
    private transient DurationField iHalfdays;
    private transient DurationField iDays;
    private transient DurationField iWeeks;
    private transient DurationField iWeekyears;
    private transient DurationField iMonths;
    private transient DurationField iYears;
    private transient DurationField iCenturies;
    private transient DurationField iEras;
    private transient DateTimeField iMillisOfSecond;
    private transient DateTimeField iMillisOfDay;
    private transient DateTimeField iSecondOfMinute;
    private transient DateTimeField iSecondOfDay;
    private transient DateTimeField iMinuteOfHour;
    private transient DateTimeField iMinuteOfDay;
    private transient DateTimeField iHourOfDay;
    private transient DateTimeField iClockhourOfDay;
    private transient DateTimeField iHourOfHalfday;
    private transient DateTimeField iClockhourOfHalfday;
    private transient DateTimeField iHalfdayOfDay;
    private transient DateTimeField iDayOfWeek;
    private transient DateTimeField iDayOfMonth;
    private transient DateTimeField iDayOfYear;
    private transient DateTimeField iWeekOfWeekyear;
    private transient DateTimeField iWeekyear;
    private transient DateTimeField iWeekyearOfCentury;
    private transient DateTimeField iMonthOfYear;
    private transient DateTimeField iYear;
    private transient DateTimeField iYearOfEra;
    private transient DateTimeField iYearOfCentury;
    private transient DateTimeField iCenturyOfEra;
    private transient DateTimeField iEra;
    private transient int iBaseFlags;

    protected abstract void assemble(Fields fields);

    protected AssembledChronology(Chronology chronology, Object obj) {
        this.iBase = chronology;
        this.iParam = obj;
        setFields();
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public DateTimeZone getZone() {
        Chronology chronology = this.iBase;
        if (chronology != null) {
            return chronology.getZone();
        }
        return null;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public long getDateTimeMillis(int i, int i2, int i3, int i4) throws IllegalArgumentException {
        Chronology chronology = this.iBase;
        if (chronology != null && (this.iBaseFlags & 6) == 6) {
            return chronology.getDateTimeMillis(i, i2, i3, i4);
        }
        return super.getDateTimeMillis(i, i2, i3, i4);
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public long getDateTimeMillis(int i, int i2, int i3, int i4, int i5, int i6, int i7) throws IllegalArgumentException {
        Chronology chronology = this.iBase;
        if (chronology != null && (this.iBaseFlags & 5) == 5) {
            return chronology.getDateTimeMillis(i, i2, i3, i4, i5, i6, i7);
        }
        return super.getDateTimeMillis(i, i2, i3, i4, i5, i6, i7);
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public long getDateTimeMillis(long j, int i, int i2, int i3, int i4) throws IllegalArgumentException {
        Chronology chronology = this.iBase;
        if (chronology != null && (this.iBaseFlags & 1) == 1) {
            return chronology.getDateTimeMillis(j, i, i2, i3, i4);
        }
        return super.getDateTimeMillis(j, i, i2, i3, i4);
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DurationField millis() {
        return this.iMillis;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField millisOfSecond() {
        return this.iMillisOfSecond;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField millisOfDay() {
        return this.iMillisOfDay;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DurationField seconds() {
        return this.iSeconds;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField secondOfMinute() {
        return this.iSecondOfMinute;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField secondOfDay() {
        return this.iSecondOfDay;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DurationField minutes() {
        return this.iMinutes;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField minuteOfHour() {
        return this.iMinuteOfHour;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField minuteOfDay() {
        return this.iMinuteOfDay;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DurationField hours() {
        return this.iHours;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField hourOfDay() {
        return this.iHourOfDay;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField clockhourOfDay() {
        return this.iClockhourOfDay;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DurationField halfdays() {
        return this.iHalfdays;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField hourOfHalfday() {
        return this.iHourOfHalfday;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField clockhourOfHalfday() {
        return this.iClockhourOfHalfday;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField halfdayOfDay() {
        return this.iHalfdayOfDay;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DurationField days() {
        return this.iDays;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField dayOfWeek() {
        return this.iDayOfWeek;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField dayOfMonth() {
        return this.iDayOfMonth;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField dayOfYear() {
        return this.iDayOfYear;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DurationField weeks() {
        return this.iWeeks;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField weekOfWeekyear() {
        return this.iWeekOfWeekyear;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DurationField weekyears() {
        return this.iWeekyears;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField weekyear() {
        return this.iWeekyear;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField weekyearOfCentury() {
        return this.iWeekyearOfCentury;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DurationField months() {
        return this.iMonths;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField monthOfYear() {
        return this.iMonthOfYear;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DurationField years() {
        return this.iYears;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField year() {
        return this.iYear;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField yearOfEra() {
        return this.iYearOfEra;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField yearOfCentury() {
        return this.iYearOfCentury;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DurationField centuries() {
        return this.iCenturies;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField centuryOfEra() {
        return this.iCenturyOfEra;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DurationField eras() {
        return this.iEras;
    }

    @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
    public final DateTimeField era() {
        return this.iEra;
    }

    protected final Chronology getBase() {
        return this.iBase;
    }

    protected final Object getParam() {
        return this.iParam;
    }

    private void setFields() {
        int i;
        Fields fields = new Fields();
        if (this.iBase != null) {
            fields.copyFieldsFrom(this.iBase);
        }
        assemble(fields);
        DurationField durationField = fields.millis;
        this.iMillis = durationField != null ? durationField : super.millis();
        DurationField durationField2 = fields.seconds;
        this.iSeconds = durationField2 != null ? durationField2 : super.seconds();
        DurationField durationField3 = fields.minutes;
        this.iMinutes = durationField3 != null ? durationField3 : super.minutes();
        DurationField durationField4 = fields.hours;
        this.iHours = durationField4 != null ? durationField4 : super.hours();
        DurationField durationField5 = fields.halfdays;
        this.iHalfdays = durationField5 != null ? durationField5 : super.halfdays();
        DurationField durationField6 = fields.days;
        this.iDays = durationField6 != null ? durationField6 : super.days();
        DurationField durationField7 = fields.weeks;
        this.iWeeks = durationField7 != null ? durationField7 : super.weeks();
        DurationField durationField8 = fields.weekyears;
        this.iWeekyears = durationField8 != null ? durationField8 : super.weekyears();
        DurationField durationField9 = fields.months;
        this.iMonths = durationField9 != null ? durationField9 : super.months();
        DurationField durationField10 = fields.years;
        this.iYears = durationField10 != null ? durationField10 : super.years();
        DurationField durationField11 = fields.centuries;
        this.iCenturies = durationField11 != null ? durationField11 : super.centuries();
        DurationField durationField12 = fields.eras;
        this.iEras = durationField12 != null ? durationField12 : super.eras();
        DateTimeField dateTimeField = fields.millisOfSecond;
        this.iMillisOfSecond = dateTimeField != null ? dateTimeField : super.millisOfSecond();
        DateTimeField dateTimeField2 = fields.millisOfDay;
        this.iMillisOfDay = dateTimeField2 != null ? dateTimeField2 : super.millisOfDay();
        DateTimeField dateTimeField3 = fields.secondOfMinute;
        this.iSecondOfMinute = dateTimeField3 != null ? dateTimeField3 : super.secondOfMinute();
        DateTimeField dateTimeField4 = fields.secondOfDay;
        this.iSecondOfDay = dateTimeField4 != null ? dateTimeField4 : super.secondOfDay();
        DateTimeField dateTimeField5 = fields.minuteOfHour;
        this.iMinuteOfHour = dateTimeField5 != null ? dateTimeField5 : super.minuteOfHour();
        DateTimeField dateTimeField6 = fields.minuteOfDay;
        this.iMinuteOfDay = dateTimeField6 != null ? dateTimeField6 : super.minuteOfDay();
        DateTimeField dateTimeField7 = fields.hourOfDay;
        this.iHourOfDay = dateTimeField7 != null ? dateTimeField7 : super.hourOfDay();
        DateTimeField dateTimeField8 = fields.clockhourOfDay;
        this.iClockhourOfDay = dateTimeField8 != null ? dateTimeField8 : super.clockhourOfDay();
        DateTimeField dateTimeField9 = fields.hourOfHalfday;
        this.iHourOfHalfday = dateTimeField9 != null ? dateTimeField9 : super.hourOfHalfday();
        DateTimeField dateTimeField10 = fields.clockhourOfHalfday;
        this.iClockhourOfHalfday = dateTimeField10 != null ? dateTimeField10 : super.clockhourOfHalfday();
        DateTimeField dateTimeField11 = fields.halfdayOfDay;
        this.iHalfdayOfDay = dateTimeField11 != null ? dateTimeField11 : super.halfdayOfDay();
        DateTimeField dateTimeField12 = fields.dayOfWeek;
        this.iDayOfWeek = dateTimeField12 != null ? dateTimeField12 : super.dayOfWeek();
        DateTimeField dateTimeField13 = fields.dayOfMonth;
        this.iDayOfMonth = dateTimeField13 != null ? dateTimeField13 : super.dayOfMonth();
        DateTimeField dateTimeField14 = fields.dayOfYear;
        this.iDayOfYear = dateTimeField14 != null ? dateTimeField14 : super.dayOfYear();
        DateTimeField dateTimeField15 = fields.weekOfWeekyear;
        this.iWeekOfWeekyear = dateTimeField15 != null ? dateTimeField15 : super.weekOfWeekyear();
        DateTimeField dateTimeField16 = fields.weekyear;
        this.iWeekyear = dateTimeField16 != null ? dateTimeField16 : super.weekyear();
        DateTimeField dateTimeField17 = fields.weekyearOfCentury;
        this.iWeekyearOfCentury = dateTimeField17 != null ? dateTimeField17 : super.weekyearOfCentury();
        DateTimeField dateTimeField18 = fields.monthOfYear;
        this.iMonthOfYear = dateTimeField18 != null ? dateTimeField18 : super.monthOfYear();
        DateTimeField dateTimeField19 = fields.year;
        this.iYear = dateTimeField19 != null ? dateTimeField19 : super.year();
        DateTimeField dateTimeField20 = fields.yearOfEra;
        this.iYearOfEra = dateTimeField20 != null ? dateTimeField20 : super.yearOfEra();
        DateTimeField dateTimeField21 = fields.yearOfCentury;
        this.iYearOfCentury = dateTimeField21 != null ? dateTimeField21 : super.yearOfCentury();
        DateTimeField dateTimeField22 = fields.centuryOfEra;
        this.iCenturyOfEra = dateTimeField22 != null ? dateTimeField22 : super.centuryOfEra();
        DateTimeField dateTimeField23 = fields.era;
        this.iEra = dateTimeField23 != null ? dateTimeField23 : super.era();
        if (this.iBase == null) {
            i = 0;
        } else {
            i = ((this.iHourOfDay == this.iBase.hourOfDay() && this.iMinuteOfHour == this.iBase.minuteOfHour() && this.iSecondOfMinute == this.iBase.secondOfMinute() && this.iMillisOfSecond == this.iBase.millisOfSecond()) ? 1 : 0) | (this.iMillisOfDay == this.iBase.millisOfDay() ? 2 : 0) | ((this.iYear == this.iBase.year() && this.iMonthOfYear == this.iBase.monthOfYear() && this.iDayOfMonth == this.iBase.dayOfMonth()) ? 4 : 0);
        }
        this.iBaseFlags = i;
    }

    private void readObject(ObjectInputStream objectInputStream) throws IOException, ClassNotFoundException {
        objectInputStream.defaultReadObject();
        setFields();
    }

    /* loaded from: joda-time-2.9.1.jar:org/joda/time/chrono/AssembledChronology$Fields.class */
    public static final class Fields {
        public DurationField millis;
        public DurationField seconds;
        public DurationField minutes;
        public DurationField hours;
        public DurationField halfdays;
        public DurationField days;
        public DurationField weeks;
        public DurationField weekyears;
        public DurationField months;
        public DurationField years;
        public DurationField centuries;
        public DurationField eras;
        public DateTimeField millisOfSecond;
        public DateTimeField millisOfDay;
        public DateTimeField secondOfMinute;
        public DateTimeField secondOfDay;
        public DateTimeField minuteOfHour;
        public DateTimeField minuteOfDay;
        public DateTimeField hourOfDay;
        public DateTimeField clockhourOfDay;
        public DateTimeField hourOfHalfday;
        public DateTimeField clockhourOfHalfday;
        public DateTimeField halfdayOfDay;
        public DateTimeField dayOfWeek;
        public DateTimeField dayOfMonth;
        public DateTimeField dayOfYear;
        public DateTimeField weekOfWeekyear;
        public DateTimeField weekyear;
        public DateTimeField weekyearOfCentury;
        public DateTimeField monthOfYear;
        public DateTimeField year;
        public DateTimeField yearOfEra;
        public DateTimeField yearOfCentury;
        public DateTimeField centuryOfEra;
        public DateTimeField era;

        Fields() {
        }

        public void copyFieldsFrom(Chronology chronology) {
            DurationField millis = chronology.millis();
            if (isSupported(millis)) {
                this.millis = millis;
            }
            DurationField seconds = chronology.seconds();
            if (isSupported(seconds)) {
                this.seconds = seconds;
            }
            DurationField minutes = chronology.minutes();
            if (isSupported(minutes)) {
                this.minutes = minutes;
            }
            DurationField hours = chronology.hours();
            if (isSupported(hours)) {
                this.hours = hours;
            }
            DurationField halfdays = chronology.halfdays();
            if (isSupported(halfdays)) {
                this.halfdays = halfdays;
            }
            DurationField days = chronology.days();
            if (isSupported(days)) {
                this.days = days;
            }
            DurationField weeks = chronology.weeks();
            if (isSupported(weeks)) {
                this.weeks = weeks;
            }
            DurationField weekyears = chronology.weekyears();
            if (isSupported(weekyears)) {
                this.weekyears = weekyears;
            }
            DurationField months = chronology.months();
            if (isSupported(months)) {
                this.months = months;
            }
            DurationField years = chronology.years();
            if (isSupported(years)) {
                this.years = years;
            }
            DurationField centuries = chronology.centuries();
            if (isSupported(centuries)) {
                this.centuries = centuries;
            }
            DurationField eras = chronology.eras();
            if (isSupported(eras)) {
                this.eras = eras;
            }
            DateTimeField millisOfSecond = chronology.millisOfSecond();
            if (isSupported(millisOfSecond)) {
                this.millisOfSecond = millisOfSecond;
            }
            DateTimeField millisOfDay = chronology.millisOfDay();
            if (isSupported(millisOfDay)) {
                this.millisOfDay = millisOfDay;
            }
            DateTimeField secondOfMinute = chronology.secondOfMinute();
            if (isSupported(secondOfMinute)) {
                this.secondOfMinute = secondOfMinute;
            }
            DateTimeField secondOfDay = chronology.secondOfDay();
            if (isSupported(secondOfDay)) {
                this.secondOfDay = secondOfDay;
            }
            DateTimeField minuteOfHour = chronology.minuteOfHour();
            if (isSupported(minuteOfHour)) {
                this.minuteOfHour = minuteOfHour;
            }
            DateTimeField minuteOfDay = chronology.minuteOfDay();
            if (isSupported(minuteOfDay)) {
                this.minuteOfDay = minuteOfDay;
            }
            DateTimeField hourOfDay = chronology.hourOfDay();
            if (isSupported(hourOfDay)) {
                this.hourOfDay = hourOfDay;
            }
            DateTimeField clockhourOfDay = chronology.clockhourOfDay();
            if (isSupported(clockhourOfDay)) {
                this.clockhourOfDay = clockhourOfDay;
            }
            DateTimeField hourOfHalfday = chronology.hourOfHalfday();
            if (isSupported(hourOfHalfday)) {
                this.hourOfHalfday = hourOfHalfday;
            }
            DateTimeField clockhourOfHalfday = chronology.clockhourOfHalfday();
            if (isSupported(clockhourOfHalfday)) {
                this.clockhourOfHalfday = clockhourOfHalfday;
            }
            DateTimeField halfdayOfDay = chronology.halfdayOfDay();
            if (isSupported(halfdayOfDay)) {
                this.halfdayOfDay = halfdayOfDay;
            }
            DateTimeField dayOfWeek = chronology.dayOfWeek();
            if (isSupported(dayOfWeek)) {
                this.dayOfWeek = dayOfWeek;
            }
            DateTimeField dayOfMonth = chronology.dayOfMonth();
            if (isSupported(dayOfMonth)) {
                this.dayOfMonth = dayOfMonth;
            }
            DateTimeField dayOfYear = chronology.dayOfYear();
            if (isSupported(dayOfYear)) {
                this.dayOfYear = dayOfYear;
            }
            DateTimeField weekOfWeekyear = chronology.weekOfWeekyear();
            if (isSupported(weekOfWeekyear)) {
                this.weekOfWeekyear = weekOfWeekyear;
            }
            DateTimeField weekyear = chronology.weekyear();
            if (isSupported(weekyear)) {
                this.weekyear = weekyear;
            }
            DateTimeField weekyearOfCentury = chronology.weekyearOfCentury();
            if (isSupported(weekyearOfCentury)) {
                this.weekyearOfCentury = weekyearOfCentury;
            }
            DateTimeField monthOfYear = chronology.monthOfYear();
            if (isSupported(monthOfYear)) {
                this.monthOfYear = monthOfYear;
            }
            DateTimeField year = chronology.year();
            if (isSupported(year)) {
                this.year = year;
            }
            DateTimeField yearOfEra = chronology.yearOfEra();
            if (isSupported(yearOfEra)) {
                this.yearOfEra = yearOfEra;
            }
            DateTimeField yearOfCentury = chronology.yearOfCentury();
            if (isSupported(yearOfCentury)) {
                this.yearOfCentury = yearOfCentury;
            }
            DateTimeField centuryOfEra = chronology.centuryOfEra();
            if (isSupported(centuryOfEra)) {
                this.centuryOfEra = centuryOfEra;
            }
            DateTimeField era = chronology.era();
            if (isSupported(era)) {
                this.era = era;
            }
        }

        private static boolean isSupported(DurationField durationField) {
            if (durationField == null) {
                return false;
            }
            return durationField.isSupported();
        }

        private static boolean isSupported(DateTimeField dateTimeField) {
            if (dateTimeField == null) {
                return false;
            }
            return dateTimeField.isSupported();
        }
    }
}
