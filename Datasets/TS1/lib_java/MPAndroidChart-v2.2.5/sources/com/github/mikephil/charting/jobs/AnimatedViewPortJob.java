package com.github.mikephil.charting.jobs;

import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.annotation.SuppressLint;
import android.view.View;
import com.github.mikephil.charting.utils.Transformer;
import com.github.mikephil.charting.utils.ViewPortHandler;

@SuppressLint({"NewApi"})
/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/jobs/AnimatedViewPortJob.class */
public abstract class AnimatedViewPortJob extends ViewPortJob implements ValueAnimator.AnimatorUpdateListener {
    protected ObjectAnimator animator;
    protected float phase;
    protected float xOrigin;
    protected float yOrigin;

    public AnimatedViewPortJob(ViewPortHandler viewPortHandler, float xValue, float yValue, Transformer trans, View v, float xOrigin, float yOrigin, long duration) {
        super(viewPortHandler, xValue, yValue, trans, v);
        this.xOrigin = xOrigin;
        this.yOrigin = yOrigin;
        this.animator = ObjectAnimator.ofFloat(this, "phase", 0.0f, 1.0f);
        this.animator.setDuration(duration);
        this.animator.addUpdateListener(this);
    }

    @Override // java.lang.Runnable
    @SuppressLint({"NewApi"})
    public void run() {
        this.animator.start();
    }

    public float getPhase() {
        return this.phase;
    }

    public void setPhase(float phase) {
        this.phase = phase;
    }

    public float getXOrigin() {
        return this.xOrigin;
    }

    public float getYOrigin() {
        return this.yOrigin;
    }
}
