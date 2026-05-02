package com.koushikdutta.async.util;

import java.util.ArrayList;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/util/TaggedList.class */
public class TaggedList<T> extends ArrayList<T> {
    private Object tag;

    public synchronized <V> V tag() {
        return (V) this.tag;
    }

    public synchronized <V> void tag(V tag) {
        this.tag = tag;
    }

    public synchronized <V> void tagNull(V tag) {
        if (this.tag == null) {
            this.tag = tag;
        }
    }
}
