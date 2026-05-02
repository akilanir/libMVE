package com.nostra13.universalimageloader.core.assist.deque;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.AbstractQueue;
import java.util.Collection;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque.class */
public class LinkedBlockingDeque<E> extends AbstractQueue<E> implements BlockingDeque<E>, Serializable {
    private static final long serialVersionUID = -387911632671998426L;
    transient Node<E> first;
    transient Node<E> last;
    private transient int count;
    private final int capacity;
    final ReentrantLock lock;
    private final Condition notEmpty;
    private final Condition notFull;

    /* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node.class */
    static final class Node<E> {
        E item;
        Node<E> prev;
        Node<E> next;

        Node(E x) {
            this.item = x;
        }
    }

    public LinkedBlockingDeque() {
        this(Integer.MAX_VALUE);
    }

    public LinkedBlockingDeque(int capacity) {
        this.lock = new ReentrantLock();
        this.notEmpty = this.lock.newCondition();
        this.notFull = this.lock.newCondition();
        if (capacity <= 0) {
            throw new IllegalArgumentException();
        }
        this.capacity = capacity;
    }

    public LinkedBlockingDeque(Collection<? extends E> c) {
        this(Integer.MAX_VALUE);
        ReentrantLock lock = this.lock;
        lock.lock();
        try {
            for (E e : c) {
                if (e == null) {
                    throw new NullPointerException();
                }
                if (!linkLast(new Node<>(e))) {
                    throw new IllegalStateException("Deque full");
                }
            }
        } finally {
            lock.unlock();
        }
    }

    private boolean linkFirst(Node<E> node) {
        if (this.count >= this.capacity) {
            return false;
        }
        Node<E> f = this.first;
        node.next = f;
        this.first = node;
        if (this.last == null) {
            this.last = node;
        } else {
            f.prev = node;
        }
        this.count++;
        this.notEmpty.signal();
        return true;
    }

    private boolean linkLast(Node<E> node) {
        if (this.count >= this.capacity) {
            return false;
        }
        Node<E> l = this.last;
        node.prev = l;
        this.last = node;
        if (this.first == null) {
            this.first = node;
        } else {
            l.next = node;
        }
        this.count++;
        this.notEmpty.signal();
        return true;
    }

    private E unlinkFirst() {
        Node<E> f = this.first;
        if (f == null) {
            return null;
        }
        Node<E> n = f.next;
        E item = f.item;
        f.item = null;
        f.next = f;
        this.first = n;
        if (n == null) {
            this.last = null;
        } else {
            n.prev = null;
        }
        this.count--;
        this.notFull.signal();
        return item;
    }

    private E unlinkLast() {
        Node<E> l = this.last;
        if (l == null) {
            return null;
        }
        Node<E> p = l.prev;
        E item = l.item;
        l.item = null;
        l.prev = l;
        this.last = p;
        if (p == null) {
            this.first = null;
        } else {
            p.next = null;
        }
        this.count--;
        this.notFull.signal();
        return item;
    }

    void unlink(Node<E> x) {
        Node<E> p = x.prev;
        Node<E> n = x.next;
        if (p == null) {
            unlinkFirst();
            return;
        }
        if (n == null) {
            unlinkLast();
            return;
        }
        p.next = n;
        n.prev = p;
        x.item = null;
        this.count--;
        this.notFull.signal();
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.BlockingDeque, com.nostra13.universalimageloader.core.assist.deque.Deque
    public void addFirst(E e) {
        if (!offerFirst(e)) {
            throw new IllegalStateException("Deque full");
        }
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.BlockingDeque, com.nostra13.universalimageloader.core.assist.deque.Deque
    public void addLast(E e) {
        if (!offerLast(e)) {
            throw new IllegalStateException("Deque full");
        }
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.BlockingDeque, com.nostra13.universalimageloader.core.assist.deque.Deque
    public boolean offerFirst(E e) {
        if (e == null) {
            throw new NullPointerException();
        }
        Node<E> node = new Node<>(e);
        ReentrantLock lock = this.lock;
        lock.lock();
        try {
            boolean linkFirst = linkFirst(node);
            lock.unlock();
            return linkFirst;
        } catch (Throwable th) {
            lock.unlock();
            throw th;
        }
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.BlockingDeque, com.nostra13.universalimageloader.core.assist.deque.Deque
    public boolean offerLast(E e) {
        if (e == null) {
            throw new NullPointerException();
        }
        Node<E> node = new Node<>(e);
        ReentrantLock lock = this.lock;
        lock.lock();
        try {
            boolean linkLast = linkLast(node);
            lock.unlock();
            return linkLast;
        } catch (Throwable th) {
            lock.unlock();
            throw th;
        }
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.BlockingDeque
    public void putFirst(E e) throws InterruptedException {
        if (e == null) {
            throw new NullPointerException();
        }
        Node<E> node = new Node<>(e);
        ReentrantLock lock = this.lock;
        lock.lock();
        while (!linkFirst(node)) {
            try {
                this.notFull.await();
            } finally {
                lock.unlock();
            }
        }
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.BlockingDeque
    public void putLast(E e) throws InterruptedException {
        if (e == null) {
            throw new NullPointerException();
        }
        Node<E> node = new Node<>(e);
        ReentrantLock lock = this.lock;
        lock.lock();
        while (!linkLast(node)) {
            try {
                this.notFull.await();
            } finally {
                lock.unlock();
            }
        }
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.BlockingDeque
    public boolean offerFirst(E e, long timeout, TimeUnit unit) throws InterruptedException {
        if (e == null) {
            throw new NullPointerException();
        }
        Node<E> node = new Node<>(e);
        long nanos = unit.toNanos(timeout);
        ReentrantLock lock = this.lock;
        lock.lockInterruptibly();
        while (!linkFirst(node)) {
            try {
                if (nanos <= 0) {
                    return false;
                }
                nanos = this.notFull.awaitNanos(nanos);
            } finally {
                lock.unlock();
            }
        }
        lock.unlock();
        return true;
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.BlockingDeque
    public boolean offerLast(E e, long timeout, TimeUnit unit) throws InterruptedException {
        if (e == null) {
            throw new NullPointerException();
        }
        Node<E> node = new Node<>(e);
        long nanos = unit.toNanos(timeout);
        ReentrantLock lock = this.lock;
        lock.lockInterruptibly();
        while (!linkLast(node)) {
            try {
                if (nanos <= 0) {
                    return false;
                }
                nanos = this.notFull.awaitNanos(nanos);
            } finally {
                lock.unlock();
            }
        }
        lock.unlock();
        return true;
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.Deque
    public E removeFirst() {
        E x = pollFirst();
        if (x == null) {
            throw new NoSuchElementException();
        }
        return x;
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.Deque
    public E removeLast() {
        E x = pollLast();
        if (x == null) {
            throw new NoSuchElementException();
        }
        return x;
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.Deque
    public E pollFirst() {
        ReentrantLock lock = this.lock;
        lock.lock();
        try {
            E unlinkFirst = unlinkFirst();
            lock.unlock();
            return unlinkFirst;
        } catch (Throwable th) {
            lock.unlock();
            throw th;
        }
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.Deque
    public E pollLast() {
        ReentrantLock lock = this.lock;
        lock.lock();
        try {
            E unlinkLast = unlinkLast();
            lock.unlock();
            return unlinkLast;
        } catch (Throwable th) {
            lock.unlock();
            throw th;
        }
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.BlockingDeque
    public E takeFirst() throws InterruptedException {
        ReentrantLock lock = this.lock;
        lock.lock();
        while (true) {
            try {
                E x = unlinkFirst();
                if (x == null) {
                    this.notEmpty.await();
                } else {
                    return x;
                }
            } finally {
                lock.unlock();
            }
        }
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.BlockingDeque
    public E takeLast() throws InterruptedException {
        ReentrantLock lock = this.lock;
        lock.lock();
        while (true) {
            try {
                E x = unlinkLast();
                if (x == null) {
                    this.notEmpty.await();
                } else {
                    return x;
                }
            } finally {
                lock.unlock();
            }
        }
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.BlockingDeque
    public E pollFirst(long timeout, TimeUnit unit) throws InterruptedException {
        long nanos = unit.toNanos(timeout);
        ReentrantLock lock = this.lock;
        lock.lockInterruptibly();
        while (true) {
            try {
                E x = unlinkFirst();
                if (x != null) {
                    lock.unlock();
                    return x;
                }
                if (nanos <= 0) {
                    return null;
                }
                nanos = this.notEmpty.awaitNanos(nanos);
            } finally {
                lock.unlock();
            }
        }
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.BlockingDeque
    public E pollLast(long timeout, TimeUnit unit) throws InterruptedException {
        long nanos = unit.toNanos(timeout);
        ReentrantLock lock = this.lock;
        lock.lockInterruptibly();
        while (true) {
            try {
                E x = unlinkLast();
                if (x != null) {
                    lock.unlock();
                    return x;
                }
                if (nanos <= 0) {
                    return null;
                }
                nanos = this.notEmpty.awaitNanos(nanos);
            } finally {
                lock.unlock();
            }
        }
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.Deque
    public E getFirst() {
        E x = peekFirst();
        if (x == null) {
            throw new NoSuchElementException();
        }
        return x;
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.Deque
    public E getLast() {
        E x = peekLast();
        if (x == null) {
            throw new NoSuchElementException();
        }
        return x;
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.Deque
    public E peekFirst() {
        ReentrantLock lock = this.lock;
        lock.lock();
        try {
            return this.first == null ? null : this.first.item;
        } finally {
            lock.unlock();
        }
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.Deque
    public E peekLast() {
        ReentrantLock lock = this.lock;
        lock.lock();
        try {
            return this.last == null ? null : this.last.item;
        } finally {
            lock.unlock();
        }
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.BlockingDeque, com.nostra13.universalimageloader.core.assist.deque.Deque
    public boolean removeFirstOccurrence(Object o) {
        if (o == null) {
            return false;
        }
        ReentrantLock lock = this.lock;
        lock.lock();
        try {
            for (Node<E> p = this.first; p != null; p = p.next) {
                if (o.equals(p.item)) {
                    unlink(p);
                    lock.unlock();
                    return true;
                }
            }
            return false;
        } finally {
            lock.unlock();
        }
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.BlockingDeque, com.nostra13.universalimageloader.core.assist.deque.Deque
    public boolean removeLastOccurrence(Object o) {
        if (o == null) {
            return false;
        }
        ReentrantLock lock = this.lock;
        lock.lock();
        try {
            for (Node<E> p = this.last; p != null; p = p.prev) {
                if (o.equals(p.item)) {
                    unlink(p);
                    lock.unlock();
                    return true;
                }
            }
            return false;
        } finally {
            lock.unlock();
        }
    }

    @Override // java.util.AbstractQueue, java.util.AbstractCollection, java.util.Collection, java.util.Queue, com.nostra13.universalimageloader.core.assist.deque.BlockingDeque, java.util.concurrent.BlockingQueue, com.nostra13.universalimageloader.core.assist.deque.Deque
    public boolean add(E e) {
        addLast(e);
        return true;
    }

    public boolean offer(E e) {
        return offerLast(e);
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.BlockingDeque, java.util.concurrent.BlockingQueue
    public void put(E e) throws InterruptedException {
        putLast(e);
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.BlockingDeque, java.util.concurrent.BlockingQueue
    public boolean offer(E e, long timeout, TimeUnit unit) throws InterruptedException {
        return offerLast(e, timeout, unit);
    }

    @Override // java.util.AbstractQueue, java.util.Queue, com.nostra13.universalimageloader.core.assist.deque.BlockingDeque, com.nostra13.universalimageloader.core.assist.deque.Deque
    public E remove() {
        return removeFirst();
    }

    @Override // java.util.Queue, com.nostra13.universalimageloader.core.assist.deque.BlockingDeque, com.nostra13.universalimageloader.core.assist.deque.Deque
    public E poll() {
        return pollFirst();
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.BlockingDeque, java.util.concurrent.BlockingQueue
    public E take() throws InterruptedException {
        return takeFirst();
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.BlockingDeque, java.util.concurrent.BlockingQueue
    public E poll(long timeout, TimeUnit unit) throws InterruptedException {
        return pollFirst(timeout, unit);
    }

    @Override // java.util.AbstractQueue, java.util.Queue, com.nostra13.universalimageloader.core.assist.deque.BlockingDeque, com.nostra13.universalimageloader.core.assist.deque.Deque
    public E element() {
        return getFirst();
    }

    @Override // java.util.Queue, com.nostra13.universalimageloader.core.assist.deque.BlockingDeque, com.nostra13.universalimageloader.core.assist.deque.Deque
    public E peek() {
        return peekFirst();
    }

    @Override // java.util.concurrent.BlockingQueue
    public int remainingCapacity() {
        ReentrantLock lock = this.lock;
        lock.lock();
        try {
            int i = this.capacity - this.count;
            lock.unlock();
            return i;
        } catch (Throwable th) {
            lock.unlock();
            throw th;
        }
    }

    @Override // java.util.concurrent.BlockingQueue
    public int drainTo(Collection<? super E> c) {
        return drainTo(c, Integer.MAX_VALUE);
    }

    @Override // java.util.concurrent.BlockingQueue
    public int drainTo(Collection<? super E> collection, int i) {
        if (collection == null) {
            throw new NullPointerException();
        }
        if (collection == this) {
            throw new IllegalArgumentException();
        }
        ReentrantLock reentrantLock = this.lock;
        reentrantLock.lock();
        try {
            int min = Math.min(i, this.count);
            for (int i2 = 0; i2 < min; i2++) {
                collection.add(this.first.item);
                unlinkFirst();
            }
            return min;
        } finally {
            reentrantLock.unlock();
        }
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.BlockingDeque, com.nostra13.universalimageloader.core.assist.deque.Deque
    public void push(E e) {
        addFirst(e);
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.Deque
    public E pop() {
        return removeFirst();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, com.nostra13.universalimageloader.core.assist.deque.BlockingDeque, java.util.concurrent.BlockingQueue, com.nostra13.universalimageloader.core.assist.deque.Deque
    public boolean remove(Object o) {
        return removeFirstOccurrence(o);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, com.nostra13.universalimageloader.core.assist.deque.BlockingDeque, com.nostra13.universalimageloader.core.assist.deque.Deque
    public int size() {
        ReentrantLock lock = this.lock;
        lock.lock();
        try {
            int i = this.count;
            lock.unlock();
            return i;
        } catch (Throwable th) {
            lock.unlock();
            throw th;
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, com.nostra13.universalimageloader.core.assist.deque.BlockingDeque, java.util.concurrent.BlockingQueue, com.nostra13.universalimageloader.core.assist.deque.Deque
    public boolean contains(Object o) {
        if (o == null) {
            return false;
        }
        ReentrantLock lock = this.lock;
        lock.lock();
        try {
            for (Node<E> p = this.first; p != null; p = p.next) {
                if (o.equals(p.item)) {
                    return true;
                }
            }
            lock.unlock();
            return false;
        } finally {
            lock.unlock();
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public Object[] toArray() {
        ReentrantLock lock = this.lock;
        lock.lock();
        try {
            Object[] a = new Object[this.count];
            int k = 0;
            for (Node<E> p = this.first; p != null; p = p.next) {
                int i = k;
                k++;
                a[i] = p.item;
            }
            return a;
        } finally {
            lock.unlock();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v17 */
    /* JADX WARN: Type inference failed for: r0v25, types: [java.lang.Object[]] */
    @Override // java.util.AbstractCollection, java.util.Collection
    public <T> T[] toArray(T[] a) {
        ReentrantLock lock = this.lock;
        lock.lock();
        try {
            if (a.length < this.count) {
                a = (Object[]) Array.newInstance(a.getClass().getComponentType(), this.count);
            }
            int k = 0;
            for (Node<E> p = this.first; p != null; p = p.next) {
                int i = k;
                k++;
                a[i] = p.item;
            }
            if (a.length > k) {
                a[k] = null;
            }
            return a;
        } finally {
            lock.unlock();
        }
    }

    @Override // java.util.AbstractCollection
    public String toString() {
        ReentrantLock lock = this.lock;
        lock.lock();
        try {
            Node<E> p = this.first;
            if (p == null) {
                return "[]";
            }
            StringBuilder sb = new StringBuilder();
            sb.append('[');
            while (true) {
                E e = p.item;
                sb.append(e == this ? "(this Collection)" : e);
                p = p.next;
                if (p == null) {
                    String sb2 = sb.append(']').toString();
                    lock.unlock();
                    return sb2;
                }
                sb.append(',').append(' ');
            }
        } finally {
            lock.unlock();
        }
    }

    @Override // java.util.AbstractQueue, java.util.AbstractCollection, java.util.Collection
    public void clear() {
        ReentrantLock lock = this.lock;
        lock.lock();
        try {
            Node<E> f = this.first;
            while (f != null) {
                f.item = null;
                Node<E> n = f.next;
                f.prev = null;
                f.next = null;
                f = n;
            }
            this.last = null;
            this.first = null;
            this.count = 0;
            this.notFull.signalAll();
            lock.unlock();
        } catch (Throwable th) {
            lock.unlock();
            throw th;
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, com.nostra13.universalimageloader.core.assist.deque.BlockingDeque, com.nostra13.universalimageloader.core.assist.deque.Deque
    public Iterator<E> iterator() {
        return new Itr();
    }

    @Override // com.nostra13.universalimageloader.core.assist.deque.Deque
    public Iterator<E> descendingIterator() {
        return new DescendingItr();
    }

    /* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr.class */
    private abstract class AbstractItr implements Iterator<E> {
        Node<E> next;
        E nextItem;
        private Node<E> lastRet;

        abstract Node<E> firstNode();

        abstract Node<E> nextNode(Node<E> node);

        AbstractItr() {
            ReentrantLock lock = LinkedBlockingDeque.this.lock;
            lock.lock();
            try {
                this.next = firstNode();
                this.nextItem = this.next == null ? null : this.next.item;
                lock.unlock();
            } catch (Throwable th) {
                lock.unlock();
                throw th;
            }
        }

        private Node<E> succ(Node<E> n) {
            while (true) {
                Node<E> s = nextNode(n);
                if (s == null) {
                    return null;
                }
                if (s.item != null) {
                    return s;
                }
                if (s == n) {
                    return firstNode();
                }
                n = s;
            }
        }

        void advance() {
            ReentrantLock lock = LinkedBlockingDeque.this.lock;
            lock.lock();
            try {
                this.next = succ(this.next);
                this.nextItem = this.next == null ? null : this.next.item;
                lock.unlock();
            } catch (Throwable th) {
                lock.unlock();
                throw th;
            }
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.next != null;
        }

        @Override // java.util.Iterator
        public E next() {
            if (this.next == null) {
                throw new NoSuchElementException();
            }
            this.lastRet = this.next;
            E x = this.nextItem;
            advance();
            return x;
        }

        @Override // java.util.Iterator
        public void remove() {
            Node<E> n = this.lastRet;
            if (n == null) {
                throw new IllegalStateException();
            }
            this.lastRet = null;
            ReentrantLock lock = LinkedBlockingDeque.this.lock;
            lock.lock();
            try {
                if (n.item != null) {
                    LinkedBlockingDeque.this.unlink(n);
                }
            } finally {
                lock.unlock();
            }
        }
    }

    /* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Itr.class */
    private class Itr extends AbstractItr {
        private Itr() {
            super();
        }

        @Override // com.nostra13.universalimageloader.core.assist.deque.LinkedBlockingDeque.AbstractItr
        Node<E> firstNode() {
            return LinkedBlockingDeque.this.first;
        }

        @Override // com.nostra13.universalimageloader.core.assist.deque.LinkedBlockingDeque.AbstractItr
        Node<E> nextNode(Node<E> n) {
            return n.next;
        }
    }

    /* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$DescendingItr.class */
    private class DescendingItr extends AbstractItr {
        private DescendingItr() {
            super();
        }

        @Override // com.nostra13.universalimageloader.core.assist.deque.LinkedBlockingDeque.AbstractItr
        Node<E> firstNode() {
            return LinkedBlockingDeque.this.last;
        }

        @Override // com.nostra13.universalimageloader.core.assist.deque.LinkedBlockingDeque.AbstractItr
        Node<E> nextNode(Node<E> n) {
            return n.prev;
        }
    }

    private void writeObject(ObjectOutputStream s) throws IOException {
        ReentrantLock lock = this.lock;
        lock.lock();
        try {
            s.defaultWriteObject();
            for (Node<E> p = this.first; p != null; p = p.next) {
                s.writeObject(p.item);
            }
            s.writeObject(null);
            lock.unlock();
        } catch (Throwable th) {
            lock.unlock();
            throw th;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void readObject(ObjectInputStream s) throws IOException, ClassNotFoundException {
        s.defaultReadObject();
        this.count = 0;
        this.first = null;
        this.last = null;
        while (true) {
            Object readObject = s.readObject();
            if (readObject != null) {
                add(readObject);
            } else {
                return;
            }
        }
    }
}
