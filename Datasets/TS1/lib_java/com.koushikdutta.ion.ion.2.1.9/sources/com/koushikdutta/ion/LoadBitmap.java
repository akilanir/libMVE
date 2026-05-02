package com.koushikdutta.ion;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Point;
import android.text.TextUtils;
import com.koushikdutta.async.ByteBufferList;
import com.koushikdutta.async.future.FutureCallback;
import com.koushikdutta.ion.bitmap.BitmapInfo;
import com.koushikdutta.ion.bitmap.IonBitmapCache;
import com.koushikdutta.ion.gif.GifDecoder;
import com.koushikdutta.ion.gif.GifFrame;
import java.nio.ByteBuffer;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/LoadBitmap.class */
class LoadBitmap extends LoadBitmapEmitter implements FutureCallback<Response<ByteBufferList>> {
    int resizeWidth;
    int resizeHeight;

    public LoadBitmap(Ion ion, String urlKey, boolean put, int resizeWidth, int resizeHeight, boolean animateGif) {
        super(ion, urlKey, put, animateGif);
        this.resizeWidth = resizeWidth;
        this.resizeHeight = resizeHeight;
    }

    public void onCompleted(Exception e, final Response<ByteBufferList> response) {
        if (e == null) {
            e = response.getException();
        }
        if (e != null) {
            report(e, null);
            return;
        }
        final ByteBufferList result = response.getResult();
        if (this.ion.bitmapsPending.tag(this.key) != this) {
            result.recycle();
        } else {
            Ion.getBitmapLoadExecutorService().execute(new Runnable() { // from class: com.koushikdutta.ion.LoadBitmap.1
                @Override // java.lang.Runnable
                public void run() {
                    Bitmap bitmap;
                    GifDecoder gifDecoder;
                    if (LoadBitmap.this.ion.bitmapsPending.tag(LoadBitmap.this.key) != LoadBitmap.this) {
                        result.recycle();
                        return;
                    }
                    try {
                        try {
                            ByteBuffer bb = result.getAll();
                            BitmapFactory.Options options = LoadBitmap.this.ion.bitmapCache.prepareBitmapOptions(bb.array(), bb.arrayOffset() + bb.position(), bb.remaining(), LoadBitmap.this.resizeWidth, LoadBitmap.this.resizeHeight);
                            Point size = new Point(options.outWidth, options.outHeight);
                            if (LoadBitmap.this.animateGif && TextUtils.equals("image/gif", options.outMimeType)) {
                                gifDecoder = new GifDecoder(bb.array(), bb.arrayOffset() + bb.position(), bb.remaining());
                                GifFrame frame = gifDecoder.nextFrame();
                                bitmap = frame.image;
                                bb = null;
                            } else {
                                bitmap = IonBitmapCache.loadBitmap(bb.array(), bb.arrayOffset() + bb.position(), bb.remaining(), options);
                                gifDecoder = null;
                                if (bitmap == null) {
                                    throw new Exception("failed to load bitmap");
                                }
                            }
                            BitmapInfo info = new BitmapInfo(LoadBitmap.this.key, options.outMimeType, bitmap, size);
                            info.gifDecoder = gifDecoder;
                            info.servedFrom = response.getServedFrom();
                            LoadBitmap.this.report(null, info);
                            ByteBufferList.reclaim(bb);
                        } catch (Exception e2) {
                            LoadBitmap.this.report(e2, null);
                            ByteBufferList.reclaim((ByteBuffer) null);
                        } catch (OutOfMemoryError e3) {
                            LoadBitmap.this.report(new Exception(e3), null);
                            ByteBufferList.reclaim((ByteBuffer) null);
                        }
                    } catch (Throwable th) {
                        ByteBufferList.reclaim((ByteBuffer) null);
                        throw th;
                    }
                }
            });
        }
    }
}
