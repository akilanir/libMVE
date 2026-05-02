package com.google.common.base;

import java.lang.ref.WeakReference;

/* loaded from: guava-15.0.jar:com/google/common/base/FinalizableWeakReference.class */
public abstract class FinalizableWeakReference<T> extends WeakReference<T> implements FinalizableReference {
    protected FinalizableWeakReference(T referent, FinalizableReferenceQueue queue) {
        super(referent, queue.queue);
        queue.cleanUp();
    }
}
