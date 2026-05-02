package com.koushikdutta.async.util;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Set;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/util/HashList.class */
public class HashList<T> {
    Hashtable<String, TaggedList<T>> internal = new Hashtable<>();

    public Set<String> keySet() {
        return this.internal.keySet();
    }

    public synchronized <V> V tag(String str) {
        TaggedList<T> taggedList = this.internal.get(str);
        if (taggedList == null) {
            return null;
        }
        return (V) taggedList.tag();
    }

    public synchronized <V> void tag(String key, V tag) {
        TaggedList<T> list = this.internal.get(key);
        if (list == null) {
            list = new TaggedList<>();
            this.internal.put(key, list);
        }
        list.tag(tag);
    }

    public synchronized ArrayList<T> remove(String key) {
        return this.internal.remove(key);
    }

    public synchronized int size() {
        return this.internal.size();
    }

    public synchronized ArrayList<T> get(String key) {
        return this.internal.get(key);
    }

    public synchronized boolean contains(String key) {
        ArrayList<T> check = get(key);
        return check != null && check.size() > 0;
    }

    public synchronized void add(String key, T value) {
        ArrayList<T> ret = get(key);
        if (ret == null) {
            TaggedList<T> put = new TaggedList<>();
            ret = put;
            this.internal.put(key, put);
        }
        ret.add(value);
    }

    public synchronized T pop(String key) {
        TaggedList<T> values = this.internal.get(key);
        if (values == null || values.size() == 0) {
            return null;
        }
        return values.remove(values.size() - 1);
    }

    public synchronized boolean removeItem(String key, T value) {
        TaggedList<T> values = this.internal.get(key);
        if (values == null) {
            return false;
        }
        values.remove(value);
        return values.size() == 0;
    }
}
