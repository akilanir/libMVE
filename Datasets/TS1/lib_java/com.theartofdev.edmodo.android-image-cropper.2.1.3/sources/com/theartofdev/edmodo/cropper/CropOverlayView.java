package com.theartofdev.edmodo.cropper;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Region;
import android.os.Build;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import com.theartofdev.edmodo.cropper.CropImageView;

/* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/CropOverlayView.class */
public class CropOverlayView extends View {
    private final CropWindowHandler mCropWindowHandler;
    private CropWindowChangeListener mCropWindowChangeListener;
    private final RectF mDrawRect;
    private Paint mBorderPaint;
    private Paint mBorderCornerPaint;
    private Paint mGuidelinePaint;
    private Paint mBackgroundPaint;
    private final RectF mBitmapRect;
    private int mViewWidth;
    private int mViewHeight;
    private float mBorderCornerOffset;
    private float mBorderCornerLength;
    private float mInitialCropWindowPaddingRatio;
    private float mTouchRadius;
    private float mSnapRadius;
    private CropWindowMoveHandler mMoveHandler;
    private boolean mFixAspectRatio;
    private int mAspectRatioX;
    private int mAspectRatioY;
    private float mTargetAspectRatio;
    private CropImageView.Guidelines mGuidelines;
    private CropImageView.CropShape mCropShape;
    private final Rect mInitialCropWindowRect;
    private boolean initializedCropWindow;
    private Integer mOriginalLayerType;

    /* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/CropOverlayView$CropWindowChangeListener.class */
    public interface CropWindowChangeListener {
        void onCropWindowChanged(boolean z);
    }

    public CropOverlayView(Context context) {
        this(context, null);
    }

    public CropOverlayView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mCropWindowHandler = new CropWindowHandler();
        this.mDrawRect = new RectF();
        this.mBitmapRect = new RectF();
        this.mTargetAspectRatio = this.mAspectRatioX / this.mAspectRatioY;
        this.mInitialCropWindowRect = new Rect();
    }

    public void setCropWindowChangeListener(CropWindowChangeListener listener) {
        this.mCropWindowChangeListener = listener;
    }

    public RectF getCropWindowRect() {
        return this.mCropWindowHandler.getRect();
    }

    public void setCropWindowRect(RectF rect) {
        this.mCropWindowHandler.setRect(rect);
    }

    public void setBitmapRect(RectF bitmapRect, int viewWidth, int viewHeight) {
        if (this.mBitmapRect == null || !bitmapRect.equals(this.mBitmapRect)) {
            this.mBitmapRect.set(bitmapRect);
            this.mViewWidth = viewWidth;
            this.mViewHeight = viewHeight;
            RectF cropRect = this.mCropWindowHandler.getRect();
            if (cropRect.width() == 0.0f || cropRect.height() == 0.0f) {
                initCropWindow();
            }
        }
    }

    public void resetCropOverlayView() {
        if (this.initializedCropWindow) {
            setBitmapRect(BitmapUtils.EMPTY_RECT_F, 0, 0);
            setCropWindowRect(BitmapUtils.EMPTY_RECT_F);
            initCropWindow();
            invalidate();
        }
    }

    public CropImageView.CropShape getCropShape() {
        return this.mCropShape;
    }

    public void setCropShape(CropImageView.CropShape cropShape) {
        if (this.mCropShape != cropShape) {
            this.mCropShape = cropShape;
            if (Build.VERSION.SDK_INT >= 11 && Build.VERSION.SDK_INT <= 17) {
                if (this.mCropShape == CropImageView.CropShape.OVAL) {
                    this.mOriginalLayerType = Integer.valueOf(getLayerType());
                    if (this.mOriginalLayerType.intValue() != 1) {
                        setLayerType(1, null);
                    } else {
                        this.mOriginalLayerType = null;
                    }
                } else if (this.mOriginalLayerType != null) {
                    setLayerType(this.mOriginalLayerType.intValue(), null);
                    this.mOriginalLayerType = null;
                }
            }
            invalidate();
        }
    }

    public CropImageView.Guidelines getGuidelines() {
        return this.mGuidelines;
    }

    public void setGuidelines(CropImageView.Guidelines guidelines) {
        if (this.mGuidelines != guidelines) {
            this.mGuidelines = guidelines;
            if (this.initializedCropWindow) {
                invalidate();
            }
        }
    }

    public boolean isFixAspectRatio() {
        return this.mFixAspectRatio;
    }

    public void setFixedAspectRatio(boolean fixAspectRatio) {
        if (this.mFixAspectRatio != fixAspectRatio) {
            this.mFixAspectRatio = fixAspectRatio;
            if (this.initializedCropWindow) {
                initCropWindow();
                invalidate();
            }
        }
    }

    public int getAspectRatioX() {
        return this.mAspectRatioX;
    }

    public void setAspectRatioX(int aspectRatioX) {
        if (aspectRatioX <= 0) {
            throw new IllegalArgumentException("Cannot set aspect ratio value to a number less than or equal to 0.");
        }
        if (this.mAspectRatioX != aspectRatioX) {
            this.mAspectRatioX = aspectRatioX;
            this.mTargetAspectRatio = this.mAspectRatioX / this.mAspectRatioY;
            if (this.initializedCropWindow) {
                initCropWindow();
                invalidate();
            }
        }
    }

    public int getAspectRatioY() {
        return this.mAspectRatioY;
    }

    public void setAspectRatioY(int aspectRatioY) {
        if (aspectRatioY <= 0) {
            throw new IllegalArgumentException("Cannot set aspect ratio value to a number less than or equal to 0.");
        }
        if (this.mAspectRatioY != aspectRatioY) {
            this.mAspectRatioY = aspectRatioY;
            this.mTargetAspectRatio = this.mAspectRatioX / this.mAspectRatioY;
            if (this.initializedCropWindow) {
                initCropWindow();
                invalidate();
            }
        }
    }

    public void setSnapRadius(float snapRadius) {
        this.mSnapRadius = snapRadius;
    }

    public void setCropWindowLimits(float maxWidth, float maxHeight, float scaleFactorWidth, float scaleFactorHeight) {
        this.mCropWindowHandler.setCropWindowLimits(maxWidth, maxHeight, scaleFactorWidth, scaleFactorHeight);
    }

    public Rect getInitialCropWindowRect() {
        return this.mInitialCropWindowRect;
    }

    public void setInitialCropWindowRect(Rect rect) {
        this.mInitialCropWindowRect.set(rect != null ? rect : BitmapUtils.EMPTY_RECT);
        if (this.initializedCropWindow) {
            initCropWindow();
            invalidate();
            callOnCropWindowChanged(false);
        }
    }

    public void resetCropWindowRect() {
        if (this.initializedCropWindow) {
            initCropWindow();
            invalidate();
            callOnCropWindowChanged(false);
        }
    }

    public void setInitialAttributeValues(CropImageOptions options) {
        this.mCropWindowHandler.setInitialAttributeValues(options);
        setCropShape(options.cropShape);
        setSnapRadius(options.snapRadius);
        setGuidelines(options.guidelines);
        setFixedAspectRatio(options.fixAspectRatio);
        setAspectRatioX(options.aspectRatioX);
        setAspectRatioY(options.aspectRatioY);
        this.mTouchRadius = options.touchRadius;
        this.mInitialCropWindowPaddingRatio = options.initialCropWindowPaddingRatio;
        this.mBorderPaint = getNewPaintOrNull(options.borderLineThickness, options.borderLineColor);
        this.mBorderCornerOffset = options.borderCornerOffset;
        this.mBorderCornerLength = options.borderCornerLength;
        this.mBorderCornerPaint = getNewPaintOrNull(options.borderCornerThickness, options.borderCornerColor);
        this.mGuidelinePaint = getNewPaintOrNull(options.guidelinesThickness, options.guidelinesColor);
        this.mBackgroundPaint = getNewPaint(options.backgroundColor);
    }

    private void initCropWindow() {
        if (this.mBitmapRect == null || this.mBitmapRect.width() == 0.0f || this.mBitmapRect.height() == 0.0f) {
            return;
        }
        RectF rect = new RectF();
        this.initializedCropWindow = true;
        float leftLimit = Math.max(this.mBitmapRect.left, 0.0f);
        float topLimit = Math.max(this.mBitmapRect.top, 0.0f);
        float rightLimit = Math.min(this.mBitmapRect.right, getWidth());
        float bottomLimit = Math.min(this.mBitmapRect.bottom, getHeight());
        float horizontalPadding = this.mInitialCropWindowPaddingRatio * this.mBitmapRect.width();
        float verticalPadding = this.mInitialCropWindowPaddingRatio * this.mBitmapRect.height();
        if (this.mInitialCropWindowRect.width() > 0 && this.mInitialCropWindowRect.height() > 0) {
            rect.left = leftLimit + (this.mInitialCropWindowRect.left / this.mCropWindowHandler.getScaleFactorWidth());
            rect.top = topLimit + (this.mInitialCropWindowRect.top / this.mCropWindowHandler.getScaleFactorHeight());
            rect.right = rect.left + (this.mInitialCropWindowRect.width() / this.mCropWindowHandler.getScaleFactorWidth());
            rect.bottom = rect.top + (this.mInitialCropWindowRect.height() / this.mCropWindowHandler.getScaleFactorHeight());
            rect.left = Math.max(leftLimit, rect.left);
            rect.top = Math.max(topLimit, rect.top);
            rect.right = Math.min(rightLimit, rect.right);
            rect.bottom = Math.min(bottomLimit, rect.bottom);
        } else if (this.mFixAspectRatio && !this.mBitmapRect.isEmpty()) {
            float bitmapAspectRatio = this.mBitmapRect.width() / this.mBitmapRect.height();
            if (bitmapAspectRatio > this.mTargetAspectRatio) {
                rect.top = topLimit + verticalPadding;
                rect.bottom = bottomLimit - verticalPadding;
                float centerX = getWidth() / 2.0f;
                this.mTargetAspectRatio = this.mAspectRatioX / this.mAspectRatioY;
                float cropWidth = Math.max(this.mCropWindowHandler.getMinCropWidth(), rect.height() * this.mTargetAspectRatio);
                float halfCropWidth = cropWidth / 2.0f;
                rect.left = centerX - halfCropWidth;
                rect.right = centerX + halfCropWidth;
            } else {
                rect.left = leftLimit + horizontalPadding;
                rect.right = rightLimit - horizontalPadding;
                float centerY = getHeight() / 2.0f;
                float cropHeight = Math.max(this.mCropWindowHandler.getMinCropHeight(), rect.width() / this.mTargetAspectRatio);
                float halfCropHeight = cropHeight / 2.0f;
                rect.top = centerY - halfCropHeight;
                rect.bottom = centerY + halfCropHeight;
            }
        } else {
            rect.left = leftLimit + horizontalPadding;
            rect.top = topLimit + verticalPadding;
            rect.right = rightLimit - horizontalPadding;
            rect.bottom = bottomLimit - verticalPadding;
        }
        fixCropWindowRectByRules(rect);
        this.mCropWindowHandler.setRect(rect);
    }

    private void fixCropWindowRectByRules(RectF rect) {
        if (rect.width() < this.mCropWindowHandler.getMinCropWidth()) {
            float adj = (this.mCropWindowHandler.getMinCropWidth() - rect.width()) / 2.0f;
            rect.left -= adj;
            rect.right += adj;
        }
        if (rect.height() < this.mCropWindowHandler.getMinCropHeight()) {
            float adj2 = (this.mCropWindowHandler.getMinCropHeight() - rect.height()) / 2.0f;
            rect.top -= adj2;
            rect.bottom += adj2;
        }
        if (rect.width() > this.mCropWindowHandler.getMaxCropWidth()) {
            float adj3 = (rect.width() - this.mCropWindowHandler.getMaxCropWidth()) / 2.0f;
            rect.left += adj3;
            rect.right -= adj3;
        }
        if (rect.height() > this.mCropWindowHandler.getMaxCropHeight()) {
            float adj4 = (rect.height() - this.mCropWindowHandler.getMaxCropHeight()) / 2.0f;
            rect.top += adj4;
            rect.bottom -= adj4;
        }
        if (this.mBitmapRect != null && this.mBitmapRect.width() > 0.0f && this.mBitmapRect.height() > 0.0f) {
            float leftLimit = Math.max(this.mBitmapRect.left, 0.0f);
            float topLimit = Math.max(this.mBitmapRect.top, 0.0f);
            float rightLimit = Math.min(this.mBitmapRect.right, getWidth());
            float bottomLimit = Math.min(this.mBitmapRect.bottom, getHeight());
            if (rect.left < leftLimit) {
                rect.left = leftLimit;
            }
            if (rect.top < topLimit) {
                rect.top = topLimit;
            }
            if (rect.right > rightLimit) {
                rect.right = rightLimit;
            }
            if (rect.bottom > bottomLimit) {
                rect.bottom = bottomLimit;
            }
        }
        if (!this.mFixAspectRatio || Math.abs(rect.width() - (rect.height() * this.mTargetAspectRatio)) <= 0.1d) {
            return;
        }
        if (rect.width() > rect.height() * this.mTargetAspectRatio) {
            float adj5 = Math.abs((rect.height() * this.mTargetAspectRatio) - rect.width()) / 2.0f;
            rect.left += adj5;
            rect.right -= adj5;
        } else {
            float adj6 = Math.abs((rect.width() / this.mTargetAspectRatio) - rect.height()) / 2.0f;
            rect.top += adj6;
            rect.bottom -= adj6;
        }
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        drawBackground(canvas, this.mBitmapRect);
        if (this.mCropWindowHandler.showGuidelines()) {
            if (this.mGuidelines == CropImageView.Guidelines.ON) {
                drawGuidelines(canvas);
            } else if (this.mGuidelines == CropImageView.Guidelines.ON_TOUCH && this.mMoveHandler != null) {
                drawGuidelines(canvas);
            }
        }
        drawBorders(canvas);
        if (this.mCropShape == CropImageView.CropShape.RECTANGLE) {
            drawCorners(canvas);
        }
    }

    private void drawBackground(Canvas canvas, RectF bitmapRect) {
        RectF rect = this.mCropWindowHandler.getRect();
        if (this.mCropShape == CropImageView.CropShape.RECTANGLE) {
            canvas.drawRect(bitmapRect.left, bitmapRect.top, bitmapRect.right, rect.top, this.mBackgroundPaint);
            canvas.drawRect(bitmapRect.left, rect.bottom, bitmapRect.right, bitmapRect.bottom, this.mBackgroundPaint);
            canvas.drawRect(bitmapRect.left, rect.top, rect.left, rect.bottom, this.mBackgroundPaint);
            canvas.drawRect(rect.right, rect.top, bitmapRect.right, rect.bottom, this.mBackgroundPaint);
            return;
        }
        Path circleSelectionPath = new Path();
        if (Build.VERSION.SDK_INT >= 11 && Build.VERSION.SDK_INT <= 17 && this.mCropShape == CropImageView.CropShape.OVAL) {
            this.mDrawRect.set(rect.left + 2.0f, rect.top + 2.0f, rect.right - 2.0f, rect.bottom - 2.0f);
        } else {
            this.mDrawRect.set(rect.left, rect.top, rect.right, rect.bottom);
        }
        circleSelectionPath.addOval(this.mDrawRect, Path.Direction.CW);
        canvas.save();
        canvas.clipPath(circleSelectionPath, Region.Op.XOR);
        canvas.drawRect(bitmapRect.left, bitmapRect.top, bitmapRect.right, bitmapRect.bottom, this.mBackgroundPaint);
        canvas.restore();
    }

    private void drawGuidelines(Canvas canvas) {
        if (this.mGuidelinePaint != null) {
            float sw = this.mBorderPaint != null ? this.mBorderPaint.getStrokeWidth() : 0.0f;
            RectF rect = this.mCropWindowHandler.getRect();
            rect.inset(sw, sw);
            float oneThirdCropWidth = rect.width() / 3.0f;
            float oneThirdCropHeight = rect.height() / 3.0f;
            if (this.mCropShape == CropImageView.CropShape.OVAL) {
                float w = (rect.width() / 2.0f) - sw;
                float h = (rect.height() / 2.0f) - sw;
                float x1 = rect.left + oneThirdCropWidth;
                float x2 = rect.right - oneThirdCropWidth;
                float yv = (float) (h * Math.sin(Math.acos((w - oneThirdCropWidth) / w)));
                canvas.drawLine(x1, (rect.top + h) - yv, x1, (rect.bottom - h) + yv, this.mGuidelinePaint);
                canvas.drawLine(x2, (rect.top + h) - yv, x2, (rect.bottom - h) + yv, this.mGuidelinePaint);
                float y1 = rect.top + oneThirdCropHeight;
                float y2 = rect.bottom - oneThirdCropHeight;
                float xv = (float) (w * Math.cos(Math.asin((h - oneThirdCropHeight) / h)));
                canvas.drawLine((rect.left + w) - xv, y1, (rect.right - w) + xv, y1, this.mGuidelinePaint);
                canvas.drawLine((rect.left + w) - xv, y2, (rect.right - w) + xv, y2, this.mGuidelinePaint);
                return;
            }
            float x12 = rect.left + oneThirdCropWidth;
            float x22 = rect.right - oneThirdCropWidth;
            canvas.drawLine(x12, rect.top, x12, rect.bottom, this.mGuidelinePaint);
            canvas.drawLine(x22, rect.top, x22, rect.bottom, this.mGuidelinePaint);
            float y12 = rect.top + oneThirdCropHeight;
            float y22 = rect.bottom - oneThirdCropHeight;
            canvas.drawLine(rect.left, y12, rect.right, y12, this.mGuidelinePaint);
            canvas.drawLine(rect.left, y22, rect.right, y22, this.mGuidelinePaint);
        }
    }

    private void drawBorders(Canvas canvas) {
        if (this.mBorderPaint != null) {
            float w = this.mBorderPaint.getStrokeWidth();
            RectF rect = this.mCropWindowHandler.getRect();
            rect.inset(w / 2.0f, w / 2.0f);
            if (this.mCropShape == CropImageView.CropShape.RECTANGLE) {
                canvas.drawRect(rect, this.mBorderPaint);
            } else {
                canvas.drawOval(rect, this.mBorderPaint);
            }
        }
    }

    private void drawCorners(Canvas canvas) {
        if (this.mBorderCornerPaint != null) {
            float lineWidth = this.mBorderPaint != null ? this.mBorderPaint.getStrokeWidth() : 0.0f;
            float cornerWidth = this.mBorderCornerPaint.getStrokeWidth();
            float w = (cornerWidth / 2.0f) + this.mBorderCornerOffset;
            RectF rect = this.mCropWindowHandler.getRect();
            rect.inset(w, w);
            float cornerOffset = (cornerWidth - lineWidth) / 2.0f;
            float cornerExtension = (cornerWidth / 2.0f) + cornerOffset;
            canvas.drawLine(rect.left - cornerOffset, rect.top - cornerExtension, rect.left - cornerOffset, rect.top + this.mBorderCornerLength, this.mBorderCornerPaint);
            canvas.drawLine(rect.left - cornerExtension, rect.top - cornerOffset, rect.left + this.mBorderCornerLength, rect.top - cornerOffset, this.mBorderCornerPaint);
            canvas.drawLine(rect.right + cornerOffset, rect.top - cornerExtension, rect.right + cornerOffset, rect.top + this.mBorderCornerLength, this.mBorderCornerPaint);
            canvas.drawLine(rect.right + cornerExtension, rect.top - cornerOffset, rect.right - this.mBorderCornerLength, rect.top - cornerOffset, this.mBorderCornerPaint);
            canvas.drawLine(rect.left - cornerOffset, rect.bottom + cornerExtension, rect.left - cornerOffset, rect.bottom - this.mBorderCornerLength, this.mBorderCornerPaint);
            canvas.drawLine(rect.left - cornerExtension, rect.bottom + cornerOffset, rect.left + this.mBorderCornerLength, rect.bottom + cornerOffset, this.mBorderCornerPaint);
            canvas.drawLine(rect.right + cornerOffset, rect.bottom + cornerExtension, rect.right + cornerOffset, rect.bottom - this.mBorderCornerLength, this.mBorderCornerPaint);
            canvas.drawLine(rect.right + cornerExtension, rect.bottom + cornerOffset, rect.right - this.mBorderCornerLength, rect.bottom + cornerOffset, this.mBorderCornerPaint);
        }
    }

    private static Paint getNewPaint(int color) {
        Paint paint = new Paint();
        paint.setColor(color);
        return paint;
    }

    private static Paint getNewPaintOrNull(float thickness, int color) {
        if (thickness > 0.0f) {
            Paint borderPaint = new Paint();
            borderPaint.setColor(color);
            borderPaint.setStrokeWidth(thickness);
            borderPaint.setStyle(Paint.Style.STROKE);
            borderPaint.setAntiAlias(true);
            return borderPaint;
        }
        return null;
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        if (isEnabled()) {
            switch (event.getAction()) {
                case BuildConfig.DEBUG /* 0 */:
                    onActionDown(event.getX(), event.getY());
                    break;
                case BuildConfig.VERSION_CODE /* 1 */:
                case 3:
                    getParent().requestDisallowInterceptTouchEvent(false);
                    onActionUp();
                    break;
                case 2:
                    onActionMove(event.getX(), event.getY());
                    getParent().requestDisallowInterceptTouchEvent(true);
                    break;
            }
            return true;
        }
        return false;
    }

    private void onActionDown(float x, float y) {
        this.mMoveHandler = this.mCropWindowHandler.getMoveHandler(x, y, this.mTouchRadius, this.mCropShape);
        if (this.mMoveHandler != null) {
            invalidate();
        }
    }

    private void onActionUp() {
        if (this.mMoveHandler != null) {
            this.mMoveHandler = null;
            callOnCropWindowChanged(false);
            invalidate();
        }
    }

    private void onActionMove(float x, float y) {
        if (this.mMoveHandler != null) {
            this.mMoveHandler.move(x, y, this.mBitmapRect, this.mViewWidth, this.mViewHeight, this.mSnapRadius, this.mFixAspectRatio, this.mTargetAspectRatio);
            callOnCropWindowChanged(true);
            invalidate();
        }
    }

    private void callOnCropWindowChanged(boolean inProgress) {
        try {
            if (this.mCropWindowChangeListener != null) {
                this.mCropWindowChangeListener.onCropWindowChanged(inProgress);
            }
        } catch (Exception e) {
            Log.e("AIC", "Exception in crop window changed", e);
        }
    }
}
