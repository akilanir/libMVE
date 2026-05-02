package com.alibaba.fastjson.util;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/util/IdentityHashMap.class */
public class IdentityHashMap<K, V> {
    private final Entry<K, V>[] buckets;
    private final int indexMask;

    public IdentityHashMap() {
        this(1024);
    }

    public IdentityHashMap(int tableSize) {
        this.indexMask = tableSize - 1;
        this.buckets = new Entry[tableSize];
    }

    public final V get(K key) {
        int hash = System.identityHashCode(key);
        int bucket = hash & this.indexMask;
        Entry<K, V> entry = this.buckets[bucket];
        while (true) {
            Entry<K, V> entry2 = entry;
            if (entry2 != null) {
                if (key != entry2.key) {
                    entry = entry2.next;
                } else {
                    return entry2.value;
                }
            } else {
                return null;
            }
        }
    }

    public boolean put(K key, V value) {
        int hash = System.identityHashCode(key);
        int bucket = hash & this.indexMask;
        Entry<K, V> entry = this.buckets[bucket];
        while (true) {
            Entry<K, V> entry2 = entry;
            if (entry2 != null) {
                if (key != entry2.key) {
                    entry = entry2.next;
                } else {
                    entry2.value = value;
                    return true;
                }
            } else {
                this.buckets[bucket] = new Entry<>(key, value, hash, this.buckets[bucket]);
                return false;
            }
        }
    }

    /* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/util/IdentityHashMap$Entry.class */
    protected static final class Entry<K, V> {
        public final int hashCode;
        public final K key;
        public V value;
        public final Entry<K, V> next;

        public Entry(K key, V value, int hash, Entry<K, V> next) {
            this.key = key;
            this.value = value;
            this.next = next;
            this.hashCode = hash;
        }
    }
}
