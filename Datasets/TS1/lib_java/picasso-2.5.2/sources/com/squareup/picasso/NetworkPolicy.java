package com.squareup.picasso;

/* loaded from: picasso-2.5.2.jar:com/squareup/picasso/NetworkPolicy.class */
public enum NetworkPolicy {
    NO_CACHE(1),
    NO_STORE(2),
    OFFLINE(4);

    final int index;

    public static boolean shouldReadFromDiskCache(int networkPolicy) {
        return (networkPolicy & NO_CACHE.index) == 0;
    }

    public static boolean shouldWriteToDiskCache(int networkPolicy) {
        return (networkPolicy & NO_STORE.index) == 0;
    }

    public static boolean isOfflineOnly(int networkPolicy) {
        return (networkPolicy & OFFLINE.index) != 0;
    }

    NetworkPolicy(int index) {
        this.index = index;
    }
}
