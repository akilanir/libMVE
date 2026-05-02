package com.bea.xml.stream.util;

import java.util.AbstractCollection;
import java.util.EmptyStackException;
import java.util.Iterator;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/util/Stack.class */
public final class Stack extends AbstractCollection {
    private Object[] values;
    private int pointer;

    public Stack() {
        this(15);
    }

    public Stack(int size) {
        if (size < 0) {
            throw new IllegalArgumentException();
        }
        this.values = new Object[size];
        this.pointer = 0;
    }

    private Stack(Object[] values, int pointer) {
        this.values = values;
        this.pointer = pointer;
    }

    private void resize() {
        if (this.pointer == 0) {
            this.values = new Object[1];
            return;
        }
        Object[] o = new Object[this.pointer * 2];
        System.arraycopy(this.values, 0, o, 0, this.pointer);
        this.values = o;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public boolean add(Object o) {
        push(o);
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public void clear() {
        Object[] v = this.values;
        while (this.pointer > 0) {
            int i = this.pointer - 1;
            this.pointer = i;
            v[i] = null;
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public boolean isEmpty() {
        return this.pointer == 0;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public Iterator iterator() {
        Object[] o = new Object[this.pointer];
        System.arraycopy(this.values, 0, o, 0, this.pointer);
        return new ArrayIterator(o);
    }

    public Object clone() {
        Object[] newValues = new Object[this.pointer];
        System.arraycopy(this.values, 0, newValues, 0, this.pointer);
        return new Stack(newValues, this.pointer);
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public int size() {
        return this.pointer;
    }

    public void push(Object o) {
        if (this.pointer == this.values.length) {
            resize();
        }
        Object[] objArr = this.values;
        int i = this.pointer;
        this.pointer = i + 1;
        objArr[i] = o;
    }

    public Object pop() {
        try {
            Object[] objArr = this.values;
            int i = this.pointer - 1;
            this.pointer = i;
            Object o = objArr[i];
            this.values[this.pointer] = null;
            return o;
        } catch (ArrayIndexOutOfBoundsException e) {
            if (this.pointer < 0) {
                this.pointer = 0;
            }
            throw new EmptyStackException();
        }
    }

    public Object peek() {
        try {
            return this.values[this.pointer - 1];
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new EmptyStackException();
        }
    }
}
