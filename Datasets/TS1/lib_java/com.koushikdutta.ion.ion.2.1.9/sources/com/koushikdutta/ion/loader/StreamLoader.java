package com.koushikdutta.ion.loader;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Point;
import android.text.TextUtils;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.async.future.SimpleFuture;
import com.koushikdutta.async.util.StreamUtility;
import com.koushikdutta.ion.Ion;
import com.koushikdutta.ion.ResponseServedFrom;
import com.koushikdutta.ion.bitmap.BitmapInfo;
import com.koushikdutta.ion.bitmap.IonBitmapCache;
import com.koushikdutta.ion.gif.GifDecoder;
import com.koushikdutta.ion.gif.GifFrame;
import java.io.Closeable;
import java.io.InputStream;
import java.nio.ByteBuffer;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/loader/StreamLoader.class */
public class StreamLoader extends SimpleLoader {
    protected BitmapInfo loadGif(String key, Point size, InputStream in, BitmapFactory.Options options) throws Exception {
        GifDecoder gifDecoder = new GifDecoder(ByteBuffer.wrap(StreamUtility.readToEndAsArray(in)));
        GifFrame frame = gifDecoder.nextFrame();
        BitmapInfo info = new BitmapInfo(key, options.outMimeType, frame.image, size);
        info.gifDecoder = gifDecoder;
        return info;
    }

    protected InputStream getInputStream(Context context, String uri) throws Exception {
        return null;
    }

    @Override // com.koushikdutta.ion.loader.SimpleLoader, com.koushikdutta.ion.Loader
    public Future<BitmapInfo> loadBitmap(final Context context, final Ion ion, final String key, final String uri, final int resizeWidth, final int resizeHeight, final boolean animateGif) {
        final SimpleFuture<BitmapInfo> ret = new SimpleFuture<>();
        Ion.getBitmapLoadExecutorService().execute(new Runnable() { // from class: com.koushikdutta.ion.loader.StreamLoader.1
            @Override // java.lang.Runnable
            public void run() {
                BitmapInfo info;
                try {
                    try {
                        try {
                            InputStream in = StreamLoader.this.getInputStream(context, uri);
                            BitmapFactory.Options options = ion.getBitmapCache().prepareBitmapOptions(in, resizeWidth, resizeHeight);
                            StreamUtility.closeQuietly(new Closeable[]{in});
                            Point size = new Point(options.outWidth, options.outHeight);
                            InputStream in2 = StreamLoader.this.getInputStream(context, uri);
                            if (animateGif && TextUtils.equals("image/gif", options.outMimeType)) {
                                info = StreamLoader.this.loadGif(key, size, in2, options);
                            } else {
                                Bitmap bitmap = IonBitmapCache.loadBitmap(in2, options);
                                if (bitmap == null) {
                                    throw new Exception("Bitmap failed to load");
                                }
                                info = new BitmapInfo(key, options.outMimeType, bitmap, size);
                            }
                            info.servedFrom = ResponseServedFrom.LOADED_FROM_CACHE;
                            ret.setComplete(info);
                            StreamUtility.closeQuietly(new Closeable[]{in2});
                        } catch (OutOfMemoryError e) {
                            ret.setComplete(new Exception(e), (Object) null);
                            StreamUtility.closeQuietly(new Closeable[]{null});
                        }
                    } catch (Exception e2) {
                        ret.setComplete(e2);
                        StreamUtility.closeQuietly(new Closeable[]{null});
                    }
                } catch (Throwable th) {
                    StreamUtility.closeQuietly(new Closeable[]{null});
                    throw th;
                }
            }
        });
        return ret;
    }
}
