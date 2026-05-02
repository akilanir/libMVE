package com.rey.material.app;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Handler;
import android.view.GestureDetector;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.Transformation;
import android.widget.FrameLayout;
import com.rey.material.R;
import com.rey.material.drawable.BlankDrawable;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/BottomSheetDialog.class */
public class BottomSheetDialog extends android.app.Dialog {
    private boolean mCancelable;
    private boolean mCanceledOnTouchOutside;
    private int mLayoutHeight;
    private Interpolator mInInterpolator;
    private int mInDuration;
    private Interpolator mOutInterpolator;
    private int mOutDuration;
    private ContainerFrameLayout mContainer;
    private View mContentView;
    private GestureDetector mGestureDetector;
    private int mMinFlingVelocity;
    private final Handler mHandler;
    private final Runnable mDismissAction;
    private boolean mRunShowAnimation;
    private Animation mAnimation;

    public BottomSheetDialog(Context context) {
        this(context, R.style.Material_App_BottomSheetDialog);
    }

    public BottomSheetDialog(Context context, int style) {
        super(context, style);
        this.mCancelable = true;
        this.mCanceledOnTouchOutside = true;
        this.mLayoutHeight = -2;
        this.mHandler = new Handler();
        this.mDismissAction = new Runnable() { // from class: com.rey.material.app.BottomSheetDialog.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    BottomSheetDialog.super.dismiss();
                } catch (IllegalArgumentException e) {
                }
            }
        };
        this.mRunShowAnimation = false;
        requestWindowFeature(1);
        getWindow().setBackgroundDrawable(BlankDrawable.getInstance());
        WindowManager.LayoutParams layout = getWindow().getAttributes();
        layout.width = -1;
        layout.height = -1;
        layout.windowAnimations = R.style.DialogNoAnimation;
        getWindow().setAttributes(layout);
        init(context, style);
    }

    private void init(Context context, int style) {
        this.mContainer = new ContainerFrameLayout(context);
        cancelable(true);
        canceledOnTouchOutside(true);
        onCreate();
        applyStyle(style);
        this.mMinFlingVelocity = ViewConfiguration.get(context).getScaledMinimumFlingVelocity() * 2;
        this.mGestureDetector = new GestureDetector(context, new GestureDetector.OnGestureListener() { // from class: com.rey.material.app.BottomSheetDialog.2
            @Override // android.view.GestureDetector.OnGestureListener
            public boolean onDown(MotionEvent e) {
                return false;
            }

            @Override // android.view.GestureDetector.OnGestureListener
            public void onShowPress(MotionEvent e) {
            }

            @Override // android.view.GestureDetector.OnGestureListener
            public boolean onSingleTapUp(MotionEvent e) {
                return false;
            }

            @Override // android.view.GestureDetector.OnGestureListener
            public boolean onScroll(MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) {
                return false;
            }

            @Override // android.view.GestureDetector.OnGestureListener
            public void onLongPress(MotionEvent e) {
            }

            @Override // android.view.GestureDetector.OnGestureListener
            public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) {
                if (velocityY > BottomSheetDialog.this.mMinFlingVelocity) {
                    BottomSheetDialog.this.dismiss();
                    return true;
                }
                return false;
            }
        });
        super.setContentView(this.mContainer);
    }

    protected void onCreate() {
    }

    public BottomSheetDialog applyStyle(int styleId) {
        int resId;
        Context context = getContext();
        TypedArray a = context.obtainStyledAttributes(styleId, R.styleable.BottomSheetDialog);
        int count = a.getIndexCount();
        for (int i = 0; i < count; i++) {
            int attr = a.getIndex(i);
            if (attr == R.styleable.BottomSheetDialog_android_layout_height) {
                heightParam(a.getLayoutDimension(attr, -2));
            } else if (attr == R.styleable.BottomSheetDialog_bsd_cancelable) {
                cancelable(a.getBoolean(attr, true));
            } else if (attr == R.styleable.BottomSheetDialog_bsd_canceledOnTouchOutside) {
                canceledOnTouchOutside(a.getBoolean(attr, true));
            } else if (attr == R.styleable.BottomSheetDialog_bsd_dimAmount) {
                dimAmount(a.getFloat(attr, 0.0f));
            } else if (attr == R.styleable.BottomSheetDialog_bsd_inDuration) {
                inDuration(a.getInteger(attr, 0));
            } else if (attr == R.styleable.BottomSheetDialog_bsd_inInterpolator) {
                int resId2 = a.getResourceId(attr, 0);
                if (resId2 != 0) {
                    inInterpolator(AnimationUtils.loadInterpolator(context, resId2));
                }
            } else if (attr == R.styleable.BottomSheetDialog_bsd_outDuration) {
                outDuration(a.getInteger(attr, 0));
            } else if (attr == R.styleable.BottomSheetDialog_bsd_outInterpolator && (resId = a.getResourceId(attr, 0)) != 0) {
                outInterpolator(AnimationUtils.loadInterpolator(context, resId));
            }
        }
        a.recycle();
        if (this.mInInterpolator == null) {
            this.mInInterpolator = new DecelerateInterpolator();
        }
        if (this.mOutInterpolator == null) {
            this.mOutInterpolator = new AccelerateInterpolator();
        }
        return this;
    }

    public BottomSheetDialog cancelable(boolean cancelable) {
        super.setCancelable(cancelable);
        this.mCancelable = cancelable;
        return this;
    }

    public BottomSheetDialog canceledOnTouchOutside(boolean cancel) {
        super.setCanceledOnTouchOutside(cancel);
        this.mCanceledOnTouchOutside = cancel;
        return this;
    }

    public BottomSheetDialog dimAmount(float amount) {
        Window window = getWindow();
        if (amount > 0.0f) {
            window.addFlags(2);
            WindowManager.LayoutParams lp = window.getAttributes();
            lp.dimAmount = amount;
            window.setAttributes(lp);
        } else {
            window.clearFlags(2);
        }
        return this;
    }

    public BottomSheetDialog contentView(View v) {
        this.mContentView = v;
        this.mContainer.removeAllViews();
        this.mContainer.addView(v);
        return this;
    }

    public BottomSheetDialog contentView(int layoutId) {
        if (layoutId == 0) {
            return this;
        }
        View v = LayoutInflater.from(getContext()).inflate(layoutId, (ViewGroup) null);
        return contentView(v);
    }

    public BottomSheetDialog heightParam(int height) {
        if (this.mLayoutHeight != height) {
            this.mLayoutHeight = height;
            if (isShowing() && this.mContentView != null) {
                this.mRunShowAnimation = true;
                this.mContainer.forceLayout();
                this.mContainer.requestLayout();
            }
        }
        return this;
    }

    public BottomSheetDialog inDuration(int duration) {
        this.mInDuration = duration;
        return this;
    }

    public BottomSheetDialog inInterpolator(Interpolator interpolator) {
        this.mInInterpolator = interpolator;
        return this;
    }

    public BottomSheetDialog outDuration(int duration) {
        this.mOutDuration = duration;
        return this;
    }

    public BottomSheetDialog outInterpolator(Interpolator interpolator) {
        this.mOutInterpolator = interpolator;
        return this;
    }

    @Override // android.app.Dialog
    protected void onStart() {
        super.onStart();
        if (this.mContentView != null) {
            this.mRunShowAnimation = true;
            this.mContainer.forceLayout();
        }
    }

    @Override // android.app.Dialog
    protected void onStop() {
        super.onStop();
        this.mContainer = null;
        this.mContentView = null;
        this.mGestureDetector = null;
    }

    @Override // android.app.Dialog
    public void setCancelable(boolean flag) {
        cancelable(flag);
    }

    @Override // android.app.Dialog
    public void setCanceledOnTouchOutside(boolean cancel) {
        canceledOnTouchOutside(cancel);
    }

    @Override // android.app.Dialog
    public void setContentView(View v) {
        contentView(v);
    }

    @Override // android.app.Dialog
    public void setContentView(int layoutId) {
        contentView(layoutId);
    }

    @Override // android.app.Dialog
    public void setContentView(View v, ViewGroup.LayoutParams params) {
        contentView(v);
    }

    @Override // android.app.Dialog
    public void addContentView(View view, ViewGroup.LayoutParams params) {
        contentView(view);
    }

    public void dismissImmediately() {
        super.dismiss();
        if (this.mAnimation != null) {
            this.mAnimation.cancel();
        }
        if (this.mHandler != null) {
            this.mHandler.removeCallbacks(this.mDismissAction);
        }
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public void dismiss() {
        if (!isShowing()) {
            return;
        }
        if (this.mContentView != null) {
            this.mAnimation = new SlideAnimation(this.mContentView.getTop(), this.mContainer.getMeasuredHeight());
            this.mAnimation.setDuration(this.mOutDuration);
            this.mAnimation.setInterpolator(this.mOutInterpolator);
            this.mAnimation.setAnimationListener(new Animation.AnimationListener() { // from class: com.rey.material.app.BottomSheetDialog.3
                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationStart(Animation animation) {
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationRepeat(Animation animation) {
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationEnd(Animation animation) {
                    BottomSheetDialog.this.mAnimation = null;
                    BottomSheetDialog.this.mHandler.post(BottomSheetDialog.this.mDismissAction);
                }
            });
            this.mContentView.startAnimation(this.mAnimation);
            return;
        }
        this.mHandler.post(this.mDismissAction);
    }

    protected int getContainerHeight() {
        if (this.mContainer == null) {
            return 0;
        }
        return this.mContainer.getHeight();
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/BottomSheetDialog$ContainerFrameLayout.class */
    private class ContainerFrameLayout extends FrameLayout {
        private boolean mClickOutside;
        private int mChildTop;

        public ContainerFrameLayout(Context context) {
            super(context);
            this.mClickOutside = false;
            this.mChildTop = -1;
        }

        public void setChildTop(int top) {
            this.mChildTop = top;
            View child = getChildAt(0);
            if (child != null) {
                child.offsetTopAndBottom(this.mChildTop - child.getTop());
            }
        }

        @Override // android.widget.FrameLayout, android.view.View
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int widthSize = View.MeasureSpec.getSize(widthMeasureSpec);
            int heightSize = View.MeasureSpec.getSize(heightMeasureSpec);
            View child = getChildAt(0);
            if (child != null) {
                switch (BottomSheetDialog.this.mLayoutHeight) {
                    case -2:
                        child.measure(View.MeasureSpec.makeMeasureSpec(widthSize, 1073741824), View.MeasureSpec.makeMeasureSpec(heightSize, ThemeManager.THEME_UNDEFINED));
                        break;
                    case -1:
                        child.measure(View.MeasureSpec.makeMeasureSpec(widthSize, 1073741824), View.MeasureSpec.makeMeasureSpec(heightSize, 1073741824));
                        break;
                    default:
                        child.measure(View.MeasureSpec.makeMeasureSpec(widthSize, 1073741824), View.MeasureSpec.makeMeasureSpec(Math.min(BottomSheetDialog.this.mLayoutHeight, heightSize), 1073741824));
                        break;
                }
            }
            setMeasuredDimension(widthSize, heightSize);
        }

        @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
        protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
            View child = getChildAt(0);
            if (child != null) {
                if (this.mChildTop < 0) {
                    this.mChildTop = bottom - top;
                }
                child.layout(0, this.mChildTop, child.getMeasuredWidth(), Math.max(bottom - top, this.mChildTop + child.getMeasuredHeight()));
                if (BottomSheetDialog.this.mRunShowAnimation) {
                    BottomSheetDialog.this.mRunShowAnimation = false;
                    if (BottomSheetDialog.this.mAnimation != null) {
                        BottomSheetDialog.this.mAnimation.cancel();
                        BottomSheetDialog.this.mAnimation = null;
                    }
                    if (BottomSheetDialog.this.mContentView != null) {
                        int start = this.mChildTop < 0 ? getHeight() : child.getTop();
                        int end = getMeasuredHeight() - BottomSheetDialog.this.mContentView.getMeasuredHeight();
                        if (start != end) {
                            BottomSheetDialog.this.mAnimation = BottomSheetDialog.this.new SlideAnimation(start, end);
                            BottomSheetDialog.this.mAnimation.setDuration(BottomSheetDialog.this.mInDuration);
                            BottomSheetDialog.this.mAnimation.setInterpolator(BottomSheetDialog.this.mInInterpolator);
                            BottomSheetDialog.this.mAnimation.setAnimationListener(new Animation.AnimationListener() { // from class: com.rey.material.app.BottomSheetDialog.ContainerFrameLayout.1
                                @Override // android.view.animation.Animation.AnimationListener
                                public void onAnimationStart(Animation animation) {
                                }

                                @Override // android.view.animation.Animation.AnimationListener
                                public void onAnimationRepeat(Animation animation) {
                                }

                                @Override // android.view.animation.Animation.AnimationListener
                                public void onAnimationEnd(Animation animation) {
                                    BottomSheetDialog.this.mAnimation = null;
                                }
                            });
                            BottomSheetDialog.this.mContentView.startAnimation(BottomSheetDialog.this.mAnimation);
                        }
                    }
                }
            }
        }

        private boolean isOutsideDialog(float x, float y) {
            if (y < this.mChildTop) {
                return true;
            }
            View child = getChildAt(0);
            if (child != null && y > this.mChildTop + child.getMeasuredHeight()) {
                return true;
            }
            return false;
        }

        @Override // android.view.ViewGroup, android.view.View
        public boolean dispatchTouchEvent(MotionEvent ev) {
            if (!super.dispatchTouchEvent(ev) && BottomSheetDialog.this.mGestureDetector != null) {
                BottomSheetDialog.this.mGestureDetector.onTouchEvent(ev);
                return true;
            }
            return true;
        }

        @Override // android.view.View
        public boolean onTouchEvent(MotionEvent event) {
            boolean handled = super.onTouchEvent(event);
            if (handled) {
                return true;
            }
            switch (event.getAction()) {
                case 0:
                    if (isOutsideDialog(event.getX(), event.getY())) {
                        this.mClickOutside = true;
                        break;
                    }
                    break;
                case 1:
                    if (this.mClickOutside && isOutsideDialog(event.getX(), event.getY())) {
                        this.mClickOutside = false;
                        if (BottomSheetDialog.this.mCancelable && BottomSheetDialog.this.mCanceledOnTouchOutside) {
                            BottomSheetDialog.this.dismiss();
                            break;
                        }
                    }
                    break;
                case 3:
                    this.mClickOutside = false;
                    break;
            }
            return true;
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/BottomSheetDialog$SlideAnimation.class */
    private class SlideAnimation extends Animation {
        int mStart;
        int mEnd;

        public SlideAnimation(int start, int end) {
            this.mStart = start;
            this.mEnd = end;
        }

        @Override // android.view.animation.Animation
        protected void applyTransformation(float interpolatedTime, Transformation t) {
            int top = Math.round(((this.mEnd - this.mStart) * interpolatedTime) + this.mStart);
            if (BottomSheetDialog.this.mContainer != null) {
                BottomSheetDialog.this.mContainer.setChildTop(top);
            } else {
                cancel();
            }
        }
    }
}
