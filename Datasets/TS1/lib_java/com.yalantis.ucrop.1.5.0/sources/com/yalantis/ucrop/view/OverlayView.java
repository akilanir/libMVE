package com.yalantis.ucrop.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Region;
import android.os.Build;
import android.support.annotation.ColorInt;
import android.support.annotation.IntRange;
import android.support.annotation.NonNull;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import com.yalantis.ucrop.R;
import com.yalantis.ucrop.UCropActivity;
import com.yalantis.ucrop.callback.OverlayViewChangeListener;
import com.yalantis.ucrop.util.RectUtils;

/* loaded from: com.yalantis.ucrop.1.5.0.jar:com/yalantis/ucrop/view/OverlayView.class */
public class OverlayView extends View {
    public static final boolean DEFAULT_SHOW_CROP_FRAME = true;
    public static final boolean DEFAULT_SHOW_CROP_GRID = true;
    public static final boolean DEFAULT_OVAL_DIMMED_LAYER = false;
    public static final boolean DEFAULT_FREESTYLE_CROP_ENABLED = false;
    public static final int DEFAULT_CROP_GRID_ROW_COUNT = 2;
    public static final int DEFAULT_CROP_GRID_COLUMN_COUNT = 2;
    private final RectF mCropViewRect;
    private final RectF mTempRect;
    private int mCropGridRowCount;
    private int mCropGridColumnCount;
    private float mTargetAspectRatio;
    private float[] mGridPoints;
    private boolean mShowCropFrame;
    private boolean mShowCropGrid;
    private boolean mOvalDimmedLayer;
    private int mDimmedColor;
    private Path mCircularPath;
    private Paint mDimmedStrokePaint;
    private Paint mCropGridPaint;
    private Paint mCropFramePaint;
    private Paint mCropFrameCornersPaint;
    protected int mThisWidth;
    protected int mThisHeight;
    private boolean mIsFreestyleCropEnabled;
    protected float[] mCropGridCorners;
    private int mCurrentTouchCornerIndex;
    private int mTouchPointThreshold;
    private int mCropRectMinSize;
    private int mCropRectCornerTouchAreaLineLength;
    private OverlayViewChangeListener mCallback;

    public OverlayView(Context context) {
        this(context, null);
    }

    public OverlayView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public OverlayView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mCropViewRect = new RectF();
        this.mTempRect = new RectF();
        this.mGridPoints = null;
        this.mCircularPath = new Path();
        this.mDimmedStrokePaint = new Paint(1);
        this.mCropGridPaint = new Paint(1);
        this.mCropFramePaint = new Paint(1);
        this.mCropFrameCornersPaint = new Paint(1);
        this.mIsFreestyleCropEnabled = false;
        this.mCurrentTouchCornerIndex = -1;
        this.mTouchPointThreshold = getResources().getDimensionPixelSize(R.dimen.ucrop_default_crop_rect_corner_touch_threshold);
        this.mCropRectMinSize = getResources().getDimensionPixelSize(R.dimen.ucrop_default_crop_rect_min_size);
        this.mCropRectCornerTouchAreaLineLength = getResources().getDimensionPixelSize(R.dimen.ucrop_default_crop_rect_corner_touch_area_line_length);
        init();
    }

    public OverlayViewChangeListener getOverlayViewChangeListener() {
        return this.mCallback;
    }

    public void setOverlayViewChangeListener(OverlayViewChangeListener callback) {
        this.mCallback = callback;
    }

    @NonNull
    public RectF getCropViewRect() {
        return this.mCropViewRect;
    }

    public boolean isFreestyleCropEnabled() {
        return this.mIsFreestyleCropEnabled;
    }

    public void setFreestyleCropEnabled(boolean freestyleCropEnabled) {
        this.mIsFreestyleCropEnabled = freestyleCropEnabled;
    }

    public void setOvalDimmedLayer(boolean ovalDimmedLayer) {
        this.mOvalDimmedLayer = ovalDimmedLayer;
    }

    public void setCropGridRowCount(@IntRange(from = 0) int cropGridRowCount) {
        this.mCropGridRowCount = cropGridRowCount;
        this.mGridPoints = null;
    }

    public void setCropGridColumnCount(@IntRange(from = 0) int cropGridColumnCount) {
        this.mCropGridColumnCount = cropGridColumnCount;
        this.mGridPoints = null;
    }

    public void setShowCropFrame(boolean showCropFrame) {
        this.mShowCropFrame = showCropFrame;
    }

    public void setShowCropGrid(boolean showCropGrid) {
        this.mShowCropGrid = showCropGrid;
    }

    public void setDimmedColor(@ColorInt int dimmedColor) {
        this.mDimmedColor = dimmedColor;
    }

    public void setCropFrameStrokeWidth(@IntRange(from = 0) int width) {
        this.mCropFramePaint.setStrokeWidth(width);
    }

    public void setCropGridStrokeWidth(@IntRange(from = 0) int width) {
        this.mCropGridPaint.setStrokeWidth(width);
    }

    public void setCropFrameColor(@ColorInt int color) {
        this.mCropFramePaint.setColor(color);
    }

    public void setCropGridColor(@ColorInt int color) {
        this.mCropGridPaint.setColor(color);
    }

    public void setTargetAspectRatio(float targetAspectRatio) {
        this.mTargetAspectRatio = targetAspectRatio;
        setupCropBounds();
        postInvalidate();
    }

    public void setupCropBounds() {
        int height = (int) (this.mThisWidth / this.mTargetAspectRatio);
        if (height > this.mThisHeight) {
            int width = (int) (this.mThisHeight * this.mTargetAspectRatio);
            int halfDiff = (this.mThisWidth - width) / 2;
            this.mCropViewRect.set(getPaddingLeft() + halfDiff, getPaddingTop(), getPaddingLeft() + width + halfDiff, getPaddingTop() + this.mThisHeight);
        } else {
            int halfDiff2 = (this.mThisHeight - height) / 2;
            this.mCropViewRect.set(getPaddingLeft(), getPaddingTop() + halfDiff2, getPaddingLeft() + this.mThisWidth, getPaddingTop() + height + halfDiff2);
        }
        if (this.mCallback != null) {
            this.mCallback.onCropRectUpdated(this.mCropViewRect);
        }
        updateGridPoints();
    }

    private void updateGridPoints() {
        this.mCropGridCorners = RectUtils.getCornersFromRect(this.mCropViewRect);
        this.mGridPoints = null;
        this.mCircularPath.reset();
        this.mCircularPath.addOval(this.mCropViewRect, Path.Direction.CW);
    }

    protected void init() {
        if (Build.VERSION.SDK_INT < 18 && Build.VERSION.SDK_INT >= 11) {
            setLayerType(1, null);
        }
    }

    @Override // android.view.View
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        super.onLayout(changed, left, top, right, bottom);
        if (changed) {
            int left2 = getPaddingLeft();
            int top2 = getPaddingTop();
            int right2 = getWidth() - getPaddingRight();
            int bottom2 = getHeight() - getPaddingBottom();
            this.mThisWidth = right2 - left2;
            this.mThisHeight = bottom2 - top2;
        }
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        drawDimmedLayer(canvas);
        drawCropGrid(canvas);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        if (this.mCropViewRect.isEmpty() || !this.mIsFreestyleCropEnabled) {
            return false;
        }
        float x = event.getX();
        float y = event.getY();
        if ((event.getAction() & 255) == 0) {
            this.mCurrentTouchCornerIndex = getCurrentTouchCorner(x, y);
            return this.mCurrentTouchCornerIndex != -1;
        }
        if ((event.getAction() & 255) == 2 && event.getPointerCount() == 1 && this.mCurrentTouchCornerIndex != -1) {
            resizeCropViewRect(Math.min(Math.max(x, getPaddingLeft()), getWidth() - getPaddingRight()), Math.min(Math.max(y, getPaddingTop()), getHeight() - getPaddingBottom()));
            return true;
        }
        if ((event.getAction() & 255) == 1) {
            this.mCurrentTouchCornerIndex = -1;
            if (this.mCallback != null) {
                this.mCallback.onCropRectUpdated(this.mCropViewRect);
                return false;
            }
            return false;
        }
        return false;
    }

    private void resizeCropViewRect(float touchX, float touchY) {
        this.mTempRect.set(this.mCropViewRect);
        switch (this.mCurrentTouchCornerIndex) {
            case 0:
                this.mTempRect.set(touchX, touchY, this.mCropViewRect.right, this.mCropViewRect.bottom);
                break;
            case 1:
                this.mTempRect.set(this.mCropViewRect.left, touchY, touchX, this.mCropViewRect.bottom);
                break;
            case 2:
                this.mTempRect.set(this.mCropViewRect.left, this.mCropViewRect.top, touchX, touchY);
                break;
            case UCropActivity.ALL /* 3 */:
                this.mTempRect.set(touchX, this.mCropViewRect.top, this.mCropViewRect.right, touchY);
                break;
        }
        boolean changeHeight = this.mTempRect.height() >= ((float) this.mCropRectMinSize);
        boolean changeWidth = this.mTempRect.width() >= ((float) this.mCropRectMinSize);
        this.mCropViewRect.set(changeWidth ? this.mTempRect.left : this.mCropViewRect.left, changeHeight ? this.mTempRect.top : this.mCropViewRect.top, changeWidth ? this.mTempRect.right : this.mCropViewRect.right, changeHeight ? this.mTempRect.bottom : this.mCropViewRect.bottom);
        if (changeHeight || changeWidth) {
            updateGridPoints();
            postInvalidate();
        }
    }

    private int getCurrentTouchCorner(float touchX, float touchY) {
        int closestPointIndex = -1;
        double closestPointDistance = this.mTouchPointThreshold;
        for (int i = 0; i < 8; i += 2) {
            double distanceToCorner = Math.sqrt(Math.pow(touchX - this.mCropGridCorners[i], 2.0d) + Math.pow(touchY - this.mCropGridCorners[i + 1], 2.0d));
            if (distanceToCorner < closestPointDistance) {
                closestPointDistance = distanceToCorner;
                closestPointIndex = i / 2;
            }
        }
        return closestPointIndex;
    }

    protected void drawDimmedLayer(@NonNull Canvas canvas) {
        canvas.save();
        if (this.mOvalDimmedLayer) {
            canvas.clipPath(this.mCircularPath, Region.Op.DIFFERENCE);
        } else {
            canvas.clipRect(this.mCropViewRect, Region.Op.DIFFERENCE);
        }
        canvas.drawColor(this.mDimmedColor);
        canvas.restore();
        if (this.mOvalDimmedLayer) {
            canvas.drawOval(this.mCropViewRect, this.mDimmedStrokePaint);
        }
    }

    protected void drawCropGrid(@NonNull Canvas canvas) {
        if (this.mShowCropGrid) {
            if (this.mGridPoints == null && !this.mCropViewRect.isEmpty()) {
                this.mGridPoints = new float[(this.mCropGridRowCount * 4) + (this.mCropGridColumnCount * 4)];
                int index = 0;
                for (int i = 0; i < this.mCropGridRowCount; i++) {
                    int i2 = index;
                    int index2 = index + 1;
                    this.mGridPoints[i2] = this.mCropViewRect.left;
                    int index3 = index2 + 1;
                    this.mGridPoints[index2] = (this.mCropViewRect.height() * ((i + 1.0f) / (this.mCropGridRowCount + 1))) + this.mCropViewRect.top;
                    int index4 = index3 + 1;
                    this.mGridPoints[index3] = this.mCropViewRect.right;
                    index = index4 + 1;
                    this.mGridPoints[index4] = (this.mCropViewRect.height() * ((i + 1.0f) / (this.mCropGridRowCount + 1))) + this.mCropViewRect.top;
                }
                for (int i3 = 0; i3 < this.mCropGridColumnCount; i3++) {
                    int i4 = index;
                    int index5 = index + 1;
                    this.mGridPoints[i4] = (this.mCropViewRect.width() * ((i3 + 1.0f) / (this.mCropGridColumnCount + 1))) + this.mCropViewRect.left;
                    int index6 = index5 + 1;
                    this.mGridPoints[index5] = this.mCropViewRect.top;
                    int index7 = index6 + 1;
                    this.mGridPoints[index6] = (this.mCropViewRect.width() * ((i3 + 1.0f) / (this.mCropGridColumnCount + 1))) + this.mCropViewRect.left;
                    index = index7 + 1;
                    this.mGridPoints[index7] = this.mCropViewRect.bottom;
                }
            }
            if (this.mGridPoints != null) {
                canvas.drawLines(this.mGridPoints, this.mCropGridPaint);
            }
        }
        if (this.mShowCropFrame) {
            canvas.drawRect(this.mCropViewRect, this.mCropFramePaint);
        }
        if (this.mIsFreestyleCropEnabled) {
            canvas.save();
            this.mTempRect.set(this.mCropViewRect);
            this.mTempRect.inset(this.mCropRectCornerTouchAreaLineLength, -this.mCropRectCornerTouchAreaLineLength);
            canvas.clipRect(this.mTempRect, Region.Op.DIFFERENCE);
            this.mTempRect.set(this.mCropViewRect);
            this.mTempRect.inset(-this.mCropRectCornerTouchAreaLineLength, this.mCropRectCornerTouchAreaLineLength);
            canvas.clipRect(this.mTempRect, Region.Op.DIFFERENCE);
            canvas.drawRect(this.mCropViewRect, this.mCropFrameCornersPaint);
            canvas.restore();
        }
    }

    protected void processStyledAttributes(@NonNull TypedArray a) {
        this.mOvalDimmedLayer = a.getBoolean(R.styleable.ucrop_UCropView_ucrop_oval_dimmed_layer, false);
        this.mDimmedColor = a.getColor(R.styleable.ucrop_UCropView_ucrop_dimmed_color, getResources().getColor(R.color.ucrop_color_default_dimmed));
        this.mDimmedStrokePaint.setColor(this.mDimmedColor);
        this.mDimmedStrokePaint.setStyle(Paint.Style.STROKE);
        this.mDimmedStrokePaint.setStrokeWidth(1.0f);
        initCropFrameStyle(a);
        this.mShowCropFrame = a.getBoolean(R.styleable.ucrop_UCropView_ucrop_show_frame, true);
        initCropGridStyle(a);
        this.mShowCropGrid = a.getBoolean(R.styleable.ucrop_UCropView_ucrop_show_grid, true);
    }

    private void initCropFrameStyle(@NonNull TypedArray a) {
        int cropFrameStrokeSize = a.getDimensionPixelSize(R.styleable.ucrop_UCropView_ucrop_frame_stroke_size, getResources().getDimensionPixelSize(R.dimen.ucrop_default_crop_frame_stoke_width));
        int cropFrameColor = a.getColor(R.styleable.ucrop_UCropView_ucrop_frame_color, getResources().getColor(R.color.ucrop_color_default_crop_frame));
        this.mCropFramePaint.setStrokeWidth(cropFrameStrokeSize);
        this.mCropFramePaint.setColor(cropFrameColor);
        this.mCropFramePaint.setStyle(Paint.Style.STROKE);
        this.mCropFrameCornersPaint.setStrokeWidth(cropFrameStrokeSize * 3);
        this.mCropFrameCornersPaint.setColor(cropFrameColor);
        this.mCropFrameCornersPaint.setStyle(Paint.Style.STROKE);
    }

    private void initCropGridStyle(@NonNull TypedArray a) {
        int cropGridStrokeSize = a.getDimensionPixelSize(R.styleable.ucrop_UCropView_ucrop_grid_stroke_size, getResources().getDimensionPixelSize(R.dimen.ucrop_default_crop_grid_stoke_width));
        int cropGridColor = a.getColor(R.styleable.ucrop_UCropView_ucrop_grid_color, getResources().getColor(R.color.ucrop_color_default_crop_grid));
        this.mCropGridPaint.setStrokeWidth(cropGridStrokeSize);
        this.mCropGridPaint.setColor(cropGridColor);
        this.mCropGridRowCount = a.getInt(R.styleable.ucrop_UCropView_ucrop_grid_row_count, 2);
        this.mCropGridColumnCount = a.getInt(R.styleable.ucrop_UCropView_ucrop_grid_column_count, 2);
    }
}
