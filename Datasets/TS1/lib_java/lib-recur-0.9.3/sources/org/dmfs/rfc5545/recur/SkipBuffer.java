package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/SkipBuffer.class */
final class SkipBuffer extends RuleIterator {
    private LongArray mWorkingSet;
    private final LongArray mResultSet;
    private final LongArray mTempSet;
    private final boolean mIsYearly;

    public SkipBuffer(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j) {
        super(ruleIterator);
        this.mWorkingSet = null;
        this.mResultSet = new LongArray();
        this.mTempSet = new LongArray();
        this.mIsYearly = recurrenceRule.getFreq() == Freq.YEARLY;
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
        LongArray longArray2 = this.mTempSet;
        int i = Integer.MAX_VALUE;
        int i2 = Integer.MAX_VALUE;
        boolean z = true;
        longArray.clear();
        if (longArray2.size() > 0) {
            while (longArray2.hasNext()) {
                long next = longArray2.next();
                if (z) {
                    i2 = Instance.year(next);
                    i = Instance.month(next);
                    z = false;
                }
                longArray.add(next);
            }
            longArray2.clear();
        }
        LongArray nextSet = this.mPrevious.nextSet();
        while (nextSet.hasNext()) {
            long next2 = nextSet.next();
            int year = Instance.year(next2);
            int month = Instance.month(next2);
            if (z) {
                i2 = month;
                i = year;
                z = false;
                longArray.add(next2);
            } else if (this.mIsYearly) {
                if (year == i) {
                    longArray.add(next2);
                } else {
                    longArray2.add(next2);
                }
            } else if (year == i && month == i2) {
                longArray.add(next2);
            } else {
                longArray2.add(next2);
            }
        }
        longArray.sort();
        return longArray;
    }
}
