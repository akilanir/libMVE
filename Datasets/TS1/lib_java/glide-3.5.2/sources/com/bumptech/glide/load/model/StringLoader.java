package com.bumptech.glide.load.model;

import android.net.Uri;
import com.bumptech.glide.load.data.DataFetcher;
import java.io.File;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/model/StringLoader.class */
public class StringLoader<T> implements ModelLoader<String, T> {
    private final ModelLoader<Uri, T> uriLoader;

    public StringLoader(ModelLoader<Uri, T> uriLoader) {
        this.uriLoader = uriLoader;
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public DataFetcher<T> getResourceFetcher(String model, int width, int height) {
        Uri uri;
        if (model.startsWith("/")) {
            uri = toFileUri(model);
        } else {
            uri = Uri.parse(model);
            String scheme = uri.getScheme();
            if (scheme == null) {
                uri = toFileUri(model);
            }
        }
        return this.uriLoader.getResourceFetcher(uri, width, height);
    }

    private static Uri toFileUri(String path) {
        return Uri.fromFile(new File(path));
    }
}
