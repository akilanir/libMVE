package android.support.v7.widget;

import android.R;
import android.support.v4.content.ContextCompat;
import android.util.AttributeSet;
import android.widget.ImageView;

/* loaded from: com.android.support.appcompat-v7.23.1.1.jar:android/support/v7/widget/AppCompatImageHelper.class */
class AppCompatImageHelper {
    private static final int[] VIEW_ATTRS = {R.attr.src};
    private final ImageView mView;
    private final TintManager mTintManager;

    AppCompatImageHelper(ImageView view, TintManager tintManager) {
        this.mView = view;
        this.mTintManager = tintManager;
    }

    void loadFromAttributes(AttributeSet attrs, int defStyleAttr) {
        TintTypedArray a = TintTypedArray.obtainStyledAttributes(this.mView.getContext(), attrs, VIEW_ATTRS, defStyleAttr, 0);
        try {
            if (a.hasValue(0)) {
                this.mView.setImageDrawable(a.getDrawable(0));
            }
        } finally {
            a.recycle();
        }
    }

    void setImageResource(int resId) {
        if (resId != 0) {
            this.mView.setImageDrawable(this.mTintManager != null ? this.mTintManager.getDrawable(resId) : ContextCompat.getDrawable(this.mView.getContext(), resId));
        } else {
            this.mView.setImageDrawable(null);
        }
    }
}
