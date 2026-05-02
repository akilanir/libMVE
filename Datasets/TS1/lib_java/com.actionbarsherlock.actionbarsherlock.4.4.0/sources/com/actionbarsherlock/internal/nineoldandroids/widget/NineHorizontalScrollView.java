package com.actionbarsherlock.internal.nineoldandroids.widget;

import android.content.Context;
import android.widget.HorizontalScrollView;
import com.actionbarsherlock.internal.nineoldandroids.view.animation.AnimatorProxy;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/nineoldandroids/widget/NineHorizontalScrollView.class */
public class NineHorizontalScrollView extends HorizontalScrollView {
    private final AnimatorProxy mProxy;

    public NineHorizontalScrollView(Context context) {
        super(context);
        this.mProxy = AnimatorProxy.NEEDS_PROXY ? AnimatorProxy.wrap(this) : null;
    }

    @Override // android.view.View
    public void setVisibility(int visibility) {
        if (this.mProxy != null) {
            if (visibility == 8) {
                clearAnimation();
            } else if (visibility == 0) {
                setAnimation(this.mProxy);
            }
        }
        super.setVisibility(visibility);
    }

    @Override // android.view.View
    public float getAlpha() {
        if (AnimatorProxy.NEEDS_PROXY) {
            return this.mProxy.getAlpha();
        }
        return super.getAlpha();
    }

    @Override // android.view.View
    public void setAlpha(float alpha) {
        if (AnimatorProxy.NEEDS_PROXY) {
            this.mProxy.setAlpha(alpha);
        } else {
            super.setAlpha(alpha);
        }
    }
}
