package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/ByMonthDaySkipFilter.class */
final class ByMonthDaySkipFilter extends RuleIterator {
    private static final int MAX_EMPTY_SETS = 1000;
    private final CalendarMetrics mCalendarMetrics;
    private final RecurrenceRule.Skip mSkip;
    private LongArray mWorkingSet;
    private final LongArray mResultSet;

    public ByMonthDaySkipFilter(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j) {
        super(ruleIterator);
        this.mWorkingSet = null;
        this.mResultSet = new LongArray();
        this.mCalendarMetrics = calendarMetrics;
        this.mSkip = recurrenceRule.getSkip();
    }

    @Override // org.dmfs.rfc5545.recur.RuleIterator
    public long next() {
        LongArray longArray = this.mWorkingSet;
        if (longArray == null || !longArray.hasNext()) {
            LongArray nextSet = nextSet();
            longArray = nextSet;
            this.mWorkingSet = nextSet;
        }
        return longArray.next();
    }

    @Override // org.dmfs.rfc5545.recur.RuleIterator
    LongArray nextSet() {
        LongArray longArray = this.mResultSet;
        CalendarMetrics calendarMetrics = this.mCalendarMetrics;
        int i = 0;
        while (i != MAX_EMPTY_SETS) {
            i++;
            LongArray nextSet = this.mPrevious.nextSet();
            while (nextSet.hasNext()) {
                long maskWeekday = Instance.maskWeekday(nextSet.next());
                if (!calendarMetrics.validate(maskWeekday)) {
                    maskWeekday = this.mSkip == RecurrenceRule.Skip.BACKWARD ? calendarMetrics.prevDay(maskWeekday) : calendarMetrics.nextDay(maskWeekday);
                }
                longArray.add(maskWeekday);
            }
            if (longArray.hasNext()) {
                return longArray;
            }
        }
        throw new IllegalArgumentException("too many empty recurrence sets");
    }
}
