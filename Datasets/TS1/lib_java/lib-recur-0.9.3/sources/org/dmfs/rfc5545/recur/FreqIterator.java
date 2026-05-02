package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/FreqIterator.class */
public final class FreqIterator extends ByExpander {
    private static final int MAX_EMPTY_SETS = 1000;
    private final Freq mFreq;
    private final int mInterval;
    private final LongArray mResultSet;
    private final CalendarMetrics mCalendarMetrics;
    private long mNextInstance;

    public FreqIterator(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics, long j) {
        super(null, calendarMetrics, j);
        this.mResultSet = new LongArray(1);
        this.mFreq = recurrenceRule.getFreq();
        this.mInterval = recurrenceRule.getInterval();
        this.mCalendarMetrics = calendarMetrics;
        int year = Instance.year(j);
        this.mNextInstance = Instance.setDayOfWeek(j, this.mCalendarMetrics.getDayOfWeek(year, this.mCalendarMetrics.getDayOfYear(year, Instance.month(j), Instance.dayOfMonth(j))));
    }

    @Override // org.dmfs.rfc5545.recur.ByExpander, org.dmfs.rfc5545.recur.RuleIterator
    public long next() {
        long j;
        CalendarMetrics calendarMetrics = this.mCalendarMetrics;
        int i = MAX_EMPTY_SETS;
        do {
            i--;
            if (i >= 0) {
                j = this.mNextInstance;
                this.mNextInstance = this.mFreq.next(calendarMetrics, j, this.mInterval);
                if (this.mFilterCount <= 0) {
                    break;
                }
            } else {
                throw new IllegalArgumentException("too many empty recurrence sets");
            }
        } while (filter(j));
        return j;
    }

    @Override // org.dmfs.rfc5545.recur.ByExpander, org.dmfs.rfc5545.recur.RuleIterator
    LongArray nextSet() {
        this.mResultSet.clear();
        this.mResultSet.add(next());
        return this.mResultSet;
    }

    @Override // org.dmfs.rfc5545.recur.ByExpander
    void expand(long j, long j2) {
    }

    @Override // org.dmfs.rfc5545.recur.ByExpander, org.dmfs.rfc5545.recur.RuleIterator
    void fastForward(long j) {
        this.mNextInstance = this.mFreq.next(this.mCalendarMetrics, this.mNextInstance, this.mInterval, j);
    }
}
