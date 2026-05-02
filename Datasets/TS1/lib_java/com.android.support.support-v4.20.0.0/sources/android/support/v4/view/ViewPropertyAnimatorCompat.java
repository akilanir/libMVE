package android.support.v4.view;

import android.os.Build;
import android.view.View;
import android.view.animation.Interpolator;
import java.lang.ref.WeakReference;

/* loaded from: com.android.support.support-v4.20.0.0.jar:android/support/v4/view/ViewPropertyAnimatorCompat.class */
public class ViewPropertyAnimatorCompat {
    private static final String TAG = "ViewAnimatorCompat";
    private WeakReference<View> mView;
    static final ViewPropertyAnimatorCompatImpl IMPL;

    /* loaded from: com.android.support.support-v4.20.0.0.jar:android/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl.class */
    interface ViewPropertyAnimatorCompatImpl {
        void setDuration(View view, long j);

        long getDuration(View view);

        void setInterpolator(View view, Interpolator interpolator);

        Interpolator getInterpolator(View view);

        void setStartDelay(View view, long j);

        long getStartDelay(View view);

        void alpha(View view, float f);

        void alphaBy(View view, float f);

        void rotation(View view, float f);

        void rotationBy(View view, float f);

        void rotationX(View view, float f);

        void rotationXBy(View view, float f);

        void rotationY(View view, float f);

        void rotationYBy(View view, float f);

        void scaleX(View view, float f);

        void scaleXBy(View view, float f);

        void scaleY(View view, float f);

        void scaleYBy(View view, float f);

        void cancel(View view);

        void x(View view, float f);

        void xBy(View view, float f);

        void y(View view, float f);

        void yBy(View view, float f);

        void translationX(View view, float f);

        void translationXBy(View view, float f);

        void translationY(View view, float f);

        void translationYBy(View view, float f);

        void start(View view);

        void withLayer(View view);

        void withStartAction(View view, Runnable runnable);

        void withEndAction(View view, Runnable runnable);

        void setListener(View view, ViewPropertyAnimatorListener viewPropertyAnimatorListener);
    }

    ViewPropertyAnimatorCompat(View view) {
        this.mView = new WeakReference<>(view);
    }

    /* loaded from: com.android.support.support-v4.20.0.0.jar:android/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl.class */
    static class BaseViewPropertyAnimatorCompatImpl implements ViewPropertyAnimatorCompatImpl {
        BaseViewPropertyAnimatorCompatImpl() {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void setDuration(View view, long value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void alpha(View view, float value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void translationX(View view, float value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void translationY(View view, float value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void withEndAction(View view, Runnable runnable) {
            runnable.run();
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public long getDuration(View view) {
            return 0L;
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void setInterpolator(View view, Interpolator value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public Interpolator getInterpolator(View view) {
            return null;
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void setStartDelay(View view, long value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public long getStartDelay(View view) {
            return 0L;
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void alphaBy(View view, float value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void rotation(View view, float value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void rotationBy(View view, float value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void rotationX(View view, float value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void rotationXBy(View view, float value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void rotationY(View view, float value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void rotationYBy(View view, float value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void scaleX(View view, float value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void scaleXBy(View view, float value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void scaleY(View view, float value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void scaleYBy(View view, float value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void cancel(View view) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void x(View view, float value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void xBy(View view, float value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void y(View view, float value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void yBy(View view, float value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void translationXBy(View view, float value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void translationYBy(View view, float value) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void start(View view) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void withLayer(View view) {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void withStartAction(View view, Runnable runnable) {
            runnable.run();
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void setListener(View view, ViewPropertyAnimatorListener listener) {
        }
    }

    /* loaded from: com.android.support.support-v4.20.0.0.jar:android/support/v4/view/ViewPropertyAnimatorCompat$ICSViewPropertyAnimatorCompatImpl.class */
    static class ICSViewPropertyAnimatorCompatImpl extends BaseViewPropertyAnimatorCompatImpl {
        ICSViewPropertyAnimatorCompatImpl() {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void setDuration(View view, long value) {
            ViewPropertyAnimatorCompatICS.setDuration(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void alpha(View view, float value) {
            ViewPropertyAnimatorCompatICS.alpha(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void translationX(View view, float value) {
            ViewPropertyAnimatorCompatICS.translationX(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void translationY(View view, float value) {
            ViewPropertyAnimatorCompatICS.translationY(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public long getDuration(View view) {
            return ViewPropertyAnimatorCompatICS.getDuration(view);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void setInterpolator(View view, Interpolator value) {
            ViewPropertyAnimatorCompatICS.setInterpolator(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void setStartDelay(View view, long value) {
            ViewPropertyAnimatorCompatICS.setStartDelay(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public long getStartDelay(View view) {
            return ViewPropertyAnimatorCompatICS.getStartDelay(view);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void alphaBy(View view, float value) {
            ViewPropertyAnimatorCompatICS.alphaBy(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void rotation(View view, float value) {
            ViewPropertyAnimatorCompatICS.rotation(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void rotationBy(View view, float value) {
            ViewPropertyAnimatorCompatICS.rotationBy(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void rotationX(View view, float value) {
            ViewPropertyAnimatorCompatICS.rotationX(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void rotationXBy(View view, float value) {
            ViewPropertyAnimatorCompatICS.rotationXBy(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void rotationY(View view, float value) {
            ViewPropertyAnimatorCompatICS.rotationY(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void rotationYBy(View view, float value) {
            ViewPropertyAnimatorCompatICS.rotationYBy(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void scaleX(View view, float value) {
            ViewPropertyAnimatorCompatICS.scaleX(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void scaleXBy(View view, float value) {
            ViewPropertyAnimatorCompatICS.scaleXBy(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void scaleY(View view, float value) {
            ViewPropertyAnimatorCompatICS.scaleY(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void scaleYBy(View view, float value) {
            ViewPropertyAnimatorCompatICS.scaleYBy(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void cancel(View view) {
            ViewPropertyAnimatorCompatICS.cancel(view);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void x(View view, float value) {
            ViewPropertyAnimatorCompatICS.x(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void xBy(View view, float value) {
            ViewPropertyAnimatorCompatICS.xBy(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void y(View view, float value) {
            ViewPropertyAnimatorCompatICS.y(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void yBy(View view, float value) {
            ViewPropertyAnimatorCompatICS.yBy(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void translationXBy(View view, float value) {
            ViewPropertyAnimatorCompatICS.translationXBy(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void translationYBy(View view, float value) {
            ViewPropertyAnimatorCompatICS.translationYBy(view, value);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void start(View view) {
            ViewPropertyAnimatorCompatICS.start(view);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void setListener(View view, ViewPropertyAnimatorListener listener) {
            ViewPropertyAnimatorCompatICS.setListener(view, listener);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void withEndAction(View view, final Runnable runnable) {
            setListener(view, new ViewPropertyAnimatorListener() { // from class: android.support.v4.view.ViewPropertyAnimatorCompat.ICSViewPropertyAnimatorCompatImpl.1
                public void onAnimationStart(View view2) {
                }

                public void onAnimationEnd(View view2) {
                    runnable.run();
                    ICSViewPropertyAnimatorCompatImpl.this.setListener(view2, null);
                }

                public void onAnimationCancel(View view2) {
                }
            });
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void withStartAction(View view, final Runnable runnable) {
            setListener(view, new ViewPropertyAnimatorListener() { // from class: android.support.v4.view.ViewPropertyAnimatorCompat.ICSViewPropertyAnimatorCompatImpl.2
                public void onAnimationStart(View view2) {
                    runnable.run();
                    ICSViewPropertyAnimatorCompatImpl.this.setListener(view2, null);
                }

                public void onAnimationEnd(View view2) {
                }

                public void onAnimationCancel(View view2) {
                }
            });
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void withLayer(View view) {
            final int currentLayerType = ViewCompat.getLayerType(view);
            setListener(view, new ViewPropertyAnimatorListener() { // from class: android.support.v4.view.ViewPropertyAnimatorCompat.ICSViewPropertyAnimatorCompatImpl.3
                public void onAnimationStart(View view2) {
                    ViewCompat.setLayerType(view2, 2, null);
                }

                public void onAnimationEnd(View view2) {
                    ViewCompat.setLayerType(view2, currentLayerType, null);
                    ICSViewPropertyAnimatorCompatImpl.this.setListener(view2, null);
                }

                public void onAnimationCancel(View view2) {
                }
            });
        }
    }

    /* loaded from: com.android.support.support-v4.20.0.0.jar:android/support/v4/view/ViewPropertyAnimatorCompat$JBViewPropertyAnimatorCompatImpl.class */
    static class JBViewPropertyAnimatorCompatImpl extends ICSViewPropertyAnimatorCompatImpl {
        JBViewPropertyAnimatorCompatImpl() {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ICSViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void withStartAction(View view, Runnable runnable) {
            ViewPropertyAnimatorCompatJB.withStartAction(view, runnable);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ICSViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void withEndAction(View view, Runnable runnable) {
            ViewPropertyAnimatorCompatJB.withEndAction(view, runnable);
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.ICSViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public void withLayer(View view) {
            ViewPropertyAnimatorCompatJB.withLayer(view);
        }
    }

    /* loaded from: com.android.support.support-v4.20.0.0.jar:android/support/v4/view/ViewPropertyAnimatorCompat$JBMr2ViewPropertyAnimatorCompatImpl.class */
    static class JBMr2ViewPropertyAnimatorCompatImpl extends JBViewPropertyAnimatorCompatImpl {
        JBMr2ViewPropertyAnimatorCompatImpl() {
        }

        @Override // android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl, android.support.v4.view.ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
        public Interpolator getInterpolator(View view) {
            return ViewPropertyAnimatorCompatJellybeanMr2.getInterpolator(view);
        }
    }

    static {
        int version = Build.VERSION.SDK_INT;
        if (version >= 18) {
            IMPL = new JBMr2ViewPropertyAnimatorCompatImpl();
            return;
        }
        if (version >= 16) {
            IMPL = new JBViewPropertyAnimatorCompatImpl();
        } else if (version >= 14) {
            IMPL = new ICSViewPropertyAnimatorCompatImpl();
        } else {
            IMPL = new BaseViewPropertyAnimatorCompatImpl();
        }
    }

    public ViewPropertyAnimatorCompat setDuration(long value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.setDuration(view, value);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat alpha(float value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.alpha(view, value);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat alphaBy(float value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.alphaBy(view, value);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat translationX(float value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.translationX(view, value);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat translationY(float value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.translationY(view, value);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat withEndAction(Runnable runnable) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.withEndAction(view, runnable);
        }
        return this;
    }

    public long getDuration() {
        View view = this.mView.get();
        if (view != null) {
            return IMPL.getDuration(view);
        }
        return 0L;
    }

    public ViewPropertyAnimatorCompat setInterpolator(Interpolator value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.setInterpolator(view, value);
        }
        return this;
    }

    public Interpolator getInterpolator() {
        View view = this.mView.get();
        if (view != null) {
            return IMPL.getInterpolator(view);
        }
        return null;
    }

    public ViewPropertyAnimatorCompat setStartDelay(long value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.setStartDelay(view, value);
        }
        return this;
    }

    public long getStartDelay() {
        View view = this.mView.get();
        if (view != null) {
            return IMPL.getStartDelay(view);
        }
        return 0L;
    }

    public ViewPropertyAnimatorCompat rotation(float value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.rotation(view, value);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat rotationBy(float value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.rotationBy(view, value);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat rotationX(float value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.rotationX(view, value);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat rotationXBy(float value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.rotationXBy(view, value);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat rotationY(float value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.rotationY(view, value);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat rotationYBy(float value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.rotationYBy(view, value);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat scaleX(float value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.scaleX(view, value);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat scaleXBy(float value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.scaleXBy(view, value);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat scaleY(float value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.scaleY(view, value);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat scaleYBy(float value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.scaleYBy(view, value);
        }
        return this;
    }

    public void cancel() {
        View view = this.mView.get();
        if (view != null) {
            IMPL.cancel(view);
        }
    }

    public ViewPropertyAnimatorCompat x(float value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.x(view, value);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat xBy(float value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.xBy(view, value);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat y(float value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.y(view, value);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat yBy(float value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.yBy(view, value);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat translationXBy(float value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.translationXBy(view, value);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat translationYBy(float value) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.translationYBy(view, value);
        }
        return this;
    }

    public void start() {
        View view = this.mView.get();
        if (view != null) {
            IMPL.start(view);
        }
    }

    public ViewPropertyAnimatorCompat withLayer() {
        View view = this.mView.get();
        if (view != null) {
            IMPL.withLayer(view);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat withStartAction(Runnable runnable) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.withStartAction(view, runnable);
        }
        return this;
    }

    public ViewPropertyAnimatorCompat setListener(ViewPropertyAnimatorListener listener) {
        View view = this.mView.get();
        if (view != null) {
            IMPL.setListener(view, listener);
        }
        return this;
    }
}
