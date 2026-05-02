package android.support.v7.widget;

import android.graphics.drawable.Drawable;
import android.support.v4.content.ContextCompat;
import android.support.v7.appcompat.R;
import android.util.AttributeSet;
import android.widget.ImageView;

/* loaded from: com.android.support.appcompat-v7.23.2.1.jar:android/support/v7/widget/AppCompatImageHelper.class */
public class AppCompatImageHelper {
    private final ImageView mView;
    private final AppCompatDrawableManager mDrawableManager;

    public AppCompatImageHelper(ImageView view, AppCompatDrawableManager drawableManager) {
        this.mView = view;
        this.mDrawableManager = drawableManager;
    }

    public void loadFromAttributes(AttributeSet attrs, int defStyleAttr) {
        Drawable d;
        TintTypedArray a = TintTypedArray.obtainStyledAttributes(this.mView.getContext(), attrs, R.styleable.AppCompatImageView, defStyleAttr, 0);
        try {
            Drawable d2 = a.getDrawableIfKnown(R.styleable.AppCompatImageView_android_src);
            if (d2 != null) {
                this.mView.setImageDrawable(d2);
            }
            int id = a.getResourceId(R.styleable.AppCompatImageView_srcCompat, -1);
            if (id != -1 && (d = this.mDrawableManager.getDrawable(this.mView.getContext(), id)) != null) {
                this.mView.setImageDrawable(d);
            }
            Drawable drawable = this.mView.getDrawable();
            if (drawable != null) {
                DrawableUtils.fixDrawable(drawable);
            }
        } finally {
            a.recycle();
        }
    }

    public void setImageResource(int resId) {
        if (resId != 0) {
            Drawable d = this.mDrawableManager != null ? this.mDrawableManager.getDrawable(this.mView.getContext(), resId) : ContextCompat.getDrawable(this.mView.getContext(), resId);
            if (d != null) {
                DrawableUtils.fixDrawable(d);
            }
            this.mView.setImageDrawable(d);
            return;
        }
        this.mView.setImageDrawable(null);
    }
}
