package com.octo.android.robospice.priority;

import java.util.concurrent.FutureTask;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/priority/PriorityFuture.class */
public class PriorityFuture<T> extends FutureTask<T> implements Comparable<PriorityFuture<T>> {
    private int priority;

    public PriorityFuture(Runnable other, int priority, T result) {
        super(other, result);
        this.priority = priority;
    }

    public int getPriority() {
        return this.priority;
    }

    @Override // java.lang.Comparable
    public int compareTo(PriorityFuture<T> other) {
        return this.priority - other.priority;
    }

    public int hashCode() {
        int result = (31 * 1) + this.priority;
        return result;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        PriorityFuture<?> other = (PriorityFuture) obj;
        if (this.priority != other.priority) {
            return false;
        }
        return true;
    }
}
