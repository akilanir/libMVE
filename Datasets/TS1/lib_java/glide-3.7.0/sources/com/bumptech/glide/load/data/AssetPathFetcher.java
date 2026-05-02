package com.bumptech.glide.load.data;

import android.content.res.AssetManager;
import android.util.Log;
import com.bumptech.glide.Priority;
import java.io.IOException;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/data/AssetPathFetcher.class */
public abstract class AssetPathFetcher<T> implements DataFetcher<T> {
    private static final String TAG = "AssetUriFetcher";
    private final String assetPath;
    private final AssetManager assetManager;
    private T data;

    protected abstract T loadResource(AssetManager assetManager, String str) throws IOException;

    protected abstract void close(T t) throws IOException;

    public AssetPathFetcher(AssetManager assetManager, String assetPath) {
        this.assetManager = assetManager;
        this.assetPath = assetPath;
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public T loadData(Priority priority) throws Exception {
        this.data = loadResource(this.assetManager, this.assetPath);
        return this.data;
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public void cleanup() {
        if (this.data == null) {
            return;
        }
        try {
            close(this.data);
        } catch (IOException e) {
            if (Log.isLoggable(TAG, 2)) {
                Log.v(TAG, "Failed to close data", e);
            }
        }
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public String getId() {
        return this.assetPath;
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public void cancel() {
    }
}
