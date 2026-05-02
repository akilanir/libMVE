package org.dmfs.rfc5545.recur;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/CountLimiter.class */
class CountLimiter extends Limiter {
    private final int mLimit;
    private int mCounter;

    CountLimiter(RecurrenceRule recurrenceRule, RuleIterator ruleIterator) {
        super(ruleIterator);
        this.mCounter = 0;
        this.mLimit = recurrenceRule.getCount().intValue();
    }

    @Override // org.dmfs.rfc5545.recur.Limiter
    boolean stop(long j) {
        int i = this.mCounter + 1;
        this.mCounter = i;
        return i > this.mLimit;
    }

    @Override // org.dmfs.rfc5545.recur.RuleIterator
    void fastForward(long j) {
    }
}
