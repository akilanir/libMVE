package org.spongycastle.util;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/util/Selector.class */
public interface Selector<T> extends Cloneable {
    boolean match(T t);

    Object clone();
}
