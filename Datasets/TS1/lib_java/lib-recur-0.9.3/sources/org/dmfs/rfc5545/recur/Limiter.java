package org.dmfs.rfc5545.recur;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/Limiter.class */
abstract class Limiter extends RuleIterator {
    Limiter(RuleIterator ruleIterator) {
        super(ruleIterator);
    }

    @Override // org.dmfs.rfc5545.recur.RuleIterator
    public long next() {
        long next = this.mPrevious.next();
        if (stop(next)) {
            return Long.MIN_VALUE;
        }
        return next;
    }

    @Override // org.dmfs.rfc5545.recur.RuleIterator
    LongArray nextSet() {
        throw new UnsupportedOperationException("nextSet is not implemented for Limiters, since it should never be called");
    }

    abstract boolean stop(long j);
}
