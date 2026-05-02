package com.bumptech.glide.load.engine.cache;

import com.bumptech.glide.load.Key;
import java.io.File;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/cache/DiskCache.class */
public interface DiskCache {

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/cache/DiskCache$Factory.class */
    public interface Factory {
        public static final int DEFAULT_DISK_CACHE_SIZE = 262144000;
        public static final String DEFAULT_DISK_CACHE_DIR = "image_manager_disk_cache";

        DiskCache build();
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/cache/DiskCache$Writer.class */
    public interface Writer {
        boolean write(File file);
    }

    File get(Key key);

    void put(Key key, Writer writer);

    void delete(Key key);

    void clear();
}
