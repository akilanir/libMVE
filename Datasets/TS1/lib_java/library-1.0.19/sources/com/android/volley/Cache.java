package com.android.volley;

import java.util.Collections;
import java.util.Map;

/* loaded from: library-1.0.19.jar:com/android/volley/Cache.class */
public interface Cache {
    Entry get(String str);

    void put(String str, Entry entry);

    void initialize();

    void invalidate(String str, boolean z);

    void remove(String str);

    void clear();

    /* loaded from: library-1.0.19.jar:com/android/volley/Cache$Entry.class */
    public static class Entry {
        public byte[] data;
        public String etag;
        public long serverDate;
        public long lastModified;
        public long ttl;
        public long softTtl;
        public Map<String, String> responseHeaders = Collections.emptyMap();

        public boolean isExpired() {
            return this.ttl < System.currentTimeMillis();
        }

        public boolean refreshNeeded() {
            return this.softTtl < System.currentTimeMillis();
        }
    }
}
