package org.apache.commons.collections;

import java.util.ArrayList;
import java.util.EmptyStackException;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/collections/ArrayStack.class */
public class ArrayStack extends ArrayList implements Buffer {
    private static final long serialVersionUID = 2130079159931574599L;

    public ArrayStack() {
    }

    public ArrayStack(int initialSize) {
        super(initialSize);
    }

    public boolean empty() {
        return isEmpty();
    }

    public Object peek() throws EmptyStackException {
        int n = size();
        if (n <= 0) {
            throw new EmptyStackException();
        }
        return get(n - 1);
    }

    public Object peek(int n) throws EmptyStackException {
        int m = (size() - n) - 1;
        if (m < 0) {
            throw new EmptyStackException();
        }
        return get(m);
    }

    public Object pop() throws EmptyStackException {
        int n = size();
        if (n <= 0) {
            throw new EmptyStackException();
        }
        return remove(n - 1);
    }

    public Object push(Object item) {
        add(item);
        return item;
    }

    public int search(Object object) {
        int i = size() - 1;
        int n = 1;
        while (i >= 0) {
            Object current = get(i);
            if ((object == null && current == null) || (object != null && object.equals(current))) {
                return n;
            }
            i--;
            n++;
        }
        return -1;
    }

    @Override // org.apache.commons.collections.Buffer
    public Object get() {
        int size = size();
        if (size == 0) {
            throw new BufferUnderflowException();
        }
        return get(size - 1);
    }

    @Override // org.apache.commons.collections.Buffer
    public Object remove() {
        int size = size();
        if (size == 0) {
            throw new BufferUnderflowException();
        }
        return remove(size - 1);
    }
}
