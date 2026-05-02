package android.support.v7.widget;

import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.support.v4.content.ContextCompat;
import android.support.v7.appcompat.R;
import android.util.AttributeSet;
import android.widget.ImageView;

/* loaded from: com.android.support.appcompat-v7.24.0.0-beta1.jar:android/support/v7/widget/AppCompatImageHelper.class */
public class AppCompatImageHelper {
    private final ImageView mView;
    private final AppCompatDrawableManager mDrawableManager;

    public AppCompatImageHelper(ImageView view, AppCompatDrawableManager drawableManager) {
        this.mView = view;
        this.mDrawableManager = drawableManager;
    }

    public void loadFromAttributes(AttributeSet attrs, int defStyleAttr) {
        TintTypedArray a = null;
        try {
            Drawable drawable = this.mView.getDrawable();
            if (drawable == null) {
                a = TintTypedArray.obtainStyledAttributes(this.mView.getContext(), attrs, R.styleable.AppCompatImageView, defStyleAttr, 0);
                int id = a.getResourceId(R.styleable.AppCompatImageView_srcCompat, -1);
                if (id != -1) {
                    drawable = this.mDrawableManager.getDrawable(this.mView.getContext(), id);
                    if (drawable != null) {
                        this.mView.setImageDrawable(drawable);
                    }
                }
            }
            if (drawable != null) {
                DrawableUtils.fixDrawable(drawable);
            }
        } finally {
            if (a != null) {
                a.recycle();
            }
        }
    }

    public void setImageResource(int resId) {
        Drawable drawable;
        if (resId != 0) {
            if (this.mDrawableManager != null) {
                drawable = this.mDrawableManager.getDrawable(this.mView.getContext(), resId);
            } else {
                drawable = ContextCompat.getDrawable(this.mView.getContext(), resId);
            }
            Drawable d = drawable;
            if (d != null) {
                DrawableUtils.fixDrawable(d);
            }
            this.mView.setImageDrawable(d);
            return;
        }
        this.mView.setImageDrawable(null);
    }

    boolean hasOverlappingRendering() {
        Drawable background = this.mView.getBackground();
        if (Build.VERSION.SDK_INT >= 21 && (background instanceof RippleDrawable)) {
            return false;
        }
        return true;
    }
}
