package com.koushikdutta.async;

import java.util.Iterator;
import java.util.Queue;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/Deque.class */
public interface Deque<E> extends Queue<E> {
    void addFirst(E e);

    void addLast(E e);

    boolean offerFirst(E e);

    boolean offerLast(E e);

    E removeFirst();

    E removeLast();

    E pollFirst();

    E pollLast();

    E getFirst();

    E getLast();

    E peekFirst();

    E peekLast();

    boolean removeFirstOccurrence(Object obj);

    boolean removeLastOccurrence(Object obj);

    @Override // java.util.Collection, com.koushikdutta.async.Deque, java.util.Queue
    boolean add(E e);

    @Override // java.util.Queue
    boolean offer(E e);

    @Override // java.util.Queue
    E remove();

    @Override // java.util.Queue
    E poll();

    @Override // java.util.Queue
    E element();

    @Override // java.util.Queue
    E peek();

    void push(E e);

    E pop();

    boolean remove(Object obj);

    boolean contains(Object obj);

    int size();

    Iterator<E> iterator();

    Iterator<E> descendingIterator();
}
