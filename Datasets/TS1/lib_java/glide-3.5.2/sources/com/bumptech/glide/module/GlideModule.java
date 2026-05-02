package com.bumptech.glide.module;

import android.content.Context;
import com.bumptech.glide.Glide;
import com.bumptech.glide.GlideBuilder;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/module/GlideModule.class */
public interface GlideModule {
    void applyOptions(Context context, GlideBuilder glideBuilder);

    void registerComponents(Context context, Glide glide);
}
