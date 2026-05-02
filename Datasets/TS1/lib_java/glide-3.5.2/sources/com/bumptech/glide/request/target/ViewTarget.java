package com.bumptech.glide.request.target;

import android.annotation.TargetApi;
import android.graphics.Point;
import android.os.Build;
import android.util.Log;
import android.view.Display;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.WindowManager;
import com.bumptech.glide.request.Request;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/request/target/ViewTarget.class */
public abstract class ViewTarget<T extends View, Z> extends BaseTarget<Z> {
    private static final String TAG = "ViewTarget";
    protected final T view;
    private final SizeDeterminer sizeDeterminer;

    public ViewTarget(T view) {
        if (view == null) {
            throw new NullPointerException("View must not be null!");
        }
        this.view = view;
        this.sizeDeterminer = new SizeDeterminer(view);
    }

    public T getView() {
        return this.view;
    }

    @Override // com.bumptech.glide.request.target.Target
    public void getSize(SizeReadyCallback cb) {
        this.sizeDeterminer.getSize(cb);
    }

    @Override // com.bumptech.glide.request.target.BaseTarget, com.bumptech.glide.request.target.Target
    public void setRequest(Request request) {
        this.view.setTag(request);
    }

    @Override // com.bumptech.glide.request.target.BaseTarget, com.bumptech.glide.request.target.Target
    public Request getRequest() {
        Object tag = this.view.getTag();
        Request request = null;
        if (tag != null) {
            if (tag instanceof Request) {
                request = (Request) tag;
            } else {
                throw new IllegalArgumentException("You must not call setTag() on a view Glide is targeting");
            }
        }
        return request;
    }

    public String toString() {
        return "Target for: " + this.view;
    }

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/request/target/ViewTarget$SizeDeterminer.class */
    private static class SizeDeterminer {
        private static final int PENDING_SIZE = 0;
        private final View view;
        private final List<SizeReadyCallback> cbs = new ArrayList();
        private SizeDeterminerLayoutListener layoutListener;
        private Point displayDimens;

        public SizeDeterminer(View view) {
            this.view = view;
        }

        private void notifyCbs(int width, int height) {
            for (SizeReadyCallback cb : this.cbs) {
                cb.onSizeReady(width, height);
            }
            this.cbs.clear();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void checkCurrentDimens() {
            if (this.cbs.isEmpty()) {
                return;
            }
            int currentWidth = getViewWidthOrParam();
            int currentHeight = getViewHeightOrParam();
            if (!isSizeValid(currentWidth) || !isSizeValid(currentHeight)) {
                return;
            }
            notifyCbs(currentWidth, currentHeight);
            ViewTreeObserver observer = this.view.getViewTreeObserver();
            if (observer.isAlive()) {
                observer.removeOnPreDrawListener(this.layoutListener);
            }
            this.layoutListener = null;
        }

        public void getSize(SizeReadyCallback cb) {
            int currentWidth = getViewWidthOrParam();
            int currentHeight = getViewHeightOrParam();
            if (isSizeValid(currentWidth) && isSizeValid(currentHeight)) {
                cb.onSizeReady(currentWidth, currentHeight);
                return;
            }
            if (!this.cbs.contains(cb)) {
                this.cbs.add(cb);
            }
            if (this.layoutListener == null) {
                ViewTreeObserver observer = this.view.getViewTreeObserver();
                this.layoutListener = new SizeDeterminerLayoutListener(this);
                observer.addOnPreDrawListener(this.layoutListener);
            }
        }

        private int getViewHeightOrParam() {
            ViewGroup.LayoutParams layoutParams = this.view.getLayoutParams();
            if (isSizeValid(this.view.getHeight())) {
                return this.view.getHeight();
            }
            if (layoutParams != null) {
                return getSizeForParam(layoutParams.height, true);
            }
            return 0;
        }

        private int getViewWidthOrParam() {
            ViewGroup.LayoutParams layoutParams = this.view.getLayoutParams();
            if (isSizeValid(this.view.getWidth())) {
                return this.view.getWidth();
            }
            if (layoutParams != null) {
                return getSizeForParam(layoutParams.width, false);
            }
            return 0;
        }

        private int getSizeForParam(int param, boolean isHeight) {
            if (param == -2) {
                Point displayDimens = getDisplayDimens();
                return isHeight ? displayDimens.y : displayDimens.x;
            }
            return param;
        }

        @TargetApi(13)
        private Point getDisplayDimens() {
            if (this.displayDimens != null) {
                return this.displayDimens;
            }
            WindowManager windowManager = (WindowManager) this.view.getContext().getSystemService("window");
            Display display = windowManager.getDefaultDisplay();
            if (Build.VERSION.SDK_INT >= 13) {
                this.displayDimens = new Point();
                display.getSize(this.displayDimens);
            } else {
                this.displayDimens = new Point(display.getWidth(), display.getHeight());
            }
            return this.displayDimens;
        }

        private boolean isSizeValid(int size) {
            return size > 0 || size == -2;
        }

        /* loaded from: glide-3.5.2.jar:com/bumptech/glide/request/target/ViewTarget$SizeDeterminer$SizeDeterminerLayoutListener.class */
        private static class SizeDeterminerLayoutListener implements ViewTreeObserver.OnPreDrawListener {
            private final WeakReference<SizeDeterminer> sizeDeterminerRef;

            public SizeDeterminerLayoutListener(SizeDeterminer sizeDeterminer) {
                this.sizeDeterminerRef = new WeakReference<>(sizeDeterminer);
            }

            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                if (Log.isLoggable(ViewTarget.TAG, 2)) {
                    Log.v(ViewTarget.TAG, "OnGlobalLayoutListener called listener=" + this);
                }
                SizeDeterminer sizeDeterminer = this.sizeDeterminerRef.get();
                if (sizeDeterminer != null) {
                    sizeDeterminer.checkCurrentDimens();
                    return true;
                }
                return true;
            }
        }
    }
}
