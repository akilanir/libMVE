package org.dmfs.rfc5545.recur;

import java.util.List;
import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/FastWeeklyIterator.class */
public final class FastWeeklyIterator extends ByExpander {
    private final int mInterval;
    private final LongArray mResultSet;
    private final long mStart;
    private long mNextInstance;
    private int mYear;
    private int mYearDay;
    private final int mInstanceLimit;
    private int mCount;

    private FastWeeklyIterator(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics, long j, long j2) {
        super(null, calendarMetrics, j2);
        this.mResultSet = new LongArray(1);
        this.mInterval = recurrenceRule.getInterval();
        this.mStart = j;
        this.mNextInstance = j2;
        this.mYear = Instance.year(j2);
        this.mYearDay = calendarMetrics.getDayOfYear(this.mYear, Instance.month(j2), Instance.dayOfMonth(j2));
        Integer count = recurrenceRule.getCount();
        this.mInstanceLimit = count == null ? -1 : count.intValue();
    }

    public static FastWeeklyIterator getInstance(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics, long j) {
        if (recurrenceRule.getFreq() != Freq.WEEKLY || recurrenceRule.hasPart(RecurrenceRule.Part.BYMONTH) || recurrenceRule.hasPart(RecurrenceRule.Part.BYYEARDAY) || recurrenceRule.hasPart(RecurrenceRule.Part.BYMONTHDAY) || recurrenceRule.hasPart(RecurrenceRule.Part.BYWEEKNO) || recurrenceRule.hasPart(RecurrenceRule.Part.BYHOUR) || recurrenceRule.hasPart(RecurrenceRule.Part.BYMINUTE) || recurrenceRule.hasPart(RecurrenceRule.Part.BYSECOND) || recurrenceRule.hasPart(RecurrenceRule.Part.BYSETPOS) || recurrenceRule.getSkip() != RecurrenceRule.Skip.OMIT) {
            return null;
        }
        List<RecurrenceRule.WeekdayNum> byDayPart = recurrenceRule.getByDayPart();
        if (byDayPart != null && byDayPart.size() != 1) {
            return null;
        }
        long j2 = j;
        if (byDayPart != null) {
            int ordinal = byDayPart.get(0).weekday.ordinal();
            int year = Instance.year(j2);
            int dayOfYear = calendarMetrics.getDayOfYear(year, Instance.month(j2), Instance.dayOfMonth(j2));
            int dayOfWeek = calendarMetrics.getDayOfWeek(year, dayOfYear);
            if (dayOfWeek != ordinal) {
                int i = dayOfYear + (((ordinal - dayOfWeek) + 7) % 7);
                int daysPerYear = calendarMetrics.getDaysPerYear(Instance.year(j2));
                if (i > daysPerYear) {
                    year++;
                    i -= daysPerYear;
                }
                int monthAndDayOfYearDay = calendarMetrics.getMonthAndDayOfYearDay(year, i);
                j2 = Instance.setMonthAndDayOfMonth(Instance.setYear(j2, year), CalendarMetrics.packedMonth(monthAndDayOfYearDay), CalendarMetrics.dayOfMonth(monthAndDayOfYearDay));
            }
        }
        return new FastWeeklyIterator(recurrenceRule, calendarMetrics, j, j2);
    }

    /*  JADX ERROR: Failed to decode insn: 0x0035: MOVE_MULTI
        java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[6]
        	at java.base/java.lang.System.arraycopy(Native Method)
        	at jadx.plugins.input.java.data.code.StackState.insert(StackState.java:52)
        	at jadx.plugins.input.java.data.code.CodeDecodeState.insert(CodeDecodeState.java:137)
        	at jadx.plugins.input.java.data.code.JavaInsnsRegister.dup2x1(JavaInsnsRegister.java:313)
        	at jadx.plugins.input.java.data.code.JavaInsnData.decode(JavaInsnData.java:46)
        	at jadx.core.dex.instructions.InsnDecoder.lambda$process$0(InsnDecoder.java:50)
        	at jadx.plugins.input.java.data.code.JavaCodeReader.visitInstructions(JavaCodeReader.java:85)
        	at jadx.core.dex.instructions.InsnDecoder.process(InsnDecoder.java:46)
        	at jadx.core.dex.nodes.MethodNode.load(MethodNode.java:157)
        	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:458)
        	at jadx.core.ProcessClass.process(ProcessClass.java:69)
        	at jadx.core.ProcessClass.generateCode(ProcessClass.java:109)
        	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
        	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
        	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
        */
    @Override // org.dmfs.rfc5545.recur.ByExpander, org.dmfs.rfc5545.recur.RuleIterator
    public long next() {
        /*
            r6 = this;
            r0 = r6
            r1 = r0
            int r1 = r1.mCount
            r2 = r1; r1 = r0; r0 = r2; 
            r3 = 1
            int r2 = r2 + r3
            r1.mCount = r2
            if (r0 != 0) goto L1f
            r0 = r6
            long r0 = r0.mStart
            r1 = r6
            long r1 = r1.mNextInstance
            int r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r0 == 0) goto L1f
            r0 = r6
            long r0 = r0.mStart
            return r0
            r0 = r6
            int r0 = r0.mInstanceLimit
            if (r0 <= 0) goto L3a
            r0 = r6
            int r0 = r0.mCount
            r1 = r6
            int r1 = r1.mInstanceLimit
            if (r0 <= r1) goto L3a
            r0 = r6
            r1 = -9223372036854775808
            // decode failed: arraycopy: source index -1 out of bounds for object array[6]
            r0.mNextInstance = r1
            return r-1
            r0 = r6
            long r0 = r0.mNextInstance
            r7 = r0
            r0 = r6
            org.dmfs.rfc5545.calendarmetrics.CalendarMetrics r0 = r0.mCalendarMetrics
            r1 = r6
            int r1 = r1.mYear
            int r0 = r0.getDaysPerYear(r1)
            r9 = r0
            r0 = r6
            r1 = r0
            int r1 = r1.mYearDay
            r2 = 7
            r3 = r6
            int r3 = r3.mInterval
            int r2 = r2 * r3
            int r1 = r1 + r2
            r0.mYearDay = r1
            r0 = r6
            int r0 = r0.mYearDay
            r1 = r9
            if (r0 <= r1) goto L86
            r0 = r6
            r1 = r0
            int r1 = r1.mYear
            r2 = 1
            int r1 = r1 + r2
            r0.mYear = r1
            r0 = r6
            r1 = r0
            int r1 = r1.mYearDay
            r2 = r9
            int r1 = r1 - r2
            r0.mYearDay = r1
            r0 = r6
            org.dmfs.rfc5545.calendarmetrics.CalendarMetrics r0 = r0.mCalendarMetrics
            r1 = r6
            int r1 = r1.mYear
            int r0 = r0.getDaysPerYear(r1)
            r9 = r0
            goto L5b
            r0 = r6
            org.dmfs.rfc5545.calendarmetrics.CalendarMetrics r0 = r0.mCalendarMetrics
            r1 = r6
            int r1 = r1.mYear
            r2 = r6
            int r2 = r2.mYearDay
            int r0 = r0.getMonthAndDayOfYearDay(r1, r2)
            r10 = r0
            r0 = r6
            r1 = r6
            long r1 = r1.mNextInstance
            r2 = r6
            int r2 = r2.mYear
            long r1 = org.dmfs.rfc5545.Instance.setYear(r1, r2)
            r2 = r10
            int r2 = org.dmfs.rfc5545.calendarmetrics.CalendarMetrics.packedMonth(r2)
            r3 = r10
            int r3 = org.dmfs.rfc5545.calendarmetrics.CalendarMetrics.dayOfMonth(r3)
            long r1 = org.dmfs.rfc5545.Instance.setMonthAndDayOfMonth(r1, r2, r3)
            r0.mNextInstance = r1
            r0 = r7
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: org.dmfs.rfc5545.recur.FastWeeklyIterator.next():long");
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
        int month = Instance.month(j);
        int monthsPerYear = this.mCalendarMetrics.getMonthsPerYear(year - 1);
        int month2 = Instance.month(this.mNextInstance);
        while (true) {
            int i = month2;
            if ((this.mYear >= year - 1 && ((this.mYear != year - 1 || month != 0 || i >= monthsPerYear - 1) && (this.mYear != year || i >= month))) || this.mNextInstance <= Long.MIN_VALUE) {
                return;
            } else {
                month2 = Instance.month(next());
            }
        }
    }
}
