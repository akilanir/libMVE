package com.koushikdutta.ion.bitmap;

import java.lang.ref.Reference;
import java.lang.ref.SoftReference;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/bitmap/SoftReferenceHashtable.class */
public class SoftReferenceHashtable<K, V> extends ReferenceHashtable<K, V, SoftReference<V>> {
    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.koushikdutta.ion.bitmap.ReferenceHashtable
    protected /* bridge */ /* synthetic */ Reference create(Object obj) {
        return create((SoftReferenceHashtable<K, V>) obj);
    }

    @Override // com.koushikdutta.ion.bitmap.ReferenceHashtable
    protected SoftReference<V> create(V value) {
        return new SoftReference<>(value);
    }
}
