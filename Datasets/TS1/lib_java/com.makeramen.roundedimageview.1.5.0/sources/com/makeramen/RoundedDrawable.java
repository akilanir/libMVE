package com.makeramen;

import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.util.Log;
import android.widget.ImageView;

/* loaded from: com.makeramen.roundedimageview.1.5.0.jar:com/makeramen/RoundedDrawable.class */
public class RoundedDrawable extends Drawable {
    public static final String TAG = "RoundedDrawable";
    public static final int DEFAULT_BORDER_COLOR = -16777216;
    private final Bitmap mBitmap;
    private final Paint mBitmapPaint;
    private final int mBitmapWidth;
    private final int mBitmapHeight;
    private final Paint mBorderPaint;
    private BitmapShader mBitmapShader;
    private final RectF mBounds = new RectF();
    private final RectF mDrawableRect = new RectF();
    private final RectF mBitmapRect = new RectF();
    private final RectF mBorderRect = new RectF();
    private final Matrix mShaderMatrix = new Matrix();
    private Shader.TileMode mTileModeX = Shader.TileMode.CLAMP;
    private Shader.TileMode mTileModeY = Shader.TileMode.CLAMP;
    private boolean mRebuildShader = true;
    private float mCornerRadius = 0.0f;
    private boolean mOval = false;
    private float mBorderWidth = 0.0f;
    private ColorStateList mBorderColor = ColorStateList.valueOf(DEFAULT_BORDER_COLOR);
    private ImageView.ScaleType mScaleType = ImageView.ScaleType.FIT_CENTER;

    public RoundedDrawable(Bitmap bitmap) {
        this.mBitmap = bitmap;
        this.mBitmapWidth = bitmap.getWidth();
        this.mBitmapHeight = bitmap.getHeight();
        this.mBitmapRect.set(0.0f, 0.0f, this.mBitmapWidth, this.mBitmapHeight);
        this.mBitmapPaint = new Paint();
        this.mBitmapPaint.setStyle(Paint.Style.FILL);
        this.mBitmapPaint.setAntiAlias(true);
        this.mBorderPaint = new Paint();
        this.mBorderPaint.setStyle(Paint.Style.STROKE);
        this.mBorderPaint.setAntiAlias(true);
        this.mBorderPaint.setColor(this.mBorderColor.getColorForState(getState(), DEFAULT_BORDER_COLOR));
        this.mBorderPaint.setStrokeWidth(this.mBorderWidth);
    }

    public static RoundedDrawable fromBitmap(Bitmap bitmap) {
        if (bitmap != null) {
            return new RoundedDrawable(bitmap);
        }
        return null;
    }

    public static Drawable fromDrawable(Drawable drawable) {
        if (drawable != null) {
            if (drawable instanceof RoundedDrawable) {
                return drawable;
            }
            if (drawable instanceof LayerDrawable) {
                LayerDrawable ld = (LayerDrawable) drawable;
                int num = ld.getNumberOfLayers();
                for (int i = 0; i < num; i++) {
                    Drawable d = ld.getDrawable(i);
                    ld.setDrawableByLayerId(ld.getId(i), fromDrawable(d));
                }
                return ld;
            }
            Bitmap bm = drawableToBitmap(drawable);
            if (bm != null) {
                return new RoundedDrawable(bm);
            }
            Log.w(TAG, "Failed to create bitmap from drawable!");
        }
        return drawable;
    }

    public static Bitmap drawableToBitmap(Drawable drawable) {
        Bitmap bitmap;
        if (drawable instanceof BitmapDrawable) {
            return ((BitmapDrawable) drawable).getBitmap();
        }
        int width = Math.max(drawable.getIntrinsicWidth(), 2);
        int height = Math.max(drawable.getIntrinsicHeight(), 2);
        try {
            bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmap);
            drawable.setBounds(0, 0, canvas.getWidth(), canvas.getHeight());
            drawable.draw(canvas);
        } catch (Exception e) {
            e.printStackTrace();
            bitmap = null;
        }
        return bitmap;
    }

    @Override // android.graphics.drawable.Drawable
    public boolean isStateful() {
        return this.mBorderColor.isStateful();
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onStateChange(int[] state) {
        int newColor = this.mBorderColor.getColorForState(state, 0);
        if (this.mBorderPaint.getColor() != newColor) {
            this.mBorderPaint.setColor(newColor);
            return true;
        }
        return super.onStateChange(state);
    }

    /* renamed from: com.makeramen.RoundedDrawable$1, reason: invalid class name */
    /* loaded from: com.makeramen.roundedimageview.1.5.0.jar:com/makeramen/RoundedDrawable$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$android$widget$ImageView$ScaleType = new int[ImageView.ScaleType.values().length];

        static {
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.CENTER.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.CENTER_CROP.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.CENTER_INSIDE.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_CENTER.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_END.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_START.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_XY.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
        }
    }

    private void updateShaderMatrix() {
        float scale;
        float scale2;
        switch (AnonymousClass1.$SwitchMap$android$widget$ImageView$ScaleType[this.mScaleType.ordinal()]) {
            case BuildConfig.VERSION_CODE /* 1 */:
                this.mBorderRect.set(this.mBounds);
                this.mBorderRect.inset(this.mBorderWidth / 2.0f, this.mBorderWidth / 2.0f);
                this.mShaderMatrix.reset();
                this.mShaderMatrix.setTranslate((int) (((this.mBorderRect.width() - this.mBitmapWidth) * 0.5f) + 0.5f), (int) (((this.mBorderRect.height() - this.mBitmapHeight) * 0.5f) + 0.5f));
                break;
            case 2:
                this.mBorderRect.set(this.mBounds);
                this.mBorderRect.inset(this.mBorderWidth / 2.0f, this.mBorderWidth / 2.0f);
                this.mShaderMatrix.reset();
                float dx = 0.0f;
                float dy = 0.0f;
                if (this.mBitmapWidth * this.mBorderRect.height() > this.mBorderRect.width() * this.mBitmapHeight) {
                    scale2 = this.mBorderRect.height() / this.mBitmapHeight;
                    dx = (this.mBorderRect.width() - (this.mBitmapWidth * scale2)) * 0.5f;
                } else {
                    scale2 = this.mBorderRect.width() / this.mBitmapWidth;
                    dy = (this.mBorderRect.height() - (this.mBitmapHeight * scale2)) * 0.5f;
                }
                this.mShaderMatrix.setScale(scale2, scale2);
                this.mShaderMatrix.postTranslate(((int) (dx + 0.5f)) + this.mBorderWidth, ((int) (dy + 0.5f)) + this.mBorderWidth);
                break;
            case 3:
                this.mShaderMatrix.reset();
                if (this.mBitmapWidth <= this.mBounds.width() && this.mBitmapHeight <= this.mBounds.height()) {
                    scale = 1.0f;
                } else {
                    scale = Math.min(this.mBounds.width() / this.mBitmapWidth, this.mBounds.height() / this.mBitmapHeight);
                }
                float dx2 = (int) (((this.mBounds.width() - (this.mBitmapWidth * scale)) * 0.5f) + 0.5f);
                float dy2 = (int) (((this.mBounds.height() - (this.mBitmapHeight * scale)) * 0.5f) + 0.5f);
                this.mShaderMatrix.setScale(scale, scale);
                this.mShaderMatrix.postTranslate(dx2, dy2);
                this.mBorderRect.set(this.mBitmapRect);
                this.mShaderMatrix.mapRect(this.mBorderRect);
                this.mBorderRect.inset(this.mBorderWidth / 2.0f, this.mBorderWidth / 2.0f);
                this.mShaderMatrix.setRectToRect(this.mBitmapRect, this.mBorderRect, Matrix.ScaleToFit.FILL);
                break;
            case 4:
            default:
                this.mBorderRect.set(this.mBitmapRect);
                this.mShaderMatrix.setRectToRect(this.mBitmapRect, this.mBounds, Matrix.ScaleToFit.CENTER);
                this.mShaderMatrix.mapRect(this.mBorderRect);
                this.mBorderRect.inset(this.mBorderWidth / 2.0f, this.mBorderWidth / 2.0f);
                this.mShaderMatrix.setRectToRect(this.mBitmapRect, this.mBorderRect, Matrix.ScaleToFit.FILL);
                break;
            case 5:
                this.mBorderRect.set(this.mBitmapRect);
                this.mShaderMatrix.setRectToRect(this.mBitmapRect, this.mBounds, Matrix.ScaleToFit.END);
                this.mShaderMatrix.mapRect(this.mBorderRect);
                this.mBorderRect.inset(this.mBorderWidth / 2.0f, this.mBorderWidth / 2.0f);
                this.mShaderMatrix.setRectToRect(this.mBitmapRect, this.mBorderRect, Matrix.ScaleToFit.FILL);
                break;
            case 6:
                this.mBorderRect.set(this.mBitmapRect);
                this.mShaderMatrix.setRectToRect(this.mBitmapRect, this.mBounds, Matrix.ScaleToFit.START);
                this.mShaderMatrix.mapRect(this.mBorderRect);
                this.mBorderRect.inset(this.mBorderWidth / 2.0f, this.mBorderWidth / 2.0f);
                this.mShaderMatrix.setRectToRect(this.mBitmapRect, this.mBorderRect, Matrix.ScaleToFit.FILL);
                break;
            case 7:
                this.mBorderRect.set(this.mBounds);
                this.mBorderRect.inset(this.mBorderWidth / 2.0f, this.mBorderWidth / 2.0f);
                this.mShaderMatrix.reset();
                this.mShaderMatrix.setRectToRect(this.mBitmapRect, this.mBorderRect, Matrix.ScaleToFit.FILL);
                break;
        }
        this.mDrawableRect.set(this.mBorderRect);
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        super.onBoundsChange(bounds);
        this.mBounds.set(bounds);
        updateShaderMatrix();
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        if (this.mRebuildShader) {
            this.mBitmapShader = new BitmapShader(this.mBitmap, this.mTileModeX, this.mTileModeY);
            if (this.mTileModeX == Shader.TileMode.CLAMP && this.mTileModeY == Shader.TileMode.CLAMP) {
                this.mBitmapShader.setLocalMatrix(this.mShaderMatrix);
            }
            this.mBitmapPaint.setShader(this.mBitmapShader);
            this.mRebuildShader = false;
        }
        if (this.mOval) {
            if (this.mBorderWidth > 0.0f) {
                canvas.drawOval(this.mDrawableRect, this.mBitmapPaint);
                canvas.drawOval(this.mBorderRect, this.mBorderPaint);
                return;
            } else {
                canvas.drawOval(this.mDrawableRect, this.mBitmapPaint);
                return;
            }
        }
        if (this.mBorderWidth > 0.0f) {
            canvas.drawRoundRect(this.mDrawableRect, Math.max(this.mCornerRadius, 0.0f), Math.max(this.mCornerRadius, 0.0f), this.mBitmapPaint);
            canvas.drawRoundRect(this.mBorderRect, this.mCornerRadius, this.mCornerRadius, this.mBorderPaint);
        } else {
            canvas.drawRoundRect(this.mDrawableRect, this.mCornerRadius, this.mCornerRadius, this.mBitmapPaint);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.mBitmapPaint.setAlpha(alpha);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        this.mBitmapPaint.setColorFilter(cf);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public void setDither(boolean dither) {
        this.mBitmapPaint.setDither(dither);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public void setFilterBitmap(boolean filter) {
        this.mBitmapPaint.setFilterBitmap(filter);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return this.mBitmapWidth;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return this.mBitmapHeight;
    }

    public float getCornerRadius() {
        return this.mCornerRadius;
    }

    public RoundedDrawable setCornerRadius(float radius) {
        this.mCornerRadius = radius;
        return this;
    }

    public float getBorderWidth() {
        return this.mBorderWidth;
    }

    public RoundedDrawable setBorderWidth(float width) {
        this.mBorderWidth = width;
        this.mBorderPaint.setStrokeWidth(this.mBorderWidth);
        return this;
    }

    public int getBorderColor() {
        return this.mBorderColor.getDefaultColor();
    }

    public RoundedDrawable setBorderColor(int color) {
        return setBorderColor(ColorStateList.valueOf(color));
    }

    public ColorStateList getBorderColors() {
        return this.mBorderColor;
    }

    public RoundedDrawable setBorderColor(ColorStateList colors) {
        this.mBorderColor = colors != null ? colors : ColorStateList.valueOf(0);
        this.mBorderPaint.setColor(this.mBorderColor.getColorForState(getState(), DEFAULT_BORDER_COLOR));
        return this;
    }

    public boolean isOval() {
        return this.mOval;
    }

    public RoundedDrawable setOval(boolean oval) {
        this.mOval = oval;
        return this;
    }

    public ImageView.ScaleType getScaleType() {
        return this.mScaleType;
    }

    public RoundedDrawable setScaleType(ImageView.ScaleType scaleType) {
        if (scaleType == null) {
            scaleType = ImageView.ScaleType.FIT_CENTER;
        }
        if (this.mScaleType != scaleType) {
            this.mScaleType = scaleType;
            updateShaderMatrix();
        }
        return this;
    }

    public Shader.TileMode getTileModeX() {
        return this.mTileModeX;
    }

    public RoundedDrawable setTileModeX(Shader.TileMode tileModeX) {
        if (this.mTileModeX != tileModeX) {
            this.mTileModeX = tileModeX;
            this.mRebuildShader = true;
            invalidateSelf();
        }
        return this;
    }

    public Shader.TileMode getTileModeY() {
        return this.mTileModeY;
    }

    public RoundedDrawable setTileModeY(Shader.TileMode tileModeY) {
        if (this.mTileModeY != tileModeY) {
            this.mTileModeY = tileModeY;
            this.mRebuildShader = true;
            invalidateSelf();
        }
        return this;
    }

    public Bitmap toBitmap() {
        return drawableToBitmap(this);
    }
}
