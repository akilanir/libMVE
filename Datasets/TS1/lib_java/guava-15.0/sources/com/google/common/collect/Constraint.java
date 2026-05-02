package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;

@Beta
@GwtCompatible
@Deprecated
/* loaded from: guava-15.0.jar:com/google/common/collect/Constraint.class */
public interface Constraint<E> {
    E checkElement(E e);

    String toString();
}
