package org.acra.collections;

import android.support.annotation.NonNull;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/collections/BoundedLinkedList.class */
public final class BoundedLinkedList<E> extends LinkedList<E> {
    private final int maxSize;

    public BoundedLinkedList(int maxSize) {
        this.maxSize = maxSize;
    }

    @Override // java.util.LinkedList, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List, java.util.Deque, java.util.Queue
    public boolean add(E object) {
        if (size() == this.maxSize) {
            removeFirst();
        }
        return super.add(object);
    }

    @Override // java.util.LinkedList, java.util.AbstractSequentialList, java.util.AbstractList, java.util.List
    public void add(int location, E object) {
        if (size() == this.maxSize) {
            removeFirst();
        }
        super.add(location, object);
    }

    @Override // java.util.LinkedList, java.util.AbstractCollection, java.util.Collection, java.util.List, java.util.Deque
    public boolean addAll(@NonNull Collection<? extends E> collection) {
        int size = collection.size();
        if (size > this.maxSize) {
            LinkedList<? extends E> list = new LinkedList<>(collection);
            for (int i = 0; i < size - this.maxSize; i++) {
                list.removeFirst();
            }
            collection = list;
        }
        int totalNeededSize = size() + collection.size();
        int overhead = totalNeededSize - this.maxSize;
        if (overhead > 0) {
            removeRange(0, overhead);
        }
        return super.addAll(collection);
    }

    @Override // java.util.LinkedList, java.util.AbstractSequentialList, java.util.AbstractList, java.util.List
    public boolean addAll(int location, Collection<? extends E> collection) {
        if (location == size()) {
            return super.addAll(location, collection);
        }
        throw new UnsupportedOperationException();
    }

    @Override // java.util.LinkedList, java.util.Deque
    public void addFirst(E object) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.LinkedList, java.util.Deque
    public void addLast(E object) {
        add(object);
    }

    @Override // java.util.AbstractCollection
    @NonNull
    public String toString() {
        StringBuilder result = new StringBuilder();
        Iterator it = iterator();
        while (it.hasNext()) {
            result.append(it.next().toString());
        }
        return result.toString();
    }

    @Override // java.util.LinkedList, java.util.Deque, java.util.Queue
    public boolean offer(E o) {
        return add(o);
    }

    @Override // java.util.LinkedList, java.util.Deque
    public boolean offerFirst(E e) {
        addFirst(e);
        return true;
    }

    @Override // java.util.LinkedList, java.util.Deque
    public boolean offerLast(E e) {
        return add(e);
    }

    @Override // java.util.LinkedList, java.util.Deque
    public void push(E e) {
        add(e);
    }
}
