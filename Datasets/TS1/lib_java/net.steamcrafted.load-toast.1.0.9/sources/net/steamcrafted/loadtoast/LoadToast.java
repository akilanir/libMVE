package net.steamcrafted.loadtoast;

import android.R;
import android.app.Activity;
import android.content.Context;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import com.nineoldandroids.view.ViewHelper;
import com.nineoldandroids.view.ViewPropertyAnimator;

/* loaded from: net.steamcrafted.load-toast.1.0.9.jar:net/steamcrafted/loadtoast/LoadToast.class */
public class LoadToast {
    private LoadToastView mView;
    private ViewGroup mParentView;
    private String mText = BuildConfig.FLAVOR;
    private int mTranslationY = 0;
    private boolean mShowCalled = false;
    private boolean mToastCanceled = false;
    private boolean mInflated = false;
    private boolean mVisible = false;

    public LoadToast(Context context) {
        this.mView = new LoadToastView(context);
        this.mParentView = (ViewGroup) ((Activity) context).getWindow().getDecorView().findViewById(R.id.content);
        this.mParentView.addView(this.mView, new ViewGroup.LayoutParams(-2, -2));
        ViewHelper.setAlpha(this.mView, 0.0f);
        this.mParentView.postDelayed(new Runnable() { // from class: net.steamcrafted.loadtoast.LoadToast.1
            @Override // java.lang.Runnable
            public void run() {
                ViewHelper.setTranslationX(LoadToast.this.mView, (LoadToast.this.mParentView.getWidth() - LoadToast.this.mView.getWidth()) / 2);
                ViewHelper.setTranslationY(LoadToast.this.mView, (-LoadToast.this.mView.getHeight()) + LoadToast.this.mTranslationY);
                LoadToast.this.mInflated = true;
                if (LoadToast.this.mToastCanceled || !LoadToast.this.mShowCalled) {
                    return;
                }
                LoadToast.this.show();
            }
        }, 1L);
        this.mParentView.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() { // from class: net.steamcrafted.loadtoast.LoadToast.2
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            public void onGlobalLayout() {
                LoadToast.this.checkZPosition();
            }
        });
    }

    public LoadToast setTranslationY(int pixels) {
        this.mTranslationY = pixels;
        return this;
    }

    public LoadToast setText(String message) {
        this.mText = message;
        this.mView.setText(this.mText);
        return this;
    }

    public LoadToast setTextColor(int color) {
        this.mView.setTextColor(color);
        return this;
    }

    public LoadToast setBackgroundColor(int color) {
        this.mView.setBackgroundColor(color);
        return this;
    }

    public LoadToast setProgressColor(int color) {
        this.mView.setProgressColor(color);
        return this;
    }

    public LoadToast show() {
        if (!this.mInflated) {
            this.mShowCalled = true;
            return this;
        }
        this.mView.show();
        ViewHelper.setTranslationX(this.mView, (this.mParentView.getWidth() - this.mView.getWidth()) / 2);
        ViewHelper.setAlpha(this.mView, 0.0f);
        ViewHelper.setTranslationY(this.mView, (-this.mView.getHeight()) + this.mTranslationY);
        ViewPropertyAnimator.animate(this.mView).alpha(1.0f).translationY(25 + this.mTranslationY).setInterpolator(new DecelerateInterpolator()).setDuration(300L).setStartDelay(0L).start();
        this.mVisible = true;
        checkZPosition();
        return this;
    }

    public void success() {
        if (!this.mInflated) {
            this.mToastCanceled = true;
        } else {
            this.mView.success();
            slideUp();
        }
    }

    public void error() {
        if (!this.mInflated) {
            this.mToastCanceled = true;
        } else {
            this.mView.error();
            slideUp();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void checkZPosition() {
        if (this.mVisible) {
            int pos = this.mParentView.indexOfChild(this.mView);
            int count = this.mParentView.getChildCount();
            if (pos != count - 1) {
                ((ViewGroup) this.mView.getParent()).removeView(this.mView);
                this.mParentView.requestLayout();
                this.mParentView.addView(this.mView, new ViewGroup.LayoutParams(-2, -2));
            }
        }
    }

    private void slideUp() {
        ViewPropertyAnimator.animate(this.mView).setStartDelay(1000L).alpha(0.0f).translationY((-this.mView.getHeight()) + this.mTranslationY).setInterpolator(new AccelerateInterpolator()).setDuration(300L).start();
        this.mVisible = false;
    }
}
