package com.shamanland.fab;

import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;

/* loaded from: com.shamanland.fab.0.0.5.jar:com/shamanland/fab/ShowHideOnScroll.class */
public class ShowHideOnScroll extends ScrollDetector implements Animation.AnimationListener {
    private final View mView;
    private final int mShow;
    private final int mHide;

    public ShowHideOnScroll(View view) {
        this(view, R.anim.floating_action_button_show, R.anim.floating_action_button_hide);
    }

    public ShowHideOnScroll(View view, int animShow, int animHide) {
        super(view.getContext());
        this.mView = view;
        this.mShow = animShow;
        this.mHide = animHide;
    }

    @Override // com.shamanland.fab.ScrollDetector
    public void onScrollDown() {
        if (this.mView.getVisibility() != 0) {
            this.mView.setVisibility(0);
            animate(this.mShow);
        }
    }

    @Override // com.shamanland.fab.ScrollDetector
    public void onScrollUp() {
        if (this.mView.getVisibility() == 0) {
            this.mView.setVisibility(8);
            animate(this.mHide);
        }
    }

    private void animate(int anim) {
        if (anim != 0) {
            Animation a = AnimationUtils.loadAnimation(this.mView.getContext(), anim);
            a.setAnimationListener(this);
            this.mView.startAnimation(a);
            setIgnore(true);
        }
    }

    @Override // android.view.animation.Animation.AnimationListener
    public void onAnimationStart(Animation animation) {
    }

    @Override // android.view.animation.Animation.AnimationListener
    public void onAnimationEnd(Animation animation) {
        setIgnore(false);
    }

    @Override // android.view.animation.Animation.AnimationListener
    public void onAnimationRepeat(Animation animation) {
    }
}
