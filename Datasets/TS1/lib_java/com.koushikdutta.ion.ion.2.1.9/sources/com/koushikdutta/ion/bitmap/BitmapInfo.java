package com.koushikdutta.ion.bitmap;

import android.graphics.Bitmap;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Point;
import com.koushikdutta.async.util.UntypedHashtable;
import com.koushikdutta.ion.ResponseServedFrom;
import com.koushikdutta.ion.gif.GifDecoder;
import java.io.File;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/bitmap/BitmapInfo.class */
public class BitmapInfo {
    public final Point originalSize;
    public long drawTime;
    public final String key;
    public ResponseServedFrom servedFrom;
    public final Bitmap bitmap;
    public Exception exception;
    public GifDecoder gifDecoder;
    public BitmapRegionDecoder decoder;
    public File decoderFile;
    public final String mimeType;
    public long loadTime = System.currentTimeMillis();
    public final UntypedHashtable extras = new UntypedHashtable();

    public BitmapInfo(String key, String mimeType, Bitmap bitmap, Point originalSize) {
        this.originalSize = originalSize;
        this.bitmap = bitmap;
        this.key = key;
        this.mimeType = mimeType;
    }

    public int sizeOf() {
        if (this.bitmap != null) {
            return this.bitmap.getRowBytes() * this.bitmap.getHeight();
        }
        if (this.gifDecoder != null) {
            return this.gifDecoder.getGifDataLength();
        }
        return 0;
    }
}
