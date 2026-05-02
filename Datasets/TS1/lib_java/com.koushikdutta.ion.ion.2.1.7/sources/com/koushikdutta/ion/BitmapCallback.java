package com.koushikdutta.ion;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Point;
import com.koushikdutta.async.AsyncServer;
import com.koushikdutta.async.future.FutureCallback;
import com.koushikdutta.async.util.FileCache;
import com.koushikdutta.ion.bitmap.BitmapInfo;
import com.koushikdutta.ion.bitmap.IonBitmapCache;
import com.koushikdutta.ion.bitmap.PostProcess;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.CancellationException;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/BitmapCallback.class */
abstract class BitmapCallback {
    final String key;
    final Ion ion;
    final boolean put;

    public static void saveBitmapSnapshot(Ion ion, BitmapInfo info) {
        FileCache cache;
        if (info.bitmap == null || (cache = ion.responseCache.getFileCache()) == null) {
            return;
        }
        File tempFile = cache.getTempFile();
        try {
            FileOutputStream out = new FileOutputStream(tempFile);
            Bitmap.CompressFormat format = info.bitmap.hasAlpha() ? Bitmap.CompressFormat.PNG : Bitmap.CompressFormat.JPEG;
            info.bitmap.compress(format, 100, out);
            out.close();
            cache.commitTempFiles(info.key, new File[]{tempFile});
            tempFile.delete();
        } catch (Exception e) {
            tempFile.delete();
        } catch (Throwable th) {
            tempFile.delete();
            throw th;
        }
    }

    public static void getBitmapSnapshot(final Ion ion, final String transformKey, final ArrayList<PostProcess> postProcess) {
        if (ion.bitmapsPending.tag(transformKey) != null) {
            return;
        }
        final BitmapCallback callback = new LoadBitmapBase(ion, transformKey, true);
        Ion.getBitmapLoadExecutorService().execute(new Runnable() { // from class: com.koushikdutta.ion.BitmapCallback.1
            @Override // java.lang.Runnable
            public void run() {
                if (ion.bitmapsPending.tag(transformKey) != callback) {
                    return;
                }
                try {
                    File file = ion.responseCache.getFileCache().getFile(transformKey);
                    Bitmap bitmap = IonBitmapCache.loadBitmap(file, (BitmapFactory.Options) null);
                    if (bitmap == null) {
                        throw new Exception("Bitmap failed to load");
                    }
                    BitmapInfo info = new BitmapInfo(transformKey, "image/jpeg", bitmap, null);
                    info.servedFrom = ResponseServedFrom.LOADED_FROM_CACHE;
                    if (postProcess != null) {
                        Iterator i$ = postProcess.iterator();
                        while (i$.hasNext()) {
                            PostProcess p = (PostProcess) i$.next();
                            p.postProcess(info);
                        }
                    }
                    callback.report(null, info);
                } catch (Exception e) {
                    callback.report(e, null);
                    try {
                        ion.responseCache.getFileCache().remove(transformKey);
                    } catch (Exception e2) {
                    }
                } catch (OutOfMemoryError e3) {
                    callback.report(new Exception(e3), null);
                }
            }
        });
    }

    protected BitmapCallback(Ion ion, String key, boolean put) {
        this.key = key;
        this.put = put;
        this.ion = ion;
        ion.bitmapsPending.tag(key, this);
    }

    boolean put() {
        return this.put;
    }

    protected void onReported() {
        this.ion.processDeferred();
    }

    protected void report(final Exception e, final BitmapInfo info) {
        AsyncServer.post(Ion.mainHandler, new Runnable() { // from class: com.koushikdutta.ion.BitmapCallback.2
            @Override // java.lang.Runnable
            public void run() {
                BitmapInfo result = info;
                if (result == null) {
                    result = new BitmapInfo(BitmapCallback.this.key, null, null, new Point());
                    result.exception = e;
                    if (!(e instanceof CancellationException)) {
                        BitmapCallback.this.ion.getBitmapCache().put(result);
                    }
                } else if (BitmapCallback.this.put()) {
                    BitmapCallback.this.ion.getBitmapCache().put(result);
                } else {
                    BitmapCallback.this.ion.getBitmapCache().putSoft(result);
                }
                ArrayList<FutureCallback<BitmapInfo>> callbacks = BitmapCallback.this.ion.bitmapsPending.remove(BitmapCallback.this.key);
                if (callbacks == null || callbacks.size() == 0) {
                    BitmapCallback.this.onReported();
                    return;
                }
                Iterator i$ = callbacks.iterator();
                while (i$.hasNext()) {
                    FutureCallback<BitmapInfo> callback = i$.next();
                    callback.onCompleted(e, result);
                }
                BitmapCallback.this.onReported();
            }
        });
        if (info == null || info.originalSize == null || info.decoder != null || !this.put || info.bitmap == null || info.gifDecoder != null || info.sizeOf() > 1048576) {
            return;
        }
        saveBitmapSnapshot(this.ion, info);
    }
}
