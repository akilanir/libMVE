package com.bumptech.glide.load.engine.bitmap_recycle;

import java.util.Map;
import java.util.TreeMap;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/bitmap_recycle/PrettyPrintTreeMap.class */
class PrettyPrintTreeMap<K, V> extends TreeMap<K, V> {
    PrettyPrintTreeMap() {
    }

    @Override // java.util.AbstractMap
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("( ");
        for (Map.Entry<K, V> entry : entrySet()) {
            sb.append('{').append(entry.getKey()).append(':').append(entry.getValue()).append("}, ");
        }
        if (!isEmpty()) {
            sb.replace(sb.length() - 2, sb.length(), "");
        }
        return sb.append(" )").toString();
    }
}
