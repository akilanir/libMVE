package com.bumptech.glide.load.engine.cache;

import android.util.Log;
import com.bumptech.glide.disklrucache.DiskLruCache;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.engine.cache.DiskCache;
import java.io.File;
import java.io.IOException;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/cache/DiskLruCacheWrapper.class */
public class DiskLruCacheWrapper implements DiskCache {
    private static final String TAG = "DiskLruCacheWrapper";
    private static final int APP_VERSION = 1;
    private static final int VALUE_COUNT = 1;
    private static DiskLruCacheWrapper wrapper = null;
    private final SafeKeyGenerator safeKeyGenerator = new SafeKeyGenerator();
    private final File directory;
    private final int maxSize;
    private DiskLruCache diskLruCache;

    public static synchronized DiskCache get(File directory, int maxSize) {
        if (wrapper == null) {
            wrapper = new DiskLruCacheWrapper(directory, maxSize);
        }
        return wrapper;
    }

    protected DiskLruCacheWrapper(File directory, int maxSize) {
        this.directory = directory;
        this.maxSize = maxSize;
    }

    private synchronized DiskLruCache getDiskCache() throws IOException {
        if (this.diskLruCache == null) {
            this.diskLruCache = DiskLruCache.open(this.directory, 1, 1, this.maxSize);
        }
        return this.diskLruCache;
    }

    @Override // com.bumptech.glide.load.engine.cache.DiskCache
    public File get(Key key) {
        String safeKey = this.safeKeyGenerator.getSafeKey(key);
        File result = null;
        try {
            DiskLruCache.Value value = getDiskCache().get(safeKey);
            if (value != null) {
                result = value.getFile(0);
            }
        } catch (IOException e) {
            if (Log.isLoggable(TAG, 5)) {
                Log.w(TAG, "Unable to get from disk cache", e);
            }
        }
        return result;
    }

    /* JADX WARN: Finally extract failed */
    @Override // com.bumptech.glide.load.engine.cache.DiskCache
    public void put(Key key, DiskCache.Writer writer) {
        String safeKey = this.safeKeyGenerator.getSafeKey(key);
        try {
            DiskLruCache.Editor editor = getDiskCache().edit(safeKey);
            if (editor != null) {
                try {
                    File file = editor.getFile(0);
                    if (writer.write(file)) {
                        editor.commit();
                    }
                    editor.abortUnlessCommitted();
                } catch (Throwable th) {
                    editor.abortUnlessCommitted();
                    throw th;
                }
            }
        } catch (IOException e) {
            if (Log.isLoggable(TAG, 5)) {
                Log.w(TAG, "Unable to put to disk cache", e);
            }
        }
    }

    @Override // com.bumptech.glide.load.engine.cache.DiskCache
    public void delete(Key key) {
        String safeKey = this.safeKeyGenerator.getSafeKey(key);
        try {
            getDiskCache().remove(safeKey);
        } catch (IOException e) {
            if (Log.isLoggable(TAG, 5)) {
                Log.w(TAG, "Unable to delete from disk cache", e);
            }
        }
    }
}
