package com.koushikdutta.ion;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Point;
import android.graphics.Rect;
import android.text.TextUtils;
import com.koushikdutta.async.future.FutureCallback;
import com.koushikdutta.async.util.FileCache;
import com.koushikdutta.async.util.StreamUtility;
import com.koushikdutta.ion.bitmap.BitmapInfo;
import com.koushikdutta.ion.gif.GifDecoder;
import com.koushikdutta.ion.gif.GifFrame;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.nio.ByteBuffer;

@TargetApi(10)
/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/LoadDeepZoom.class */
public class LoadDeepZoom extends LoadBitmapEmitter implements FutureCallback<Response<File>> {
    FileCache fileCache;

    public LoadDeepZoom(Ion ion, String urlKey, boolean animateGif, FileCache fileCache) {
        super(ion, urlKey, true, animateGif);
        this.fileCache = fileCache;
    }

    public void onCompleted(Exception e, final Response<File> response) {
        if (e == null) {
            e = response.getException();
        }
        if (e != null) {
            report(e, null);
            return;
        }
        final File tempFile = response.getResult();
        if (this.ion.bitmapsPending.tag(this.key) != this) {
            return;
        }
        Ion.getBitmapLoadExecutorService().execute(new Runnable() { // from class: com.koushikdutta.ion.LoadDeepZoom.1
            @Override // java.lang.Runnable
            public void run() {
                File file;
                try {
                    try {
                        if (LoadDeepZoom.this.fileCache != null) {
                            LoadDeepZoom.this.fileCache.commitTempFiles(LoadDeepZoom.this.key, new File[]{tempFile});
                            file = LoadDeepZoom.this.fileCache.getFile(LoadDeepZoom.this.key);
                        } else {
                            file = tempFile;
                        }
                        BitmapFactory.Options options = LoadDeepZoom.this.ion.getBitmapCache().prepareBitmapOptions(file, 0, 0);
                        Point size = new Point(options.outWidth, options.outHeight);
                        if (LoadDeepZoom.this.animateGif && TextUtils.equals("image/gif", options.outMimeType)) {
                            FileInputStream fin = LoadDeepZoom.this.fileCache.get(LoadDeepZoom.this.key);
                            GifDecoder gifDecoder = new GifDecoder(ByteBuffer.wrap(StreamUtility.readToEndAsArray(fin)));
                            GifFrame frame = gifDecoder.nextFrame();
                            BitmapInfo info = new BitmapInfo(LoadDeepZoom.this.key, options.outMimeType, frame.image, size);
                            info.gifDecoder = gifDecoder;
                            LoadDeepZoom.this.report(null, info);
                            StreamUtility.closeQuietly(new Closeable[]{fin});
                            return;
                        }
                        BitmapRegionDecoder decoder = BitmapRegionDecoder.newInstance(file.toString(), false);
                        Bitmap bitmap = decoder.decodeRegion(new Rect(0, 0, size.x, size.y), options);
                        if (bitmap == null) {
                            throw new Exception("unable to load decoder");
                        }
                        BitmapInfo info2 = new BitmapInfo(LoadDeepZoom.this.key, options.outMimeType, bitmap, size);
                        info2.decoder = decoder;
                        info2.decoderFile = file;
                        info2.servedFrom = response.getServedFrom();
                        LoadDeepZoom.this.report(null, info2);
                        StreamUtility.closeQuietly(new Closeable[]{null});
                    } catch (Exception e2) {
                        LoadDeepZoom.this.report(e2, null);
                        StreamUtility.closeQuietly(new Closeable[]{null});
                    }
                } catch (Throwable th) {
                    StreamUtility.closeQuietly(new Closeable[]{null});
                    throw th;
                }
            }
        });
    }
}
