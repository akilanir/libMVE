package org.jivesoftware.smack.util;

import java.util.AbstractCollection;
import java.util.AbstractSet;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import org.jivesoftware.smack.util.collections.AbstractMapEntry;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/Cache.class */
public class Cache<K, V> implements Map<K, V> {
    protected Map<K, CacheObject<V>> map;
    protected LinkedList lastAccessedList;
    protected LinkedList ageList;
    protected int maxCacheSize;
    protected long maxLifetime;
    protected long cacheHits;
    protected long cacheMisses = 0;

    public Cache(int maxSize, long maxLifetime) {
        if (maxSize == 0) {
            throw new IllegalArgumentException("Max cache size cannot be 0.");
        }
        this.maxCacheSize = maxSize;
        this.maxLifetime = maxLifetime;
        this.map = new HashMap(103);
        this.lastAccessedList = new LinkedList();
        this.ageList = new LinkedList();
    }

    @Override // java.util.Map
    public synchronized V put(K key, V value) {
        V oldValue = null;
        if (this.map.containsKey(key)) {
            oldValue = remove((Object) key, true);
        }
        CacheObject<V> cacheObject = new CacheObject<>(value);
        this.map.put(key, cacheObject);
        cacheObject.lastAccessedListNode = this.lastAccessedList.addFirst(key);
        LinkedListNode ageNode = this.ageList.addFirst(key);
        ageNode.timestamp = System.currentTimeMillis();
        cacheObject.ageListNode = ageNode;
        cullCache();
        return oldValue;
    }

    @Override // java.util.Map
    public synchronized V get(Object key) {
        deleteExpiredEntries();
        CacheObject<V> cacheObject = this.map.get(key);
        if (cacheObject == null) {
            this.cacheMisses++;
            return null;
        }
        cacheObject.lastAccessedListNode.remove();
        this.lastAccessedList.addFirst(cacheObject.lastAccessedListNode);
        this.cacheHits++;
        cacheObject.readCount++;
        return cacheObject.object;
    }

    @Override // java.util.Map
    public synchronized V remove(Object key) {
        return remove(key, false);
    }

    public synchronized V remove(Object key, boolean internal) {
        CacheObject<V> cacheObject = this.map.remove(key);
        if (cacheObject == null) {
            return null;
        }
        cacheObject.lastAccessedListNode.remove();
        cacheObject.ageListNode.remove();
        cacheObject.ageListNode = null;
        cacheObject.lastAccessedListNode = null;
        return cacheObject.object;
    }

    @Override // java.util.Map
    public synchronized void clear() {
        Object[] keys = this.map.keySet().toArray();
        for (Object key : keys) {
            remove(key);
        }
        this.map.clear();
        this.lastAccessedList.clear();
        this.ageList.clear();
        this.cacheHits = 0L;
        this.cacheMisses = 0L;
    }

    @Override // java.util.Map
    public synchronized int size() {
        deleteExpiredEntries();
        return this.map.size();
    }

    @Override // java.util.Map
    public synchronized boolean isEmpty() {
        deleteExpiredEntries();
        return this.map.isEmpty();
    }

    @Override // java.util.Map
    public synchronized Collection<V> values() {
        deleteExpiredEntries();
        return Collections.unmodifiableCollection(new AnonymousClass1());
    }

    /* renamed from: org.jivesoftware.smack.util.Cache$1, reason: invalid class name */
    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/Cache$1.class */
    class AnonymousClass1 extends AbstractCollection<V> {
        Collection<CacheObject<V>> values;

        AnonymousClass1() {
            this.values = Cache.this.map.values();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
        public Iterator<V> iterator() {
            return new Iterator<V>() { // from class: org.jivesoftware.smack.util.Cache.1.1
                Iterator<CacheObject<V>> it;

                {
                    this.it = AnonymousClass1.this.values.iterator();
                }

                @Override // java.util.Iterator
                public boolean hasNext() {
                    return this.it.hasNext();
                }

                @Override // java.util.Iterator
                public V next() {
                    return this.it.next().object;
                }

                @Override // java.util.Iterator
                public void remove() {
                    this.it.remove();
                }
            };
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public int size() {
            return this.values.size();
        }
    }

    @Override // java.util.Map
    public synchronized boolean containsKey(Object key) {
        deleteExpiredEntries();
        return this.map.containsKey(key);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r8v0 */
    /* JADX WARN: Type inference failed for: r8v1 */
    /* JADX WARN: Type inference failed for: r8v2 */
    @Override // java.util.Map
    public void putAll(Map<? extends K, ? extends V> map) {
        for (Map.Entry<? extends K, ? extends V> entry : map.entrySet()) {
            V value = entry.getValue();
            if (value instanceof CacheObject) {
                value = ((CacheObject) value).object;
            }
            put(entry.getKey(), value);
        }
    }

    @Override // java.util.Map
    public synchronized boolean containsValue(Object value) {
        deleteExpiredEntries();
        CacheObject<V> cacheObject = new CacheObject<>(value);
        return this.map.containsValue(cacheObject);
    }

    @Override // java.util.Map
    public synchronized Set<Map.Entry<K, V>> entrySet() {
        deleteExpiredEntries();
        return new AbstractSet<Map.Entry<K, V>>() { // from class: org.jivesoftware.smack.util.Cache.2
            private final Set<Map.Entry<K, CacheObject<V>>> set;

            {
                this.set = Cache.this.map.entrySet();
            }

            @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
            public Iterator<Map.Entry<K, V>> iterator() {
                return new Iterator<Map.Entry<K, V>>() { // from class: org.jivesoftware.smack.util.Cache.2.1
                    private final Iterator<Map.Entry<K, CacheObject<V>>> it;

                    {
                        this.it = AnonymousClass2.this.set.iterator();
                    }

                    @Override // java.util.Iterator
                    public boolean hasNext() {
                        return this.it.hasNext();
                    }

                    @Override // java.util.Iterator
                    public Map.Entry<K, V> next() {
                        Map.Entry<K, CacheObject<V>> entry = this.it.next();
                        return new AbstractMapEntry<K, V>(entry.getKey(), entry.getValue().object) { // from class: org.jivesoftware.smack.util.Cache.2.1.1
                            @Override // org.jivesoftware.smack.util.collections.AbstractMapEntry, java.util.Map.Entry
                            public V setValue(V value) {
                                throw new UnsupportedOperationException("Cannot set");
                            }
                        };
                    }

                    @Override // java.util.Iterator
                    public void remove() {
                        this.it.remove();
                    }
                };
            }

            @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
            public int size() {
                return this.set.size();
            }
        };
    }

    @Override // java.util.Map
    public synchronized Set<K> keySet() {
        deleteExpiredEntries();
        return Collections.unmodifiableSet(this.map.keySet());
    }

    public long getCacheHits() {
        return this.cacheHits;
    }

    public long getCacheMisses() {
        return this.cacheMisses;
    }

    public int getMaxCacheSize() {
        return this.maxCacheSize;
    }

    public synchronized void setMaxCacheSize(int maxCacheSize) {
        this.maxCacheSize = maxCacheSize;
        cullCache();
    }

    public long getMaxLifetime() {
        return this.maxLifetime;
    }

    public void setMaxLifetime(long maxLifetime) {
        this.maxLifetime = maxLifetime;
    }

    protected synchronized void deleteExpiredEntries() {
        if (this.maxLifetime <= 0) {
            return;
        }
        LinkedListNode node = this.ageList.getLast();
        if (node == null) {
            return;
        }
        long expireTime = System.currentTimeMillis() - this.maxLifetime;
        while (expireTime > node.timestamp) {
            if (remove(node.object, true) == null) {
                System.err.println("Error attempting to remove(" + node.object.toString() + ") - cacheObject not found in cache!");
                node.remove();
            }
            node = this.ageList.getLast();
            if (node == null) {
                return;
            }
        }
    }

    protected synchronized void cullCache() {
        if (this.maxCacheSize >= 0 && this.map.size() > this.maxCacheSize) {
            deleteExpiredEntries();
            int desiredSize = (int) (this.maxCacheSize * 0.9d);
            for (int i = this.map.size(); i > desiredSize; i--) {
                if (remove(this.lastAccessedList.getLast().object, true) == null) {
                    System.err.println("Error attempting to cullCache with remove(" + this.lastAccessedList.getLast().object.toString() + ") - cacheObject not found in cache!");
                    this.lastAccessedList.getLast().remove();
                }
            }
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/Cache$CacheObject.class */
    private static class CacheObject<V> {
        public V object;
        public LinkedListNode lastAccessedListNode;
        public LinkedListNode ageListNode;
        public int readCount = 0;

        public CacheObject(V object) {
            this.object = object;
        }

        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (!(o instanceof CacheObject)) {
                return false;
            }
            CacheObject cacheObject = (CacheObject) o;
            return this.object.equals(cacheObject.object);
        }

        public int hashCode() {
            return this.object.hashCode();
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/Cache$LinkedList.class */
    private static class LinkedList {
        private LinkedListNode head = new LinkedListNode("head", null, null);

        public LinkedList() {
            LinkedListNode linkedListNode = this.head;
            LinkedListNode linkedListNode2 = this.head;
            LinkedListNode linkedListNode3 = this.head;
            linkedListNode2.previous = linkedListNode3;
            linkedListNode.next = linkedListNode3;
        }

        public LinkedListNode getFirst() {
            LinkedListNode node = this.head.next;
            if (node == this.head) {
                return null;
            }
            return node;
        }

        public LinkedListNode getLast() {
            LinkedListNode node = this.head.previous;
            if (node == this.head) {
                return null;
            }
            return node;
        }

        public LinkedListNode addFirst(LinkedListNode node) {
            node.next = this.head.next;
            node.previous = this.head;
            node.previous.next = node;
            node.next.previous = node;
            return node;
        }

        public LinkedListNode addFirst(Object object) {
            LinkedListNode node = new LinkedListNode(object, this.head.next, this.head);
            node.previous.next = node;
            node.next.previous = node;
            return node;
        }

        public LinkedListNode addLast(Object object) {
            LinkedListNode node = new LinkedListNode(object, this.head, this.head.previous);
            node.previous.next = node;
            node.next.previous = node;
            return node;
        }

        public void clear() {
            LinkedListNode last = getLast();
            while (true) {
                LinkedListNode node = last;
                if (node != null) {
                    node.remove();
                    last = getLast();
                } else {
                    LinkedListNode linkedListNode = this.head;
                    LinkedListNode linkedListNode2 = this.head;
                    LinkedListNode linkedListNode3 = this.head;
                    linkedListNode2.previous = linkedListNode3;
                    linkedListNode.next = linkedListNode3;
                    return;
                }
            }
        }

        public String toString() {
            StringBuilder buf = new StringBuilder();
            for (LinkedListNode node = this.head.next; node != this.head; node = node.next) {
                buf.append(node.toString()).append(", ");
            }
            return buf.toString();
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/Cache$LinkedListNode.class */
    private static class LinkedListNode {
        public LinkedListNode previous;
        public LinkedListNode next;
        public Object object;
        public long timestamp;

        public LinkedListNode(Object object, LinkedListNode next, LinkedListNode previous) {
            this.object = object;
            this.next = next;
            this.previous = previous;
        }

        public void remove() {
            this.previous.next = this.next;
            this.next.previous = this.previous;
        }

        public String toString() {
            return this.object.toString();
        }
    }
}
