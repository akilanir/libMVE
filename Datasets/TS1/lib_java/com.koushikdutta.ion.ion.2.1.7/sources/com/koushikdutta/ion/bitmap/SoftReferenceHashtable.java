package com.koushikdutta.ion.bitmap;

import java.lang.ref.SoftReference;
import java.util.Hashtable;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/bitmap/SoftReferenceHashtable.class */
public class SoftReferenceHashtable<K, V> {
    Hashtable<K, SoftReference<V>> mTable = new Hashtable<>();

    public V put(K key, V value) {
        SoftReference<V> old = this.mTable.put(key, new SoftReference<>(value));
        if (old == null) {
            return null;
        }
        return old.get();
    }

    public V get(K key) {
        SoftReference<V> val = this.mTable.get(key);
        if (val == null) {
            return null;
        }
        V ret = val.get();
        if (ret == null) {
            this.mTable.remove(key);
        }
        return ret;
    }

    public V remove(K k) {
        SoftReference<V> v = this.mTable.remove(k);
        if (v == null) {
            return null;
        }
        return v.get();
    }

    public void clear() {
        this.mTable.clear();
    }
}
