package ch.qos.logback.classic.turbo;

import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/turbo/LRUMessageCache.class */
class LRUMessageCache extends LinkedHashMap<String, Integer> {
    private static final long serialVersionUID = 1;
    final int cacheSize;

    LRUMessageCache(int i) {
        super((int) (i * 1.3333334f), 0.75f, true);
        if (i < 1) {
            throw new IllegalArgumentException("Cache size cannot be smaller than 1");
        }
        this.cacheSize = i;
    }

    int getMessageCountAndThenIncrement(String str) {
        Integer valueOf;
        if (str == null) {
            return 0;
        }
        synchronized (this) {
            Integer num = (Integer) super.get(str);
            valueOf = num == null ? 0 : Integer.valueOf(num.intValue() + 1);
            super.put(str, valueOf);
        }
        return valueOf.intValue();
    }

    @Override // java.util.LinkedHashMap
    protected boolean removeEldestEntry(Map.Entry<String, Integer> entry) {
        return size() > this.cacheSize;
    }

    @Override // java.util.LinkedHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
    public synchronized void clear() {
        super.clear();
    }
}
