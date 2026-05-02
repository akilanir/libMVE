package com.balysv.materialripple;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.AttributeSet;
import android.util.Property;
import android.util.TypedValue;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.LinearInterpolator;
import android.widget.AdapterView;
import android.widget.FrameLayout;

/* loaded from: com.balysv.material-ripple.1.0.2.jar:com/balysv/materialripple/MaterialRippleLayout.class */
public class MaterialRippleLayout extends FrameLayout {
    private static final int DEFAULT_DURATION = 350;
    private static final int DEFAULT_FADE_DURATION = 75;
    private static final float DEFAULT_DIAMETER_DP = 35.0f;
    private static final float DEFAULT_ALPHA = 0.2f;
    private static final int DEFAULT_COLOR = -16777216;
    private static final int DEFAULT_BACKGROUND = 0;
    private static final boolean DEFAULT_HOVER = true;
    private static final boolean DEFAULT_DELAY_CLICK = true;
    private static final boolean DEFAULT_PERSISTENT = false;
    private static final boolean DEFAULT_SEARCH_ADAPTER = false;
    private static final boolean DEFAULT_RIPPLE_OVERLAY = false;
    private static final int DEFAULT_ROUNDED_CORNERS = 0;
    private static final int FADE_EXTRA_DELAY = 50;
    private static final long HOVER_DURATION = 2500;
    private final Paint paint;
    private final Rect bounds;
    private int rippleColor;
    private boolean rippleOverlay;
    private boolean rippleHover;
    private int rippleDiameter;
    private int rippleDuration;
    private int rippleAlpha;
    private boolean rippleDelayClick;
    private int rippleFadeDuration;
    private boolean ripplePersistent;
    private Drawable rippleBackground;
    private boolean rippleInAdapter;
    private float rippleRoundedCorners;
    private float radius;
    private AdapterView parentAdapter;
    private View childView;
    private AnimatorSet rippleAnimator;
    private ObjectAnimator hoverAnimator;
    private Point currentCoords;
    private Point previousCoords;
    private int layerType;
    private boolean eventCancelled;
    private boolean prepressed;
    private int positionInAdapter;
    private GestureDetector gestureDetector;
    private PerformClickEvent pendingClickEvent;
    private PressedEvent pendingPressEvent;
    private boolean hasPerformedLongPress;
    private GestureDetector.SimpleOnGestureListener longClickListener;
    private Property<MaterialRippleLayout, Float> radiusProperty;
    private Property<MaterialRippleLayout, Integer> circleAlphaProperty;

    public static RippleBuilder on(View view) {
        return new RippleBuilder(view);
    }

    public MaterialRippleLayout(Context context) {
        this(context, null, 0);
    }

    public MaterialRippleLayout(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public MaterialRippleLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.paint = new Paint(1);
        this.bounds = new Rect();
        this.currentCoords = new Point();
        this.previousCoords = new Point();
        this.longClickListener = new GestureDetector.SimpleOnGestureListener() { // from class: com.balysv.materialripple.MaterialRippleLayout.2
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public void onLongPress(MotionEvent e) {
                MaterialRippleLayout.this.hasPerformedLongPress = MaterialRippleLayout.this.childView.performLongClick();
                if (MaterialRippleLayout.this.hasPerformedLongPress) {
                    if (MaterialRippleLayout.this.rippleHover) {
                        MaterialRippleLayout.this.startRipple(null);
                    }
                    MaterialRippleLayout.this.cancelPressedEvent();
                }
            }

            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onDown(MotionEvent e) {
                MaterialRippleLayout.this.hasPerformedLongPress = false;
                return super.onDown(e);
            }
        };
        this.radiusProperty = new Property<MaterialRippleLayout, Float>(Float.class, "radius") { // from class: com.balysv.materialripple.MaterialRippleLayout.4
            @Override // android.util.Property
            public Float get(MaterialRippleLayout object) {
                return Float.valueOf(object.getRadius());
            }

            @Override // android.util.Property
            public void set(MaterialRippleLayout object, Float value) {
                object.setRadius(value.floatValue());
            }
        };
        this.circleAlphaProperty = new Property<MaterialRippleLayout, Integer>(Integer.class, "rippleAlpha") { // from class: com.balysv.materialripple.MaterialRippleLayout.5
            @Override // android.util.Property
            public Integer get(MaterialRippleLayout object) {
                return Integer.valueOf(object.getRippleAlpha());
            }

            @Override // android.util.Property
            public void set(MaterialRippleLayout object, Integer value) {
                object.setRippleAlpha(value);
            }
        };
        setWillNotDraw(false);
        this.gestureDetector = new GestureDetector(context, this.longClickListener);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.MaterialRippleLayout);
        this.rippleColor = a.getColor(R.styleable.MaterialRippleLayout_mrl_rippleColor, DEFAULT_COLOR);
        this.rippleDiameter = a.getDimensionPixelSize(R.styleable.MaterialRippleLayout_mrl_rippleDimension, (int) dpToPx(getResources(), DEFAULT_DIAMETER_DP));
        this.rippleOverlay = a.getBoolean(R.styleable.MaterialRippleLayout_mrl_rippleOverlay, false);
        this.rippleHover = a.getBoolean(R.styleable.MaterialRippleLayout_mrl_rippleHover, true);
        this.rippleDuration = a.getInt(R.styleable.MaterialRippleLayout_mrl_rippleDuration, DEFAULT_DURATION);
        this.rippleAlpha = (int) (255.0f * a.getFloat(R.styleable.MaterialRippleLayout_mrl_rippleAlpha, DEFAULT_ALPHA));
        this.rippleDelayClick = a.getBoolean(R.styleable.MaterialRippleLayout_mrl_rippleDelayClick, true);
        this.rippleFadeDuration = a.getInteger(R.styleable.MaterialRippleLayout_mrl_rippleFadeDuration, DEFAULT_FADE_DURATION);
        this.rippleBackground = new ColorDrawable(a.getColor(R.styleable.MaterialRippleLayout_mrl_rippleBackground, 0));
        this.ripplePersistent = a.getBoolean(R.styleable.MaterialRippleLayout_mrl_ripplePersistent, false);
        this.rippleInAdapter = a.getBoolean(R.styleable.MaterialRippleLayout_mrl_rippleInAdapter, false);
        this.rippleRoundedCorners = a.getDimensionPixelSize(R.styleable.MaterialRippleLayout_mrl_rippleRoundedCorners, 0);
        a.recycle();
        this.paint.setColor(this.rippleColor);
        this.paint.setAlpha(this.rippleAlpha);
        enableClipPathSupportIfNecessary();
    }

    public <T extends View> T getChildView() {
        return (T) this.childView;
    }

    @Override // android.view.ViewGroup
    public final void addView(View child, int index, ViewGroup.LayoutParams params) {
        if (getChildCount() > 0) {
            throw new IllegalStateException("MaterialRippleLayout can host only one child");
        }
        this.childView = child;
        super.addView(child, index, params);
    }

    @Override // android.view.View
    public void setOnClickListener(View.OnClickListener onClickListener) {
        if (this.childView == null) {
            throw new IllegalStateException("MaterialRippleLayout must have a child view to handle clicks");
        }
        this.childView.setOnClickListener(onClickListener);
    }

    @Override // android.view.View
    public void setOnLongClickListener(View.OnLongClickListener onClickListener) {
        if (this.childView == null) {
            throw new IllegalStateException("MaterialRippleLayout must have a child view to handle clicks");
        }
        this.childView.setOnLongClickListener(onClickListener);
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent event) {
        return !findClickableViewInChild(this.childView, (int) event.getX(), (int) event.getY());
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        boolean superOnTouchEvent = super.onTouchEvent(event);
        if (!isEnabled() || !this.childView.isEnabled()) {
            return superOnTouchEvent;
        }
        boolean isEventInBounds = this.bounds.contains((int) event.getX(), (int) event.getY());
        if (isEventInBounds) {
            this.previousCoords.set(this.currentCoords.x, this.currentCoords.y);
            this.currentCoords.set((int) event.getX(), (int) event.getY());
        }
        boolean gestureResult = this.gestureDetector.onTouchEvent(event);
        if (gestureResult || this.hasPerformedLongPress) {
            return true;
        }
        int action = event.getActionMasked();
        switch (action) {
            case BuildConfig.DEBUG /* 0 */:
                setPositionInAdapter();
                this.eventCancelled = false;
                this.pendingPressEvent = new PressedEvent(event);
                if (isInScrollingContainer()) {
                    cancelPressedEvent();
                    this.prepressed = true;
                    postDelayed(this.pendingPressEvent, ViewConfiguration.getTapTimeout());
                    break;
                } else {
                    this.pendingPressEvent.run();
                    break;
                }
            case BuildConfig.VERSION_CODE /* 1 */:
                this.pendingClickEvent = new PerformClickEvent();
                if (this.prepressed) {
                    this.childView.setPressed(true);
                    postDelayed(new Runnable() { // from class: com.balysv.materialripple.MaterialRippleLayout.1
                        @Override // java.lang.Runnable
                        public void run() {
                            MaterialRippleLayout.this.childView.setPressed(false);
                        }
                    }, ViewConfiguration.getPressedStateDuration());
                }
                if (isEventInBounds) {
                    startRipple(this.pendingClickEvent);
                } else if (!this.rippleHover) {
                    setRadius(0.0f);
                }
                if (!this.rippleDelayClick && isEventInBounds) {
                    this.pendingClickEvent.run();
                }
                cancelPressedEvent();
                break;
            case 2:
                if (this.rippleHover) {
                    if (isEventInBounds && !this.eventCancelled) {
                        invalidate();
                    } else if (!isEventInBounds) {
                        startRipple(null);
                    }
                }
                if (!isEventInBounds) {
                    cancelPressedEvent();
                    if (this.hoverAnimator != null) {
                        this.hoverAnimator.cancel();
                    }
                    this.childView.onTouchEvent(event);
                    this.eventCancelled = true;
                    break;
                }
                break;
            case 3:
                if (this.rippleInAdapter) {
                    this.currentCoords.set(this.previousCoords.x, this.previousCoords.y);
                    this.previousCoords = new Point();
                }
                this.childView.onTouchEvent(event);
                if (this.rippleHover) {
                    if (!this.prepressed) {
                        startRipple(null);
                    }
                } else {
                    this.childView.setPressed(false);
                }
                cancelPressedEvent();
                break;
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cancelPressedEvent() {
        if (this.pendingPressEvent != null) {
            removeCallbacks(this.pendingPressEvent);
            this.prepressed = false;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startHover() {
        if (this.eventCancelled) {
            return;
        }
        if (this.hoverAnimator != null) {
            this.hoverAnimator.cancel();
        }
        float radius = (float) (Math.sqrt(Math.pow(getWidth(), 2.0d) + Math.pow(getHeight(), 2.0d)) * 1.2000000476837158d);
        this.hoverAnimator = ObjectAnimator.ofFloat(this, this.radiusProperty, this.rippleDiameter, radius).setDuration(HOVER_DURATION);
        this.hoverAnimator.setInterpolator(new LinearInterpolator());
        this.hoverAnimator.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startRipple(final Runnable animationEndRunnable) {
        if (this.eventCancelled) {
            return;
        }
        float endRadius = getEndRadius();
        cancelAnimations();
        this.rippleAnimator = new AnimatorSet();
        this.rippleAnimator.addListener(new AnimatorListenerAdapter() { // from class: com.balysv.materialripple.MaterialRippleLayout.3
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                if (!MaterialRippleLayout.this.ripplePersistent) {
                    MaterialRippleLayout.this.setRadius(0.0f);
                    MaterialRippleLayout.this.setRippleAlpha(Integer.valueOf(MaterialRippleLayout.this.rippleAlpha));
                }
                if (animationEndRunnable != null && MaterialRippleLayout.this.rippleDelayClick) {
                    animationEndRunnable.run();
                }
                MaterialRippleLayout.this.childView.setPressed(false);
            }
        });
        ObjectAnimator ripple = ObjectAnimator.ofFloat(this, this.radiusProperty, this.radius, endRadius);
        ripple.setDuration(this.rippleDuration);
        ripple.setInterpolator(new DecelerateInterpolator());
        ObjectAnimator fade = ObjectAnimator.ofInt(this, this.circleAlphaProperty, this.rippleAlpha, 0);
        fade.setDuration(this.rippleFadeDuration);
        fade.setInterpolator(new AccelerateInterpolator());
        fade.setStartDelay((this.rippleDuration - this.rippleFadeDuration) - FADE_EXTRA_DELAY);
        if (this.ripplePersistent) {
            this.rippleAnimator.play(ripple);
        } else if (getRadius() > endRadius) {
            fade.setStartDelay(0L);
            this.rippleAnimator.play(fade);
        } else {
            this.rippleAnimator.playTogether(ripple, fade);
        }
        this.rippleAnimator.start();
    }

    private void cancelAnimations() {
        if (this.rippleAnimator != null) {
            this.rippleAnimator.cancel();
            this.rippleAnimator.removeAllListeners();
        }
        if (this.hoverAnimator != null) {
            this.hoverAnimator.cancel();
        }
    }

    private float getEndRadius() {
        int width = getWidth();
        int height = getHeight();
        int halfWidth = width / 2;
        int halfHeight = height / 2;
        float radiusX = halfWidth > this.currentCoords.x ? width - this.currentCoords.x : this.currentCoords.x;
        float radiusY = halfHeight > this.currentCoords.y ? height - this.currentCoords.y : this.currentCoords.y;
        return ((float) Math.sqrt(Math.pow(radiusX, 2.0d) + Math.pow(radiusY, 2.0d))) * 1.2f;
    }

    private boolean isInScrollingContainer() {
        ViewParent parent = getParent();
        while (true) {
            ViewParent p = parent;
            if (p != null && (p instanceof ViewGroup)) {
                if (((ViewGroup) p).shouldDelayChildPressedState()) {
                    return true;
                }
                parent = p.getParent();
            } else {
                return false;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public AdapterView findParentAdapterView() {
        if (this.parentAdapter != null) {
            return this.parentAdapter;
        }
        ViewParent current = getParent();
        while (!(current instanceof AdapterView)) {
            try {
                current = current.getParent();
            } catch (NullPointerException e) {
                throw new RuntimeException("Could not find a parent AdapterView");
            }
        }
        this.parentAdapter = (AdapterView) current;
        return this.parentAdapter;
    }

    private void setPositionInAdapter() {
        if (this.rippleInAdapter) {
            this.positionInAdapter = findParentAdapterView().getPositionForView(this);
        }
    }

    private boolean adapterPositionChanged() {
        if (this.rippleInAdapter) {
            int newPosition = findParentAdapterView().getPositionForView(this);
            boolean changed = newPosition != this.positionInAdapter;
            this.positionInAdapter = newPosition;
            if (changed) {
                cancelPressedEvent();
                cancelAnimations();
                this.childView.setPressed(false);
                setRadius(0.0f);
            }
            return changed;
        }
        return false;
    }

    private boolean findClickableViewInChild(View view, int x, int y) {
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int i = 0; i < viewGroup.getChildCount(); i++) {
                View child = viewGroup.getChildAt(i);
                Rect rect = new Rect();
                child.getHitRect(rect);
                boolean contains = rect.contains(x, y);
                if (contains) {
                    return findClickableViewInChild(child, x - rect.left, y - rect.top);
                }
            }
        } else if (view != this.childView) {
            return view.isEnabled() && (view.isClickable() || view.isLongClickable() || view.isFocusableInTouchMode());
        }
        return view.isFocusableInTouchMode();
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        this.bounds.set(0, 0, w, h);
        this.rippleBackground.setBounds(this.bounds);
    }

    @Override // android.view.View
    public boolean isInEditMode() {
        return true;
    }

    @Override // android.view.View
    public void draw(Canvas canvas) {
        boolean positionChanged = adapterPositionChanged();
        if (this.rippleOverlay) {
            if (!positionChanged) {
                this.rippleBackground.draw(canvas);
            }
            super.draw(canvas);
            if (!positionChanged) {
                if (this.rippleRoundedCorners != 0.0f) {
                    Path clipPath = new Path();
                    RectF rect = new RectF(0.0f, 0.0f, canvas.getWidth(), canvas.getHeight());
                    clipPath.addRoundRect(rect, this.rippleRoundedCorners, this.rippleRoundedCorners, Path.Direction.CW);
                    canvas.clipPath(clipPath);
                }
                canvas.drawCircle(this.currentCoords.x, this.currentCoords.y, this.radius, this.paint);
                return;
            }
            return;
        }
        if (!positionChanged) {
            this.rippleBackground.draw(canvas);
            canvas.drawCircle(this.currentCoords.x, this.currentCoords.y, this.radius, this.paint);
        }
        super.draw(canvas);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public float getRadius() {
        return this.radius;
    }

    public void setRadius(float radius) {
        this.radius = radius;
        invalidate();
    }

    public int getRippleAlpha() {
        return this.paint.getAlpha();
    }

    public void setRippleAlpha(Integer rippleAlpha) {
        this.paint.setAlpha(rippleAlpha.intValue());
        invalidate();
    }

    public void setRippleColor(int rippleColor) {
        this.rippleColor = rippleColor;
        this.paint.setColor(rippleColor);
        this.paint.setAlpha(this.rippleAlpha);
        invalidate();
    }

    public void setRippleOverlay(boolean rippleOverlay) {
        this.rippleOverlay = rippleOverlay;
    }

    public void setRippleDiameter(int rippleDiameter) {
        this.rippleDiameter = rippleDiameter;
    }

    public void setRippleDuration(int rippleDuration) {
        this.rippleDuration = rippleDuration;
    }

    public void setRippleBackground(int color) {
        this.rippleBackground = new ColorDrawable(color);
        this.rippleBackground.setBounds(this.bounds);
        invalidate();
    }

    public void setRippleHover(boolean rippleHover) {
        this.rippleHover = rippleHover;
    }

    public void setRippleDelayClick(boolean rippleDelayClick) {
        this.rippleDelayClick = rippleDelayClick;
    }

    public void setRippleFadeDuration(int rippleFadeDuration) {
        this.rippleFadeDuration = rippleFadeDuration;
    }

    public void setRipplePersistent(boolean ripplePersistent) {
        this.ripplePersistent = ripplePersistent;
    }

    public void setRippleInAdapter(boolean rippleInAdapter) {
        this.rippleInAdapter = rippleInAdapter;
    }

    public void setRippleRoundedCorners(int rippleRoundedCorner) {
        this.rippleRoundedCorners = rippleRoundedCorner;
        enableClipPathSupportIfNecessary();
    }

    public void setDefaultRippleAlpha(int alpha) {
        this.rippleAlpha = alpha;
        this.paint.setAlpha(alpha);
        invalidate();
    }

    public void performRipple() {
        this.currentCoords = new Point(getWidth() / 2, getHeight() / 2);
        startRipple(null);
    }

    public void performRipple(Point anchor) {
        this.currentCoords = new Point(anchor.x, anchor.y);
        startRipple(null);
    }

    private void enableClipPathSupportIfNecessary() {
        if (Build.VERSION.SDK_INT <= 17) {
            if (this.rippleRoundedCorners != 0.0f) {
                this.layerType = getLayerType();
                setLayerType(1, null);
            } else {
                setLayerType(this.layerType, null);
            }
        }
    }

    /* loaded from: com.balysv.material-ripple.1.0.2.jar:com/balysv/materialripple/MaterialRippleLayout$PerformClickEvent.class */
    private class PerformClickEvent implements Runnable {
        private PerformClickEvent() {
        }

        @Override // java.lang.Runnable
        public void run() {
            if (MaterialRippleLayout.this.hasPerformedLongPress) {
                return;
            }
            if (!(MaterialRippleLayout.this.getParent() instanceof AdapterView)) {
                if (!MaterialRippleLayout.this.rippleInAdapter) {
                    MaterialRippleLayout.this.childView.performClick();
                    return;
                } else {
                    clickAdapterView(MaterialRippleLayout.this.findParentAdapterView());
                    return;
                }
            }
            clickAdapterView((AdapterView) MaterialRippleLayout.this.getParent());
        }

        private void clickAdapterView(AdapterView parent) {
            int position = parent.getPositionForView(MaterialRippleLayout.this);
            long itemId = parent.getAdapter() != null ? parent.getAdapter().getItemId(position) : 0L;
            if (position != -1) {
                parent.performItemClick(MaterialRippleLayout.this, position, itemId);
            }
        }
    }

    /* loaded from: com.balysv.material-ripple.1.0.2.jar:com/balysv/materialripple/MaterialRippleLayout$PressedEvent.class */
    private final class PressedEvent implements Runnable {
        private final MotionEvent event;

        public PressedEvent(MotionEvent event) {
            this.event = event;
        }

        @Override // java.lang.Runnable
        public void run() {
            MaterialRippleLayout.this.prepressed = false;
            MaterialRippleLayout.this.childView.setLongClickable(false);
            MaterialRippleLayout.this.childView.onTouchEvent(this.event);
            MaterialRippleLayout.this.childView.setPressed(true);
            if (MaterialRippleLayout.this.rippleHover) {
                MaterialRippleLayout.this.startHover();
            }
        }
    }

    static float dpToPx(Resources resources, float dp) {
        return TypedValue.applyDimension(1, dp, resources.getDisplayMetrics());
    }

    /* loaded from: com.balysv.material-ripple.1.0.2.jar:com/balysv/materialripple/MaterialRippleLayout$RippleBuilder.class */
    public static class RippleBuilder {
        private final Context context;
        private final View child;
        private int rippleColor = MaterialRippleLayout.DEFAULT_COLOR;
        private boolean rippleOverlay = false;
        private boolean rippleHover = true;
        private float rippleDiameter = MaterialRippleLayout.DEFAULT_DIAMETER_DP;
        private int rippleDuration = MaterialRippleLayout.DEFAULT_DURATION;
        private float rippleAlpha = MaterialRippleLayout.DEFAULT_ALPHA;
        private boolean rippleDelayClick = true;
        private int rippleFadeDuration = MaterialRippleLayout.DEFAULT_FADE_DURATION;
        private boolean ripplePersistent = false;
        private int rippleBackground = 0;
        private boolean rippleSearchAdapter = false;
        private float rippleRoundedCorner = 0.0f;

        public RippleBuilder(View child) {
            this.child = child;
            this.context = child.getContext();
        }

        public RippleBuilder rippleColor(int color) {
            this.rippleColor = color;
            return this;
        }

        public RippleBuilder rippleOverlay(boolean overlay) {
            this.rippleOverlay = overlay;
            return this;
        }

        public RippleBuilder rippleHover(boolean hover) {
            this.rippleHover = hover;
            return this;
        }

        public RippleBuilder rippleDiameterDp(int diameterDp) {
            this.rippleDiameter = diameterDp;
            return this;
        }

        public RippleBuilder rippleDuration(int duration) {
            this.rippleDuration = duration;
            return this;
        }

        public RippleBuilder rippleAlpha(float alpha) {
            this.rippleAlpha = 255.0f * alpha;
            return this;
        }

        public RippleBuilder rippleDelayClick(boolean delayClick) {
            this.rippleDelayClick = delayClick;
            return this;
        }

        public RippleBuilder rippleFadeDuration(int fadeDuration) {
            this.rippleFadeDuration = fadeDuration;
            return this;
        }

        public RippleBuilder ripplePersistent(boolean persistent) {
            this.ripplePersistent = persistent;
            return this;
        }

        public RippleBuilder rippleBackground(int color) {
            this.rippleBackground = color;
            return this;
        }

        public RippleBuilder rippleInAdapter(boolean inAdapter) {
            this.rippleSearchAdapter = inAdapter;
            return this;
        }

        public RippleBuilder rippleRoundedCorners(int radiusDp) {
            this.rippleRoundedCorner = radiusDp;
            return this;
        }

        public MaterialRippleLayout create() {
            MaterialRippleLayout layout = new MaterialRippleLayout(this.context);
            layout.setRippleColor(this.rippleColor);
            layout.setDefaultRippleAlpha((int) this.rippleAlpha);
            layout.setRippleDelayClick(this.rippleDelayClick);
            layout.setRippleDiameter((int) MaterialRippleLayout.dpToPx(this.context.getResources(), this.rippleDiameter));
            layout.setRippleDuration(this.rippleDuration);
            layout.setRippleFadeDuration(this.rippleFadeDuration);
            layout.setRippleHover(this.rippleHover);
            layout.setRipplePersistent(this.ripplePersistent);
            layout.setRippleOverlay(this.rippleOverlay);
            layout.setRippleBackground(this.rippleBackground);
            layout.setRippleInAdapter(this.rippleSearchAdapter);
            layout.setRippleRoundedCorners((int) MaterialRippleLayout.dpToPx(this.context.getResources(), this.rippleRoundedCorner));
            ViewGroup.LayoutParams params = this.child.getLayoutParams();
            ViewGroup parent = (ViewGroup) this.child.getParent();
            int index = 0;
            if (parent != null && (parent instanceof MaterialRippleLayout)) {
                throw new IllegalStateException("MaterialRippleLayout could not be created: parent of the view already is a MaterialRippleLayout");
            }
            if (parent != null) {
                index = parent.indexOfChild(this.child);
                parent.removeView(this.child);
            }
            layout.addView(this.child, new ViewGroup.LayoutParams(-1, -1));
            if (parent != null) {
                parent.addView(layout, index, params);
            }
            return layout;
        }
    }
}
