package org.dmfs.rfc5545.recur;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/RuleIterator.class */
abstract class RuleIterator {
    final RuleIterator mPrevious;

    RuleIterator(RuleIterator ruleIterator) {
        this.mPrevious = ruleIterator;
    }

    public abstract long next();

    abstract LongArray nextSet();

    void fastForward(long j) {
        this.mPrevious.fastForward(j);
    }
}
