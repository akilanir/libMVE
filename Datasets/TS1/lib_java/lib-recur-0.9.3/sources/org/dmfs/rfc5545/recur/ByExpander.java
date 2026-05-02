package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/ByExpander.class */
abstract class ByExpander extends RuleIterator {
    private static final int MAX_EMPTY_SETS = 1000;
    private final long mStart;
    private LongArray mWorkingSet;
    private final LongArray mResultSet;
    final CalendarMetrics mCalendarMetrics;
    private final ByFilter[] mFilters;
    int mFilterCount;

    /* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/ByExpander$Scope.class */
    protected enum Scope {
        WEEKLY,
        MONTHLY,
        WEEKLY_AND_MONTHLY,
        YEARLY
    }

    public ByExpander(RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j) {
        super(ruleIterator);
        this.mWorkingSet = null;
        this.mResultSet = new LongArray();
        this.mFilters = new ByFilter[8];
        this.mFilterCount = 0;
        this.mStart = j;
        this.mCalendarMetrics = calendarMetrics;
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
        RuleIterator ruleIterator = this.mPrevious;
        long j = this.mStart;
        longArray.clear();
        int i = 0;
        while (i != MAX_EMPTY_SETS) {
            i++;
            LongArray nextSet = ruleIterator.nextSet();
            while (nextSet.hasNext()) {
                expand(nextSet.next(), j);
            }
            if (longArray.hasNext()) {
                longArray.sort();
                return longArray;
            }
        }
        throw new IllegalArgumentException("too many empty recurrence sets " + this);
    }

    final void addFilter(ByFilter byFilter) {
        ByFilter[] byFilterArr = this.mFilters;
        int i = this.mFilterCount;
        this.mFilterCount = i + 1;
        byFilterArr[i] = byFilter;
    }

    final void addInstance(long j) {
        if (this.mFilterCount == 0 || !filter(j)) {
            this.mResultSet.add(j);
        }
    }

    final boolean filter(long j) {
        ByFilter[] byFilterArr = this.mFilters;
        int i = this.mFilterCount;
        for (int i2 = 0; i2 < i; i2++) {
            if (byFilterArr[i2].filter(j)) {
                return true;
            }
        }
        return false;
    }

    abstract void expand(long j, long j2);

    @Override // org.dmfs.rfc5545.recur.RuleIterator
    void fastForward(long j) {
        long maskWeekday = Instance.maskWeekday(j);
        LongArray longArray = this.mWorkingSet;
        if (longArray != null) {
            while (longArray.hasNext() && Instance.maskWeekday(longArray.peek()) < maskWeekday) {
                longArray.next();
            }
        }
        if (longArray == null || !longArray.hasNext()) {
            this.mPrevious.fastForward(maskWeekday);
        }
    }
}
