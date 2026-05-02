package org.dmfs.rfc5545.recurrenceset;

import java.util.Arrays;
import java.util.TimeZone;
import org.dmfs.rfc5545.DateTime;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.recurrenceset.AbstractRecurrenceAdapter;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recurrenceset/RecurrenceList.class */
public final class RecurrenceList extends AbstractRecurrenceAdapter {
    private final long[] mInstances;
    private final int mCount;

    /* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator.class */
    class InstanceIterator implements AbstractRecurrenceAdapter.InstanceIterator {
        private int mNext;

        public InstanceIterator(long j) {
            fastForward(j);
        }

        @Override // org.dmfs.rfc5545.recurrenceset.AbstractRecurrenceAdapter.InstanceIterator
        public boolean hasNext() {
            return this.mNext < RecurrenceList.this.mCount;
        }

        @Override // org.dmfs.rfc5545.recurrenceset.AbstractRecurrenceAdapter.InstanceIterator
        public long next() {
            if (this.mNext >= RecurrenceList.this.mCount) {
                throw new ArrayIndexOutOfBoundsException("No more instances to iterate.");
            }
            long[] jArr = RecurrenceList.this.mInstances;
            int i = this.mNext;
            this.mNext = i + 1;
            return jArr[i];
        }

        @Override // org.dmfs.rfc5545.recurrenceset.AbstractRecurrenceAdapter.InstanceIterator
        public long peek() {
            if (this.mNext >= RecurrenceList.this.mCount) {
                throw new ArrayIndexOutOfBoundsException("No more instances to iterate.");
            }
            return RecurrenceList.this.mInstances[this.mNext];
        }

        @Override // org.dmfs.rfc5545.recurrenceset.AbstractRecurrenceAdapter.InstanceIterator
        public void skip(int i) {
            this.mNext += i;
        }

        @Override // org.dmfs.rfc5545.recurrenceset.AbstractRecurrenceAdapter.InstanceIterator
        public void fastForward(long j) {
            int i = RecurrenceList.this.mCount;
            int i2 = this.mNext;
            long[] jArr = RecurrenceList.this.mInstances;
            while (i2 < i && jArr[i2] < j) {
                i2++;
            }
            this.mNext = i2;
        }
    }

    public RecurrenceList(String str, TimeZone timeZone) {
        this(DateTime.GREGORIAN_CALENDAR_SCALE, str, timeZone);
    }

    public RecurrenceList(CalendarMetrics calendarMetrics, String str, TimeZone timeZone) {
        if (str == null || str.length() == 0) {
            this.mInstances = null;
            this.mCount = 0;
            return;
        }
        String[] split = str.split(",");
        this.mInstances = new long[split.length];
        int i = 0;
        for (String str2 : split) {
            this.mInstances[i] = DateTime.parse(calendarMetrics, timeZone, str2).getTimestamp();
            i++;
        }
        this.mCount = i;
        Arrays.sort(this.mInstances);
    }

    public RecurrenceList(long[] jArr) {
        this.mInstances = new long[jArr.length];
        System.arraycopy(jArr, 0, this.mInstances, 0, jArr.length);
        this.mCount = jArr.length;
        Arrays.sort(this.mInstances);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // org.dmfs.rfc5545.recurrenceset.AbstractRecurrenceAdapter
    public InstanceIterator getIterator(TimeZone timeZone, long j) {
        return new InstanceIterator(j);
    }

    @Override // org.dmfs.rfc5545.recurrenceset.AbstractRecurrenceAdapter
    boolean isInfinite() {
        return false;
    }

    @Override // org.dmfs.rfc5545.recurrenceset.AbstractRecurrenceAdapter
    long getLastInstance(TimeZone timeZone, long j) {
        long[] jArr = this.mInstances;
        return jArr[jArr.length - 1];
    }
}
