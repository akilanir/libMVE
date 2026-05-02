package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/ByMinuteExpander.class */
final class ByMinuteExpander extends ByExpander {
    private final int[] mMinutes;

    public ByMinuteExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j) {
        super(ruleIterator, calendarMetrics, j);
        this.mMinutes = StaticUtils.ListToSortedArray(recurrenceRule.getByPart(RecurrenceRule.Part.BYMINUTE));
    }

    @Override // org.dmfs.rfc5545.recur.ByExpander
    void expand(long j, long j2) {
        for (int i : this.mMinutes) {
            addInstance(Instance.setMinute(j, i));
        }
    }
}
