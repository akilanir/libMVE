package org.dmfs.rfc5545.recurrenceset;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.TimeZone;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recurrenceset/RecurrenceSet.class */
public class RecurrenceSet {
    private final List<AbstractRecurrenceAdapter> mInstances = new ArrayList();
    private List<AbstractRecurrenceAdapter> mExceptions = null;
    private boolean mIsInfinite = false;

    public void addInstances(AbstractRecurrenceAdapter abstractRecurrenceAdapter) {
        this.mInstances.add(abstractRecurrenceAdapter);
        this.mIsInfinite |= abstractRecurrenceAdapter.isInfinite();
    }

    public void addExceptions(AbstractRecurrenceAdapter abstractRecurrenceAdapter) {
        if (this.mExceptions == null) {
            this.mExceptions = new ArrayList();
        }
        this.mExceptions.add(abstractRecurrenceAdapter);
    }

    public RecurrenceSetIterator iterator(TimeZone timeZone, long j) {
        return iterator(timeZone, j, Long.MAX_VALUE);
    }

    public RecurrenceSetIterator iterator(TimeZone timeZone, long j, long j2) {
        ArrayList arrayList = new ArrayList(this.mInstances.size());
        Iterator<AbstractRecurrenceAdapter> it = this.mInstances.iterator();
        while (it.hasNext()) {
            arrayList.add(it.next().getIterator(timeZone, j));
        }
        ArrayList arrayList2 = null;
        if (this.mExceptions != null) {
            arrayList2 = new ArrayList(this.mExceptions.size());
            Iterator<AbstractRecurrenceAdapter> it2 = this.mExceptions.iterator();
            while (it2.hasNext()) {
                arrayList2.add(it2.next().getIterator(timeZone, j));
            }
        }
        return new RecurrenceSetIterator(arrayList, arrayList2).setEnd(j2);
    }

    public boolean isInfinite() {
        return this.mIsInfinite;
    }

    public long getLastInstance(TimeZone timeZone, long j) {
        if (isInfinite()) {
            throw new IllegalStateException("can not calculate the last instance of an infinite recurrence set");
        }
        if (this.mExceptions != null && this.mExceptions.size() > 0) {
            long j2 = Long.MIN_VALUE;
            RecurrenceSetIterator it = iterator(timeZone, j);
            while (it.hasNext()) {
                j2 = it.next();
            }
            return j2;
        }
        if (this.mInstances.size() == 1) {
            return this.mInstances.get(0).getLastInstance(timeZone, j);
        }
        long j3 = Long.MIN_VALUE;
        Iterator<AbstractRecurrenceAdapter> it2 = this.mInstances.iterator();
        while (it2.hasNext()) {
            long lastInstance = it2.next().getLastInstance(timeZone, j);
            if (lastInstance > j3) {
                j3 = lastInstance;
            }
        }
        return j3;
    }
}
