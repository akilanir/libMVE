package jp.wasabeef.glide.transformations.gpu;

import android.content.Context;
import com.bumptech.glide.Glide;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import jp.co.cyberagent.android.gpuimage.GPUImageSketchFilter;

/* loaded from: jp.wasabeef.glide-transformations.2.0.1.jar:jp/wasabeef/glide/transformations/gpu/SketchFilterTransformation.class */
public class SketchFilterTransformation extends GPUFilterTransformation {
    public SketchFilterTransformation(Context context) {
        this(context, Glide.get(context).getBitmapPool());
    }

    public SketchFilterTransformation(Context context, BitmapPool pool) {
        super(context, pool, new GPUImageSketchFilter());
    }

    @Override // jp.wasabeef.glide.transformations.gpu.GPUFilterTransformation
    public String getId() {
        return "SketchFilterTransformation()";
    }
}
