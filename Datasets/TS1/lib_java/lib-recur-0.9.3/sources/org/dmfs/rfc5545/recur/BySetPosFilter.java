package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/BySetPosFilter.class */
final class BySetPosFilter extends RuleIterator {
    private static final int MAX_EMPTY_SETS = 1000;
    private final int[] mSetPositions;
    private LongArray mSetIterator;
    private boolean mFirst;
    private final LongArray mResultSet;
    private final long mStart;

    public BySetPosFilter(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, long j) {
        super(ruleIterator);
        this.mFirst = true;
        this.mResultSet = new LongArray();
        this.mSetPositions = StaticUtils.ListToSortedArray(recurrenceRule.getByPart(RecurrenceRule.Part.BYSETPOS));
        this.mStart = j;
    }

    @Override // org.dmfs.rfc5545.recur.RuleIterator
    public long next() {
        if (this.mSetIterator == null || !this.mSetIterator.hasNext()) {
            this.mSetIterator = nextSet();
        }
        return this.mSetIterator.next();
    }

    @Override // org.dmfs.rfc5545.recur.RuleIterator
    LongArray nextSet() {
        LongArray longArray = this.mResultSet;
        int[] iArr = this.mSetPositions;
        longArray.clear();
        if (this.mFirst) {
            longArray.add(this.mStart);
            this.mFirst = false;
        }
        boolean z = false;
        int i = -1;
        do {
            i++;
            if (i == MAX_EMPTY_SETS) {
                throw new IllegalStateException("too many empty recurrence sets");
            }
            LongArray nextSet = this.mPrevious.nextSet();
            int size = nextSet.size() + 1;
            int i2 = 1;
            while (nextSet.hasNext()) {
                long next = nextSet.next();
                if ((StaticUtils.linearSearch(iArr, i2) >= 0 || (i2 < size && StaticUtils.linearSearch(iArr, i2 - size) >= 0)) && this.mStart < Instance.maskWeekday(next)) {
                    longArray.add(next);
                    z = true;
                }
                i2++;
            }
        } while (!z);
        return longArray;
    }
}
