package com.koushikdutta.async.util;

import java.util.Hashtable;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/util/UntypedHashtable.class */
public class UntypedHashtable {
    private Hashtable<String, Object> hash = new Hashtable<>();

    public void put(String key, Object value) {
        this.hash.put(key, value);
    }

    public void remove(String key) {
        this.hash.remove(key);
    }

    public <T> T get(String str, T t) {
        T t2 = (T) get(str);
        if (t2 == null) {
            return t;
        }
        return t2;
    }

    public <T> T get(String str) {
        return (T) this.hash.get(str);
    }
}
