package com.nostra13.universalimageloader.core.assist.deque;

import java.util.Iterator;
import java.util.Queue;

/* loaded from: universal-image-loader-1.9.5.jar:com/nostra13/universalimageloader/core/assist/deque/Deque.class */
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

    boolean add(E e);

    boolean offer(E e);

    E remove();

    E poll();

    E element();

    E peek();

    void push(E e);

    E pop();

    boolean remove(Object obj);

    boolean contains(Object obj);

    int size();

    Iterator<E> iterator();

    Iterator<E> descendingIterator();
}
