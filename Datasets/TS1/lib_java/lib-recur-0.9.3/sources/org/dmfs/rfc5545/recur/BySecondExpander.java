package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/BySecondExpander.class */
class BySecondExpander extends ByExpander {
    private final int[] mSeconds;

    public BySecondExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j) {
        super(ruleIterator, calendarMetrics, j);
        this.mSeconds = StaticUtils.ListToSortedArray(recurrenceRule.getByPart(RecurrenceRule.Part.BYSECOND));
    }

    @Override // org.dmfs.rfc5545.recur.ByExpander
    void expand(long j, long j2) {
        for (int i : this.mSeconds) {
            addInstance(Instance.setSecond(j, i));
        }
    }
}
