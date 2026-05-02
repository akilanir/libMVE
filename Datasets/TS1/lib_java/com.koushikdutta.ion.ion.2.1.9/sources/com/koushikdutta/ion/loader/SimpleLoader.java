package com.koushikdutta.ion.loader;

import android.content.Context;
import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.async.future.FutureCallback;
import com.koushikdutta.async.http.AsyncHttpRequest;
import com.koushikdutta.ion.Ion;
import com.koushikdutta.ion.Loader;
import com.koushikdutta.ion.bitmap.BitmapInfo;
import com.koushikdutta.ion.future.ResponseFuture;
import java.lang.reflect.Type;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/loader/SimpleLoader.class */
public class SimpleLoader implements Loader {
    @Override // com.koushikdutta.ion.Loader
    public Future<DataEmitter> load(Ion ion, AsyncHttpRequest request, FutureCallback<Loader.LoaderEmitter> callback) {
        return null;
    }

    @Override // com.koushikdutta.ion.Loader
    public Future<BitmapInfo> loadBitmap(Context context, Ion ion, String key, String uri, int resizeWidth, int resizeHeight, boolean animateGif) {
        return null;
    }

    @Override // com.koushikdutta.ion.Loader
    public Future<AsyncHttpRequest> resolve(Context context, Ion ion, AsyncHttpRequest request) {
        return null;
    }

    @Override // com.koushikdutta.ion.Loader
    public <T> ResponseFuture<T> load(Ion ion, AsyncHttpRequest request, Type type) {
        return null;
    }
}
