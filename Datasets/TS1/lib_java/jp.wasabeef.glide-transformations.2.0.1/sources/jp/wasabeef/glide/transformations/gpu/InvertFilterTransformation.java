package jp.wasabeef.glide.transformations.gpu;

import android.content.Context;
import com.bumptech.glide.Glide;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import jp.co.cyberagent.android.gpuimage.GPUImageColorInvertFilter;

/* loaded from: jp.wasabeef.glide-transformations.2.0.1.jar:jp/wasabeef/glide/transformations/gpu/InvertFilterTransformation.class */
public class InvertFilterTransformation extends GPUFilterTransformation {
    public InvertFilterTransformation(Context context) {
        this(context, Glide.get(context).getBitmapPool());
    }

    public InvertFilterTransformation(Context context, BitmapPool pool) {
        super(context, pool, new GPUImageColorInvertFilter());
    }

    @Override // jp.wasabeef.glide.transformations.gpu.GPUFilterTransformation
    public String getId() {
        return "InvertFilterTransformation()";
    }
}
