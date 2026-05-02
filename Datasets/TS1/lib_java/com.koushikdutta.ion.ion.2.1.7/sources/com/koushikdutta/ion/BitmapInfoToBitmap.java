package com.koushikdutta.ion;

import android.graphics.Bitmap;
import com.koushikdutta.async.future.TransformFuture;
import com.koushikdutta.ion.bitmap.BitmapInfo;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/BitmapInfoToBitmap.class */
class BitmapInfoToBitmap extends TransformFuture<Bitmap, BitmapInfo> {
    ContextReference contextReference;

    public BitmapInfoToBitmap(ContextReference contextReference) {
        this.contextReference = contextReference;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void transform(BitmapInfo result) throws Exception {
        if (this.contextReference.isAlive() != null) {
            cancel();
        } else if (result.exception != null) {
            setComplete(result.exception);
        } else {
            setComplete(result.bitmap);
        }
    }
}
