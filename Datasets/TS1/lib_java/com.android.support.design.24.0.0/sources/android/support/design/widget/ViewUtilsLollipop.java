package android.support.design.widget;

import android.R;
import android.animation.AnimatorInflater;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewOutlineProvider;

/* loaded from: com.android.support.design.24.0.0.jar:android/support/design/widget/ViewUtilsLollipop.class */
class ViewUtilsLollipop {
    private static final int[] STATE_LIST_ANIM_ATTRS = {R.attr.stateListAnimator};

    ViewUtilsLollipop() {
    }

    static void setBoundsViewOutlineProvider(View view) {
        view.setOutlineProvider(ViewOutlineProvider.BOUNDS);
    }

    static void setStateListAnimatorFromAttrs(View view, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        Context context = view.getContext();
        TypedArray a = context.obtainStyledAttributes(attrs, STATE_LIST_ANIM_ATTRS, defStyleAttr, defStyleRes);
        try {
            if (a.hasValue(0)) {
                android.animation.StateListAnimator sla = AnimatorInflater.loadStateListAnimator(context, a.getResourceId(0, 0));
                view.setStateListAnimator(sla);
            }
        } finally {
            a.recycle();
        }
    }

    static void setDefaultAppBarLayoutStateListAnimator(View view, float targetElevation) {
        android.animation.StateListAnimator sla = new android.animation.StateListAnimator();
        sla.addState(new int[]{R.attr.enabled, android.support.design.R.attr.state_collapsible, android.support.design.R.attr.state_collapsed}, ObjectAnimator.ofFloat(view, "elevation", targetElevation));
        sla.addState(new int[]{R.attr.enabled, android.support.design.R.attr.state_collapsible, -android.support.design.R.attr.state_collapsed}, ObjectAnimator.ofFloat(view, "elevation", 0.0f));
        sla.addState(new int[]{R.attr.enabled, -android.support.design.R.attr.state_collapsible}, ObjectAnimator.ofFloat(view, "elevation", targetElevation));
        sla.addState(new int[0], ObjectAnimator.ofFloat(view, "elevation", 0.0f));
        view.setStateListAnimator(sla);
    }
}
