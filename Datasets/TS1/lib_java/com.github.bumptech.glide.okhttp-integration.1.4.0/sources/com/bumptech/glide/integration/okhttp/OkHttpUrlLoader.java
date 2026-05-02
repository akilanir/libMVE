package com.bumptech.glide.integration.okhttp;

import android.content.Context;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.model.GenericLoaderFactory;
import com.bumptech.glide.load.model.GlideUrl;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.model.ModelLoaderFactory;
import com.squareup.okhttp.OkHttpClient;
import java.io.InputStream;

/* loaded from: com.github.bumptech.glide.okhttp-integration.1.4.0.jar:com/bumptech/glide/integration/okhttp/OkHttpUrlLoader.class */
public class OkHttpUrlLoader implements ModelLoader<GlideUrl, InputStream> {
    private final OkHttpClient client;

    /* loaded from: com.github.bumptech.glide.okhttp-integration.1.4.0.jar:com/bumptech/glide/integration/okhttp/OkHttpUrlLoader$Factory.class */
    public static class Factory implements ModelLoaderFactory<GlideUrl, InputStream> {
        private static volatile OkHttpClient internalClient;
        private OkHttpClient client;

        private static OkHttpClient getInternalClient() {
            if (internalClient == null) {
                synchronized (Factory.class) {
                    if (internalClient == null) {
                        internalClient = new OkHttpClient();
                    }
                }
            }
            return internalClient;
        }

        public Factory() {
            this(getInternalClient());
        }

        public Factory(OkHttpClient client) {
            this.client = client;
        }

        public ModelLoader<GlideUrl, InputStream> build(Context context, GenericLoaderFactory factories) {
            return new OkHttpUrlLoader(this.client);
        }

        public void teardown() {
        }
    }

    public OkHttpUrlLoader(OkHttpClient client) {
        this.client = client;
    }

    public DataFetcher<InputStream> getResourceFetcher(GlideUrl model, int width, int height) {
        return new OkHttpStreamFetcher(this.client, model);
    }
}
