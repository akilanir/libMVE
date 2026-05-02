package com.bumptech.glide.load.engine.bitmap_recycle;

import com.bumptech.glide.load.engine.bitmap_recycle.Poolable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/bitmap_recycle/GroupedLinkedMap.class */
class GroupedLinkedMap<K extends Poolable, V> {
    private final LinkedEntry<K, V> head = new LinkedEntry<>();
    private final Map<K, LinkedEntry<K, V>> keyToEntry = new HashMap();

    GroupedLinkedMap() {
    }

    public void put(K key, V value) {
        LinkedEntry<K, V> entry = this.keyToEntry.get(key);
        if (entry == null) {
            entry = new LinkedEntry<>(key);
            makeTail(entry);
            this.keyToEntry.put(key, entry);
        } else {
            key.offer();
        }
        entry.add(value);
    }

    public V get(K key) {
        LinkedEntry<K, V> entry = this.keyToEntry.get(key);
        if (entry == null) {
            entry = new LinkedEntry<>(key);
            this.keyToEntry.put(key, entry);
        } else {
            key.offer();
        }
        makeHead(entry);
        return entry.removeLast();
    }

    public V removeLast() {
        LinkedEntry linkedEntry = this.head.prev;
        while (true) {
            LinkedEntry linkedEntry2 = linkedEntry;
            if (!linkedEntry2.equals(this.head)) {
                V v = (V) linkedEntry2.removeLast();
                if (v != null) {
                    return v;
                }
                removeEntry(linkedEntry2);
                this.keyToEntry.remove(linkedEntry2.key);
                ((Poolable) linkedEntry2.key).offer();
                linkedEntry = linkedEntry2.prev;
            } else {
                return null;
            }
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("GroupedLinkedMap( ");
        boolean hadAtLeastOneItem = false;
        for (LinkedEntry<K, V> current = this.head.next; !current.equals(this.head); current = current.next) {
            hadAtLeastOneItem = true;
            sb.append('{').append(((LinkedEntry) current).key).append(':').append(current.size()).append("}, ");
        }
        if (hadAtLeastOneItem) {
            sb.delete(sb.length() - 2, sb.length());
        }
        return sb.append(" )").toString();
    }

    private void makeHead(LinkedEntry<K, V> entry) {
        removeEntry(entry);
        entry.prev = this.head;
        entry.next = this.head.next;
        updateEntry(entry);
    }

    private void makeTail(LinkedEntry<K, V> entry) {
        removeEntry(entry);
        entry.prev = this.head.prev;
        entry.next = this.head;
        updateEntry(entry);
    }

    private static <K, V> void updateEntry(LinkedEntry<K, V> entry) {
        entry.next.prev = entry;
        entry.prev.next = entry;
    }

    private static <K, V> void removeEntry(LinkedEntry<K, V> entry) {
        entry.prev.next = entry.next;
        entry.next.prev = entry.prev;
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/bitmap_recycle/GroupedLinkedMap$LinkedEntry.class */
    private static class LinkedEntry<K, V> {
        private final K key;
        private List<V> values;
        LinkedEntry<K, V> next;
        LinkedEntry<K, V> prev;

        public LinkedEntry() {
            this(null);
        }

        public LinkedEntry(K key) {
            this.prev = this;
            this.next = this;
            this.key = key;
        }

        public V removeLast() {
            int valueSize = size();
            if (valueSize > 0) {
                return this.values.remove(valueSize - 1);
            }
            return null;
        }

        public int size() {
            if (this.values != null) {
                return this.values.size();
            }
            return 0;
        }

        public void add(V value) {
            if (this.values == null) {
                this.values = new ArrayList();
            }
            this.values.add(value);
        }
    }
}
