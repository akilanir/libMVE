package com.yalantis.ucrop.view;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.Point;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.support.annotation.IntRange;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.Display;
import android.view.WindowManager;
import android.widget.ImageView;
import com.yalantis.ucrop.callback.BitmapLoadCallback;
import com.yalantis.ucrop.util.BitmapLoadUtils;
import com.yalantis.ucrop.util.FastBitmapDrawable;
import com.yalantis.ucrop.util.RectUtils;

/* loaded from: com.yalantis.ucrop.1.5.0.jar:com/yalantis/ucrop/view/TransformImageView.class */
public class TransformImageView extends ImageView {
    private static final String TAG = "TransformImageView";
    private static final int RECT_CORNER_POINTS_COORDS = 8;
    private static final int RECT_CENTER_POINT_COORDS = 2;
    private static final int MATRIX_VALUES_COUNT = 9;
    protected final float[] mCurrentImageCorners;
    protected final float[] mCurrentImageCenter;
    private final float[] mMatrixValues;
    protected Matrix mCurrentImageMatrix;
    protected int mThisWidth;
    protected int mThisHeight;
    protected TransformImageListener mTransformImageListener;
    private float[] mInitialImageCorners;
    private float[] mInitialImageCenter;
    protected boolean mBitmapDecoded;
    protected boolean mBitmapLaidOut;
    private int mMaxBitmapSize;
    private Uri mImageUri;

    /* loaded from: com.yalantis.ucrop.1.5.0.jar:com/yalantis/ucrop/view/TransformImageView$TransformImageListener.class */
    public interface TransformImageListener {
        void onLoadComplete();

        void onLoadFailure(@NonNull Exception exc);

        void onRotate(float f);

        void onScale(float f);
    }

    public TransformImageView(Context context) {
        this(context, null);
    }

    public TransformImageView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public TransformImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mCurrentImageCorners = new float[RECT_CORNER_POINTS_COORDS];
        this.mCurrentImageCenter = new float[2];
        this.mMatrixValues = new float[MATRIX_VALUES_COUNT];
        this.mCurrentImageMatrix = new Matrix();
        this.mBitmapDecoded = false;
        this.mBitmapLaidOut = false;
        this.mMaxBitmapSize = 0;
        init();
    }

    public void setTransformImageListener(TransformImageListener transformImageListener) {
        this.mTransformImageListener = transformImageListener;
    }

    @Override // android.widget.ImageView
    public void setScaleType(ImageView.ScaleType scaleType) {
        if (scaleType == ImageView.ScaleType.MATRIX) {
            super.setScaleType(scaleType);
        } else {
            Log.w(TAG, "Invalid ScaleType. Only ScaleType.MATRIX can be used");
        }
    }

    public void setMaxBitmapSize(int maxBitmapSize) {
        this.mMaxBitmapSize = maxBitmapSize;
    }

    public int getMaxBitmapSize() {
        if (this.mMaxBitmapSize <= 0) {
            this.mMaxBitmapSize = calculateMaxBitmapSize();
        }
        return this.mMaxBitmapSize;
    }

    @Override // android.widget.ImageView
    public void setImageBitmap(Bitmap bitmap) {
        setImageDrawable(new FastBitmapDrawable(bitmap));
    }

    @Nullable
    public Uri getImageUri() {
        return this.mImageUri;
    }

    public void setImageUri(@NonNull Uri imageUri, @NonNull Uri outputUri) throws Exception {
        this.mImageUri = imageUri;
        int maxBitmapSize = getMaxBitmapSize();
        BitmapLoadUtils.decodeBitmapInBackground(getContext(), imageUri, outputUri, maxBitmapSize, maxBitmapSize, new BitmapLoadCallback() { // from class: com.yalantis.ucrop.view.TransformImageView.1
            @Override // com.yalantis.ucrop.callback.BitmapLoadCallback
            public void onBitmapLoaded(@NonNull Bitmap bitmap) {
                TransformImageView.this.mBitmapDecoded = true;
                TransformImageView.this.setImageBitmap(bitmap);
            }

            @Override // com.yalantis.ucrop.callback.BitmapLoadCallback
            public void onFailure(@NonNull Exception bitmapWorkerException) {
                Log.e(TransformImageView.TAG, "onFailure: setImageUri", bitmapWorkerException);
                if (TransformImageView.this.mTransformImageListener != null) {
                    TransformImageView.this.mTransformImageListener.onLoadFailure(bitmapWorkerException);
                }
            }
        });
    }

    public float getCurrentScale() {
        return getMatrixScale(this.mCurrentImageMatrix);
    }

    public float getMatrixScale(@NonNull Matrix matrix) {
        return (float) Math.sqrt(Math.pow(getMatrixValue(matrix, 0), 2.0d) + Math.pow(getMatrixValue(matrix, 3), 2.0d));
    }

    public float getCurrentAngle() {
        return getMatrixAngle(this.mCurrentImageMatrix);
    }

    public float getMatrixAngle(@NonNull Matrix matrix) {
        return (float) (-(Math.atan2(getMatrixValue(matrix, 1), getMatrixValue(matrix, 0)) * 57.29577951308232d));
    }

    @Override // android.widget.ImageView
    public void setImageMatrix(Matrix matrix) {
        super.setImageMatrix(matrix);
        updateCurrentImagePoints();
    }

    @Nullable
    public Bitmap getViewBitmap() {
        if (getDrawable() == null || !(getDrawable() instanceof FastBitmapDrawable)) {
            return null;
        }
        return ((FastBitmapDrawable) getDrawable()).getBitmap();
    }

    public void postTranslate(float deltaX, float deltaY) {
        if (deltaX != 0.0f || deltaY != 0.0f) {
            this.mCurrentImageMatrix.postTranslate(deltaX, deltaY);
            setImageMatrix(this.mCurrentImageMatrix);
        }
    }

    public void postScale(float deltaScale, float px, float py) {
        if (deltaScale != 0.0f) {
            this.mCurrentImageMatrix.postScale(deltaScale, deltaScale, px, py);
            setImageMatrix(this.mCurrentImageMatrix);
            if (this.mTransformImageListener != null) {
                this.mTransformImageListener.onScale(getMatrixScale(this.mCurrentImageMatrix));
            }
        }
    }

    public void postRotate(float deltaAngle, float px, float py) {
        if (deltaAngle != 0.0f) {
            this.mCurrentImageMatrix.postRotate(deltaAngle, px, py);
            setImageMatrix(this.mCurrentImageMatrix);
            if (this.mTransformImageListener != null) {
                this.mTransformImageListener.onRotate(getMatrixAngle(this.mCurrentImageMatrix));
            }
        }
    }

    protected void init() {
        setScaleType(ImageView.ScaleType.MATRIX);
    }

    protected int calculateMaxBitmapSize() {
        int width;
        int height;
        WindowManager wm = (WindowManager) getContext().getSystemService("window");
        Display display = wm.getDefaultDisplay();
        Point size = new Point();
        if (Build.VERSION.SDK_INT >= 13) {
            display.getSize(size);
            width = size.x;
            height = size.y;
        } else {
            width = display.getWidth();
            height = display.getHeight();
        }
        return (int) Math.sqrt(Math.pow(width, 2.0d) + Math.pow(height, 2.0d));
    }

    @Override // android.view.View
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        super.onLayout(changed, left, top, right, bottom);
        if (changed || (this.mBitmapDecoded && !this.mBitmapLaidOut)) {
            int left2 = getPaddingLeft();
            int top2 = getPaddingTop();
            int right2 = getWidth() - getPaddingRight();
            int bottom2 = getHeight() - getPaddingBottom();
            this.mThisWidth = right2 - left2;
            this.mThisHeight = bottom2 - top2;
            onImageLaidOut();
        }
    }

    protected void onImageLaidOut() {
        Drawable drawable = getDrawable();
        if (drawable == null) {
            return;
        }
        float w = drawable.getIntrinsicWidth();
        float h = drawable.getIntrinsicHeight();
        Log.d(TAG, String.format("Image size: [%d:%d]", Integer.valueOf((int) w), Integer.valueOf((int) h)));
        RectF initialImageRect = new RectF(0.0f, 0.0f, w, h);
        this.mInitialImageCorners = RectUtils.getCornersFromRect(initialImageRect);
        this.mInitialImageCenter = RectUtils.getCenterFromRect(initialImageRect);
        this.mBitmapLaidOut = true;
        if (this.mTransformImageListener != null) {
            this.mTransformImageListener.onLoadComplete();
        }
    }

    protected float getMatrixValue(@NonNull Matrix matrix, @IntRange(from = 0, to = 9) int valueIndex) {
        matrix.getValues(this.mMatrixValues);
        return this.mMatrixValues[valueIndex];
    }

    protected void printMatrix(@NonNull String logPrefix, @NonNull Matrix matrix) {
        float x = getMatrixValue(matrix, 2);
        float y = getMatrixValue(matrix, 5);
        float rScale = getMatrixScale(matrix);
        float rAngle = getMatrixAngle(matrix);
        Log.d(TAG, logPrefix + ": matrix: { x: " + x + ", y: " + y + ", scale: " + rScale + ", angle: " + rAngle + " }");
    }

    private void updateCurrentImagePoints() {
        this.mCurrentImageMatrix.mapPoints(this.mCurrentImageCorners, this.mInitialImageCorners);
        this.mCurrentImageMatrix.mapPoints(this.mCurrentImageCenter, this.mInitialImageCenter);
    }
}
