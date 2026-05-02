package com.koushikdutta.ion.loader;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.media.MediaMetadataRetriever;
import android.media.ThumbnailUtils;
import android.os.Build;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.async.future.SimpleFuture;
import com.koushikdutta.ion.Ion;
import com.koushikdutta.ion.ResponseServedFrom;
import com.koushikdutta.ion.bitmap.BitmapInfo;
import com.koushikdutta.ion.loader.MediaFile;
import java.io.File;
import java.net.URI;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/loader/VideoLoader.class */
public class VideoLoader extends SimpleLoader {
    @TargetApi(10)
    public static Bitmap createVideoThumbnail(String filePath) throws Exception {
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        retriever.setDataSource(filePath);
        try {
            return retriever.getFrameAtTime();
        } finally {
            try {
                retriever.release();
            } catch (Exception e) {
            }
        }
    }

    static boolean mustUseThumbnailUtils() {
        return Build.MANUFACTURER.toLowerCase().contains("samsung");
    }

    @Override // com.koushikdutta.ion.loader.SimpleLoader, com.koushikdutta.ion.Loader
    public Future<BitmapInfo> loadBitmap(Context context, Ion ion, final String key, final String uri, final int resizeWidth, final int resizeHeight, boolean animateGif) {
        final MediaFile.MediaFileType type;
        if (!uri.startsWith("file") || (type = MediaFile.getFileType(uri)) == null || !MediaFile.isVideoFileType(type.fileType)) {
            return null;
        }
        final SimpleFuture<BitmapInfo> ret = new SimpleFuture<>();
        Ion.getBitmapLoadExecutorService().execute(new Runnable() { // from class: com.koushikdutta.ion.loader.VideoLoader.1
            @Override // java.lang.Runnable
            public void run() {
                Bitmap bmp;
                File file = new File(URI.create(uri));
                if (ret.isCancelled()) {
                    return;
                }
                try {
                    if (VideoLoader.mustUseThumbnailUtils() || Build.VERSION.SDK_INT < 10) {
                        bmp = ThumbnailUtils.createVideoThumbnail(file.getAbsolutePath(), 1);
                    } else {
                        bmp = VideoLoader.createVideoThumbnail(file.getAbsolutePath());
                    }
                    if (bmp == null) {
                        throw new Exception("video bitmap failed to load");
                    }
                    Point originalSize = new Point(bmp.getWidth(), bmp.getHeight());
                    if (bmp.getWidth() > resizeWidth * 2 && bmp.getHeight() > resizeHeight * 2) {
                        float xratio = resizeWidth / bmp.getWidth();
                        float yratio = resizeHeight / bmp.getHeight();
                        float ratio = Math.min(xratio, yratio);
                        if (ratio != 0.0f) {
                            bmp = Bitmap.createScaledBitmap(bmp, (int) (bmp.getWidth() * ratio), (int) (bmp.getHeight() * ratio), true);
                        }
                    }
                    BitmapInfo info = new BitmapInfo(key, type.mimeType, bmp, originalSize);
                    info.servedFrom = ResponseServedFrom.LOADED_FROM_CACHE;
                    ret.setComplete(info);
                } catch (Exception e) {
                    ret.setComplete(e);
                } catch (OutOfMemoryError e2) {
                    ret.setComplete(new Exception(e2));
                }
            }
        });
        return ret;
    }
}
