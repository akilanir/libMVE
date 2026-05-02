package org.dmfs.rfc5545.recurrenceset;

import java.util.TimeZone;
import org.dmfs.rfc5545.recur.RecurrenceRule;
import org.dmfs.rfc5545.recur.RecurrenceRuleIterator;
import org.dmfs.rfc5545.recurrenceset.AbstractRecurrenceAdapter;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter.class */
public final class RecurrenceRuleAdapter extends AbstractRecurrenceAdapter {
    private final RecurrenceRule mRrule;

    /* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recurrenceset/RecurrenceRuleAdapter$InstanceIterator.class */
    class InstanceIterator implements AbstractRecurrenceAdapter.InstanceIterator {
        private final RecurrenceRuleIterator mIterator;

        public InstanceIterator(RecurrenceRuleIterator recurrenceRuleIterator) {
            this.mIterator = recurrenceRuleIterator;
        }

        @Override // org.dmfs.rfc5545.recurrenceset.AbstractRecurrenceAdapter.InstanceIterator
        public boolean hasNext() {
            return this.mIterator.hasNext();
        }

        @Override // org.dmfs.rfc5545.recurrenceset.AbstractRecurrenceAdapter.InstanceIterator
        public long next() {
            return this.mIterator.nextMillis();
        }

        @Override // org.dmfs.rfc5545.recurrenceset.AbstractRecurrenceAdapter.InstanceIterator
        public long peek() {
            return this.mIterator.peekMillis();
        }

        @Override // org.dmfs.rfc5545.recurrenceset.AbstractRecurrenceAdapter.InstanceIterator
        public void skip(int i) {
            this.mIterator.skip(i);
        }

        @Override // org.dmfs.rfc5545.recurrenceset.AbstractRecurrenceAdapter.InstanceIterator
        public void fastForward(long j) {
            this.mIterator.fastForward(j);
        }
    }

    public RecurrenceRuleAdapter(RecurrenceRule recurrenceRule) {
        this.mRrule = recurrenceRule;
    }

    @Override // org.dmfs.rfc5545.recurrenceset.AbstractRecurrenceAdapter
    AbstractRecurrenceAdapter.InstanceIterator getIterator(TimeZone timeZone, long j) {
        return new InstanceIterator(this.mRrule.iterator(j, timeZone));
    }

    @Override // org.dmfs.rfc5545.recurrenceset.AbstractRecurrenceAdapter
    boolean isInfinite() {
        return this.mRrule.isInfinite();
    }

    @Override // org.dmfs.rfc5545.recurrenceset.AbstractRecurrenceAdapter
    long getLastInstance(TimeZone timeZone, long j) {
        if (isInfinite()) {
            return Long.MAX_VALUE;
        }
        RecurrenceRuleIterator it = this.mRrule.iterator(j, timeZone);
        it.skipAllButLast();
        long j2 = Long.MIN_VALUE;
        if (it.hasNext()) {
            j2 = it.nextMillis();
        }
        return j2;
    }
}
