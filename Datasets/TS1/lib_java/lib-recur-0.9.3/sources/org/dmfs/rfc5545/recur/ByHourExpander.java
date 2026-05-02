package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/ByHourExpander.class */
final class ByHourExpander extends ByExpander {
    private final int[] mHours;

    public ByHourExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j) {
        super(ruleIterator, calendarMetrics, j);
        this.mHours = StaticUtils.ListToSortedArray(recurrenceRule.getByPart(RecurrenceRule.Part.BYHOUR));
    }

    @Override // org.dmfs.rfc5545.recur.ByExpander
    void expand(long j, long j2) {
        for (int i : this.mHours) {
            addInstance(Instance.setHour(j, i));
        }
    }
}
