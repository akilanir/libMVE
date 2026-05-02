package com.bea.xml.stream.util;

import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/util/ArrayIterator.class */
public final class ArrayIterator implements Iterator {
    private final Object[] array;
    private final int maxIndex;
    private int index;

    public ArrayIterator(Object[] a) {
        this(a, 0, a.length);
    }

    public ArrayIterator(Object[] a, int off, int len) {
        if (off < 0) {
            throw new IllegalArgumentException();
        }
        if (off > a.length) {
            throw new IllegalArgumentException();
        }
        if (len > a.length - off) {
            throw new IllegalArgumentException();
        }
        this.array = a;
        this.index = off;
        this.maxIndex = len + off;
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        return this.index < this.maxIndex;
    }

    @Override // java.util.Iterator
    public Object next() {
        if (this.index >= this.maxIndex) {
            throw new NoSuchElementException();
        }
        Object[] objArr = this.array;
        int i = this.index;
        this.index = i + 1;
        return objArr[i];
    }

    @Override // java.util.Iterator
    public void remove() {
        throw new UnsupportedOperationException();
    }
}
