package com.bumptech.glide.load.data;

import android.content.ContentResolver;
import android.content.Context;
import android.net.Uri;
import android.util.Log;
import com.bumptech.glide.Priority;
import java.io.FileNotFoundException;
import java.io.IOException;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/data/LocalUriFetcher.class */
public abstract class LocalUriFetcher<T> implements DataFetcher<T> {
    private static final String TAG = "LocalUriFetcher";
    private final Uri uri;
    private final Context context;
    private T data;

    protected abstract T loadResource(Uri uri, ContentResolver contentResolver) throws FileNotFoundException;

    protected abstract void close(T t) throws IOException;

    public LocalUriFetcher(Context context, Uri uri) {
        this.context = context.getApplicationContext();
        this.uri = uri;
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public final T loadData(Priority priority) throws Exception {
        ContentResolver contentResolver = this.context.getContentResolver();
        this.data = loadResource(this.uri, contentResolver);
        return this.data;
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public void cleanup() {
        if (this.data != null) {
            try {
                close(this.data);
            } catch (IOException e) {
                if (Log.isLoggable(TAG, 2)) {
                    Log.v(TAG, "failed to close data", e);
                }
            }
        }
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public void cancel() {
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public String getId() {
        return this.uri.toString();
    }
}
