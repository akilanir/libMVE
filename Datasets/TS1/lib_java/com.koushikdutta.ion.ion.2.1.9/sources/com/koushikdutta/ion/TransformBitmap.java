package com.koushikdutta.ion;

import android.graphics.Bitmap;
import com.koushikdutta.async.future.FutureCallback;
import com.koushikdutta.ion.bitmap.BitmapInfo;
import com.koushikdutta.ion.bitmap.PostProcess;
import com.koushikdutta.ion.bitmap.Transform;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/TransformBitmap.class */
class TransformBitmap extends BitmapCallback implements FutureCallback<BitmapInfo> {
    ArrayList<Transform> transforms;
    ArrayList<PostProcess> postProcess;
    String downloadKey;

    /* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/TransformBitmap$PostProcessNullTransform.class */
    static class PostProcessNullTransform implements Transform {
        String key;

        public PostProcessNullTransform(String key) {
            this.key = key;
        }

        @Override // com.koushikdutta.ion.bitmap.Transform
        public Bitmap transform(Bitmap b) {
            return b;
        }

        @Override // com.koushikdutta.ion.bitmap.Transform
        public String key() {
            return this.key;
        }
    }

    public TransformBitmap(Ion ion, String transformKey, String downloadKey, ArrayList<Transform> transforms, ArrayList<PostProcess> postProcess) {
        super(ion, transformKey, true);
        this.transforms = transforms;
        this.downloadKey = downloadKey;
        this.postProcess = postProcess;
    }

    public void onCompleted(Exception e, final BitmapInfo result) {
        if (e != null) {
            report(e, null);
        } else {
            if (this.ion.bitmapsPending.tag(this.key) != this) {
                return;
            }
            Ion.getBitmapLoadExecutorService().execute(new Runnable() { // from class: com.koushikdutta.ion.TransformBitmap.1
                @Override // java.lang.Runnable
                public void run() {
                    if (TransformBitmap.this.ion.bitmapsPending.tag(TransformBitmap.this.key) != TransformBitmap.this) {
                        return;
                    }
                    try {
                        Bitmap bitmap = result.bitmap;
                        Iterator i$ = TransformBitmap.this.transforms.iterator();
                        while (i$.hasNext()) {
                            Transform transform = i$.next();
                            bitmap = transform.transform(bitmap);
                            if (bitmap == null) {
                                throw new Exception("failed to transform bitmap");
                            }
                        }
                        BitmapInfo info = new BitmapInfo(TransformBitmap.this.key, result.mimeType, bitmap, result.originalSize);
                        info.servedFrom = result.servedFrom;
                        if (TransformBitmap.this.postProcess != null) {
                            Iterator i$2 = TransformBitmap.this.postProcess.iterator();
                            while (i$2.hasNext()) {
                                PostProcess p = i$2.next();
                                p.postProcess(info);
                            }
                        }
                        TransformBitmap.this.report(null, info);
                    } catch (Exception e2) {
                        TransformBitmap.this.report(e2, null);
                    } catch (OutOfMemoryError e3) {
                        TransformBitmap.this.report(new Exception(e3), null);
                    }
                }
            });
        }
    }
}
