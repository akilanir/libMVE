package com.bumptech.glide.load.model;

import android.content.Context;
import android.net.Uri;
import com.bumptech.glide.load.data.DataFetcher;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/model/UriLoader.class */
public abstract class UriLoader<T> implements ModelLoader<Uri, T> {
    private final Context context;
    private final ModelLoader<GlideUrl, T> urlLoader;

    protected abstract DataFetcher<T> getLocalUriFetcher(Context context, Uri uri);

    protected abstract DataFetcher<T> getAssetPathFetcher(Context context, String str);

    public UriLoader(Context context, ModelLoader<GlideUrl, T> urlLoader) {
        this.context = context;
        this.urlLoader = urlLoader;
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final DataFetcher<T> getResourceFetcher(Uri model, int width, int height) {
        String scheme = model.getScheme();
        DataFetcher<T> result = null;
        if (isLocalUri(scheme)) {
            if (AssetUriParser.isAssetUri(model)) {
                String path = AssetUriParser.toAssetPath(model);
                result = getAssetPathFetcher(this.context, path);
            } else {
                result = getLocalUriFetcher(this.context, model);
            }
        } else if (this.urlLoader != null && ("http".equals(scheme) || "https".equals(scheme))) {
            result = this.urlLoader.getResourceFetcher(new GlideUrl(model.toString()), width, height);
        }
        return result;
    }

    private static boolean isLocalUri(String scheme) {
        return "file".equals(scheme) || "content".equals(scheme) || "android.resource".equals(scheme);
    }
}
