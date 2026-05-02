package org.acra.collections;

import java.util.Iterator;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/collections/UnmodifiableIteratorWrapper.class */
class UnmodifiableIteratorWrapper<E> implements Iterator<E> {
    private final Iterator<E> mIterator;

    UnmodifiableIteratorWrapper(Iterator<E> mIterator) {
        this.mIterator = mIterator;
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        return this.mIterator.hasNext();
    }

    @Override // java.util.Iterator
    public E next() {
        return this.mIterator.next();
    }

    @Override // java.util.Iterator
    public void remove() {
        throw new UnsupportedOperationException();
    }
}
