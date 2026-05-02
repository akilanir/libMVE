package jp.wasabeef.glide.transformations;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import com.bumptech.glide.Glide;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import com.bumptech.glide.load.resource.bitmap.BitmapResource;

/* loaded from: jp.wasabeef.glide-transformations.2.0.1.jar:jp/wasabeef/glide/transformations/CropTransformation.class */
public class CropTransformation implements Transformation<Bitmap> {
    private BitmapPool mBitmapPool;
    private int mWidth;
    private int mHeight;
    private CropType mCropType;

    /* loaded from: jp.wasabeef.glide-transformations.2.0.1.jar:jp/wasabeef/glide/transformations/CropTransformation$CropType.class */
    public enum CropType {
        TOP,
        CENTER,
        BOTTOM
    }

    public CropTransformation(Context context) {
        this(Glide.get(context).getBitmapPool());
    }

    public CropTransformation(BitmapPool pool) {
        this(pool, 0, 0);
    }

    public CropTransformation(Context context, int width, int height) {
        this(Glide.get(context).getBitmapPool(), width, height);
    }

    public CropTransformation(BitmapPool pool, int width, int height) {
        this(pool, width, height, CropType.CENTER);
    }

    public CropTransformation(Context context, int width, int height, CropType cropType) {
        this(Glide.get(context).getBitmapPool(), width, height, cropType);
    }

    public CropTransformation(BitmapPool pool, int width, int height, CropType cropType) {
        this.mCropType = CropType.CENTER;
        this.mBitmapPool = pool;
        this.mWidth = width;
        this.mHeight = height;
        this.mCropType = cropType;
    }

    public Resource<Bitmap> transform(Resource<Bitmap> resource, int outWidth, int outHeight) {
        Bitmap source = (Bitmap) resource.get();
        this.mWidth = this.mWidth == 0 ? source.getWidth() : this.mWidth;
        this.mHeight = this.mHeight == 0 ? source.getHeight() : this.mHeight;
        Bitmap.Config config = source.getConfig() != null ? source.getConfig() : Bitmap.Config.ARGB_8888;
        Bitmap bitmap = this.mBitmapPool.get(this.mWidth, this.mHeight, config);
        if (bitmap == null) {
            bitmap = Bitmap.createBitmap(this.mWidth, this.mHeight, config);
        }
        float scaleX = this.mWidth / source.getWidth();
        float scaleY = this.mHeight / source.getHeight();
        float scale = Math.max(scaleX, scaleY);
        float scaledWidth = scale * source.getWidth();
        float scaledHeight = scale * source.getHeight();
        float left = (this.mWidth - scaledWidth) / 2.0f;
        float top = getTop(scaledHeight);
        RectF targetRect = new RectF(left, top, left + scaledWidth, top + scaledHeight);
        Canvas canvas = new Canvas(bitmap);
        canvas.drawBitmap(source, (Rect) null, targetRect, (Paint) null);
        return BitmapResource.obtain(bitmap, this.mBitmapPool);
    }

    public String getId() {
        return "CropTransformation(width=" + this.mWidth + ", height=" + this.mHeight + ", cropType=" + this.mCropType + ")";
    }

    private float getTop(float scaledHeight) {
        switch (this.mCropType) {
            case TOP:
                return 0.0f;
            case CENTER:
                return (this.mHeight - scaledHeight) / 2.0f;
            case BOTTOM:
                return this.mHeight - scaledHeight;
            default:
                return 0.0f;
        }
    }
}
