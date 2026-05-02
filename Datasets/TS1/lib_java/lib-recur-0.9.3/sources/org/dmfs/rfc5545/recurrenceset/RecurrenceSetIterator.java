package org.dmfs.rfc5545.recurrenceset;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import org.dmfs.rfc5545.recur.StaticUtils;
import org.dmfs.rfc5545.recurrenceset.AbstractRecurrenceAdapter;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recurrenceset/RecurrenceSetIterator.class */
public class RecurrenceSetIterator {
    private static final int INSTANCE_CACHE_SIZE = 32;
    private static final int EXCEPTION_CACHE_SIZE = 16;
    private static final int MAX_SKIPPED_INSTANCES = 1000;
    private AbstractRecurrenceAdapter.InstanceIterator[] mInstances;
    private AbstractRecurrenceAdapter.InstanceIterator[] mExceptions;
    private long[] mInstanceCache;
    private int mInstancesInCache;
    private long[] mExceptionCache;
    private int mExceptionsInCache;
    private int mLastExceptionIndex;
    private int mNextInstance = 0;
    private long mIterateEnd = Long.MAX_VALUE;
    private Comparator<AbstractRecurrenceAdapter.InstanceIterator> mAdapterComparator = new Comparator<AbstractRecurrenceAdapter.InstanceIterator>() { // from class: org.dmfs.rfc5545.recurrenceset.RecurrenceSetIterator.1
        @Override // java.util.Comparator
        public int compare(AbstractRecurrenceAdapter.InstanceIterator instanceIterator, AbstractRecurrenceAdapter.InstanceIterator instanceIterator2) {
            boolean hasNext = instanceIterator.hasNext();
            boolean hasNext2 = instanceIterator2.hasNext();
            if (!hasNext || !hasNext2) {
                return hasNext ? -1 : 1;
            }
            long peek = instanceIterator.peek() - instanceIterator2.peek();
            if (peek < 0) {
                return -1;
            }
            return peek > 0 ? 1 : 0;
        }
    };

    RecurrenceSetIterator(List<AbstractRecurrenceAdapter.InstanceIterator> list, List<AbstractRecurrenceAdapter.InstanceIterator> list2) {
        this.mInstances = (AbstractRecurrenceAdapter.InstanceIterator[]) list.toArray(new AbstractRecurrenceAdapter.InstanceIterator[list.size()]);
        Arrays.sort(this.mInstances, this.mAdapterComparator);
        if (list2 == null || list2.size() <= 0) {
            this.mExceptions = null;
        } else {
            this.mExceptions = (AbstractRecurrenceAdapter.InstanceIterator[]) list2.toArray(new AbstractRecurrenceAdapter.InstanceIterator[list2.size()]);
            Arrays.sort(this.mExceptions, this.mAdapterComparator);
        }
    }

    RecurrenceSetIterator setEnd(long j) {
        this.mIterateEnd = j;
        return this;
    }

    public boolean hasNext() {
        if (this.mInstanceCache == null || this.mNextInstance == INSTANCE_CACHE_SIZE) {
            fillInstanceCache();
        }
        return this.mNextInstance < this.mInstancesInCache;
    }

    public long next() {
        if (this.mInstanceCache == null || this.mNextInstance == INSTANCE_CACHE_SIZE) {
            fillInstanceCache();
        }
        if (this.mNextInstance >= this.mInstancesInCache) {
            throw new ArrayIndexOutOfBoundsException("no more instances to iterate");
        }
        long[] jArr = this.mInstanceCache;
        int i = this.mNextInstance;
        this.mNextInstance = i + 1;
        return jArr[i];
    }

    public void fastForward(long j) {
        if (this.mInstanceCache != null) {
            long[] jArr = this.mInstanceCache;
            int i = this.mNextInstance;
            int i2 = this.mInstancesInCache;
            while (i < i2 && jArr[i] < j) {
                i++;
            }
            if (i < i2) {
                this.mNextInstance = i;
                return;
            }
        }
        for (AbstractRecurrenceAdapter.InstanceIterator instanceIterator : this.mInstances) {
            instanceIterator.fastForward(j);
        }
        if (this.mExceptions != null) {
            for (AbstractRecurrenceAdapter.InstanceIterator instanceIterator2 : this.mExceptions) {
                instanceIterator2.fastForward(j);
            }
        }
    }

    private void fillInstanceCache() {
        long next;
        long[] jArr = this.mInstanceCache;
        if (jArr == null) {
            jArr = new long[INSTANCE_CACHE_SIZE];
            this.mInstanceCache = jArr;
        }
        long j = this.mIterateEnd;
        AbstractRecurrenceAdapter.InstanceIterator[] instanceIteratorArr = this.mInstances;
        int i = 0;
        int i2 = 0;
        long j2 = Long.MIN_VALUE;
        if (instanceIteratorArr != null && instanceIteratorArr.length == 1) {
            AbstractRecurrenceAdapter.InstanceIterator instanceIterator = instanceIteratorArr[0];
            while (instanceIterator.hasNext() && i < INSTANCE_CACHE_SIZE) {
                try {
                    next = instanceIterator.next();
                } catch (IllegalArgumentException e) {
                    this.mInstances = null;
                }
                if (next > j) {
                    break;
                }
                if (j2 != next && !isException(next)) {
                    jArr[i] = next;
                    i++;
                    i2 = 0;
                    j2 = next;
                } else if (j2 != next) {
                    j2 = next;
                    i2++;
                    if (i2 >= MAX_SKIPPED_INSTANCES) {
                        break;
                    }
                } else {
                    continue;
                }
            }
        } else if (instanceIteratorArr != null) {
            while (instanceIteratorArr.length > 0 && i < INSTANCE_CACHE_SIZE) {
                AbstractRecurrenceAdapter.InstanceIterator instanceIterator2 = instanceIteratorArr[0];
                try {
                    if (instanceIterator2.hasNext()) {
                        long next2 = instanceIterator2.next();
                        if (next2 > j) {
                            break;
                        }
                        if (!isException(next2) && j2 != next2) {
                            jArr[i] = next2;
                            i++;
                            i2 = 0;
                            j2 = next2;
                        } else if (j2 != next2) {
                            j2 = next2;
                            i2++;
                            if (i2 >= MAX_SKIPPED_INSTANCES) {
                                break;
                            }
                        }
                        Arrays.sort(instanceIteratorArr, this.mAdapterComparator);
                    } else {
                        AbstractRecurrenceAdapter.InstanceIterator[] instanceIteratorArr2 = new AbstractRecurrenceAdapter.InstanceIterator[instanceIteratorArr.length - 1];
                        System.arraycopy(instanceIteratorArr, 1, instanceIteratorArr2, 0, instanceIteratorArr2.length);
                        this.mInstances = instanceIteratorArr2;
                        instanceIteratorArr = instanceIteratorArr2;
                    }
                } catch (IllegalArgumentException e2) {
                    AbstractRecurrenceAdapter.InstanceIterator[] instanceIteratorArr3 = new AbstractRecurrenceAdapter.InstanceIterator[instanceIteratorArr.length - 1];
                    System.arraycopy(instanceIteratorArr, 1, instanceIteratorArr3, 0, instanceIteratorArr3.length);
                    this.mInstances = instanceIteratorArr3;
                    instanceIteratorArr = instanceIteratorArr3;
                }
            }
        }
        this.mInstancesInCache = i;
        this.mNextInstance = 0;
    }

    private boolean isException(long j) {
        if (this.mExceptions == null) {
            return false;
        }
        if (this.mExceptionCache == null) {
            fillExceptionCache();
        }
        while (this.mExceptionsInCache > 0 && j >= this.mExceptionCache[0]) {
            if (j <= this.mExceptionCache[this.mExceptionsInCache - 1]) {
                int linearSearch = StaticUtils.linearSearch(this.mExceptionCache, this.mLastExceptionIndex + 1, this.mExceptionsInCache, j);
                if (linearSearch < 0) {
                    return false;
                }
                this.mLastExceptionIndex = linearSearch;
                return true;
            }
            fillExceptionCache();
        }
        return false;
    }

    private void fillExceptionCache() {
        long next;
        this.mLastExceptionIndex = 0;
        long[] jArr = this.mExceptionCache;
        if (jArr == null) {
            long[] jArr2 = new long[EXCEPTION_CACHE_SIZE];
            this.mExceptionCache = jArr2;
            jArr = jArr2;
        }
        long j = this.mIterateEnd;
        AbstractRecurrenceAdapter.InstanceIterator[] instanceIteratorArr = this.mExceptions;
        int i = 0;
        if (instanceIteratorArr.length == 0) {
            return;
        }
        if (instanceIteratorArr.length == 1) {
            AbstractRecurrenceAdapter.InstanceIterator instanceIterator = instanceIteratorArr[0];
            if (!instanceIterator.hasNext()) {
                this.mExceptions = null;
                this.mExceptionsInCache = 0;
                return;
            }
            while (instanceIterator.hasNext() && i < EXCEPTION_CACHE_SIZE) {
                try {
                    next = instanceIterator.next();
                    jArr[i] = next;
                } catch (IllegalArgumentException e) {
                    this.mExceptions = null;
                }
                if (next > j) {
                    break;
                } else {
                    i++;
                }
            }
        } else {
            while (instanceIteratorArr.length > 0 && i < EXCEPTION_CACHE_SIZE) {
                AbstractRecurrenceAdapter.InstanceIterator instanceIterator2 = instanceIteratorArr[0];
                try {
                    if (instanceIterator2.hasNext()) {
                        long next2 = instanceIterator2.next();
                        jArr[i] = next2;
                        if (next2 > j) {
                            break;
                        }
                        i++;
                        Arrays.sort(instanceIteratorArr, this.mAdapterComparator);
                    } else if (instanceIteratorArr.length > 1) {
                        AbstractRecurrenceAdapter.InstanceIterator[] instanceIteratorArr2 = new AbstractRecurrenceAdapter.InstanceIterator[instanceIteratorArr.length - 1];
                        System.arraycopy(instanceIteratorArr, 1, instanceIteratorArr2, 0, instanceIteratorArr2.length);
                        this.mExceptions = instanceIteratorArr2;
                        instanceIteratorArr = instanceIteratorArr2;
                    } else {
                        this.mExceptions = null;
                        instanceIteratorArr = null;
                    }
                } catch (IllegalArgumentException e2) {
                    if (instanceIteratorArr.length > 1) {
                        AbstractRecurrenceAdapter.InstanceIterator[] instanceIteratorArr3 = new AbstractRecurrenceAdapter.InstanceIterator[instanceIteratorArr.length - 1];
                        System.arraycopy(instanceIteratorArr, 1, instanceIteratorArr3, 0, instanceIteratorArr3.length);
                        this.mExceptions = instanceIteratorArr3;
                        instanceIteratorArr = instanceIteratorArr3;
                    } else {
                        this.mExceptions = null;
                        instanceIteratorArr = null;
                    }
                }
            }
        }
        this.mExceptionsInCache = i;
    }
}
