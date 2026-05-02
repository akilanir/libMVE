package jp.wasabeef.glide.transformations.gpu;

import android.content.Context;
import com.bumptech.glide.Glide;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import jp.co.cyberagent.android.gpuimage.GPUImagePixelationFilter;

/* loaded from: jp.wasabeef.glide-transformations.2.0.1.jar:jp/wasabeef/glide/transformations/gpu/PixelationFilterTransformation.class */
public class PixelationFilterTransformation extends GPUFilterTransformation {
    private float mPixel;

    public PixelationFilterTransformation(Context context) {
        this(context, Glide.get(context).getBitmapPool());
    }

    public PixelationFilterTransformation(Context context, BitmapPool pool) {
        this(context, pool, 10.0f);
    }

    public PixelationFilterTransformation(Context context, float pixel) {
        this(context, Glide.get(context).getBitmapPool(), pixel);
    }

    public PixelationFilterTransformation(Context context, BitmapPool pool, float pixel) {
        super(context, pool, new GPUImagePixelationFilter());
        this.mPixel = pixel;
        GPUImagePixelationFilter filter = (GPUImagePixelationFilter) getFilter();
        filter.setPixel(this.mPixel);
    }

    @Override // jp.wasabeef.glide.transformations.gpu.GPUFilterTransformation
    public String getId() {
        return "PixelationFilterTransformation(pixel=" + this.mPixel + ")";
    }
}
