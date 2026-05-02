package android.support.design.widget;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.view.View;

/* loaded from: com.android.support.design.22.2.1.jar:android/support/design/widget/FloatingActionButtonHoneycombMr1.class */
class FloatingActionButtonHoneycombMr1 extends FloatingActionButtonEclairMr1 {
    private boolean mIsHiding;

    FloatingActionButtonHoneycombMr1(View view, ShadowViewDelegate shadowViewDelegate) {
        super(view, shadowViewDelegate);
    }

    @Override // android.support.design.widget.FloatingActionButtonEclairMr1, android.support.design.widget.FloatingActionButtonImpl
    void hide() {
        if (this.mIsHiding) {
            return;
        }
        this.mView.animate().scaleX(0.0f).scaleY(0.0f).alpha(0.0f).setDuration(200L).setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR).setListener(new AnimatorListenerAdapter() { // from class: android.support.design.widget.FloatingActionButtonHoneycombMr1.1
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator animation) {
                FloatingActionButtonHoneycombMr1.this.mIsHiding = true;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animation) {
                FloatingActionButtonHoneycombMr1.this.mIsHiding = false;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                FloatingActionButtonHoneycombMr1.this.mIsHiding = false;
                FloatingActionButtonHoneycombMr1.this.mView.setVisibility(8);
            }
        });
    }

    @Override // android.support.design.widget.FloatingActionButtonEclairMr1, android.support.design.widget.FloatingActionButtonImpl
    void show() {
        this.mView.animate().scaleX(1.0f).scaleY(1.0f).alpha(1.0f).setDuration(200L).setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR).setListener(null);
    }
}
