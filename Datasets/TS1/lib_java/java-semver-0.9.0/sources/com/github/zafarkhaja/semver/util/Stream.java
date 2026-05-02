package com.github.zafarkhaja.semver.util;

import java.util.Arrays;
import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: java-semver-0.9.0.jar:com/github/zafarkhaja/semver/util/Stream.class */
public class Stream<E> implements Iterable<E> {
    private final E[] elements;
    private int offset = 0;

    /* loaded from: java-semver-0.9.0.jar:com/github/zafarkhaja/semver/util/Stream$ElementType.class */
    public interface ElementType<E> {
        boolean isMatchedBy(E e);
    }

    public Stream(E[] eArr) {
        this.elements = (E[]) ((Object[]) eArr.clone());
    }

    public E consume() {
        if (this.offset >= this.elements.length) {
            return null;
        }
        E[] eArr = this.elements;
        int i = this.offset;
        this.offset = i + 1;
        return eArr[i];
    }

    public <T extends ElementType<E>> E consume(T... expected) {
        E lookahead = lookahead(1);
        for (T t : expected) {
            if (t.isMatchedBy(lookahead)) {
                return consume();
            }
        }
        throw new UnexpectedElementException(lookahead, this.offset, expected);
    }

    public void pushBack() {
        if (this.offset > 0) {
            this.offset--;
        }
    }

    public E lookahead() {
        return lookahead(1);
    }

    public E lookahead(int position) {
        int idx = (this.offset + position) - 1;
        if (idx < this.elements.length) {
            return this.elements[idx];
        }
        return null;
    }

    public int currentOffset() {
        return this.offset;
    }

    public <T extends ElementType<E>> boolean positiveLookahead(T... expected) {
        for (T t : expected) {
            if (t.isMatchedBy(lookahead(1))) {
                return true;
            }
        }
        return false;
    }

    public <T extends ElementType<E>> boolean positiveLookaheadBefore(ElementType<E> before, T... expected) {
        for (int i = 1; i <= this.elements.length; i++) {
            E lookahead = lookahead(i);
            if (!before.isMatchedBy(lookahead)) {
                for (T t : expected) {
                    if (t.isMatchedBy(lookahead)) {
                        return true;
                    }
                }
            } else {
                return false;
            }
        }
        return false;
    }

    public <T extends ElementType<E>> boolean positiveLookaheadUntil(int until, T... expected) {
        for (int i = 1; i <= until; i++) {
            for (T t : expected) {
                if (t.isMatchedBy(lookahead(i))) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // java.lang.Iterable
    public Iterator<E> iterator() {
        return new Iterator<E>() { // from class: com.github.zafarkhaja.semver.util.Stream.1
            private int index;

            {
                this.index = Stream.this.offset;
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                return this.index < Stream.this.elements.length;
            }

            @Override // java.util.Iterator
            public E next() {
                if (this.index < Stream.this.elements.length) {
                    Object[] objArr = Stream.this.elements;
                    int i = this.index;
                    this.index = i + 1;
                    return (E) objArr[i];
                }
                throw new NoSuchElementException();
            }

            @Override // java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException();
            }
        };
    }

    public E[] toArray() {
        return (E[]) Arrays.copyOfRange(this.elements, this.offset, this.elements.length);
    }
}
