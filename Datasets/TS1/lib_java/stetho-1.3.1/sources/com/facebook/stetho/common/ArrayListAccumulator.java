package com.facebook.stetho.common;

import java.util.ArrayList;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/ArrayListAccumulator.class */
public final class ArrayListAccumulator<E> extends ArrayList<E> implements Accumulator<E> {
    @Override // com.facebook.stetho.common.Accumulator
    public void store(E object) {
        add(object);
    }
}
