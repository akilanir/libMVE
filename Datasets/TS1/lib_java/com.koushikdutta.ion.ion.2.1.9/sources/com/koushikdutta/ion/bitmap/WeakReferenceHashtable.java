package com.koushikdutta.ion.bitmap;

import java.lang.ref.Reference;
import java.lang.ref.WeakReference;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/bitmap/WeakReferenceHashtable.class */
public class WeakReferenceHashtable<K, V> extends ReferenceHashtable<K, V, WeakReference<V>> {
    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.koushikdutta.ion.bitmap.ReferenceHashtable
    protected /* bridge */ /* synthetic */ Reference create(Object obj) {
        return create((WeakReferenceHashtable<K, V>) obj);
    }

    @Override // com.koushikdutta.ion.bitmap.ReferenceHashtable
    protected WeakReference<V> create(V value) {
        return new WeakReference<>(value);
    }
}
