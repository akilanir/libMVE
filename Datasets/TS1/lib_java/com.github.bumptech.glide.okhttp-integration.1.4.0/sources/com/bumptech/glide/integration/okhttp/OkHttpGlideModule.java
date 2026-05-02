package com.bumptech.glide.integration.okhttp;

import android.content.Context;
import com.bumptech.glide.Glide;
import com.bumptech.glide.GlideBuilder;
import com.bumptech.glide.integration.okhttp.OkHttpUrlLoader;
import com.bumptech.glide.load.model.GlideUrl;
import com.bumptech.glide.module.GlideModule;
import java.io.InputStream;

/* loaded from: com.github.bumptech.glide.okhttp-integration.1.4.0.jar:com/bumptech/glide/integration/okhttp/OkHttpGlideModule.class */
public class OkHttpGlideModule implements GlideModule {
    public void applyOptions(Context context, GlideBuilder builder) {
    }

    public void registerComponents(Context context, Glide glide) {
        glide.register(GlideUrl.class, InputStream.class, new OkHttpUrlLoader.Factory());
    }
}
