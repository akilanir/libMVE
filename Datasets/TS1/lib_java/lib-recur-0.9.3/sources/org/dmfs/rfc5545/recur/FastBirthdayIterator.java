package org.dmfs.rfc5545.recur;

import java.util.List;
import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/FastBirthdayIterator.class */
public final class FastBirthdayIterator extends ByExpander {
    private final int mInterval;
    private final LongArray mResultSet;
    private long mNextInstance;

    private FastBirthdayIterator(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics, long j) {
        super(null, calendarMetrics, j);
        this.mResultSet = new LongArray(1);
        int interval = recurrenceRule.getInterval();
        this.mInterval = recurrenceRule.getFreq() == Freq.MONTHLY ? interval > 12 ? interval / 12 : 1 : interval;
        this.mNextInstance = j;
    }

    public static FastBirthdayIterator getInstance(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics, long j) {
        if (recurrenceRule.hasPart(RecurrenceRule.Part.BYDAY) || recurrenceRule.hasPart(RecurrenceRule.Part.BYYEARDAY) || recurrenceRule.hasPart(RecurrenceRule.Part.BYWEEKNO) || recurrenceRule.hasPart(RecurrenceRule.Part.BYHOUR) || recurrenceRule.hasPart(RecurrenceRule.Part.BYMINUTE) || recurrenceRule.hasPart(RecurrenceRule.Part.BYSECOND) || recurrenceRule.hasPart(RecurrenceRule.Part.BYSETPOS) || recurrenceRule.getSkip() != RecurrenceRule.Skip.OMIT) {
            return null;
        }
        Freq freq = recurrenceRule.getFreq();
        List<Integer> byPart = recurrenceRule.getByPart(RecurrenceRule.Part.BYMONTH);
        List<Integer> byPart2 = recurrenceRule.getByPart(RecurrenceRule.Part.BYMONTHDAY);
        if (freq == Freq.MONTHLY) {
            int interval = recurrenceRule.getInterval();
            if (interval == 5) {
                return null;
            }
            if (interval > 6 && interval % 12 != 0) {
                return null;
            }
        }
        if ((byPart == null || byPart.size() != 1 || (!(byPart2 == null && (freq == Freq.MONTHLY || freq == Freq.YEARLY)) && (byPart2 == null || byPart2.size() != 1 || byPart2.get(0).intValue() <= 0 || !(freq == Freq.MONTHLY || freq == Freq.YEARLY || freq == Freq.DAILY)))) && !(freq == Freq.YEARLY && byPart == null && byPart2 == null)) {
            return null;
        }
        if (byPart != null) {
            j = Instance.setMonth(j, byPart.get(0).intValue());
        }
        if (byPart2 != null) {
            j = Instance.setDayOfMonth(j, byPart2.get(0).intValue());
        }
        return new FastBirthdayIterator(recurrenceRule, calendarMetrics, j);
    }

    @Override // org.dmfs.rfc5545.recur.ByExpander, org.dmfs.rfc5545.recur.RuleIterator
    public long next() {
        long j = this.mNextInstance;
        this.mNextInstance = Instance.setYear(this.mNextInstance, Instance.year(this.mNextInstance) + this.mInterval);
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
        int year = Instance.year(j);
        int year2 = Instance.year(this.mNextInstance);
        this.mNextInstance = Instance.setYear(this.mNextInstance, year2 + ((Math.max(0, year - year2) % this.mInterval) * this.mInterval));
    }
}
