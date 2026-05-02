package zmq;

import java.lang.Comparable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

/* loaded from: jeromq-0.3.5.jar:zmq/MultiMap.class */
public class MultiMap<K extends Comparable<? super K>, V> implements Map<K, V> {
    private long id = 0;
    private final HashMap<Long, V> values = new HashMap<>();
    private final TreeMap<K, ArrayList<Long>> keys = new TreeMap<>();

    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.util.Map
    public /* bridge */ /* synthetic */ Object put(Object x0, Object obj) {
        return put((MultiMap<K, V>) x0, (Comparable) obj);
    }

    /* loaded from: jeromq-0.3.5.jar:zmq/MultiMap$MultiMapEntry.class */
    public class MultiMapEntry implements Map.Entry<K, V> {
        private K key;
        private V value;

        public MultiMapEntry(K key, V value) {
            this.key = key;
            this.value = value;
        }

        @Override // java.util.Map.Entry
        public K getKey() {
            return this.key;
        }

        @Override // java.util.Map.Entry
        public V getValue() {
            return this.value;
        }

        @Override // java.util.Map.Entry
        public V setValue(V value) {
            V old = this.value;
            this.value = value;
            return old;
        }
    }

    /* loaded from: jeromq-0.3.5.jar:zmq/MultiMap$MultiMapEntrySet.class */
    public class MultiMapEntrySet implements Set<Map.Entry<K, V>>, Iterator<Map.Entry<K, V>> {
        private MultiMap<K, V> map;
        private Iterator<Map.Entry<K, ArrayList<Long>>> it;
        private Iterator<Long> iit;
        private K key;
        private long id;

        public MultiMapEntrySet(MultiMap<K, V> map) {
            this.map = map;
        }

        @Override // java.util.Set, java.util.Collection
        public boolean add(Map.Entry<K, V> arg0) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Set, java.util.Collection
        public boolean addAll(Collection<? extends Map.Entry<K, V>> arg0) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Set, java.util.Collection
        public void clear() {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Set, java.util.Collection
        public boolean contains(Object arg0) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Set, java.util.Collection
        public boolean containsAll(Collection<?> arg0) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Set, java.util.Collection
        public boolean isEmpty() {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Set, java.util.Collection, java.lang.Iterable
        public Iterator<Map.Entry<K, V>> iterator() {
            this.it = ((MultiMap) this.map).keys.entrySet().iterator();
            return this;
        }

        @Override // java.util.Set, java.util.Collection
        public boolean remove(Object arg0) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Set, java.util.Collection
        public boolean removeAll(Collection<?> arg0) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Set, java.util.Collection
        public boolean retainAll(Collection<?> arg0) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Set, java.util.Collection
        public int size() {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Set, java.util.Collection
        public Object[] toArray() {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Set, java.util.Collection
        public <T> T[] toArray(T[] arg0) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            if (this.iit == null || !this.iit.hasNext()) {
                if (!this.it.hasNext()) {
                    return false;
                }
                Map.Entry<K, ArrayList<Long>> item = this.it.next();
                this.key = item.getKey();
                this.iit = item.getValue().iterator();
                return true;
            }
            return true;
        }

        @Override // java.util.Iterator
        public Map.Entry<K, V> next() {
            this.id = this.iit.next().longValue();
            return new MultiMapEntry(this.key, ((MultiMap) this.map).values.get(Long.valueOf(this.id)));
        }

        @Override // java.util.Iterator
        public void remove() {
            this.iit.remove();
            ((MultiMap) this.map).values.remove(Long.valueOf(this.id));
            if (((ArrayList) ((MultiMap) this.map).keys.get(this.key)).isEmpty()) {
                this.it.remove();
            }
        }
    }

    @Override // java.util.Map
    public void clear() {
        this.keys.clear();
        this.values.clear();
    }

    @Override // java.util.Map
    public boolean containsKey(Object key) {
        return this.keys.containsKey(key);
    }

    @Override // java.util.Map
    public boolean containsValue(Object value) {
        return this.values.containsValue(value);
    }

    @Override // java.util.Map
    public Set<Map.Entry<K, V>> entrySet() {
        return new MultiMapEntrySet(this);
    }

    @Override // java.util.Map
    public V get(Object key) {
        ArrayList<Long> l = this.keys.get(key);
        if (l == null) {
            return null;
        }
        return this.values.get(l.get(0));
    }

    @Override // java.util.Map
    public boolean isEmpty() {
        return this.keys.isEmpty();
    }

    @Override // java.util.Map
    public Set<K> keySet() {
        return this.keys.keySet();
    }

    public V put(K key, V value) {
        ArrayList<Long> ids = this.keys.get(key);
        if (ids == null) {
            ArrayList<Long> ids2 = new ArrayList<>();
            ids2.add(Long.valueOf(this.id));
            this.keys.put(key, ids2);
        } else {
            ids.add(Long.valueOf(this.id));
        }
        this.values.put(Long.valueOf(this.id), value);
        this.id++;
        return null;
    }

    @Override // java.util.Map
    public void putAll(Map<? extends K, ? extends V> src) {
        for (Map.Entry<? extends K, ? extends V> o : src.entrySet()) {
            put((MultiMap<K, V>) o.getKey(), (K) o.getValue());
        }
    }

    @Override // java.util.Map
    public V remove(Object key) {
        ArrayList<Long> l = this.keys.get(key);
        if (l == null) {
            return null;
        }
        V old = this.values.remove(l.remove(0));
        if (l.isEmpty()) {
            this.keys.remove(key);
        }
        return old;
    }

    @Override // java.util.Map
    public int size() {
        return this.values.size();
    }

    @Override // java.util.Map
    public Collection<V> values() {
        return this.values.values();
    }
}
