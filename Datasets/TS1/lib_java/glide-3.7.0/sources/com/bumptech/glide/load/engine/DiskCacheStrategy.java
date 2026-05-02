package com.bumptech.glide.load.engine;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/DiskCacheStrategy.class */
public enum DiskCacheStrategy {
    ALL(true, true),
    NONE(false, false),
    SOURCE(true, false),
    RESULT(false, true);

    private final boolean cacheSource;
    private final boolean cacheResult;

    DiskCacheStrategy(boolean cacheSource, boolean cacheResult) {
        this.cacheSource = cacheSource;
        this.cacheResult = cacheResult;
    }

    public boolean cacheSource() {
        return this.cacheSource;
    }

    public boolean cacheResult() {
        return this.cacheResult;
    }
}
