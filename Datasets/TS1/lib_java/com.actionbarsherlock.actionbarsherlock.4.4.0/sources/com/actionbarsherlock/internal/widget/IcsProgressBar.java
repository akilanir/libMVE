package com.actionbarsherlock.internal.widget;

import android.R;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.Shader;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ClipDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RoundRectShape;
import android.graphics.drawable.shapes.Shape;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewDebug;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.animation.AlphaAnimation;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import android.view.animation.Transformation;
import android.widget.RemoteViews;

@RemoteViews.RemoteView
/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/IcsProgressBar.class */
public class IcsProgressBar extends View {
    private static final boolean IS_HONEYCOMB;
    private static final int MAX_LEVEL = 10000;
    private static final int ANIMATION_RESOLUTION = 200;
    private static final int TIMEOUT_SEND_ACCESSIBILITY_EVENT = 200;
    private static final int[] ProgressBar;
    private static final int ProgressBar_maxWidth = 0;
    private static final int ProgressBar_maxHeight = 1;
    private static final int ProgressBar_max = 2;
    private static final int ProgressBar_progress = 3;
    private static final int ProgressBar_secondaryProgress = 4;
    private static final int ProgressBar_indeterminate = 5;
    private static final int ProgressBar_indeterminateOnly = 6;
    private static final int ProgressBar_indeterminateDrawable = 7;
    private static final int ProgressBar_progressDrawable = 8;
    private static final int ProgressBar_indeterminateDuration = 9;
    private static final int ProgressBar_indeterminateBehavior = 10;
    private static final int ProgressBar_minWidth = 11;
    private static final int ProgressBar_minHeight = 12;
    private static final int ProgressBar_interpolator = 13;
    private static final int ProgressBar_animationResolution = 14;
    int mMinWidth;
    int mMaxWidth;
    int mMinHeight;
    int mMaxHeight;
    private int mProgress;
    private int mSecondaryProgress;
    private int mMax;
    private int mBehavior;
    private int mDuration;
    private boolean mIndeterminate;
    private boolean mOnlyIndeterminate;
    private Transformation mTransformation;
    private AlphaAnimation mAnimation;
    private Drawable mIndeterminateDrawable;
    private int mIndeterminateRealLeft;
    private int mIndeterminateRealTop;
    private Drawable mProgressDrawable;
    private Drawable mCurrentDrawable;
    Bitmap mSampleTile;
    private boolean mNoInvalidate;
    private Interpolator mInterpolator;
    private RefreshProgressRunnable mRefreshProgressRunnable;
    private long mUiThreadId;
    private boolean mShouldStartAnimationDrawable;
    private long mLastDrawTime;
    private boolean mInDrawing;
    private int mAnimationResolution;
    private AccessibilityManager mAccessibilityManager;
    private AccessibilityEventSender mAccessibilityEventSender;

    static {
        IS_HONEYCOMB = Build.VERSION.SDK_INT >= ProgressBar_minWidth;
        ProgressBar = new int[]{R.attr.maxWidth, R.attr.maxHeight, R.attr.max, R.attr.progress, R.attr.secondaryProgress, R.attr.indeterminate, R.attr.indeterminateOnly, R.attr.indeterminateDrawable, R.attr.progressDrawable, R.attr.indeterminateDuration, R.attr.indeterminateBehavior, R.attr.minWidth, R.attr.minHeight, R.attr.interpolator, R.attr.animationResolution};
    }

    public IcsProgressBar(Context context) {
        this(context, null);
    }

    public IcsProgressBar(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.progressBarStyle);
    }

    public IcsProgressBar(Context context, AttributeSet attrs, int defStyle) {
        this(context, attrs, defStyle, 0);
    }

    public IcsProgressBar(Context context, AttributeSet attrs, int defStyle, int styleRes) {
        super(context, attrs, defStyle);
        this.mUiThreadId = Thread.currentThread().getId();
        initProgressBar();
        TypedArray a = context.obtainStyledAttributes(attrs, ProgressBar, defStyle, styleRes);
        this.mNoInvalidate = true;
        Drawable drawable = a.getDrawable(8);
        if (drawable != null) {
            setProgressDrawable(tileify(drawable, false));
        }
        this.mDuration = a.getInt(ProgressBar_indeterminateDuration, this.mDuration);
        this.mMinWidth = a.getDimensionPixelSize(ProgressBar_minWidth, this.mMinWidth);
        this.mMaxWidth = a.getDimensionPixelSize(0, this.mMaxWidth);
        this.mMinHeight = a.getDimensionPixelSize(ProgressBar_minHeight, this.mMinHeight);
        this.mMaxHeight = a.getDimensionPixelSize(1, this.mMaxHeight);
        this.mBehavior = a.getInt(ProgressBar_indeterminateBehavior, this.mBehavior);
        int resID = a.getResourceId(ProgressBar_interpolator, R.anim.linear_interpolator);
        if (resID > 0) {
            setInterpolator(context, resID);
        }
        setMax(a.getInt(2, this.mMax));
        setProgress(a.getInt(ProgressBar_progress, this.mProgress));
        setSecondaryProgress(a.getInt(4, this.mSecondaryProgress));
        Drawable drawable2 = a.getDrawable(ProgressBar_indeterminateDrawable);
        if (drawable2 != null) {
            setIndeterminateDrawable(tileifyIndeterminate(drawable2));
        }
        this.mOnlyIndeterminate = a.getBoolean(ProgressBar_indeterminateOnly, this.mOnlyIndeterminate);
        this.mNoInvalidate = false;
        setIndeterminate(this.mOnlyIndeterminate || a.getBoolean(ProgressBar_indeterminate, this.mIndeterminate));
        this.mAnimationResolution = a.getInteger(ProgressBar_animationResolution, 200);
        a.recycle();
        this.mAccessibilityManager = (AccessibilityManager) context.getSystemService("accessibility");
    }

    private Drawable tileify(Drawable drawable, boolean clip) {
        if (drawable instanceof LayerDrawable) {
            LayerDrawable background = (LayerDrawable) drawable;
            int N = background.getNumberOfLayers();
            Drawable[] outDrawables = new Drawable[N];
            for (int i = 0; i < N; i++) {
                int id = background.getId(i);
                outDrawables[i] = tileify(background.getDrawable(i), id == 16908301 || id == 16908303);
            }
            LayerDrawable newBg = new LayerDrawable(outDrawables);
            for (int i2 = 0; i2 < N; i2++) {
                newBg.setId(i2, background.getId(i2));
            }
            return newBg;
        }
        if (drawable instanceof BitmapDrawable) {
            Bitmap tileBitmap = ((BitmapDrawable) drawable).getBitmap();
            if (this.mSampleTile == null) {
                this.mSampleTile = tileBitmap;
            }
            ShapeDrawable shapeDrawable = new ShapeDrawable(getDrawableShape());
            BitmapShader bitmapShader = new BitmapShader(tileBitmap, Shader.TileMode.REPEAT, Shader.TileMode.CLAMP);
            shapeDrawable.getPaint().setShader(bitmapShader);
            return clip ? new ClipDrawable(shapeDrawable, ProgressBar_progress, 1) : shapeDrawable;
        }
        return drawable;
    }

    Shape getDrawableShape() {
        float[] roundedCorners = {5.0f, 5.0f, 5.0f, 5.0f, 5.0f, 5.0f, 5.0f, 5.0f};
        return new RoundRectShape(roundedCorners, null, null);
    }

    private Drawable tileifyIndeterminate(Drawable drawable) {
        if (drawable instanceof AnimationDrawable) {
            AnimationDrawable background = (AnimationDrawable) drawable;
            int N = background.getNumberOfFrames();
            AnimationDrawable newBg = new AnimationDrawable();
            newBg.setOneShot(background.isOneShot());
            for (int i = 0; i < N; i++) {
                Drawable frame = tileify(background.getFrame(i), true);
                frame.setLevel(MAX_LEVEL);
                newBg.addFrame(frame, background.getDuration(i));
            }
            newBg.setLevel(MAX_LEVEL);
            drawable = newBg;
        }
        return drawable;
    }

    private void initProgressBar() {
        this.mMax = 100;
        this.mProgress = 0;
        this.mSecondaryProgress = 0;
        this.mIndeterminate = false;
        this.mOnlyIndeterminate = false;
        this.mDuration = 4000;
        this.mBehavior = 1;
        this.mMinWidth = 24;
        this.mMaxWidth = 48;
        this.mMinHeight = 24;
        this.mMaxHeight = 48;
    }

    @ViewDebug.ExportedProperty(category = "progress")
    public synchronized boolean isIndeterminate() {
        return this.mIndeterminate;
    }

    public synchronized void setIndeterminate(boolean indeterminate) {
        if ((!this.mOnlyIndeterminate || !this.mIndeterminate) && indeterminate != this.mIndeterminate) {
            this.mIndeterminate = indeterminate;
            if (indeterminate) {
                this.mCurrentDrawable = this.mIndeterminateDrawable;
                startAnimation();
            } else {
                this.mCurrentDrawable = this.mProgressDrawable;
                stopAnimation();
            }
        }
    }

    public Drawable getIndeterminateDrawable() {
        return this.mIndeterminateDrawable;
    }

    public void setIndeterminateDrawable(Drawable d) {
        if (d != null) {
            d.setCallback(this);
        }
        this.mIndeterminateDrawable = d;
        if (this.mIndeterminate) {
            this.mCurrentDrawable = d;
            postInvalidate();
        }
    }

    public Drawable getProgressDrawable() {
        return this.mProgressDrawable;
    }

    public void setProgressDrawable(Drawable d) {
        boolean needUpdate;
        if (this.mProgressDrawable != null && d != this.mProgressDrawable) {
            this.mProgressDrawable.setCallback(null);
            needUpdate = true;
        } else {
            needUpdate = false;
        }
        if (d != null) {
            d.setCallback(this);
            int drawableHeight = d.getMinimumHeight();
            if (this.mMaxHeight < drawableHeight) {
                this.mMaxHeight = drawableHeight;
                requestLayout();
            }
        }
        this.mProgressDrawable = d;
        if (!this.mIndeterminate) {
            this.mCurrentDrawable = d;
            postInvalidate();
        }
        if (needUpdate) {
            updateDrawableBounds(getWidth(), getHeight());
            updateDrawableState();
            doRefreshProgress(R.id.progress, this.mProgress, false, false);
            doRefreshProgress(R.id.secondaryProgress, this.mSecondaryProgress, false, false);
        }
    }

    Drawable getCurrentDrawable() {
        return this.mCurrentDrawable;
    }

    @Override // android.view.View
    protected boolean verifyDrawable(Drawable who) {
        return who == this.mProgressDrawable || who == this.mIndeterminateDrawable || super.verifyDrawable(who);
    }

    @Override // android.view.View
    public void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        if (this.mProgressDrawable != null) {
            this.mProgressDrawable.jumpToCurrentState();
        }
        if (this.mIndeterminateDrawable != null) {
            this.mIndeterminateDrawable.jumpToCurrentState();
        }
    }

    @Override // android.view.View
    public void postInvalidate() {
        if (!this.mNoInvalidate) {
            super.postInvalidate();
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/IcsProgressBar$RefreshProgressRunnable.class */
    private class RefreshProgressRunnable implements Runnable {
        private int mId;
        private int mProgress;
        private boolean mFromUser;

        RefreshProgressRunnable(int id, int progress, boolean fromUser) {
            this.mId = id;
            this.mProgress = progress;
            this.mFromUser = fromUser;
        }

        @Override // java.lang.Runnable
        public void run() {
            IcsProgressBar.this.doRefreshProgress(this.mId, this.mProgress, this.mFromUser, true);
            IcsProgressBar.this.mRefreshProgressRunnable = this;
        }

        public void setup(int id, int progress, boolean fromUser) {
            this.mId = id;
            this.mProgress = progress;
            this.mFromUser = fromUser;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void doRefreshProgress(int id, int progress, boolean fromUser, boolean callBackToApp) {
        float scale = this.mMax > 0 ? progress / this.mMax : 0.0f;
        Drawable d = this.mCurrentDrawable;
        if (d != null) {
            Drawable progressDrawable = null;
            if (d instanceof LayerDrawable) {
                progressDrawable = ((LayerDrawable) d).findDrawableByLayerId(id);
            }
            int level = (int) (scale * 10000.0f);
            (progressDrawable != null ? progressDrawable : d).setLevel(level);
        } else {
            invalidate();
        }
        if (callBackToApp && id == 16908301) {
            onProgressRefresh(scale, fromUser);
        }
    }

    void onProgressRefresh(float scale, boolean fromUser) {
        if (this.mAccessibilityManager.isEnabled()) {
            scheduleAccessibilityEventSender();
        }
    }

    private synchronized void refreshProgress(int id, int progress, boolean fromUser) {
        RefreshProgressRunnable r;
        if (this.mUiThreadId == Thread.currentThread().getId()) {
            doRefreshProgress(id, progress, fromUser, true);
            return;
        }
        if (this.mRefreshProgressRunnable != null) {
            r = this.mRefreshProgressRunnable;
            this.mRefreshProgressRunnable = null;
            r.setup(id, progress, fromUser);
        } else {
            r = new RefreshProgressRunnable(id, progress, fromUser);
        }
        post(r);
    }

    public synchronized void setProgress(int progress) {
        setProgress(progress, false);
    }

    synchronized void setProgress(int progress, boolean fromUser) {
        if (this.mIndeterminate) {
            return;
        }
        if (progress < 0) {
            progress = 0;
        }
        if (progress > this.mMax) {
            progress = this.mMax;
        }
        if (progress != this.mProgress) {
            this.mProgress = progress;
            refreshProgress(R.id.progress, this.mProgress, fromUser);
        }
    }

    public synchronized void setSecondaryProgress(int secondaryProgress) {
        if (this.mIndeterminate) {
            return;
        }
        if (secondaryProgress < 0) {
            secondaryProgress = 0;
        }
        if (secondaryProgress > this.mMax) {
            secondaryProgress = this.mMax;
        }
        if (secondaryProgress != this.mSecondaryProgress) {
            this.mSecondaryProgress = secondaryProgress;
            refreshProgress(R.id.secondaryProgress, this.mSecondaryProgress, false);
        }
    }

    @ViewDebug.ExportedProperty(category = "progress")
    public synchronized int getProgress() {
        if (this.mIndeterminate) {
            return 0;
        }
        return this.mProgress;
    }

    @ViewDebug.ExportedProperty(category = "progress")
    public synchronized int getSecondaryProgress() {
        if (this.mIndeterminate) {
            return 0;
        }
        return this.mSecondaryProgress;
    }

    @ViewDebug.ExportedProperty(category = "progress")
    public synchronized int getMax() {
        return this.mMax;
    }

    public synchronized void setMax(int max) {
        if (max < 0) {
            max = 0;
        }
        if (max != this.mMax) {
            this.mMax = max;
            postInvalidate();
            if (this.mProgress > max) {
                this.mProgress = max;
            }
            refreshProgress(R.id.progress, this.mProgress, false);
        }
    }

    public final synchronized void incrementProgressBy(int diff) {
        setProgress(this.mProgress + diff);
    }

    public final synchronized void incrementSecondaryProgressBy(int diff) {
        setSecondaryProgress(this.mSecondaryProgress + diff);
    }

    void startAnimation() {
        if (getVisibility() != 0) {
            return;
        }
        if (this.mIndeterminateDrawable instanceof Animatable) {
            this.mShouldStartAnimationDrawable = true;
            this.mAnimation = null;
        } else {
            if (this.mInterpolator == null) {
                this.mInterpolator = new LinearInterpolator();
            }
            this.mTransformation = new Transformation();
            this.mAnimation = new AlphaAnimation(0.0f, 1.0f);
            this.mAnimation.setRepeatMode(this.mBehavior);
            this.mAnimation.setRepeatCount(-1);
            this.mAnimation.setDuration(this.mDuration);
            this.mAnimation.setInterpolator(this.mInterpolator);
            this.mAnimation.setStartTime(-1L);
        }
        postInvalidate();
    }

    void stopAnimation() {
        this.mAnimation = null;
        this.mTransformation = null;
        if (this.mIndeterminateDrawable instanceof Animatable) {
            ((Animatable) this.mIndeterminateDrawable).stop();
            this.mShouldStartAnimationDrawable = false;
        }
        postInvalidate();
    }

    public void setInterpolator(Context context, int resID) {
        setInterpolator(AnimationUtils.loadInterpolator(context, resID));
    }

    public void setInterpolator(Interpolator interpolator) {
        this.mInterpolator = interpolator;
    }

    public Interpolator getInterpolator() {
        return this.mInterpolator;
    }

    @Override // android.view.View
    public void setVisibility(int v) {
        if (getVisibility() != v) {
            super.setVisibility(v);
            if (this.mIndeterminate) {
                if (v == 8 || v == 4) {
                    stopAnimation();
                } else {
                    startAnimation();
                }
            }
        }
    }

    @Override // android.view.View
    protected void onVisibilityChanged(View changedView, int visibility) {
        super.onVisibilityChanged(changedView, visibility);
        if (this.mIndeterminate) {
            if (visibility == 8 || visibility == 4) {
                stopAnimation();
            } else {
                startAnimation();
            }
        }
    }

    @Override // android.view.View, android.graphics.drawable.Drawable.Callback
    public void invalidateDrawable(Drawable dr) {
        if (!this.mInDrawing) {
            if (verifyDrawable(dr)) {
                Rect dirty = dr.getBounds();
                int scrollX = getScrollX() + getPaddingLeft();
                int scrollY = getScrollY() + getPaddingTop();
                invalidate(dirty.left + scrollX, dirty.top + scrollY, dirty.right + scrollX, dirty.bottom + scrollY);
                return;
            }
            super.invalidateDrawable(dr);
        }
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        updateDrawableBounds(w, h);
    }

    private void updateDrawableBounds(int w, int h) {
        int right = (w - getPaddingRight()) - getPaddingLeft();
        int bottom = (h - getPaddingBottom()) - getPaddingTop();
        int top = 0;
        int left = 0;
        if (this.mIndeterminateDrawable != null) {
            if (this.mOnlyIndeterminate && !(this.mIndeterminateDrawable instanceof AnimationDrawable)) {
                int intrinsicWidth = this.mIndeterminateDrawable.getIntrinsicWidth();
                int intrinsicHeight = this.mIndeterminateDrawable.getIntrinsicHeight();
                float intrinsicAspect = intrinsicWidth / intrinsicHeight;
                float boundAspect = w / h;
                if (intrinsicAspect != boundAspect) {
                    if (boundAspect > intrinsicAspect) {
                        int width = (int) (h * intrinsicAspect);
                        left = (w - width) / 2;
                        right = left + width;
                    } else {
                        int height = (int) (w * (1.0f / intrinsicAspect));
                        top = (h - height) / 2;
                        bottom = top + height;
                    }
                }
            }
            this.mIndeterminateDrawable.setBounds(0, 0, right - left, bottom - top);
            this.mIndeterminateRealLeft = left;
            this.mIndeterminateRealTop = top;
        }
        if (this.mProgressDrawable != null) {
            this.mProgressDrawable.setBounds(0, 0, right, bottom);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.view.View
    protected synchronized void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        Drawable drawable = this.mCurrentDrawable;
        if (drawable != 0) {
            canvas.save();
            canvas.translate(getPaddingLeft() + this.mIndeterminateRealLeft, getPaddingTop() + this.mIndeterminateRealTop);
            long time = getDrawingTime();
            if (this.mAnimation != null) {
                this.mAnimation.getTransformation(time, this.mTransformation);
                float scale = this.mTransformation.getAlpha();
                try {
                    this.mInDrawing = true;
                    drawable.setLevel((int) (scale * 10000.0f));
                    this.mInDrawing = false;
                    if (SystemClock.uptimeMillis() - this.mLastDrawTime >= this.mAnimationResolution) {
                        this.mLastDrawTime = SystemClock.uptimeMillis();
                        postInvalidateDelayed(this.mAnimationResolution);
                    }
                } catch (Throwable th) {
                    this.mInDrawing = false;
                    throw th;
                }
            }
            drawable.draw(canvas);
            canvas.restore();
            if (this.mShouldStartAnimationDrawable && (drawable instanceof Animatable)) {
                ((Animatable) drawable).start();
                this.mShouldStartAnimationDrawable = false;
            }
        }
    }

    @Override // android.view.View
    protected synchronized void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        Drawable d = this.mCurrentDrawable;
        int dw = 0;
        int dh = 0;
        if (d != null) {
            dw = Math.max(this.mMinWidth, Math.min(this.mMaxWidth, d.getIntrinsicWidth()));
            dh = Math.max(this.mMinHeight, Math.min(this.mMaxHeight, d.getIntrinsicHeight()));
        }
        updateDrawableState();
        int dw2 = dw + getPaddingLeft() + getPaddingRight();
        int dh2 = dh + getPaddingTop() + getPaddingBottom();
        if (IS_HONEYCOMB) {
            setMeasuredDimension(View.resolveSizeAndState(dw2, widthMeasureSpec, 0), View.resolveSizeAndState(dh2, heightMeasureSpec, 0));
        } else {
            setMeasuredDimension(View.resolveSize(dw2, widthMeasureSpec), View.resolveSize(dh2, heightMeasureSpec));
        }
    }

    @Override // android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        updateDrawableState();
    }

    private void updateDrawableState() {
        int[] state = getDrawableState();
        if (this.mProgressDrawable != null && this.mProgressDrawable.isStateful()) {
            this.mProgressDrawable.setState(state);
        }
        if (this.mIndeterminateDrawable != null && this.mIndeterminateDrawable.isStateful()) {
            this.mIndeterminateDrawable.setState(state);
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/IcsProgressBar$SavedState.class */
    static class SavedState extends View.BaseSavedState {
        int progress;
        int secondaryProgress;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.actionbarsherlock.internal.widget.IcsProgressBar.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState[] newArray(int size) {
                return new SavedState[size];
            }
        };

        SavedState(Parcelable superState) {
            super(superState);
        }

        private SavedState(Parcel in) {
            super(in);
            this.progress = in.readInt();
            this.secondaryProgress = in.readInt();
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeInt(this.progress);
            out.writeInt(this.secondaryProgress);
        }
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        SavedState ss = new SavedState(superState);
        ss.progress = this.mProgress;
        ss.secondaryProgress = this.mSecondaryProgress;
        return ss;
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable state) {
        SavedState ss = (SavedState) state;
        super.onRestoreInstanceState(ss.getSuperState());
        setProgress(ss.progress);
        setSecondaryProgress(ss.secondaryProgress);
    }

    @Override // android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.mIndeterminate) {
            startAnimation();
        }
    }

    @Override // android.view.View
    protected void onDetachedFromWindow() {
        if (this.mIndeterminate) {
            stopAnimation();
        }
        if (this.mRefreshProgressRunnable != null) {
            removeCallbacks(this.mRefreshProgressRunnable);
        }
        if (this.mAccessibilityEventSender != null) {
            removeCallbacks(this.mAccessibilityEventSender);
        }
        super.onDetachedFromWindow();
    }

    @Override // android.view.View
    public void onInitializeAccessibilityEvent(AccessibilityEvent event) {
        super.onInitializeAccessibilityEvent(event);
        event.setItemCount(this.mMax);
        event.setCurrentItemIndex(this.mProgress);
    }

    private void scheduleAccessibilityEventSender() {
        if (this.mAccessibilityEventSender == null) {
            this.mAccessibilityEventSender = new AccessibilityEventSender();
        } else {
            removeCallbacks(this.mAccessibilityEventSender);
        }
        postDelayed(this.mAccessibilityEventSender, 200L);
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/IcsProgressBar$AccessibilityEventSender.class */
    private class AccessibilityEventSender implements Runnable {
        private AccessibilityEventSender() {
        }

        @Override // java.lang.Runnable
        public void run() {
            IcsProgressBar.this.sendAccessibilityEvent(4);
        }
    }
}
