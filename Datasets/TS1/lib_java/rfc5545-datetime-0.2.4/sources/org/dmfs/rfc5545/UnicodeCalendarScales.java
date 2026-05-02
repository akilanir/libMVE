package org.dmfs.rfc5545;

import java.util.HashMap;
import java.util.Map;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.calendarmetrics.GregorianCalendarMetrics;
import org.dmfs.rfc5545.calendarmetrics.IslamicCalendarMetrics;
import org.dmfs.rfc5545.calendarmetrics.JulianCalendarMetrics;

/* loaded from: rfc5545-datetime-0.2.4.jar:org/dmfs/rfc5545/UnicodeCalendarScales.class */
public final class UnicodeCalendarScales {
    private static final Map<String, CalendarMetrics.CalendarMetricsFactory> CALENDAR_SCALES = new HashMap(10);

    public static CalendarMetrics.CalendarMetricsFactory getCalendarMetricsForName(String str) {
        return CALENDAR_SCALES.get(str);
    }

    static {
        CALENDAR_SCALES.put(GregorianCalendarMetrics.CALENDAR_SCALE_ALIAS, GregorianCalendarMetrics.FACTORY);
        CALENDAR_SCALES.put(GregorianCalendarMetrics.CALENDAR_SCALE_NAME, GregorianCalendarMetrics.FACTORY);
        CALENDAR_SCALES.put(JulianCalendarMetrics.CALENDAR_SCALE_ALIAS, JulianCalendarMetrics.FACTORY);
        CALENDAR_SCALES.put(JulianCalendarMetrics.CALENDAR_SCALE_NAME, JulianCalendarMetrics.FACTORY);
        CALENDAR_SCALES.put(IslamicCalendarMetrics.CALENDAR_SCALE_TLBA, new IslamicCalendarMetrics.IslamicCalendarMetricsFactory(IslamicCalendarMetrics.CALENDAR_SCALE_TLBA, IslamicCalendarMetrics.LeapYearPattern.II, false));
        CALENDAR_SCALES.put(IslamicCalendarMetrics.CALENDAR_SCALE_CIVIL, new IslamicCalendarMetrics.IslamicCalendarMetricsFactory(IslamicCalendarMetrics.CALENDAR_SCALE_CIVIL, IslamicCalendarMetrics.LeapYearPattern.II, true));
        CALENDAR_SCALES.put("ISLAMICC", CALENDAR_SCALES.get(IslamicCalendarMetrics.CALENDAR_SCALE_CIVIL));
    }
}
