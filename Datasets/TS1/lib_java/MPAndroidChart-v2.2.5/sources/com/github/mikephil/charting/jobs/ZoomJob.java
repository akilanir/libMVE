package com.github.mikephil.charting.jobs;

import android.graphics.Matrix;
import android.view.View;
import com.github.mikephil.charting.charts.BarLineChartBase;
import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.utils.Transformer;
import com.github.mikephil.charting.utils.ViewPortHandler;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/jobs/ZoomJob.class */
public class ZoomJob extends ViewPortJob {
    protected float scaleX;
    protected float scaleY;
    protected YAxis.AxisDependency axisDependency;

    public ZoomJob(ViewPortHandler viewPortHandler, float scaleX, float scaleY, float xValue, float yValue, Transformer trans, YAxis.AxisDependency axis, View v) {
        super(viewPortHandler, xValue, yValue, trans, v);
        this.scaleX = scaleX;
        this.scaleY = scaleY;
        this.axisDependency = axis;
    }

    @Override // java.lang.Runnable
    public void run() {
        Matrix save = this.mViewPortHandler.zoom(this.scaleX, this.scaleY);
        this.mViewPortHandler.refresh(save, this.view, false);
        float valsInView = ((BarLineChartBase) this.view).getDeltaY(this.axisDependency) / this.mViewPortHandler.getScaleY();
        float xsInView = ((BarLineChartBase) this.view).getXAxis().getValues().size() / this.mViewPortHandler.getScaleX();
        this.pts[0] = this.xValue - (xsInView / 2.0f);
        this.pts[1] = this.yValue + (valsInView / 2.0f);
        this.mTrans.pointValuesToPixel(this.pts);
        Matrix save2 = this.mViewPortHandler.translate(this.pts);
        this.mViewPortHandler.refresh(save2, this.view, false);
        ((BarLineChartBase) this.view).calculateOffsets();
        this.view.postInvalidate();
    }
}
