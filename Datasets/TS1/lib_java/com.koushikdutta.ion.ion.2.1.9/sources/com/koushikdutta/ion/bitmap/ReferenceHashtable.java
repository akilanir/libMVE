package com.koushikdutta.ion.bitmap;

import java.lang.ref.Reference;
import java.util.Hashtable;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/bitmap/ReferenceHashtable.class */
public abstract class ReferenceHashtable<K, V, R extends Reference<V>> {
    Hashtable<K, R> mTable = new Hashtable<>();

    protected abstract R create(V v);

    public V put(K k, V v) {
        Reference reference = (Reference) this.mTable.put(k, create(v));
        if (reference == null) {
            return null;
        }
        return (V) reference.get();
    }

    public V get(K k) {
        R r = this.mTable.get(k);
        if (r == null) {
            return null;
        }
        V v = (V) r.get();
        if (v == null) {
            this.mTable.remove(k);
        }
        return v;
    }

    public V remove(K k) {
        R remove = this.mTable.remove(k);
        if (remove == null) {
            return null;
        }
        return (V) remove.get();
    }

    public void clear() {
        this.mTable.clear();
    }
}
