package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/SanityFilter.class */
final class SanityFilter extends RuleIterator {
    private static final int MAX_EMPTY_SETS = 1000;
    private static final int MAX_FILTERED_INSTANCES = 1000;
    private boolean mFirst;
    private final long mStart;
    private final LongArray mResultSet;
    private final CalendarMetrics mCalendarMetrics;
    private final boolean mFilterStart;
    private long mLastResult;

    SanityFilter(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j) {
        super(ruleIterator);
        this.mFirst = true;
        this.mResultSet = new LongArray();
        this.mStart = j;
        this.mCalendarMetrics = calendarMetrics;
        this.mFilterStart = !recurrenceRule.hasPart(RecurrenceRule.Part.BYSETPOS);
        this.mLastResult = this.mFilterStart ? this.mStart : Long.MIN_VALUE;
    }

    @Override // org.dmfs.rfc5545.recur.RuleIterator
    public long next() {
        CalendarMetrics calendarMetrics = this.mCalendarMetrics;
        if (this.mFirst && this.mFilterStart) {
            this.mFirst = false;
            return this.mStart;
        }
        int i = -1;
        long j = this.mLastResult;
        while (true) {
            i++;
            if (i == 1000) {
                throw new IllegalArgumentException("too many filtered recurrence instances");
            }
            long next = this.mPrevious.next();
            long maskWeekday = Instance.maskWeekday(next);
            if (j < maskWeekday && calendarMetrics.validate(maskWeekday)) {
                this.mLastResult = maskWeekday;
                return next;
            }
        }
    }

    @Override // org.dmfs.rfc5545.recur.RuleIterator
    LongArray nextSet() {
        LongArray longArray = this.mResultSet;
        long j = Long.MIN_VALUE;
        CalendarMetrics calendarMetrics = this.mCalendarMetrics;
        longArray.clear();
        if (this.mFirst && this.mFilterStart) {
            this.mFirst = false;
            j = this.mStart;
            longArray.add(j);
        }
        int i = 0;
        while (i != 1000) {
            i++;
            LongArray nextSet = this.mPrevious.nextSet();
            while (nextSet.hasNext()) {
                long next = nextSet.next();
                long maskWeekday = Instance.maskWeekday(next);
                if (j < maskWeekday && calendarMetrics.validate(maskWeekday)) {
                    longArray.add(next);
                    j = maskWeekday;
                }
            }
            if (longArray.hasNext()) {
                return longArray;
            }
        }
        throw new IllegalArgumentException("too many empty recurrence sets");
    }
}
