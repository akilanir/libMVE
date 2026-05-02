package org.apache.commons.collections;

import java.util.Collection;
import java.util.ConcurrentModificationException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/collections/FastHashMap.class */
public class FastHashMap extends HashMap {
    protected HashMap map;
    protected boolean fast = false;

    /* renamed from: org.apache.commons.collections.FastHashMap$1, reason: invalid class name */
    /* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/collections/FastHashMap$1.class */
    static class AnonymousClass1 {
    }

    public FastHashMap() {
        this.map = null;
        this.map = new HashMap();
    }

    public FastHashMap(int capacity) {
        this.map = null;
        this.map = new HashMap(capacity);
    }

    public FastHashMap(int capacity, float factor) {
        this.map = null;
        this.map = new HashMap(capacity, factor);
    }

    public FastHashMap(Map map) {
        this.map = null;
        this.map = new HashMap(map);
    }

    public boolean getFast() {
        return this.fast;
    }

    public void setFast(boolean fast) {
        this.fast = fast;
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public Object get(Object key) {
        Object obj;
        if (this.fast) {
            return this.map.get(key);
        }
        synchronized (this.map) {
            obj = this.map.get(key);
        }
        return obj;
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public int size() {
        int size;
        if (this.fast) {
            return this.map.size();
        }
        synchronized (this.map) {
            size = this.map.size();
        }
        return size;
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public boolean isEmpty() {
        boolean isEmpty;
        if (this.fast) {
            return this.map.isEmpty();
        }
        synchronized (this.map) {
            isEmpty = this.map.isEmpty();
        }
        return isEmpty;
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public boolean containsKey(Object key) {
        boolean containsKey;
        if (this.fast) {
            return this.map.containsKey(key);
        }
        synchronized (this.map) {
            containsKey = this.map.containsKey(key);
        }
        return containsKey;
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public boolean containsValue(Object value) {
        boolean containsValue;
        if (this.fast) {
            return this.map.containsValue(value);
        }
        synchronized (this.map) {
            containsValue = this.map.containsValue(value);
        }
        return containsValue;
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public Object put(Object key, Object value) {
        Object put;
        Object result;
        if (this.fast) {
            synchronized (this) {
                HashMap temp = (HashMap) this.map.clone();
                result = temp.put(key, value);
                this.map = temp;
            }
            return result;
        }
        synchronized (this.map) {
            put = this.map.put(key, value);
        }
        return put;
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public void putAll(Map in) {
        if (this.fast) {
            synchronized (this) {
                HashMap temp = (HashMap) this.map.clone();
                temp.putAll(in);
                this.map = temp;
            }
            return;
        }
        synchronized (this.map) {
            this.map.putAll(in);
        }
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public Object remove(Object key) {
        Object remove;
        Object result;
        if (this.fast) {
            synchronized (this) {
                HashMap temp = (HashMap) this.map.clone();
                result = temp.remove(key);
                this.map = temp;
            }
            return result;
        }
        synchronized (this.map) {
            remove = this.map.remove(key);
        }
        return remove;
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public void clear() {
        if (this.fast) {
            synchronized (this) {
                this.map = new HashMap();
            }
        } else {
            synchronized (this.map) {
                this.map.clear();
            }
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof Map)) {
            return false;
        }
        Map mo = (Map) o;
        if (this.fast) {
            if (mo.size() != this.map.size()) {
                return false;
            }
            for (Map.Entry e : this.map.entrySet()) {
                Object key = e.getKey();
                Object value = e.getValue();
                if (value == null) {
                    if (mo.get(key) != null || !mo.containsKey(key)) {
                        return false;
                    }
                } else if (!value.equals(mo.get(key))) {
                    return false;
                }
            }
            return true;
        }
        synchronized (this.map) {
            if (mo.size() != this.map.size()) {
                return false;
            }
            for (Map.Entry e2 : this.map.entrySet()) {
                Object key2 = e2.getKey();
                Object value2 = e2.getValue();
                if (value2 == null) {
                    if (mo.get(key2) != null || !mo.containsKey(key2)) {
                        return false;
                    }
                } else if (!value2.equals(mo.get(key2))) {
                    return false;
                }
            }
            return true;
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public int hashCode() {
        int i;
        if (this.fast) {
            int h = 0;
            Iterator i2 = this.map.entrySet().iterator();
            while (i2.hasNext()) {
                h += i2.next().hashCode();
            }
            return h;
        }
        synchronized (this.map) {
            int h2 = 0;
            Iterator i3 = this.map.entrySet().iterator();
            while (i3.hasNext()) {
                h2 += i3.next().hashCode();
            }
            i = h2;
        }
        return i;
    }

    @Override // java.util.HashMap, java.util.AbstractMap
    public Object clone() {
        FastHashMap results;
        if (this.fast) {
            results = new FastHashMap(this.map);
        } else {
            synchronized (this.map) {
                results = new FastHashMap(this.map);
            }
        }
        results.setFast(getFast());
        return results;
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public Set entrySet() {
        return new EntrySet(this, null);
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public Set keySet() {
        return new KeySet(this, null);
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public Collection values() {
        return new Values(this, null);
    }

    /* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/collections/FastHashMap$CollectionView.class */
    private abstract class CollectionView implements Collection {
        private final FastHashMap this$0;

        protected abstract Collection get(Map map);

        protected abstract Object iteratorNext(Map.Entry entry);

        public CollectionView(FastHashMap fastHashMap) {
            this.this$0 = fastHashMap;
        }

        @Override // java.util.Collection
        public void clear() {
            if (this.this$0.fast) {
                synchronized (this.this$0) {
                    this.this$0.map = new HashMap();
                }
                return;
            }
            synchronized (this.this$0.map) {
                get(this.this$0.map).clear();
            }
        }

        @Override // java.util.Collection
        public boolean remove(Object o) {
            boolean remove;
            boolean r;
            if (this.this$0.fast) {
                synchronized (this.this$0) {
                    HashMap temp = (HashMap) this.this$0.map.clone();
                    r = get(temp).remove(o);
                    this.this$0.map = temp;
                }
                return r;
            }
            synchronized (this.this$0.map) {
                remove = get(this.this$0.map).remove(o);
            }
            return remove;
        }

        @Override // java.util.Collection
        public boolean removeAll(Collection o) {
            boolean removeAll;
            boolean r;
            if (this.this$0.fast) {
                synchronized (this.this$0) {
                    HashMap temp = (HashMap) this.this$0.map.clone();
                    r = get(temp).removeAll(o);
                    this.this$0.map = temp;
                }
                return r;
            }
            synchronized (this.this$0.map) {
                removeAll = get(this.this$0.map).removeAll(o);
            }
            return removeAll;
        }

        @Override // java.util.Collection
        public boolean retainAll(Collection o) {
            boolean retainAll;
            boolean r;
            if (this.this$0.fast) {
                synchronized (this.this$0) {
                    HashMap temp = (HashMap) this.this$0.map.clone();
                    r = get(temp).retainAll(o);
                    this.this$0.map = temp;
                }
                return r;
            }
            synchronized (this.this$0.map) {
                retainAll = get(this.this$0.map).retainAll(o);
            }
            return retainAll;
        }

        @Override // java.util.Collection
        public int size() {
            int size;
            if (this.this$0.fast) {
                return get(this.this$0.map).size();
            }
            synchronized (this.this$0.map) {
                size = get(this.this$0.map).size();
            }
            return size;
        }

        @Override // java.util.Collection
        public boolean isEmpty() {
            boolean isEmpty;
            if (this.this$0.fast) {
                return get(this.this$0.map).isEmpty();
            }
            synchronized (this.this$0.map) {
                isEmpty = get(this.this$0.map).isEmpty();
            }
            return isEmpty;
        }

        @Override // java.util.Collection
        public boolean contains(Object o) {
            boolean contains;
            if (this.this$0.fast) {
                return get(this.this$0.map).contains(o);
            }
            synchronized (this.this$0.map) {
                contains = get(this.this$0.map).contains(o);
            }
            return contains;
        }

        @Override // java.util.Collection
        public boolean containsAll(Collection o) {
            boolean containsAll;
            if (this.this$0.fast) {
                return get(this.this$0.map).containsAll(o);
            }
            synchronized (this.this$0.map) {
                containsAll = get(this.this$0.map).containsAll(o);
            }
            return containsAll;
        }

        @Override // java.util.Collection
        public Object[] toArray(Object[] o) {
            Object[] array;
            if (this.this$0.fast) {
                return get(this.this$0.map).toArray(o);
            }
            synchronized (this.this$0.map) {
                array = get(this.this$0.map).toArray(o);
            }
            return array;
        }

        @Override // java.util.Collection
        public Object[] toArray() {
            Object[] array;
            if (this.this$0.fast) {
                return get(this.this$0.map).toArray();
            }
            synchronized (this.this$0.map) {
                array = get(this.this$0.map).toArray();
            }
            return array;
        }

        @Override // java.util.Collection
        public boolean equals(Object o) {
            boolean equals;
            if (o == this) {
                return true;
            }
            if (this.this$0.fast) {
                return get(this.this$0.map).equals(o);
            }
            synchronized (this.this$0.map) {
                equals = get(this.this$0.map).equals(o);
            }
            return equals;
        }

        @Override // java.util.Collection
        public int hashCode() {
            int hashCode;
            if (this.this$0.fast) {
                return get(this.this$0.map).hashCode();
            }
            synchronized (this.this$0.map) {
                hashCode = get(this.this$0.map).hashCode();
            }
            return hashCode;
        }

        @Override // java.util.Collection
        public boolean add(Object o) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Collection
        public boolean addAll(Collection c) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Collection, java.lang.Iterable
        public Iterator iterator() {
            return new CollectionViewIterator(this);
        }

        /* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/collections/FastHashMap$CollectionView$CollectionViewIterator.class */
        private class CollectionViewIterator implements Iterator {
            private Map expected;
            private Map.Entry lastReturned = null;
            private Iterator iterator;
            private final CollectionView this$1;

            public CollectionViewIterator(CollectionView collectionView) {
                this.this$1 = collectionView;
                this.expected = collectionView.this$0.map;
                this.iterator = this.expected.entrySet().iterator();
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                if (this.expected != this.this$1.this$0.map) {
                    throw new ConcurrentModificationException();
                }
                return this.iterator.hasNext();
            }

            @Override // java.util.Iterator
            public Object next() {
                if (this.expected != this.this$1.this$0.map) {
                    throw new ConcurrentModificationException();
                }
                this.lastReturned = (Map.Entry) this.iterator.next();
                return this.this$1.iteratorNext(this.lastReturned);
            }

            @Override // java.util.Iterator
            public void remove() {
                if (this.lastReturned != null) {
                    if (this.this$1.this$0.fast) {
                        synchronized (this.this$1.this$0) {
                            if (this.expected == this.this$1.this$0.map) {
                                this.this$1.this$0.remove(this.lastReturned.getKey());
                                this.lastReturned = null;
                                this.expected = this.this$1.this$0.map;
                            } else {
                                throw new ConcurrentModificationException();
                            }
                        }
                        return;
                    }
                    this.iterator.remove();
                    this.lastReturned = null;
                    return;
                }
                throw new IllegalStateException();
            }
        }
    }

    /* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/collections/FastHashMap$KeySet.class */
    private class KeySet extends CollectionView implements Set {
        private final FastHashMap this$0;

        private KeySet(FastHashMap fastHashMap) {
            super(fastHashMap);
            this.this$0 = fastHashMap;
        }

        KeySet(FastHashMap x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // org.apache.commons.collections.FastHashMap.CollectionView
        protected Collection get(Map map) {
            return map.keySet();
        }

        @Override // org.apache.commons.collections.FastHashMap.CollectionView
        protected Object iteratorNext(Map.Entry entry) {
            return entry.getKey();
        }
    }

    /* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/collections/FastHashMap$Values.class */
    private class Values extends CollectionView {
        private final FastHashMap this$0;

        private Values(FastHashMap fastHashMap) {
            super(fastHashMap);
            this.this$0 = fastHashMap;
        }

        Values(FastHashMap x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // org.apache.commons.collections.FastHashMap.CollectionView
        protected Collection get(Map map) {
            return map.values();
        }

        @Override // org.apache.commons.collections.FastHashMap.CollectionView
        protected Object iteratorNext(Map.Entry entry) {
            return entry.getValue();
        }
    }

    /* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/collections/FastHashMap$EntrySet.class */
    private class EntrySet extends CollectionView implements Set {
        private final FastHashMap this$0;

        private EntrySet(FastHashMap fastHashMap) {
            super(fastHashMap);
            this.this$0 = fastHashMap;
        }

        EntrySet(FastHashMap x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // org.apache.commons.collections.FastHashMap.CollectionView
        protected Collection get(Map map) {
            return map.entrySet();
        }

        @Override // org.apache.commons.collections.FastHashMap.CollectionView
        protected Object iteratorNext(Map.Entry entry) {
            return entry;
        }
    }
}
