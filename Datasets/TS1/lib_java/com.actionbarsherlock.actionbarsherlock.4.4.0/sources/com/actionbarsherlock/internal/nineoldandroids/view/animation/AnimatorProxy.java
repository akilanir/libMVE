package com.actionbarsherlock.internal.nineoldandroids.view.animation;

import android.graphics.Matrix;
import android.graphics.RectF;
import android.os.Build;
import android.util.FloatMath;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.Transformation;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/nineoldandroids/view/animation/AnimatorProxy.class */
public final class AnimatorProxy extends Animation {
    public static final boolean NEEDS_PROXY;
    private static final WeakHashMap<View, AnimatorProxy> PROXIES;
    private final WeakReference<View> mView;
    private float mTranslationX;
    private float mTranslationY;
    private float mAlpha = 1.0f;
    private float mScaleX = 1.0f;
    private float mScaleY = 1.0f;
    private final RectF mBefore = new RectF();
    private final RectF mAfter = new RectF();
    private final Matrix mTempMatrix = new Matrix();

    static {
        NEEDS_PROXY = Build.VERSION.SDK_INT < 11;
        PROXIES = new WeakHashMap<>();
    }

    public static AnimatorProxy wrap(View view) {
        AnimatorProxy proxy = PROXIES.get(view);
        if (proxy == null) {
            proxy = new AnimatorProxy(view);
            PROXIES.put(view, proxy);
        }
        return proxy;
    }

    private AnimatorProxy(View view) {
        setDuration(0L);
        setFillAfter(true);
        view.setAnimation(this);
        this.mView = new WeakReference<>(view);
    }

    public float getAlpha() {
        return this.mAlpha;
    }

    public void setAlpha(float alpha) {
        if (this.mAlpha != alpha) {
            this.mAlpha = alpha;
            View view = this.mView.get();
            if (view != null) {
                view.invalidate();
            }
        }
    }

    public float getScaleX() {
        return this.mScaleX;
    }

    public void setScaleX(float scaleX) {
        if (this.mScaleX != scaleX) {
            prepareForUpdate();
            this.mScaleX = scaleX;
            invalidateAfterUpdate();
        }
    }

    public float getScaleY() {
        return this.mScaleY;
    }

    public void setScaleY(float scaleY) {
        if (this.mScaleY != scaleY) {
            prepareForUpdate();
            this.mScaleY = scaleY;
            invalidateAfterUpdate();
        }
    }

    public int getScrollX() {
        View view = this.mView.get();
        if (view == null) {
            return 0;
        }
        return view.getScrollX();
    }

    public void setScrollX(int value) {
        View view = this.mView.get();
        if (view != null) {
            view.scrollTo(value, view.getScrollY());
        }
    }

    public int getScrollY() {
        View view = this.mView.get();
        if (view == null) {
            return 0;
        }
        return view.getScrollY();
    }

    public void setScrollY(int value) {
        View view = this.mView.get();
        if (view != null) {
            view.scrollTo(view.getScrollY(), value);
        }
    }

    public float getTranslationX() {
        return this.mTranslationX;
    }

    public void setTranslationX(float translationX) {
        if (this.mTranslationX != translationX) {
            prepareForUpdate();
            this.mTranslationX = translationX;
            invalidateAfterUpdate();
        }
    }

    public float getTranslationY() {
        return this.mTranslationY;
    }

    public void setTranslationY(float translationY) {
        if (this.mTranslationY != translationY) {
            prepareForUpdate();
            this.mTranslationY = translationY;
            invalidateAfterUpdate();
        }
    }

    private void prepareForUpdate() {
        View view = this.mView.get();
        if (view != null) {
            computeRect(this.mBefore, view);
        }
    }

    private void invalidateAfterUpdate() {
        View parent;
        View view = this.mView.get();
        if (view == null || (parent = (View) view.getParent()) == null) {
            return;
        }
        view.setAnimation(this);
        RectF after = this.mAfter;
        computeRect(after, view);
        after.union(this.mBefore);
        parent.invalidate((int) FloatMath.floor(after.left), (int) FloatMath.floor(after.top), (int) FloatMath.ceil(after.right), (int) FloatMath.ceil(after.bottom));
    }

    private void computeRect(RectF r, View view) {
        float w = view.getWidth();
        float h = view.getHeight();
        r.set(0.0f, 0.0f, w, h);
        Matrix m = this.mTempMatrix;
        m.reset();
        transformMatrix(m, view);
        this.mTempMatrix.mapRect(r);
        r.offset(view.getLeft(), view.getTop());
        if (r.right < r.left) {
            float f = r.right;
            r.right = r.left;
            r.left = f;
        }
        if (r.bottom < r.top) {
            float f2 = r.top;
            r.top = r.bottom;
            r.bottom = f2;
        }
    }

    private void transformMatrix(Matrix m, View view) {
        float w = view.getWidth();
        float h = view.getHeight();
        float sX = this.mScaleX;
        float sY = this.mScaleY;
        if (sX != 1.0f || sY != 1.0f) {
            float deltaSX = ((sX * w) - w) / 2.0f;
            float deltaSY = ((sY * h) - h) / 2.0f;
            m.postScale(sX, sY);
            m.postTranslate(-deltaSX, -deltaSY);
        }
        m.postTranslate(this.mTranslationX, this.mTranslationY);
    }

    @Override // android.view.animation.Animation
    protected void applyTransformation(float interpolatedTime, Transformation t) {
        View view = this.mView.get();
        if (view != null) {
            t.setAlpha(this.mAlpha);
            transformMatrix(t.getMatrix(), view);
        }
    }

    @Override // android.view.animation.Animation
    public void reset() {
    }
}
