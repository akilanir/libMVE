package com.nirhart.parallaxscroll.views;

import android.annotation.SuppressLint;
import android.os.Build;
import android.view.View;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

/* loaded from: com.github.nirhart.parallaxscroll.1.0.jar:com/nirhart/parallaxscroll/views/ParallaxedView.class */
public abstract class ParallaxedView {
    public static boolean isAPI11;
    protected WeakReference<View> view;
    protected int lastOffset = 0;
    protected List<Animation> animations = new ArrayList();

    protected abstract void translatePreICS(View view, float f);

    static {
        isAPI11 = Build.VERSION.SDK_INT >= 11;
    }

    public ParallaxedView(View view) {
        this.view = new WeakReference<>(view);
    }

    public boolean is(View v) {
        return (v == null || this.view == null || this.view.get() == null || !this.view.get().equals(v)) ? false : true;
    }

    @SuppressLint({"NewApi"})
    public void setOffset(float offset) {
        View view = this.view.get();
        if (view != null) {
            if (isAPI11) {
                view.setTranslationY(offset);
            } else {
                translatePreICS(view, offset);
            }
        }
    }

    public void setAlpha(float alpha) {
        View view = this.view.get();
        if (view != null) {
            if (isAPI11) {
                view.setAlpha(alpha);
            } else {
                alphaPreICS(view, alpha);
            }
        }
    }

    protected synchronized void addAnimation(Animation animation) {
        this.animations.add(animation);
    }

    protected void alphaPreICS(View view, float alpha) {
        addAnimation(new AlphaAnimation(alpha, alpha));
    }

    protected synchronized void animateNow() {
        View view = this.view.get();
        if (view != null) {
            AnimationSet set = new AnimationSet(true);
            for (Animation animation : this.animations) {
                if (animation != null) {
                    set.addAnimation(animation);
                }
            }
            set.setDuration(0L);
            set.setFillAfter(true);
            view.setAnimation(set);
            set.start();
            this.animations.clear();
        }
    }

    public void setView(View view) {
        this.view = new WeakReference<>(view);
    }
}
