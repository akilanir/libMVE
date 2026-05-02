package org.dmfs.rfc5545.recurrenceset;

import java.util.TimeZone;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter.class */
public abstract class AbstractRecurrenceAdapter {

    /* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator.class */
    interface InstanceIterator {
        boolean hasNext();

        long next();

        long peek();

        void skip(int i);

        void fastForward(long j);
    }

    abstract InstanceIterator getIterator(TimeZone timeZone, long j);

    abstract boolean isInfinite();

    abstract long getLastInstance(TimeZone timeZone, long j);
}
