package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/ByMonthExpander.class */
final class ByMonthExpander extends ByExpander {
    private final int[] mMonths;

    public ByMonthExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j) {
        super(ruleIterator, calendarMetrics, j);
        this.mMonths = StaticUtils.ListToSortedArray(recurrenceRule.getByPart(RecurrenceRule.Part.BYMONTH));
    }

    @Override // org.dmfs.rfc5545.recur.ByExpander
    void expand(long j, long j2) {
        for (int i : this.mMonths) {
            long month = Instance.setMonth(j, i);
            if (month >= j2) {
                addInstance(month);
            }
        }
    }
}
