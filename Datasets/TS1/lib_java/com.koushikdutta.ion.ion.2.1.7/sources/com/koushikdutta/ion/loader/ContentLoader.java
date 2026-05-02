package com.koushikdutta.ion.loader;

import android.content.Context;
import android.net.Uri;
import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.async.future.FutureCallback;
import com.koushikdutta.async.http.AsyncHttpRequest;
import com.koushikdutta.async.stream.InputStreamDataEmitter;
import com.koushikdutta.ion.Ion;
import com.koushikdutta.ion.Loader;
import com.koushikdutta.ion.ResponseServedFrom;
import com.koushikdutta.ion.bitmap.BitmapInfo;
import java.io.InputStream;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/loader/ContentLoader.class */
public class ContentLoader extends StreamLoader {
    @Override // com.koushikdutta.ion.loader.StreamLoader, com.koushikdutta.ion.loader.SimpleLoader, com.koushikdutta.ion.Loader
    public Future<BitmapInfo> loadBitmap(Context context, Ion ion, String key, String uri, int resizeWidth, int resizeHeight, boolean animateGif) {
        if (!uri.startsWith("content:/")) {
            return null;
        }
        return super.loadBitmap(context, ion, key, uri, resizeWidth, resizeHeight, animateGif);
    }

    @Override // com.koushikdutta.ion.loader.StreamLoader
    protected InputStream getInputStream(Context context, String uri) throws Exception {
        return context.getContentResolver().openInputStream(Uri.parse(uri));
    }

    @Override // com.koushikdutta.ion.loader.SimpleLoader, com.koushikdutta.ion.Loader
    public Future<DataEmitter> load(final Ion ion, final AsyncHttpRequest request, final FutureCallback<Loader.LoaderEmitter> callback) {
        if (!request.getUri().getScheme().startsWith("content")) {
            return null;
        }
        final InputStreamDataEmitterFuture ret = new InputStreamDataEmitterFuture();
        ion.getHttpClient().getServer().post(new Runnable() { // from class: com.koushikdutta.ion.loader.ContentLoader.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    InputStream stream = ion.getContext().getContentResolver().openInputStream(Uri.parse(request.getUri().toString()));
                    if (stream == null) {
                        throw new Exception("Unable to load content stream");
                    }
                    int available = stream.available();
                    InputStreamDataEmitter emitter = new InputStreamDataEmitter(ion.getHttpClient().getServer(), stream);
                    ret.setComplete(emitter);
                    callback.onCompleted((Exception) null, new Loader.LoaderEmitter(emitter, available, ResponseServedFrom.LOADED_FROM_CACHE, null, null));
                } catch (Exception e) {
                    ret.setComplete(e);
                    callback.onCompleted(e, (Object) null);
                }
            }
        });
        return ret;
    }
}
