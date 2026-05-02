package com.bumptech.glide.load.model;

import android.content.Context;
import android.content.res.Resources;
import android.net.Uri;
import com.bumptech.glide.load.data.DataFetcher;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/model/ResourceLoader.class */
public class ResourceLoader<T> implements ModelLoader<Integer, T> {
    private final ModelLoader<Uri, T> uriLoader;
    private final Resources resources;

    public ResourceLoader(Context context, ModelLoader<Uri, T> uriLoader) {
        this(context.getResources(), uriLoader);
    }

    public ResourceLoader(Resources resources, ModelLoader<Uri, T> uriLoader) {
        this.resources = resources;
        this.uriLoader = uriLoader;
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public DataFetcher<T> getResourceFetcher(Integer model, int width, int height) {
        Uri uri = Uri.parse("android.resource://" + this.resources.getResourcePackageName(model.intValue()) + '/' + this.resources.getResourceTypeName(model.intValue()) + '/' + this.resources.getResourceEntryName(model.intValue()));
        return this.uriLoader.getResourceFetcher(uri, width, height);
    }
}
