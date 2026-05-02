package org.jivesoftware.smack.util.collections;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.SoftReference;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collection;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
import org.jivesoftware.smack.util.collections.AbstractHashedMap;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap.class */
public abstract class AbstractReferenceMap<K, V> extends AbstractHashedMap<K, V> {
    public static final int HARD = 0;
    public static final int SOFT = 1;
    public static final int WEAK = 2;
    protected int keyType;
    protected int valueType;
    protected boolean purgeValues;
    private transient ReferenceQueue queue;

    protected AbstractReferenceMap() {
    }

    protected AbstractReferenceMap(int keyType, int valueType, int capacity, float loadFactor, boolean purgeValues) {
        super(capacity, loadFactor);
        verify("keyType", keyType);
        verify("valueType", valueType);
        this.keyType = keyType;
        this.valueType = valueType;
        this.purgeValues = purgeValues;
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap
    protected void init() {
        this.queue = new ReferenceQueue();
    }

    private static void verify(String name, int type) {
        if (type < 0 || type > 2) {
            throw new IllegalArgumentException(name + " must be HARD, SOFT, WEAK.");
        }
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public int size() {
        purgeBeforeRead();
        return super.size();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public boolean isEmpty() {
        purgeBeforeRead();
        return super.isEmpty();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public boolean containsKey(Object key) {
        purgeBeforeRead();
        Map.Entry entry = getEntry(key);
        return (entry == null || entry.getValue() == null) ? false : true;
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public boolean containsValue(Object value) {
        purgeBeforeRead();
        if (value == null) {
            return false;
        }
        return super.containsValue(value);
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public V get(Object key) {
        purgeBeforeRead();
        Map.Entry<K, V> entry = getEntry(key);
        if (entry == null) {
            return null;
        }
        return entry.getValue();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public V put(K k, V v) {
        if (k == null) {
            throw new NullPointerException("null keys not allowed");
        }
        if (v == null) {
            throw new NullPointerException("null values not allowed");
        }
        purgeBeforeWrite();
        return (V) super.put(k, v);
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public V remove(Object obj) {
        if (obj == null) {
            return null;
        }
        purgeBeforeWrite();
        return (V) super.remove(obj);
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public void clear() {
        super.clear();
        while (this.queue.poll() != null) {
        }
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, org.jivesoftware.smack.util.collections.IterableMap
    public MapIterator<K, V> mapIterator() {
        return new ReferenceMapIterator(this);
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public Set<Map.Entry<K, V>> entrySet() {
        if (this.entrySet == null) {
            this.entrySet = new ReferenceEntrySet(this);
        }
        return this.entrySet;
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public Set<K> keySet() {
        if (this.keySet == null) {
            this.keySet = new ReferenceKeySet(this);
        }
        return this.keySet;
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap, java.util.AbstractMap, java.util.Map
    public Collection<V> values() {
        if (this.values == null) {
            this.values = new ReferenceValues(this);
        }
        return this.values;
    }

    protected void purgeBeforeRead() {
        purge();
    }

    protected void purgeBeforeWrite() {
        purge();
    }

    protected void purge() {
        Reference poll = this.queue.poll();
        while (true) {
            Reference ref = poll;
            if (ref != null) {
                purge(ref);
                poll = this.queue.poll();
            } else {
                return;
            }
        }
    }

    protected void purge(Reference ref) {
        int hash = ref.hashCode();
        int index = hashIndex(hash, this.data.length);
        AbstractHashedMap.HashEntry<K, V> previous = null;
        AbstractHashedMap.HashEntry<K, V> hashEntry = this.data[index];
        while (true) {
            AbstractHashedMap.HashEntry<K, V> entry = hashEntry;
            if (entry != null) {
                if (((ReferenceEntry) entry).purge(ref)) {
                    if (previous == null) {
                        this.data[index] = entry.next;
                    } else {
                        previous.next = entry.next;
                    }
                    this.size--;
                    return;
                }
                previous = entry;
                hashEntry = entry.next;
            } else {
                return;
            }
        }
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap
    protected AbstractHashedMap.HashEntry<K, V> getEntry(Object key) {
        if (key == null) {
            return null;
        }
        return super.getEntry(key);
    }

    protected int hashEntry(Object key, Object value) {
        return (key == null ? 0 : key.hashCode()) ^ (value == null ? 0 : value.hashCode());
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap
    protected boolean isEqualKey(Object key1, Object key2) {
        return key1 == key2 || key1.equals(key2);
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap
    public AbstractHashedMap.HashEntry<K, V> createEntry(AbstractHashedMap.HashEntry<K, V> next, int hashCode, K key, V value) {
        return new ReferenceEntry(this, (ReferenceEntry) next, hashCode, key, value);
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap
    protected Iterator<Map.Entry<K, V>> createEntrySetIterator() {
        return new ReferenceEntrySetIterator(this);
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap
    protected Iterator<K> createKeySetIterator() {
        return new ReferenceKeySetIterator(this);
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap
    protected Iterator<V> createValuesIterator() {
        return new ReferenceValuesIterator(this);
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntrySet.class */
    static class ReferenceEntrySet<K, V> extends AbstractHashedMap.EntrySet<K, V> {
        protected ReferenceEntrySet(AbstractHashedMap<K, V> parent) {
            super(parent);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public Object[] toArray() {
            return toArray(new Object[0]);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public <T> T[] toArray(T[] tArr) {
            ArrayList arrayList = new ArrayList();
            Iterator<Map.Entry<K, V>> it = iterator();
            while (it.hasNext()) {
                Map.Entry<K, V> next = it.next();
                arrayList.add(new DefaultMapEntry(next.getKey(), next.getValue()));
            }
            return (T[]) arrayList.toArray(tArr);
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceKeySet.class */
    static class ReferenceKeySet<K, V> extends AbstractHashedMap.KeySet<K, V> {
        protected ReferenceKeySet(AbstractHashedMap<K, V> parent) {
            super(parent);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public Object[] toArray() {
            return toArray(new Object[0]);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public <T> T[] toArray(T[] tArr) {
            ArrayList arrayList = new ArrayList(this.parent.size());
            Iterator<K> it = iterator();
            while (it.hasNext()) {
                arrayList.add(it.next());
            }
            return (T[]) arrayList.toArray(tArr);
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceValues.class */
    static class ReferenceValues<K, V> extends AbstractHashedMap.Values<K, V> {
        protected ReferenceValues(AbstractHashedMap<K, V> parent) {
            super(parent);
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public Object[] toArray() {
            return toArray(new Object[0]);
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public <T> T[] toArray(T[] tArr) {
            ArrayList arrayList = new ArrayList(this.parent.size());
            Iterator<V> it = iterator();
            while (it.hasNext()) {
                arrayList.add(it.next());
            }
            return (T[]) arrayList.toArray(tArr);
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntry.class */
    protected static class ReferenceEntry<K, V> extends AbstractHashedMap.HashEntry<K, V> {
        protected final AbstractReferenceMap<K, V> parent;
        protected Reference<K> refKey;
        protected Reference<V> refValue;

        public ReferenceEntry(AbstractReferenceMap<K, V> abstractReferenceMap, ReferenceEntry<K, V> referenceEntry, int i, K k, V v) {
            super(referenceEntry, i, null, null);
            this.parent = abstractReferenceMap;
            if (abstractReferenceMap.keyType != 0) {
                this.refKey = (Reference<K>) toReference(abstractReferenceMap.keyType, k, i);
            } else {
                setKey(k);
            }
            if (abstractReferenceMap.valueType != 0) {
                this.refValue = (Reference<V>) toReference(abstractReferenceMap.valueType, v, i);
            } else {
                setValue(v);
            }
        }

        @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap.HashEntry, java.util.Map.Entry, org.jivesoftware.smack.util.collections.KeyValue
        public K getKey() {
            return this.parent.keyType > 0 ? this.refKey.get() : (K) super.getKey();
        }

        @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap.HashEntry, java.util.Map.Entry, org.jivesoftware.smack.util.collections.KeyValue
        public V getValue() {
            return this.parent.valueType > 0 ? this.refValue.get() : (V) super.getValue();
        }

        @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap.HashEntry, java.util.Map.Entry
        public V setValue(V v) {
            V value = getValue();
            if (this.parent.valueType > 0) {
                this.refValue.clear();
                this.refValue = (Reference<V>) toReference(this.parent.valueType, v, this.hashCode);
            } else {
                super.setValue(v);
            }
            return value;
        }

        @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap.HashEntry, java.util.Map.Entry
        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof Map.Entry)) {
                return false;
            }
            Map.Entry entry = (Map.Entry) obj;
            Object entryKey = entry.getKey();
            Object entryValue = entry.getValue();
            return entryKey != null && entryValue != null && this.parent.isEqualKey(entryKey, getKey()) && this.parent.isEqualValue(entryValue, getValue());
        }

        @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap.HashEntry, java.util.Map.Entry
        public int hashCode() {
            return this.parent.hashEntry(getKey(), getValue());
        }

        protected <T> Reference<T> toReference(int type, T referent, int hash) {
            switch (type) {
                case 1:
                    return new SoftRef(hash, referent, ((AbstractReferenceMap) this.parent).queue);
                case 2:
                    return new WeakRef(hash, referent, ((AbstractReferenceMap) this.parent).queue);
                default:
                    throw new Error("Attempt to create hard reference in ReferenceMap!");
            }
        }

        boolean purge(Reference ref) {
            boolean r = (this.parent.keyType > 0 && this.refKey == ref) || (this.parent.valueType > 0 && this.refValue == ref);
            if (r) {
                if (this.parent.keyType > 0) {
                    this.refKey.clear();
                }
                if (this.parent.valueType > 0) {
                    this.refValue.clear();
                } else if (this.parent.purgeValues) {
                    setValue(null);
                }
            }
            return r;
        }

        protected ReferenceEntry<K, V> next() {
            return (ReferenceEntry) this.next;
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceIteratorBase.class */
    static class ReferenceIteratorBase<K, V> {
        final AbstractReferenceMap<K, V> parent;
        int index;
        ReferenceEntry<K, V> entry;
        ReferenceEntry<K, V> previous;
        K nextKey;
        V nextValue;
        K currentKey;
        V currentValue;
        int expectedModCount;

        public ReferenceIteratorBase(AbstractReferenceMap<K, V> parent) {
            this.parent = parent;
            this.index = parent.size() != 0 ? parent.data.length : 0;
            this.expectedModCount = parent.modCount;
        }

        public boolean hasNext() {
            checkMod();
            while (nextNull()) {
                ReferenceEntry<K, V> e = this.entry;
                int i = this.index;
                while (e == null && i > 0) {
                    i--;
                    e = (ReferenceEntry) this.parent.data[i];
                }
                this.entry = e;
                this.index = i;
                if (e == null) {
                    this.currentKey = null;
                    this.currentValue = null;
                    return false;
                }
                this.nextKey = e.getKey();
                this.nextValue = e.getValue();
                if (nextNull()) {
                    this.entry = this.entry.next();
                }
            }
            return true;
        }

        private void checkMod() {
            if (this.parent.modCount != this.expectedModCount) {
                throw new ConcurrentModificationException();
            }
        }

        private boolean nextNull() {
            return this.nextKey == null || this.nextValue == null;
        }

        protected ReferenceEntry<K, V> nextEntry() {
            checkMod();
            if (nextNull() && !hasNext()) {
                throw new NoSuchElementException();
            }
            this.previous = this.entry;
            this.entry = this.entry.next();
            this.currentKey = this.nextKey;
            this.currentValue = this.nextValue;
            this.nextKey = null;
            this.nextValue = null;
            return this.previous;
        }

        protected ReferenceEntry<K, V> currentEntry() {
            checkMod();
            return this.previous;
        }

        public ReferenceEntry<K, V> superNext() {
            return nextEntry();
        }

        public void remove() {
            checkMod();
            if (this.previous == null) {
                throw new IllegalStateException();
            }
            this.parent.remove(this.currentKey);
            this.previous = null;
            this.currentKey = null;
            this.currentValue = null;
            this.expectedModCount = this.parent.modCount;
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceEntrySetIterator.class */
    static class ReferenceEntrySetIterator<K, V> extends ReferenceIteratorBase<K, V> implements Iterator<Map.Entry<K, V>> {
        public ReferenceEntrySetIterator(AbstractReferenceMap<K, V> abstractReferenceMap) {
            super(abstractReferenceMap);
        }

        @Override // java.util.Iterator
        public ReferenceEntry<K, V> next() {
            return superNext();
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceKeySetIterator.class */
    static class ReferenceKeySetIterator<K, V> extends ReferenceIteratorBase<K, V> implements Iterator<K> {
        ReferenceKeySetIterator(AbstractReferenceMap<K, V> parent) {
            super(parent);
        }

        @Override // java.util.Iterator
        public K next() {
            return nextEntry().getKey();
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceValuesIterator.class */
    static class ReferenceValuesIterator<K, V> extends ReferenceIteratorBase<K, V> implements Iterator<V> {
        ReferenceValuesIterator(AbstractReferenceMap<K, V> parent) {
            super(parent);
        }

        @Override // java.util.Iterator
        public V next() {
            return nextEntry().getValue();
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$ReferenceMapIterator.class */
    static class ReferenceMapIterator<K, V> extends ReferenceIteratorBase<K, V> implements MapIterator<K, V> {
        protected ReferenceMapIterator(AbstractReferenceMap<K, V> parent) {
            super(parent);
        }

        @Override // org.jivesoftware.smack.util.collections.MapIterator, java.util.Iterator
        public K next() {
            return nextEntry().getKey();
        }

        @Override // org.jivesoftware.smack.util.collections.MapIterator
        public K getKey() {
            AbstractHashedMap.HashEntry<K, V> current = currentEntry();
            if (current == null) {
                throw new IllegalStateException("getKey() can only be called after next() and before remove()");
            }
            return current.getKey();
        }

        @Override // org.jivesoftware.smack.util.collections.MapIterator
        public V getValue() {
            AbstractHashedMap.HashEntry<K, V> current = currentEntry();
            if (current == null) {
                throw new IllegalStateException("getValue() can only be called after next() and before remove()");
            }
            return current.getValue();
        }

        @Override // org.jivesoftware.smack.util.collections.MapIterator
        public V setValue(V value) {
            AbstractHashedMap.HashEntry<K, V> current = currentEntry();
            if (current == null) {
                throw new IllegalStateException("setValue() can only be called after next() and before remove()");
            }
            return current.setValue(value);
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$SoftRef.class */
    static class SoftRef<T> extends SoftReference<T> {
        private int hash;

        public SoftRef(int hash, T r, ReferenceQueue q) {
            super(r, q);
            this.hash = hash;
        }

        public int hashCode() {
            return this.hash;
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/collections/AbstractReferenceMap$WeakRef.class */
    static class WeakRef<T> extends WeakReference<T> {
        private int hash;

        public WeakRef(int hash, T r, ReferenceQueue q) {
            super(r, q);
            this.hash = hash;
        }

        public int hashCode() {
            return this.hash;
        }
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap
    protected void doWriteObject(ObjectOutputStream out) throws IOException {
        out.writeInt(this.keyType);
        out.writeInt(this.valueType);
        out.writeBoolean(this.purgeValues);
        out.writeFloat(this.loadFactor);
        out.writeInt(this.data.length);
        MapIterator it = mapIterator();
        while (it.hasNext()) {
            out.writeObject(it.next());
            out.writeObject(it.getValue());
        }
        out.writeObject(null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // org.jivesoftware.smack.util.collections.AbstractHashedMap
    protected void doReadObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        this.keyType = in.readInt();
        this.valueType = in.readInt();
        this.purgeValues = in.readBoolean();
        this.loadFactor = in.readFloat();
        int capacity = in.readInt();
        init();
        this.data = new AbstractHashedMap.HashEntry[capacity];
        while (true) {
            Object readObject = in.readObject();
            if (readObject != null) {
                put(readObject, in.readObject());
            } else {
                this.threshold = calculateThreshold(this.data.length, this.loadFactor);
                return;
            }
        }
    }
}
