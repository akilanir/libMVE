package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/BySecondFilter.class */
class BySecondFilter extends ByFilter {
    private final int[] mSeconds;

    public BySecondFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) {
        super(calendarMetrics);
        this.mSeconds = StaticUtils.ListToArray(recurrenceRule.getByPart(RecurrenceRule.Part.BYSECOND));
    }

    @Override // org.dmfs.rfc5545.recur.ByFilter
    boolean filter(long j) {
        return StaticUtils.linearSearch(this.mSeconds, Instance.second(j)) < 0;
    }
}
