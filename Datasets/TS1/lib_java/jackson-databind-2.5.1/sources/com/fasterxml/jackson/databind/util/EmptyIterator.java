package com.fasterxml.jackson.databind.util;

import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/util/EmptyIterator.class */
public class EmptyIterator<T> implements Iterator<T> {
    private static final EmptyIterator<?> instance = new EmptyIterator<>();

    public static <T> Iterator<T> instance() {
        return instance;
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        return false;
    }

    @Override // java.util.Iterator
    public T next() {
        throw new NoSuchElementException();
    }

    @Override // java.util.Iterator
    public void remove() {
        throw new UnsupportedOperationException();
    }
}
