package org.dmfs.rfc5545.recur;

import java.util.HashMap;
import java.util.Map;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.calendarmetrics.GregorianCalendarMetrics;
import org.dmfs.rfc5545.calendarmetrics.IslamicCalendarMetrics;
import org.dmfs.rfc5545.calendarmetrics.JulianCalendarMetrics;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/UnicodeCalendarScales.class */
public final class UnicodeCalendarScales {
    private static final Map<String, CalendarMetrics.CalendarMetricsFactory> CALENDAR_SCALES = new HashMap(10);

    public static CalendarMetrics.CalendarMetricsFactory getCalendarMetricsForName(String str) {
        return CALENDAR_SCALES.get(str);
    }

    static {
        CALENDAR_SCALES.put("GREGORIAN", GregorianCalendarMetrics.FACTORY);
        CALENDAR_SCALES.put("GREGORY", GregorianCalendarMetrics.FACTORY);
        CALENDAR_SCALES.put("JULIAN", JulianCalendarMetrics.FACTORY);
        CALENDAR_SCALES.put("JULIUS", JulianCalendarMetrics.FACTORY);
        CALENDAR_SCALES.put("ISLAMIC-TLBA", new IslamicCalendarMetrics.IslamicCalendarMetricsFactory("ISLAMIC-TLBA", IslamicCalendarMetrics.LeapYearPattern.II, false));
        CALENDAR_SCALES.put("ISLAMIC_CIVIL", new IslamicCalendarMetrics.IslamicCalendarMetricsFactory("ISLAMIC_CIVIL", IslamicCalendarMetrics.LeapYearPattern.II, true));
        CALENDAR_SCALES.put("ISLAMICC", CALENDAR_SCALES.get("ISLAMIC_CIVIL"));
    }
}
