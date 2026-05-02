package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;

@GwtCompatible
/* loaded from: guava-15.0.jar:com/google/common/collect/ForwardingObject.class */
public abstract class ForwardingObject {
    protected abstract Object delegate();

    protected ForwardingObject() {
    }

    public String toString() {
        return delegate().toString();
    }
}
