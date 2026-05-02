package org.dmfs.rfc5545.calendarmetrics;

import java.util.TimeZone;
import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.Weekday;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;

/* loaded from: rfc5545-datetime-0.2.4.jar:org/dmfs/rfc5545/calendarmetrics/JulianCalendarMetrics.class */
public class JulianCalendarMetrics extends GregorianCalendarMetrics {
    public static final CalendarMetrics.CalendarMetricsFactory FACTORY = new CalendarMetrics.CalendarMetricsFactory() { // from class: org.dmfs.rfc5545.calendarmetrics.JulianCalendarMetrics.1
        @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics.CalendarMetricsFactory
        public CalendarMetrics getCalendarMetrics(Weekday weekday) {
            return new JulianCalendarMetrics(weekday, 4);
        }

        public String toString() {
            return JulianCalendarMetrics.CALENDAR_SCALE_ALIAS;
        }
    };
    public static final String CALENDAR_SCALE_ALIAS = "JULIAN";
    public static final String CALENDAR_SCALE_NAME = "JULIUS";
    private GregorianCalendarMetrics mGregorianCalendarMetrics;

    public JulianCalendarMetrics(Weekday weekday, int i) {
        super(weekday, i);
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getDayOfWeek(int i, int i2) {
        int i3 = i - 1;
        return (((i2 + 5) + i3) + (i3 >> 2)) % 7;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.GregorianCalendarMetrics
    boolean isLeapYear(int i) {
        return (i & 3) == 0;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.GregorianCalendarMetrics, org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public int getWeekDayOfFirstYearDay(int i) {
        int i2 = i - 1;
        return ((6 + i2) + (i2 >> 2)) % 7;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.GregorianCalendarMetrics, org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public long toMillis(TimeZone timeZone, int i, int i2, int i3, int i4, int i5, int i6, int i7) {
        int i8;
        if (i2 > 1) {
            int i9 = i / 100;
            i8 = i3 + ((i9 - (i9 >> 2)) - 2);
        } else {
            int i10 = (i - 1) / 100;
            i8 = i3 + ((i10 - (i10 >> 2)) - 2);
            if (i2 == 1 && i8 > 28 && i % 100 == 0 && i % 400 != 0) {
                i8++;
            }
        }
        GregorianCalendarMetrics gregorianCalendarMetrics = this.mGregorianCalendarMetrics;
        if (gregorianCalendarMetrics == null) {
            GregorianCalendarMetrics gregorianCalendarMetrics2 = new GregorianCalendarMetrics(this.weekStart, this.minDaysInFirstWeek);
            this.mGregorianCalendarMetrics = gregorianCalendarMetrics2;
            gregorianCalendarMetrics = gregorianCalendarMetrics2;
        }
        int daysPerPackedMonth = getDaysPerPackedMonth(i, i2);
        if (i8 > daysPerPackedMonth) {
            i8 -= daysPerPackedMonth;
            i2++;
            if (i2 > 11) {
                i2 = 0;
                i++;
            }
        } else if (i8 < 1) {
            i2--;
            if (i2 < 0) {
                i--;
                i2 = 11;
            }
            i8 += gregorianCalendarMetrics.getDaysPerPackedMonth(i, i2);
        }
        return gregorianCalendarMetrics.toMillis(timeZone, i, i2, i8, i4, i5, i6, i7);
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.GregorianCalendarMetrics
    long getTimeStamp(int i, int i2, int i3, int i4, int i5, int i6) {
        return ((((((((((((i - 1970) * 365) + i2) - 1) + numLeapDaysSince1970(i) + 13) * 24) + i3) * 60) + i4) * 60) + i5) * 1000) + i6;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.GregorianCalendarMetrics
    int numLeapDaysSince1970(int i) {
        return ((i - 1) >> 2) - 492;
    }

    @Override // org.dmfs.rfc5545.calendarmetrics.GregorianCalendarMetrics, org.dmfs.rfc5545.calendarmetrics.CalendarMetrics
    public long toInstance(long j, TimeZone timeZone) {
        long j2 = j;
        if (timeZone != null) {
            j2 += timeZone.getOffset(j);
        }
        int i = (int) (j2 % IslamicCalendarMetrics.MILLIS_PER_DAY);
        long j3 = j2 - i;
        if (i < 0) {
            i += 86400000;
            j3 -= IslamicCalendarMetrics.MILLIS_PER_DAY;
        }
        int i2 = (int) ((((j3 / IslamicCalendarMetrics.MILLIS_PER_DAY) + 718685) + 492) - 13);
        int i3 = i2 / 1461;
        int i4 = i2 - (i3 * 1461);
        int min = Math.min(i4 / 365, 3);
        int i5 = (i4 - (365 * min)) + 1;
        int i6 = (i3 << 2) + min + 1;
        int monthAndDayOfYearDay = getMonthAndDayOfYearDay(i6, i5);
        int i7 = i / 60000;
        return Instance.make(i6, packedMonth(monthAndDayOfYearDay), dayOfMonth(monthAndDayOfYearDay), i7 / 60, i7 % 60, (i / 1000) % 60);
    }
}
