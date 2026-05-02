package com.bea.xml.stream.util;

import java.util.AbstractCollection;
import java.util.Arrays;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/util/CircularQueue.class */
public final class CircularQueue extends AbstractCollection {
    private static final int MAX_CAPACITY = 1073741824;
    private static final int DEFAULT_CAPACITY = 256;
    private int size;
    private int producerIndex;
    private int consumerIndex;
    private int capacity;
    private int maxCapacity;
    private int bitmask;
    private Object[] q;

    public CircularQueue() {
        this(DEFAULT_CAPACITY);
    }

    public CircularQueue(int c) {
        this(c, MAX_CAPACITY);
    }

    public CircularQueue(int c, int mc) {
        this.size = 0;
        this.producerIndex = 0;
        this.consumerIndex = 0;
        if (c > mc) {
            throw new IllegalArgumentException("Capacity greater than maximum");
        }
        if (mc > MAX_CAPACITY) {
            throw new IllegalArgumentException("Maximum capacity greater than allowed");
        }
        this.capacity = 1;
        while (this.capacity < c) {
            this.capacity <<= 1;
        }
        this.maxCapacity = 1;
        while (this.maxCapacity < mc) {
            this.maxCapacity <<= 1;
        }
        this.bitmask = this.capacity - 1;
        this.q = new Object[this.capacity];
    }

    private CircularQueue(CircularQueue oldQueue) {
        this.size = 0;
        this.producerIndex = 0;
        this.consumerIndex = 0;
        this.size = oldQueue.size;
        this.producerIndex = oldQueue.producerIndex;
        this.consumerIndex = oldQueue.consumerIndex;
        this.capacity = oldQueue.capacity;
        this.maxCapacity = oldQueue.maxCapacity;
        this.bitmask = oldQueue.bitmask;
        this.q = new Object[oldQueue.q.length];
        System.arraycopy(oldQueue.q, 0, this.q, 0, this.q.length);
    }

    private boolean expandQueue() {
        if (this.capacity == this.maxCapacity) {
            return false;
        }
        int old_capacity = this.capacity;
        Object[] old_q = this.q;
        this.capacity += this.capacity;
        this.bitmask = this.capacity - 1;
        this.q = new Object[this.capacity];
        System.arraycopy(old_q, this.consumerIndex, this.q, 0, old_capacity - this.consumerIndex);
        if (this.consumerIndex != 0) {
            System.arraycopy(old_q, 0, this.q, old_capacity - this.consumerIndex, this.consumerIndex);
        }
        this.consumerIndex = 0;
        this.producerIndex = this.size;
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public boolean add(Object obj) {
        if (this.size == this.capacity && !expandQueue()) {
            return false;
        }
        this.size++;
        this.q[this.producerIndex] = obj;
        this.producerIndex = (this.producerIndex + 1) & this.bitmask;
        return true;
    }

    public Object remove() {
        if (this.size == 0) {
            return null;
        }
        this.size--;
        Object obj = this.q[this.consumerIndex];
        this.q[this.consumerIndex] = null;
        this.consumerIndex = (this.consumerIndex + 1) & this.bitmask;
        return obj;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public boolean isEmpty() {
        return this.size == 0;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public int size() {
        return this.size;
    }

    public int capacity() {
        return this.capacity;
    }

    public Object peek() {
        if (this.size == 0) {
            return null;
        }
        return this.q[this.consumerIndex];
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public void clear() {
        Arrays.fill(this.q, (Object) null);
        this.size = 0;
        this.producerIndex = 0;
        this.consumerIndex = 0;
    }

    public Object clone() {
        return new CircularQueue(this);
    }

    @Override // java.util.AbstractCollection
    public String toString() {
        StringBuffer s = new StringBuffer(new StringBuffer().append(super.toString()).append(" - capacity: '").append(capacity()).append("' size: '").append(size()).append("'").toString());
        if (this.size > 0) {
            s.append(" elements:");
            for (int i = 0; i < this.size; i++) {
                s.append('\n');
                s.append('\t');
                s.append(this.q[(this.consumerIndex + i) & this.bitmask].toString());
            }
        }
        return s.toString();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public Iterator iterator() {
        return new Iterator(this) { // from class: com.bea.xml.stream.util.CircularQueue.1
            private final int ci;
            private final int pi;
            private int s;
            private int i;
            private final CircularQueue this$0;

            @Override // java.util.Iterator
            public boolean hasNext() {
                checkForModification();
                return this.s > 0;
            }

            @Override // java.util.Iterator
            public Object next() {
                checkForModification();
                if (this.s == 0) {
                    throw new NoSuchElementException();
                }
                this.s--;
                Object r = this.this$0.q[this.i];
                this.i = (this.i + 1) & this.this$0.bitmask;
                return r;
            }

            @Override // java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException();
            }

            {
                this.this$0 = this;
                this.ci = this.this$0.consumerIndex;
                this.pi = this.this$0.producerIndex;
                this.s = this.this$0.size;
                this.i = this.ci;
            }

            private void checkForModification() {
                if (this.ci != this.this$0.consumerIndex) {
                    throw new ConcurrentModificationException();
                }
                if (this.pi != this.this$0.producerIndex) {
                    throw new ConcurrentModificationException();
                }
            }
        };
    }
}
