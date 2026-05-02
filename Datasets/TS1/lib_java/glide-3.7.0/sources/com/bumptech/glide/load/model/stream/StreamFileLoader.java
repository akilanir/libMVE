package com.bumptech.glide.load.model.stream;

import android.content.Context;
import android.net.Uri;
import com.bumptech.glide.Glide;
import com.bumptech.glide.load.model.FileLoader;
import com.bumptech.glide.load.model.GenericLoaderFactory;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.model.ModelLoaderFactory;
import java.io.File;
import java.io.InputStream;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/model/stream/StreamFileLoader.class */
public class StreamFileLoader extends FileLoader<InputStream> implements StreamModelLoader<File> {

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/model/stream/StreamFileLoader$Factory.class */
    public static class Factory implements ModelLoaderFactory<File, InputStream> {
        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public ModelLoader<File, InputStream> build(Context context, GenericLoaderFactory factories) {
            return new StreamFileLoader((ModelLoader<Uri, InputStream>) factories.buildModelLoader(Uri.class, InputStream.class));
        }

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public void teardown() {
        }
    }

    public StreamFileLoader(Context context) {
        this((ModelLoader<Uri, InputStream>) Glide.buildStreamModelLoader(Uri.class, context));
    }

    public StreamFileLoader(ModelLoader<Uri, InputStream> uriLoader) {
        super(uriLoader);
    }
}
