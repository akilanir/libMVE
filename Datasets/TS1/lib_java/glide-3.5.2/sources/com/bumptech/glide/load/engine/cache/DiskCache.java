package com.bumptech.glide.load.engine.cache;

import com.bumptech.glide.load.Key;
import java.io.File;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/cache/DiskCache.class */
public interface DiskCache {

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/cache/DiskCache$Factory.class */
    public interface Factory {
        DiskCache build();
    }

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/cache/DiskCache$Writer.class */
    public interface Writer {
        boolean write(File file);
    }

    File get(Key key);

    void put(Key key, Writer writer);

    void delete(Key key);
}
