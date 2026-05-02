package org.springframework.util;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

/* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/util/LinkedCaseInsensitiveMap.class */
public class LinkedCaseInsensitiveMap<V> extends LinkedHashMap<String, V> {
    private static final long serialVersionUID = 1;
    private final Map<String, String> caseInsensitiveKeys;
    private final Locale locale;

    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public /* bridge */ /* synthetic */ Object put(Object x0, Object obj) {
        return put((String) x0, (String) obj);
    }

    public LinkedCaseInsensitiveMap() {
        this((Locale) null);
    }

    public LinkedCaseInsensitiveMap(Locale locale) {
        this.caseInsensitiveKeys = new HashMap();
        this.locale = locale != null ? locale : Locale.getDefault();
    }

    public LinkedCaseInsensitiveMap(int initialCapacity) {
        this(initialCapacity, null);
    }

    public LinkedCaseInsensitiveMap(int initialCapacity, Locale locale) {
        super(initialCapacity);
        this.caseInsensitiveKeys = new HashMap(initialCapacity);
        this.locale = locale != null ? locale : Locale.getDefault();
    }

    public V put(String str, V v) {
        this.caseInsensitiveKeys.put(convertKey(str), str);
        return (V) super.put((LinkedCaseInsensitiveMap<V>) str, (String) v);
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public void putAll(Map<? extends String, ? extends V> map) {
        if (map.isEmpty()) {
            return;
        }
        for (Map.Entry<? extends String, ? extends V> entry : map.entrySet()) {
            put(entry.getKey(), (String) entry.getValue());
        }
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public boolean containsKey(Object key) {
        return (key instanceof String) && this.caseInsensitiveKeys.containsKey(convertKey((String) key));
    }

    @Override // java.util.LinkedHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
    public V get(Object obj) {
        if (obj instanceof String) {
            return (V) super.get(this.caseInsensitiveKeys.get(convertKey((String) obj)));
        }
        return null;
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public V remove(Object obj) {
        if (obj instanceof String) {
            return (V) super.remove(this.caseInsensitiveKeys.remove(convertKey((String) obj)));
        }
        return null;
    }

    @Override // java.util.LinkedHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
    public void clear() {
        this.caseInsensitiveKeys.clear();
        super.clear();
    }

    protected String convertKey(String key) {
        return key.toLowerCase(this.locale);
    }
}
