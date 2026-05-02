package org.simpleframework.xml.util;

import java.util.AbstractSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import org.simpleframework.xml.util.Match;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/util/Resolver.class */
public class Resolver<M extends Match> extends AbstractSet<M> {
    protected final Resolver<M>.Stack stack = new Stack();
    protected final Resolver<M>.Cache cache = new Cache();

    public M resolve(String text) {
        List<M> list = (List) this.cache.get(text);
        if (list == null) {
            list = resolveAll(text);
        }
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    public List<M> resolveAll(String text) {
        List<M> list = (List) this.cache.get(text);
        if (list != null) {
            return list;
        }
        char[] array = text.toCharArray();
        if (array == null) {
            return null;
        }
        return resolveAll(text, array);
    }

    private List<M> resolveAll(String text, char[] array) {
        ArrayList arrayList = new ArrayList();
        Iterator i$ = this.stack.iterator();
        while (i$.hasNext()) {
            Match match = (Match) i$.next();
            String wild = match.getPattern();
            if (match(array, wild.toCharArray())) {
                this.cache.put(text, arrayList);
                arrayList.add(match);
            }
        }
        return arrayList;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean add(M match) {
        this.stack.push((Resolver<M>.Stack) match);
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public Iterator<M> iterator() {
        return this.stack.sequence();
    }

    public boolean remove(M match) {
        this.cache.clear();
        return this.stack.remove(match);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public int size() {
        return this.stack.size();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public void clear() {
        this.cache.clear();
        this.stack.clear();
    }

    private boolean match(char[] text, char[] wild) {
        return match(text, 0, wild, 0);
    }

    private boolean match(char[] text, int off, char[] wild, int pos) {
        while (pos < wild.length && off < text.length) {
            if (wild[pos] == '*') {
                while (wild[pos] == '*') {
                    pos++;
                    if (pos >= wild.length) {
                        return true;
                    }
                }
                if (wild[pos] == '?') {
                    pos++;
                    if (pos >= wild.length) {
                        return true;
                    }
                }
                while (off < text.length) {
                    if (text[off] == wild[pos] || wild[pos] == '?') {
                        if (wild[pos - 1] == '?') {
                            break;
                        }
                        if (match(text, off, wild, pos)) {
                            return true;
                        }
                    }
                    off++;
                }
                if (text.length == off) {
                    return false;
                }
            }
            int i = off;
            off++;
            int i2 = pos;
            pos++;
            if (text[i] != wild[i2] && wild[pos - 1] != '?') {
                return false;
            }
        }
        if (wild.length == pos) {
            return text.length == off;
        }
        while (wild[pos] == '*') {
            pos++;
            if (pos >= wild.length) {
                return true;
            }
        }
        return false;
    }

    /* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/util/Resolver$Cache.class */
    private class Cache extends LimitedCache<List<M>> {
        public Cache() {
            super(1024);
        }
    }

    /* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/util/Resolver$Stack.class */
    private class Stack extends LinkedList<M> {
        private Stack() {
        }

        @Override // java.util.LinkedList, java.util.Deque
        public void push(M match) {
            Resolver.this.cache.clear();
            addFirst(match);
        }

        public void purge(int index) {
            Resolver.this.cache.clear();
            remove(index);
        }

        public Iterator<M> sequence() {
            return new Sequence();
        }

        /* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/util/Resolver$Stack$Sequence.class */
        private class Sequence implements Iterator<M> {
            private int cursor;

            public Sequence() {
                this.cursor = Stack.this.size();
            }

            @Override // java.util.Iterator
            public M next() {
                if (hasNext()) {
                    Stack stack = Stack.this;
                    int i = this.cursor - 1;
                    this.cursor = i;
                    return (M) stack.get(i);
                }
                return null;
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                return this.cursor > 0;
            }

            @Override // java.util.Iterator
            public void remove() {
                Stack.this.purge(this.cursor);
            }
        }
    }
}
