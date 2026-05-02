package org.dmfs.rfc5545.recur;

import java.util.TimeZone;
import org.dmfs.rfc5545.DateTime;
import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/RecurrenceRuleIterator.class */
public final class RecurrenceRuleIterator {
    private final RuleIterator mRuleIterator;
    private long mNextInstance;
    private final boolean mAllDay;
    private final TimeZone mTimeZone;
    private long mNextMillis = Long.MIN_VALUE;
    private DateTime mNextDateTime = null;
    private final CalendarMetrics mCalendarMetrics;

    RecurrenceRuleIterator(RuleIterator ruleIterator, DateTime dateTime, CalendarMetrics calendarMetrics) {
        this.mRuleIterator = ruleIterator;
        this.mAllDay = dateTime.isAllDay();
        this.mCalendarMetrics = calendarMetrics;
        this.mTimeZone = dateTime.isFloating() ? null : dateTime.getTimeZone();
        fetchNextInstance();
    }

    private void fetchNextInstance() {
        this.mNextInstance = this.mRuleIterator.next();
        this.mNextMillis = Long.MIN_VALUE;
        this.mNextDateTime = null;
    }

    public long nextMillis() {
        if (this.mNextInstance == Long.MIN_VALUE) {
            throw new ArrayIndexOutOfBoundsException("No more instances to iterate.");
        }
        long j = this.mNextMillis;
        if (j == Long.MIN_VALUE) {
            j = this.mCalendarMetrics.toMillis(this.mNextInstance, this.mTimeZone);
        }
        fetchNextInstance();
        return j;
    }

    public DateTime nextDateTime() {
        if (this.mNextInstance == Long.MIN_VALUE) {
            throw new ArrayIndexOutOfBoundsException("No more instances to iterate.");
        }
        long j = this.mNextInstance;
        DateTime dateTime = this.mNextDateTime;
        fetchNextInstance();
        return dateTime != null ? dateTime : this.mAllDay ? new DateTime(this.mCalendarMetrics, Instance.year(j), Instance.month(j), Instance.dayOfMonth(j)) : new DateTime(this.mCalendarMetrics, this.mTimeZone, Instance.year(j), Instance.month(j), Instance.dayOfMonth(j), Instance.hour(j), Instance.minute(j), Instance.second(j));
    }

    public boolean hasNext() {
        return this.mNextInstance != Long.MIN_VALUE;
    }

    /*  JADX ERROR: Failed to decode insn: 0x0032: MOVE_MULTI
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
        	at jadx.core.ProcessClass.generateCode(ProcessClass.java:117)
        	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
        	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
        	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
        */
    public long peekMillis() {
        /*
            r6 = this;
            r0 = r6
            long r0 = r0.mNextInstance
            r1 = -9223372036854775808
            int r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r0 != 0) goto L15
            java.lang.ArrayIndexOutOfBoundsException r0 = new java.lang.ArrayIndexOutOfBoundsException
            r1 = r0
            java.lang.String r2 = "No more instances to iterate."
            r1.<init>(r2)
            throw r0
            r0 = r6
            long r0 = r0.mNextMillis
            r7 = r0
            r0 = r7
            r1 = -9223372036854775808
            int r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r0 != 0) goto L37
            r0 = r6
            r1 = r6
            org.dmfs.rfc5545.calendarmetrics.CalendarMetrics r1 = r1.mCalendarMetrics
            r2 = r6
            long r2 = r2.mNextInstance
            r3 = r6
            java.util.TimeZone r3 = r3.mTimeZone
            long r1 = r1.toMillis(r2, r3)
            // decode failed: arraycopy: source index -1 out of bounds for object array[6]
            r0.mNextMillis = r1
            r7 = r-1
            r0 = r7
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: org.dmfs.rfc5545.recur.RecurrenceRuleIterator.peekMillis():long");
    }

    public DateTime peekDateTime() {
        if (this.mNextInstance == Long.MIN_VALUE) {
            throw new ArrayIndexOutOfBoundsException("No more instances to iterate.");
        }
        long j = this.mNextInstance;
        if (this.mAllDay) {
            DateTime dateTime = new DateTime(this.mCalendarMetrics, Instance.year(j), Instance.month(j), Instance.dayOfMonth(j));
            this.mNextDateTime = dateTime;
            return dateTime;
        }
        DateTime dateTime2 = new DateTime(this.mCalendarMetrics, this.mTimeZone, Instance.year(j), Instance.month(j), Instance.dayOfMonth(j), Instance.hour(j), Instance.minute(j), Instance.second(j));
        this.mNextDateTime = dateTime2;
        return dateTime2;
    }

    public void skip(int i) {
        long next;
        if (i == 0) {
            return;
        }
        if (i < 0) {
            throw new IllegalArgumentException("Can not skip backbards");
        }
        RuleIterator ruleIterator = this.mRuleIterator;
        do {
            next = ruleIterator.next();
            i--;
        } while (i > 0);
        this.mNextInstance = next;
        this.mNextMillis = Long.MIN_VALUE;
        this.mNextDateTime = null;
    }

    public void fastForward(long j) {
        if (hasNext()) {
            long instance = this.mCalendarMetrics.toInstance(j, this.mTimeZone);
            long maskWeekday = Instance.maskWeekday(this.mNextInstance);
            if (instance <= maskWeekday) {
                return;
            }
            RuleIterator ruleIterator = this.mRuleIterator;
            ruleIterator.fastForward(instance);
            while (maskWeekday != Long.MIN_VALUE && maskWeekday < instance) {
                maskWeekday = ruleIterator.next();
            }
            this.mNextInstance = maskWeekday;
            this.mNextMillis = Long.MIN_VALUE;
            this.mNextDateTime = null;
        }
    }

    public void fastForward(DateTime dateTime) {
        if (hasNext()) {
            long dateTime2 = dateTime.shiftTimeZone(this.mTimeZone).getInstance();
            long maskWeekday = Instance.maskWeekday(this.mNextInstance);
            if (dateTime2 <= maskWeekday) {
                return;
            }
            RuleIterator ruleIterator = this.mRuleIterator;
            ruleIterator.fastForward(dateTime2);
            while (maskWeekday != Long.MIN_VALUE && maskWeekday < dateTime2) {
                maskWeekday = ruleIterator.next();
            }
            this.mNextInstance = maskWeekday;
            this.mNextMillis = Long.MIN_VALUE;
            this.mNextDateTime = null;
        }
    }

    public void skipAllButLast() {
        long j;
        long j2 = Long.MIN_VALUE;
        RuleIterator ruleIterator = this.mRuleIterator;
        do {
            j = j2;
            j2 = ruleIterator.next();
        } while (j2 != Long.MIN_VALUE);
        this.mNextInstance = j;
        this.mNextMillis = Long.MIN_VALUE;
        this.mNextDateTime = null;
    }
}
