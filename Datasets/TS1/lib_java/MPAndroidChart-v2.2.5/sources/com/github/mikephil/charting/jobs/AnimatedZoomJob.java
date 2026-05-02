package com.github.mikephil.charting.jobs;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.annotation.SuppressLint;
import android.graphics.Matrix;
import android.view.View;
import com.github.mikephil.charting.charts.BarLineChartBase;
import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.utils.Transformer;
import com.github.mikephil.charting.utils.ViewPortHandler;

@SuppressLint({"NewApi"})
/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/jobs/AnimatedZoomJob.class */
public class AnimatedZoomJob extends AnimatedViewPortJob implements Animator.AnimatorListener {
    protected float zoomOriginX;
    protected float zoomOriginY;
    protected float zoomCenterX;
    protected float zoomCenterY;
    protected YAxis yAxis;
    protected float xValCount;

    @SuppressLint({"NewApi"})
    public AnimatedZoomJob(ViewPortHandler viewPortHandler, View v, Transformer trans, YAxis axis, float xValCount, float scaleX, float scaleY, float xOrigin, float yOrigin, float zoomCenterX, float zoomCenterY, float zoomOriginX, float zoomOriginY, long duration) {
        super(viewPortHandler, scaleX, scaleY, trans, v, xOrigin, yOrigin, duration);
        this.zoomCenterX = zoomCenterX;
        this.zoomCenterY = zoomCenterY;
        this.zoomOriginX = zoomOriginX;
        this.zoomOriginY = zoomOriginY;
        this.animator.addListener(this);
        this.yAxis = axis;
        this.xValCount = xValCount;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public void onAnimationUpdate(ValueAnimator animation) {
        float scaleX = this.xOrigin + ((this.xValue - this.xOrigin) * this.phase);
        float scaleY = this.yOrigin + ((this.yValue - this.yOrigin) * this.phase);
        Matrix save = this.mViewPortHandler.setZoom(scaleX, scaleY);
        this.mViewPortHandler.refresh(save, this.view, false);
        float valsInView = this.yAxis.mAxisRange / this.mViewPortHandler.getScaleY();
        float xsInView = this.xValCount / this.mViewPortHandler.getScaleX();
        this.pts[0] = this.zoomOriginX + (((this.zoomCenterX - (xsInView / 2.0f)) - this.zoomOriginX) * this.phase);
        this.pts[1] = this.zoomOriginY + (((this.zoomCenterY + (valsInView / 2.0f)) - this.zoomOriginY) * this.phase);
        this.mTrans.pointValuesToPixel(this.pts);
        Matrix save2 = this.mViewPortHandler.translate(this.pts);
        this.mViewPortHandler.refresh(save2, this.view, true);
    }

    @Override // android.animation.Animator.AnimatorListener
    public void onAnimationEnd(Animator animation) {
        ((BarLineChartBase) this.view).calculateOffsets();
        this.view.postInvalidate();
    }

    @Override // android.animation.Animator.AnimatorListener
    public void onAnimationCancel(Animator animation) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public void onAnimationRepeat(Animator animation) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public void onAnimationStart(Animator animation) {
    }
}
