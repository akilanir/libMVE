package jp.wasabeef.glide.transformations.gpu;

import android.content.Context;
import com.bumptech.glide.Glide;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import jp.co.cyberagent.android.gpuimage.GPUImageKuwaharaFilter;

/* loaded from: jp.wasabeef.glide-transformations.2.0.1.jar:jp/wasabeef/glide/transformations/gpu/KuwaharaFilterTransformation.class */
public class KuwaharaFilterTransformation extends GPUFilterTransformation {
    private int mRadius;

    public KuwaharaFilterTransformation(Context context) {
        this(context, Glide.get(context).getBitmapPool());
    }

    public KuwaharaFilterTransformation(Context context, BitmapPool pool) {
        this(context, pool, 25);
    }

    public KuwaharaFilterTransformation(Context context, int radius) {
        this(context, Glide.get(context).getBitmapPool(), radius);
    }

    public KuwaharaFilterTransformation(Context context, BitmapPool pool, int radius) {
        super(context, pool, new GPUImageKuwaharaFilter());
        this.mRadius = radius;
        GPUImageKuwaharaFilter filter = (GPUImageKuwaharaFilter) getFilter();
        filter.setRadius(this.mRadius);
    }

    @Override // jp.wasabeef.glide.transformations.gpu.GPUFilterTransformation
    public String getId() {
        return "KuwaharaFilterTransformation(radius=" + this.mRadius + ")";
    }
}
