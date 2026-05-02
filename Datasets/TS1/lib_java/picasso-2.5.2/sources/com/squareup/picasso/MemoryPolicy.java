package com.squareup.picasso;

/* loaded from: picasso-2.5.2.jar:com/squareup/picasso/MemoryPolicy.class */
public enum MemoryPolicy {
    NO_CACHE(1),
    NO_STORE(2);

    final int index;

    static boolean shouldReadFromMemoryCache(int memoryPolicy) {
        return (memoryPolicy & NO_CACHE.index) == 0;
    }

    static boolean shouldWriteToMemoryCache(int memoryPolicy) {
        return (memoryPolicy & NO_STORE.index) == 0;
    }

    MemoryPolicy(int index) {
        this.index = index;
    }
}
