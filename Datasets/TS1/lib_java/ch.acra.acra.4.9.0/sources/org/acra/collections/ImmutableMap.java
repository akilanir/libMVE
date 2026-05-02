package org.acra.collections;

import android.support.annotation.NonNull;
import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import org.acra.collections.ImmutableSet;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/collections/ImmutableMap.class */
public final class ImmutableMap<K, V> implements Map<K, V>, Serializable {
    private final Map<K, V> mMap;

    public ImmutableMap(Map<K, V> map) {
        this.mMap = new HashMap(map);
    }

    @Override // java.util.Map
    public void clear() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public boolean containsKey(Object key) {
        return this.mMap.containsKey(key);
    }

    @Override // java.util.Map
    public boolean containsValue(Object value) {
        return this.mMap.containsValue(value);
    }

    @Override // java.util.Map
    @NonNull
    public Set<Map.Entry<K, V>> entrySet() {
        Set<Map.Entry<K, V>> original = this.mMap.entrySet();
        ImmutableSet.Builder<Map.Entry<K, V>> builder = new ImmutableSet.Builder<>();
        for (Map.Entry<K, V> entry : original) {
            builder.add(new ImmutableEntryWrapper<>(entry));
        }
        return builder.build();
    }

    @Override // java.util.Map
    public V get(Object key) {
        return this.mMap.get(key);
    }

    @Override // java.util.Map
    public boolean isEmpty() {
        return this.mMap.isEmpty();
    }

    @Override // java.util.Map
    @NonNull
    public Set<K> keySet() {
        return new ImmutableSet(this.mMap.keySet());
    }

    @Override // java.util.Map
    public V put(K key, V value) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public void putAll(@NonNull Map<? extends K, ? extends V> map) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public V remove(Object object) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public int size() {
        return this.mMap.size();
    }

    @Override // java.util.Map
    @NonNull
    public Collection<V> values() {
        return new ImmutableList(this.mMap.values());
    }

    /* loaded from: ch.acra.acra.4.9.0.jar:org/acra/collections/ImmutableMap$ImmutableEntryWrapper.class */
    public static class ImmutableEntryWrapper<K, V> implements Map.Entry<K, V> {
        private final Map.Entry<K, V> mEntry;

        ImmutableEntryWrapper(Map.Entry<K, V> mEntry) {
            this.mEntry = mEntry;
        }

        @Override // java.util.Map.Entry
        public K getKey() {
            return this.mEntry.getKey();
        }

        @Override // java.util.Map.Entry
        public V getValue() {
            return this.mEntry.getValue();
        }

        @Override // java.util.Map.Entry
        public V setValue(Object object) {
            throw new UnsupportedOperationException();
        }
    }
}
