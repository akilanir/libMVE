package com.koushikdutta.ion.loader;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Point;
import android.text.TextUtils;
import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.FileDataEmitter;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.async.future.FutureCallback;
import com.koushikdutta.async.future.SimpleFuture;
import com.koushikdutta.async.http.AsyncHttpRequest;
import com.koushikdutta.async.util.StreamUtility;
import com.koushikdutta.ion.Ion;
import com.koushikdutta.ion.Loader;
import com.koushikdutta.ion.ResponseServedFrom;
import com.koushikdutta.ion.bitmap.BitmapInfo;
import com.koushikdutta.ion.bitmap.IonBitmapCache;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.net.URI;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/loader/FileLoader.class */
public class FileLoader extends StreamLoader {

    /* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/loader/FileLoader$FileFuture.class */
    private static final class FileFuture extends SimpleFuture<DataEmitter> {
        private FileFuture() {
        }
    }

    @Override // com.koushikdutta.ion.loader.StreamLoader, com.koushikdutta.ion.loader.SimpleLoader, com.koushikdutta.ion.Loader
    public Future<BitmapInfo> loadBitmap(Context context, final Ion ion, final String key, final String uri, final int resizeWidth, final int resizeHeight, final boolean animateGif) {
        if (uri == null || !uri.startsWith("file:/")) {
            return null;
        }
        final SimpleFuture<BitmapInfo> ret = new SimpleFuture<>();
        Ion.getBitmapLoadExecutorService().execute(new Runnable() { // from class: com.koushikdutta.ion.loader.FileLoader.1
            @Override // java.lang.Runnable
            public void run() {
                BitmapInfo info;
                if (ret.isCancelled()) {
                    return;
                }
                try {
                    File file = new File(URI.create(uri));
                    BitmapFactory.Options options = ion.getBitmapCache().prepareBitmapOptions(file, resizeWidth, resizeHeight);
                    Point size = new Point(options.outWidth, options.outHeight);
                    if (animateGif && TextUtils.equals("image/gif", options.outMimeType)) {
                        FileInputStream fin = new FileInputStream(file);
                        try {
                            info = FileLoader.this.loadGif(key, size, fin, options);
                            StreamUtility.closeQuietly(new Closeable[]{fin});
                        } catch (Throwable th) {
                            StreamUtility.closeQuietly(new Closeable[]{fin});
                            throw th;
                        }
                    } else {
                        Bitmap bitmap = IonBitmapCache.loadBitmap(file, options);
                        if (bitmap == null) {
                            throw new Exception("Bitmap failed to load");
                        }
                        info = new BitmapInfo(key, options.outMimeType, bitmap, size);
                    }
                    info.servedFrom = ResponseServedFrom.LOADED_FROM_CACHE;
                    ret.setComplete(info);
                } catch (Exception e) {
                    ret.setComplete(e);
                } catch (OutOfMemoryError e2) {
                    ret.setComplete(new Exception(e2), (Object) null);
                }
            }
        });
        return ret;
    }

    @Override // com.koushikdutta.ion.loader.SimpleLoader, com.koushikdutta.ion.Loader
    public Future<DataEmitter> load(final Ion ion, final AsyncHttpRequest request, final FutureCallback<Loader.LoaderEmitter> callback) {
        if (!request.getUri().getScheme().startsWith("file")) {
            return null;
        }
        final FileFuture ret = new FileFuture();
        ion.getHttpClient().getServer().post(new Runnable() { // from class: com.koushikdutta.ion.loader.FileLoader.2
            @Override // java.lang.Runnable
            public void run() {
                File file = new File(URI.create(request.getUri().toString()));
                FileDataEmitter emitter = new FileDataEmitter(ion.getHttpClient().getServer(), file);
                ret.setComplete(emitter);
                callback.onCompleted((Exception) null, new Loader.LoaderEmitter(emitter, (int) file.length(), ResponseServedFrom.LOADED_FROM_CACHE, null, request));
            }
        });
        return ret;
    }
}
