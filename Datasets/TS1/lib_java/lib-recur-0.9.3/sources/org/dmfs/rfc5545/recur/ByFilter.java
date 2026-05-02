package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/ByFilter.class */
abstract class ByFilter {
    final CalendarMetrics mCalendarMetrics;

    public ByFilter(CalendarMetrics calendarMetrics) {
        this.mCalendarMetrics = calendarMetrics;
    }

    abstract boolean filter(long j);
}
