package uk.co.senab.photoview;

import android.content.Context;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.util.FloatMath;
import android.util.Log;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.Interpolator;
import android.widget.ImageView;
import java.lang.ref.WeakReference;
import uk.co.senab.photoview.gestures.OnGestureListener;
import uk.co.senab.photoview.gestures.VersionedGestureDetector;
import uk.co.senab.photoview.log.LogManager;
import uk.co.senab.photoview.scrollerproxy.ScrollerProxy;

/* loaded from: library-1.2.2.jar:uk/co/senab/photoview/PhotoViewAttacher.class */
public class PhotoViewAttacher implements IPhotoView, View.OnTouchListener, OnGestureListener, GestureDetector.OnDoubleTapListener, ViewTreeObserver.OnGlobalLayoutListener {
    private static final String LOG_TAG = "PhotoViewAttacher";
    private static final boolean DEBUG = Log.isLoggable(LOG_TAG, 3);
    static final Interpolator sInterpolator = new AccelerateDecelerateInterpolator();
    static final int ZOOM_DURATION = 200;
    static final int EDGE_NONE = -1;
    static final int EDGE_LEFT = 0;
    static final int EDGE_RIGHT = 1;
    static final int EDGE_BOTH = 2;
    public static final float DEFAULT_MAX_SCALE = 3.0f;
    public static final float DEFAULT_MID_SCALE = 1.75f;
    public static final float DEFAULT_MIN_SCALE = 1.0f;
    private WeakReference<ImageView> mImageView;
    private GestureDetector mGestureDetector;
    private uk.co.senab.photoview.gestures.GestureDetector mScaleDragDetector;
    private OnMatrixChangedListener mMatrixChangeListener;
    private OnPhotoTapListener mPhotoTapListener;
    private OnViewTapListener mViewTapListener;
    private View.OnLongClickListener mLongClickListener;
    private int mIvTop;
    private int mIvRight;
    private int mIvBottom;
    private int mIvLeft;
    private FlingRunnable mCurrentFlingRunnable;
    private boolean mZoomEnabled;
    private float mMinScale = 1.0f;
    private float mMidScale = 1.75f;
    private float mMaxScale = 3.0f;
    private boolean mAllowParentInterceptOnEdge = true;
    private final Matrix mBaseMatrix = new Matrix();
    private final Matrix mDrawMatrix = new Matrix();
    private final Matrix mSuppMatrix = new Matrix();
    private final RectF mDisplayRect = new RectF();
    private final float[] mMatrixValues = new float[9];
    private int mScrollEdge = EDGE_BOTH;
    private ImageView.ScaleType mScaleType = ImageView.ScaleType.FIT_CENTER;
    private float mLastRotation = 0.0f;

    /* loaded from: library-1.2.2.jar:uk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener.class */
    public interface OnMatrixChangedListener {
        void onMatrixChanged(RectF rectF);
    }

    /* loaded from: library-1.2.2.jar:uk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener.class */
    public interface OnPhotoTapListener {
        void onPhotoTap(View view, float f, float f2);
    }

    /* loaded from: library-1.2.2.jar:uk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener.class */
    public interface OnViewTapListener {
        void onViewTap(View view, float f, float f2);
    }

    private static void checkZoomLevels(float minZoom, float midZoom, float maxZoom) {
        if (minZoom >= midZoom) {
            throw new IllegalArgumentException("MinZoom has to be less than MidZoom");
        }
        if (midZoom >= maxZoom) {
            throw new IllegalArgumentException("MidZoom has to be less than MaxZoom");
        }
    }

    private static boolean hasDrawable(ImageView imageView) {
        return (EDGE_LEFT == imageView || EDGE_LEFT == imageView.getDrawable()) ? false : true;
    }

    private static boolean isSupportedScaleType(ImageView.ScaleType scaleType) {
        if (EDGE_LEFT == scaleType) {
            return false;
        }
        switch (AnonymousClass2.$SwitchMap$android$widget$ImageView$ScaleType[scaleType.ordinal()]) {
            case EDGE_RIGHT /* 1 */:
                throw new IllegalArgumentException(scaleType.name() + " is not supported in PhotoView");
            default:
                return true;
        }
    }

    /* renamed from: uk.co.senab.photoview.PhotoViewAttacher$2, reason: invalid class name */
    /* loaded from: library-1.2.2.jar:uk/co/senab/photoview/PhotoViewAttacher$2.class */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] $SwitchMap$android$widget$ImageView$ScaleType = new int[ImageView.ScaleType.values().length];

        static {
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.MATRIX.ordinal()] = PhotoViewAttacher.EDGE_RIGHT;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_START.ordinal()] = PhotoViewAttacher.EDGE_BOTH;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_END.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_CENTER.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_XY.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
        }
    }

    private static void setImageViewScaleTypeMatrix(ImageView imageView) {
        if (EDGE_LEFT != imageView && !(imageView instanceof PhotoView) && !ImageView.ScaleType.MATRIX.equals(imageView.getScaleType())) {
            imageView.setScaleType(ImageView.ScaleType.MATRIX);
        }
    }

    public PhotoViewAttacher(ImageView imageView) {
        this.mImageView = new WeakReference<>(imageView);
        imageView.setOnTouchListener(this);
        ViewTreeObserver observer = imageView.getViewTreeObserver();
        if (EDGE_LEFT != observer) {
            observer.addOnGlobalLayoutListener(this);
        }
        setImageViewScaleTypeMatrix(imageView);
        if (imageView.isInEditMode()) {
            return;
        }
        this.mScaleDragDetector = VersionedGestureDetector.newInstance(imageView.getContext(), this);
        this.mGestureDetector = new GestureDetector(imageView.getContext(), new GestureDetector.SimpleOnGestureListener() { // from class: uk.co.senab.photoview.PhotoViewAttacher.1
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public void onLongPress(MotionEvent e) {
                if (PhotoViewAttacher.EDGE_LEFT != PhotoViewAttacher.this.mLongClickListener) {
                    PhotoViewAttacher.this.mLongClickListener.onLongClick(PhotoViewAttacher.this.getImageView());
                }
            }
        });
        this.mGestureDetector.setOnDoubleTapListener(this);
        setZoomable(true);
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public final boolean canZoom() {
        return this.mZoomEnabled;
    }

    public final void cleanup() {
        if (EDGE_LEFT == this.mImageView) {
            return;
        }
        ImageView imageView = this.mImageView.get();
        if (EDGE_LEFT != imageView) {
            ViewTreeObserver observer = imageView.getViewTreeObserver();
            if (EDGE_LEFT != observer && observer.isAlive()) {
                observer.removeGlobalOnLayoutListener(this);
            }
            imageView.setOnTouchListener(null);
            cancelFling();
        }
        if (EDGE_LEFT != this.mGestureDetector) {
            this.mGestureDetector.setOnDoubleTapListener(null);
        }
        this.mMatrixChangeListener = null;
        this.mPhotoTapListener = null;
        this.mViewTapListener = null;
        this.mImageView = null;
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public final RectF getDisplayRect() {
        checkMatrixBounds();
        return getDisplayRect(getDrawMatrix());
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public boolean setDisplayMatrix(Matrix finalMatrix) {
        if (finalMatrix == null) {
            throw new IllegalArgumentException("Matrix cannot be null");
        }
        ImageView imageView = getImageView();
        if (EDGE_LEFT == imageView || EDGE_LEFT == imageView.getDrawable()) {
            return false;
        }
        this.mSuppMatrix.set(finalMatrix);
        setImageViewMatrix(getDrawMatrix());
        checkMatrixBounds();
        return true;
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public void setPhotoViewRotation(float degrees) {
        float degrees2 = degrees % 360.0f;
        this.mSuppMatrix.postRotate(this.mLastRotation - degrees2);
        this.mLastRotation = degrees2;
        checkAndDisplayMatrix();
    }

    public final ImageView getImageView() {
        ImageView imageView = EDGE_LEFT;
        if (EDGE_LEFT != this.mImageView) {
            imageView = this.mImageView.get();
        }
        if (EDGE_LEFT == imageView) {
            cleanup();
            Log.i(LOG_TAG, "ImageView no longer exists. You should not use this PhotoViewAttacher any more.");
        }
        return imageView;
    }

    @Override // uk.co.senab.photoview.IPhotoView
    @Deprecated
    public float getMinScale() {
        return getMinimumScale();
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public float getMinimumScale() {
        return this.mMinScale;
    }

    @Override // uk.co.senab.photoview.IPhotoView
    @Deprecated
    public float getMidScale() {
        return getMediumScale();
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public float getMediumScale() {
        return this.mMidScale;
    }

    @Override // uk.co.senab.photoview.IPhotoView
    @Deprecated
    public float getMaxScale() {
        return getMaximumScale();
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public float getMaximumScale() {
        return this.mMaxScale;
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public final float getScale() {
        return FloatMath.sqrt(((float) Math.pow(getValue(this.mSuppMatrix, EDGE_LEFT), 2.0d)) + ((float) Math.pow(getValue(this.mSuppMatrix, 3), 2.0d)));
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public final ImageView.ScaleType getScaleType() {
        return this.mScaleType;
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public final boolean onDoubleTap(MotionEvent ev) {
        try {
            float scale = getScale();
            float x = ev.getX();
            float y = ev.getY();
            if (scale < this.mMidScale) {
                setScale(this.mMidScale, x, y, true);
            } else if (scale >= this.mMidScale && scale < this.mMaxScale) {
                setScale(this.mMaxScale, x, y, true);
            } else {
                setScale(this.mMinScale, x, y, true);
            }
            return true;
        } catch (ArrayIndexOutOfBoundsException e) {
            return true;
        }
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public final boolean onDoubleTapEvent(MotionEvent e) {
        return false;
    }

    @Override // uk.co.senab.photoview.gestures.OnGestureListener
    public final void onDrag(float dx, float dy) {
        ViewParent parent;
        if (DEBUG) {
            LogManager.getLogger().d(LOG_TAG, String.format("onDrag: dx: %.2f. dy: %.2f", Float.valueOf(dx), Float.valueOf(dy)));
        }
        ImageView imageView = getImageView();
        this.mSuppMatrix.postTranslate(dx, dy);
        checkAndDisplayMatrix();
        if (this.mAllowParentInterceptOnEdge && !this.mScaleDragDetector.isScaling()) {
            if ((this.mScrollEdge == EDGE_BOTH || ((this.mScrollEdge == 0 && dx >= 1.0f) || (this.mScrollEdge == EDGE_RIGHT && dx <= -1.0f))) && EDGE_LEFT != (parent = imageView.getParent())) {
                parent.requestDisallowInterceptTouchEvent(false);
            }
        }
    }

    @Override // uk.co.senab.photoview.gestures.OnGestureListener
    public final void onFling(float startX, float startY, float velocityX, float velocityY) {
        if (DEBUG) {
            LogManager.getLogger().d(LOG_TAG, "onFling. sX: " + startX + " sY: " + startY + " Vx: " + velocityX + " Vy: " + velocityY);
        }
        ImageView imageView = getImageView();
        this.mCurrentFlingRunnable = new FlingRunnable(imageView.getContext());
        this.mCurrentFlingRunnable.fling(getImageViewWidth(imageView), getImageViewHeight(imageView), (int) velocityX, (int) velocityY);
        imageView.post(this.mCurrentFlingRunnable);
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public final void onGlobalLayout() {
        ImageView imageView = getImageView();
        if (EDGE_LEFT != imageView && this.mZoomEnabled) {
            int top = imageView.getTop();
            int right = imageView.getRight();
            int bottom = imageView.getBottom();
            int left = imageView.getLeft();
            if (top != this.mIvTop || bottom != this.mIvBottom || left != this.mIvLeft || right != this.mIvRight) {
                updateBaseMatrix(imageView.getDrawable());
                this.mIvTop = top;
                this.mIvRight = right;
                this.mIvBottom = bottom;
                this.mIvLeft = left;
            }
        }
    }

    @Override // uk.co.senab.photoview.gestures.OnGestureListener
    public final void onScale(float scaleFactor, float focusX, float focusY) {
        if (DEBUG) {
            LogManager.getLogger().d(LOG_TAG, String.format("onScale: scale: %.2f. fX: %.2f. fY: %.2f", Float.valueOf(scaleFactor), Float.valueOf(focusX), Float.valueOf(focusY)));
        }
        if (getScale() < this.mMaxScale || scaleFactor < 1.0f) {
            this.mSuppMatrix.postScale(scaleFactor, scaleFactor, focusX, focusY);
            checkAndDisplayMatrix();
        }
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public final boolean onSingleTapConfirmed(MotionEvent e) {
        RectF displayRect;
        ImageView imageView = getImageView();
        if (EDGE_LEFT != this.mPhotoTapListener && EDGE_LEFT != (displayRect = getDisplayRect())) {
            float x = e.getX();
            float y = e.getY();
            if (displayRect.contains(x, y)) {
                float xResult = (x - displayRect.left) / displayRect.width();
                float yResult = (y - displayRect.top) / displayRect.height();
                this.mPhotoTapListener.onPhotoTap(imageView, xResult, yResult);
                return true;
            }
        }
        if (EDGE_LEFT != this.mViewTapListener) {
            this.mViewTapListener.onViewTap(imageView, e.getX(), e.getY());
            return false;
        }
        return false;
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View v, MotionEvent ev) {
        RectF rect;
        boolean handled = EDGE_LEFT;
        if (this.mZoomEnabled && hasDrawable((ImageView) v)) {
            ViewParent parent = v.getParent();
            switch (ev.getAction()) {
                case EDGE_LEFT /* 0 */:
                    if (EDGE_LEFT != parent) {
                        parent.requestDisallowInterceptTouchEvent(true);
                    } else {
                        Log.i(LOG_TAG, "onTouch getParent() returned null");
                    }
                    cancelFling();
                    break;
                case EDGE_RIGHT /* 1 */:
                case 3:
                    if (getScale() < this.mMinScale && EDGE_LEFT != (rect = getDisplayRect())) {
                        v.post(new AnimatedZoomRunnable(getScale(), this.mMinScale, rect.centerX(), rect.centerY()));
                        handled = EDGE_RIGHT;
                        break;
                    }
                    break;
            }
            if (EDGE_LEFT != this.mGestureDetector && this.mGestureDetector.onTouchEvent(ev)) {
                handled = EDGE_RIGHT;
            }
            if (!handled && EDGE_LEFT != parent) {
                parent.requestDisallowInterceptTouchEvent(false);
            }
            if (EDGE_LEFT != this.mScaleDragDetector && this.mScaleDragDetector.onTouchEvent(ev)) {
                handled = EDGE_RIGHT;
            }
        }
        return handled;
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public void setAllowParentInterceptOnEdge(boolean allow) {
        this.mAllowParentInterceptOnEdge = allow;
    }

    @Override // uk.co.senab.photoview.IPhotoView
    @Deprecated
    public void setMinScale(float minScale) {
        setMinimumScale(minScale);
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public void setMinimumScale(float minimumScale) {
        checkZoomLevels(minimumScale, this.mMidScale, this.mMaxScale);
        this.mMinScale = minimumScale;
    }

    @Override // uk.co.senab.photoview.IPhotoView
    @Deprecated
    public void setMidScale(float midScale) {
        setMediumScale(midScale);
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public void setMediumScale(float mediumScale) {
        checkZoomLevels(this.mMinScale, mediumScale, this.mMaxScale);
        this.mMidScale = mediumScale;
    }

    @Override // uk.co.senab.photoview.IPhotoView
    @Deprecated
    public void setMaxScale(float maxScale) {
        setMaximumScale(maxScale);
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public void setMaximumScale(float maximumScale) {
        checkZoomLevels(this.mMinScale, this.mMidScale, maximumScale);
        this.mMaxScale = maximumScale;
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public final void setOnLongClickListener(View.OnLongClickListener listener) {
        this.mLongClickListener = listener;
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public final void setOnMatrixChangeListener(OnMatrixChangedListener listener) {
        this.mMatrixChangeListener = listener;
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public final void setOnPhotoTapListener(OnPhotoTapListener listener) {
        this.mPhotoTapListener = listener;
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public final void setOnViewTapListener(OnViewTapListener listener) {
        this.mViewTapListener = listener;
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public void setScale(float scale) {
        setScale(scale, false);
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public void setScale(float scale, boolean animate) {
        ImageView imageView = getImageView();
        if (EDGE_LEFT != imageView) {
            setScale(scale, imageView.getRight() / EDGE_BOTH, imageView.getBottom() / EDGE_BOTH, animate);
        }
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public void setScale(float scale, float focalX, float focalY, boolean animate) {
        ImageView imageView = getImageView();
        if (EDGE_LEFT != imageView) {
            if (scale < this.mMinScale || scale > this.mMaxScale) {
                LogManager.getLogger().i(LOG_TAG, "Scale must be within the range of minScale and maxScale");
            } else if (animate) {
                imageView.post(new AnimatedZoomRunnable(getScale(), scale, focalX, focalY));
            } else {
                this.mSuppMatrix.setScale(scale, scale, focalX, focalY);
                checkAndDisplayMatrix();
            }
        }
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public final void setScaleType(ImageView.ScaleType scaleType) {
        if (isSupportedScaleType(scaleType) && scaleType != this.mScaleType) {
            this.mScaleType = scaleType;
            update();
        }
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public final void setZoomable(boolean zoomable) {
        this.mZoomEnabled = zoomable;
        update();
    }

    public final void update() {
        ImageView imageView = getImageView();
        if (EDGE_LEFT != imageView) {
            if (this.mZoomEnabled) {
                setImageViewScaleTypeMatrix(imageView);
                updateBaseMatrix(imageView.getDrawable());
            } else {
                resetMatrix();
            }
        }
    }

    @Override // uk.co.senab.photoview.IPhotoView
    public Matrix getDisplayMatrix() {
        return new Matrix(this.mSuppMatrix);
    }

    protected Matrix getDrawMatrix() {
        this.mDrawMatrix.set(this.mBaseMatrix);
        this.mDrawMatrix.postConcat(this.mSuppMatrix);
        return this.mDrawMatrix;
    }

    private void cancelFling() {
        if (EDGE_LEFT != this.mCurrentFlingRunnable) {
            this.mCurrentFlingRunnable.cancelFling();
            this.mCurrentFlingRunnable = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void checkAndDisplayMatrix() {
        if (checkMatrixBounds()) {
            setImageViewMatrix(getDrawMatrix());
        }
    }

    private void checkImageViewScaleType() {
        ImageView imageView = getImageView();
        if (EDGE_LEFT != imageView && !(imageView instanceof PhotoView) && !ImageView.ScaleType.MATRIX.equals(imageView.getScaleType())) {
            throw new IllegalStateException("The ImageView's ScaleType has been changed since attaching a PhotoViewAttacher");
        }
    }

    private boolean checkMatrixBounds() {
        RectF rect;
        ImageView imageView = getImageView();
        if (EDGE_LEFT == imageView || EDGE_LEFT == (rect = getDisplayRect(getDrawMatrix()))) {
            return false;
        }
        float height = rect.height();
        float width = rect.width();
        float deltaX = EDGE_LEFT;
        float deltaY = EDGE_LEFT;
        int viewHeight = getImageViewHeight(imageView);
        if (height <= viewHeight) {
            switch (AnonymousClass2.$SwitchMap$android$widget$ImageView$ScaleType[this.mScaleType.ordinal()]) {
                case EDGE_BOTH /* 2 */:
                    deltaY = -rect.top;
                    break;
                case 3:
                    deltaY = (viewHeight - height) - rect.top;
                    break;
                default:
                    deltaY = ((viewHeight - height) / 2.0f) - rect.top;
                    break;
            }
        } else if (rect.top > 0.0f) {
            deltaY = -rect.top;
        } else if (rect.bottom < viewHeight) {
            deltaY = viewHeight - rect.bottom;
        }
        int viewWidth = getImageViewWidth(imageView);
        if (width <= viewWidth) {
            switch (AnonymousClass2.$SwitchMap$android$widget$ImageView$ScaleType[this.mScaleType.ordinal()]) {
                case EDGE_BOTH /* 2 */:
                    deltaX = -rect.left;
                    break;
                case 3:
                    deltaX = (viewWidth - width) - rect.left;
                    break;
                default:
                    deltaX = ((viewWidth - width) / 2.0f) - rect.left;
                    break;
            }
            this.mScrollEdge = EDGE_BOTH;
        } else if (rect.left > 0.0f) {
            this.mScrollEdge = EDGE_LEFT;
            deltaX = -rect.left;
        } else if (rect.right < viewWidth) {
            deltaX = viewWidth - rect.right;
            this.mScrollEdge = EDGE_RIGHT;
        } else {
            this.mScrollEdge = EDGE_NONE;
        }
        this.mSuppMatrix.postTranslate(deltaX, deltaY);
        return true;
    }

    private RectF getDisplayRect(Matrix matrix) {
        Drawable d;
        ImageView imageView = getImageView();
        if (EDGE_LEFT != imageView && EDGE_LEFT != (d = imageView.getDrawable())) {
            this.mDisplayRect.set(0.0f, 0.0f, d.getIntrinsicWidth(), d.getIntrinsicHeight());
            matrix.mapRect(this.mDisplayRect);
            return this.mDisplayRect;
        }
        return null;
    }

    private float getValue(Matrix matrix, int whichValue) {
        matrix.getValues(this.mMatrixValues);
        return this.mMatrixValues[whichValue];
    }

    private void resetMatrix() {
        this.mSuppMatrix.reset();
        setImageViewMatrix(getDrawMatrix());
        checkMatrixBounds();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setImageViewMatrix(Matrix matrix) {
        RectF displayRect;
        ImageView imageView = getImageView();
        if (EDGE_LEFT != imageView) {
            checkImageViewScaleType();
            imageView.setImageMatrix(matrix);
            if (EDGE_LEFT != this.mMatrixChangeListener && EDGE_LEFT != (displayRect = getDisplayRect(matrix))) {
                this.mMatrixChangeListener.onMatrixChanged(displayRect);
            }
        }
    }

    private void updateBaseMatrix(Drawable d) {
        ImageView imageView = getImageView();
        if (EDGE_LEFT == imageView || EDGE_LEFT == d) {
            return;
        }
        float viewWidth = getImageViewWidth(imageView);
        float viewHeight = getImageViewHeight(imageView);
        int drawableWidth = d.getIntrinsicWidth();
        int drawableHeight = d.getIntrinsicHeight();
        this.mBaseMatrix.reset();
        float widthScale = viewWidth / drawableWidth;
        float heightScale = viewHeight / drawableHeight;
        if (this.mScaleType == ImageView.ScaleType.CENTER) {
            this.mBaseMatrix.postTranslate((viewWidth - drawableWidth) / 2.0f, (viewHeight - drawableHeight) / 2.0f);
        } else if (this.mScaleType != ImageView.ScaleType.CENTER_CROP) {
            if (this.mScaleType == ImageView.ScaleType.CENTER_INSIDE) {
                float scale = Math.min(1.0f, Math.min(widthScale, heightScale));
                this.mBaseMatrix.postScale(scale, scale);
                this.mBaseMatrix.postTranslate((viewWidth - (drawableWidth * scale)) / 2.0f, (viewHeight - (drawableHeight * scale)) / 2.0f);
            } else {
                RectF mTempSrc = new RectF(0.0f, 0.0f, drawableWidth, drawableHeight);
                RectF mTempDst = new RectF(0.0f, 0.0f, viewWidth, viewHeight);
                switch (AnonymousClass2.$SwitchMap$android$widget$ImageView$ScaleType[this.mScaleType.ordinal()]) {
                    case EDGE_BOTH /* 2 */:
                        this.mBaseMatrix.setRectToRect(mTempSrc, mTempDst, Matrix.ScaleToFit.START);
                        break;
                    case 3:
                        this.mBaseMatrix.setRectToRect(mTempSrc, mTempDst, Matrix.ScaleToFit.END);
                        break;
                    case 4:
                        this.mBaseMatrix.setRectToRect(mTempSrc, mTempDst, Matrix.ScaleToFit.CENTER);
                        break;
                    case 5:
                        this.mBaseMatrix.setRectToRect(mTempSrc, mTempDst, Matrix.ScaleToFit.FILL);
                        break;
                }
            }
        } else {
            float scale2 = Math.max(widthScale, heightScale);
            this.mBaseMatrix.postScale(scale2, scale2);
            this.mBaseMatrix.postTranslate((viewWidth - (drawableWidth * scale2)) / 2.0f, (viewHeight - (drawableHeight * scale2)) / 2.0f);
        }
        resetMatrix();
    }

    private int getImageViewWidth(ImageView imageView) {
        if (EDGE_LEFT == imageView) {
            return EDGE_LEFT;
        }
        return (imageView.getWidth() - imageView.getPaddingLeft()) - imageView.getPaddingRight();
    }

    private int getImageViewHeight(ImageView imageView) {
        if (EDGE_LEFT == imageView) {
            return EDGE_LEFT;
        }
        return (imageView.getHeight() - imageView.getPaddingTop()) - imageView.getPaddingBottom();
    }

    /* loaded from: library-1.2.2.jar:uk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable.class */
    private class AnimatedZoomRunnable implements Runnable {
        private final float mFocalX;
        private final float mFocalY;
        private final long mStartTime = System.currentTimeMillis();
        private final float mZoomStart;
        private final float mZoomEnd;

        public AnimatedZoomRunnable(float currentZoom, float targetZoom, float focalX, float focalY) {
            this.mFocalX = focalX;
            this.mFocalY = focalY;
            this.mZoomStart = currentZoom;
            this.mZoomEnd = targetZoom;
        }

        @Override // java.lang.Runnable
        public void run() {
            ImageView imageView = PhotoViewAttacher.this.getImageView();
            if (imageView == null) {
                return;
            }
            float t = interpolate();
            float scale = this.mZoomStart + (t * (this.mZoomEnd - this.mZoomStart));
            float deltaScale = scale / PhotoViewAttacher.this.getScale();
            PhotoViewAttacher.this.mSuppMatrix.postScale(deltaScale, deltaScale, this.mFocalX, this.mFocalY);
            PhotoViewAttacher.this.checkAndDisplayMatrix();
            if (t < 1.0f) {
                Compat.postOnAnimation(imageView, this);
            }
        }

        private float interpolate() {
            float t = (1.0f * (System.currentTimeMillis() - this.mStartTime)) / 200.0f;
            return PhotoViewAttacher.sInterpolator.getInterpolation(Math.min(1.0f, t));
        }
    }

    /* loaded from: library-1.2.2.jar:uk/co/senab/photoview/PhotoViewAttacher$FlingRunnable.class */
    private class FlingRunnable implements Runnable {
        private final ScrollerProxy mScroller;
        private int mCurrentX;
        private int mCurrentY;

        public FlingRunnable(Context context) {
            this.mScroller = ScrollerProxy.getScroller(context);
        }

        public void cancelFling() {
            if (PhotoViewAttacher.DEBUG) {
                LogManager.getLogger().d(PhotoViewAttacher.LOG_TAG, "Cancel Fling");
            }
            this.mScroller.forceFinished(true);
        }

        public void fling(int viewWidth, int viewHeight, int velocityX, int velocityY) {
            int maxX;
            int minX;
            int maxY;
            int minY;
            RectF rect = PhotoViewAttacher.this.getDisplayRect();
            if (PhotoViewAttacher.EDGE_LEFT == rect) {
                return;
            }
            int startX = Math.round(-rect.left);
            if (viewWidth < rect.width()) {
                minX = PhotoViewAttacher.EDGE_LEFT;
                maxX = Math.round(rect.width() - viewWidth);
            } else {
                maxX = startX;
                minX = startX;
            }
            int startY = Math.round(-rect.top);
            if (viewHeight < rect.height()) {
                minY = PhotoViewAttacher.EDGE_LEFT;
                maxY = Math.round(rect.height() - viewHeight);
            } else {
                maxY = startY;
                minY = startY;
            }
            this.mCurrentX = startX;
            this.mCurrentY = startY;
            if (PhotoViewAttacher.DEBUG) {
                LogManager.getLogger().d(PhotoViewAttacher.LOG_TAG, "fling. StartX:" + startX + " StartY:" + startY + " MaxX:" + maxX + " MaxY:" + maxY);
            }
            if (startX != maxX || startY != maxY) {
                this.mScroller.fling(startX, startY, velocityX, velocityY, minX, maxX, minY, maxY, PhotoViewAttacher.EDGE_LEFT, PhotoViewAttacher.EDGE_LEFT);
            }
        }

        @Override // java.lang.Runnable
        public void run() {
            ImageView imageView;
            if (!this.mScroller.isFinished() && PhotoViewAttacher.EDGE_LEFT != (imageView = PhotoViewAttacher.this.getImageView()) && this.mScroller.computeScrollOffset()) {
                int newX = this.mScroller.getCurrX();
                int newY = this.mScroller.getCurrY();
                if (PhotoViewAttacher.DEBUG) {
                    LogManager.getLogger().d(PhotoViewAttacher.LOG_TAG, "fling run(). CurrentX:" + this.mCurrentX + " CurrentY:" + this.mCurrentY + " NewX:" + newX + " NewY:" + newY);
                }
                PhotoViewAttacher.this.mSuppMatrix.postTranslate(this.mCurrentX - newX, this.mCurrentY - newY);
                PhotoViewAttacher.this.setImageViewMatrix(PhotoViewAttacher.this.getDrawMatrix());
                this.mCurrentX = newX;
                this.mCurrentY = newY;
                Compat.postOnAnimation(imageView, this);
            }
        }
    }
}
