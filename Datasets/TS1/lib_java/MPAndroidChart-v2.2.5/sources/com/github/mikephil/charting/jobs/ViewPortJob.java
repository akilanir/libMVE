package com.github.mikephil.charting.jobs;

import android.view.View;
import com.github.mikephil.charting.utils.Transformer;
import com.github.mikephil.charting.utils.ViewPortHandler;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/jobs/ViewPortJob.class */
public abstract class ViewPortJob implements Runnable {
    protected float[] pts = new float[2];
    protected ViewPortHandler mViewPortHandler;
    protected float xValue;
    protected float yValue;
    protected Transformer mTrans;
    protected View view;

    public ViewPortJob(ViewPortHandler viewPortHandler, float xValue, float yValue, Transformer trans, View v) {
        this.xValue = 0.0f;
        this.yValue = 0.0f;
        this.mViewPortHandler = viewPortHandler;
        this.xValue = xValue;
        this.yValue = yValue;
        this.mTrans = trans;
        this.view = v;
    }

    public float getXValue() {
        return this.xValue;
    }

    public float getYValue() {
        return this.yValue;
    }
}
