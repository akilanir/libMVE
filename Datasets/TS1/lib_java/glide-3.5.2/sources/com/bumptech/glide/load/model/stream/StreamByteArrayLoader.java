package com.bumptech.glide.load.model.stream;

import android.content.Context;
import com.bumptech.glide.load.data.ByteArrayFetcher;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.model.GenericLoaderFactory;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.model.ModelLoaderFactory;
import java.io.InputStream;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/model/stream/StreamByteArrayLoader.class */
public class StreamByteArrayLoader implements StreamModelLoader<byte[]> {
    private final String id;

    public StreamByteArrayLoader() {
        this("");
    }

    @Deprecated
    public StreamByteArrayLoader(String id) {
        this.id = id;
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public DataFetcher<InputStream> getResourceFetcher(byte[] model, int width, int height) {
        return new ByteArrayFetcher(model, this.id);
    }

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/model/stream/StreamByteArrayLoader$Factory.class */
    public static class Factory implements ModelLoaderFactory<byte[], InputStream> {
        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public ModelLoader<byte[], InputStream> build(Context context, GenericLoaderFactory factories) {
            return new StreamByteArrayLoader();
        }

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public void teardown() {
        }
    }
}
