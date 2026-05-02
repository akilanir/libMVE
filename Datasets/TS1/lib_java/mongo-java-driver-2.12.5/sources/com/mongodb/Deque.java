package com.mongodb;

import java.util.Iterator;
import java.util.Queue;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/Deque.class */
interface Deque<E> extends Queue<E> {
    boolean offerFirst(E e);

    boolean offerLast(E e);

    void addFirst(E e);

    void addLast(E e);

    E pollFirst();

    E pollLast();

    E removeFirst();

    E removeLast();

    E peekFirst();

    E peekLast();

    E getFirst();

    E getLast();

    boolean removeFirstOccurrence(Object obj);

    boolean removeLastOccurrence(Object obj);

    @Override // java.util.Queue
    boolean offer(E e);

    @Override // java.util.Collection, com.mongodb.Deque, java.util.Queue
    boolean add(E e);

    @Override // java.util.Queue
    E poll();

    @Override // java.util.Queue
    E remove();

    @Override // java.util.Queue
    E peek();

    @Override // java.util.Queue
    E element();

    void push(E e);

    E pop();

    Iterator<E> iterator();
}
