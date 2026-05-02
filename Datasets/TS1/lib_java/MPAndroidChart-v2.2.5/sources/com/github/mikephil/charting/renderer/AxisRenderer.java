package com.github.mikephil.charting.renderer;

import android.graphics.Canvas;
import android.graphics.Paint;
import com.github.mikephil.charting.utils.Transformer;
import com.github.mikephil.charting.utils.ViewPortHandler;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/renderer/AxisRenderer.class */
public abstract class AxisRenderer extends Renderer {
    protected Transformer mTrans;
    protected Paint mGridPaint;
    protected Paint mAxisLabelPaint;
    protected Paint mAxisLinePaint;
    protected Paint mLimitLinePaint;

    public abstract void renderAxisLabels(Canvas canvas);

    public abstract void renderGridLines(Canvas canvas);

    public abstract void renderAxisLine(Canvas canvas);

    public abstract void renderLimitLines(Canvas canvas);

    public AxisRenderer(ViewPortHandler viewPortHandler, Transformer trans) {
        super(viewPortHandler);
        this.mTrans = trans;
        this.mAxisLabelPaint = new Paint(1);
        this.mGridPaint = new Paint();
        this.mGridPaint.setColor(-7829368);
        this.mGridPaint.setStrokeWidth(1.0f);
        this.mGridPaint.setStyle(Paint.Style.STROKE);
        this.mGridPaint.setAlpha(90);
        this.mAxisLinePaint = new Paint();
        this.mAxisLinePaint.setColor(-16777216);
        this.mAxisLinePaint.setStrokeWidth(1.0f);
        this.mAxisLinePaint.setStyle(Paint.Style.STROKE);
        this.mLimitLinePaint = new Paint(1);
        this.mLimitLinePaint.setStyle(Paint.Style.STROKE);
    }

    public Paint getPaintAxisLabels() {
        return this.mAxisLabelPaint;
    }

    public Paint getPaintGrid() {
        return this.mGridPaint;
    }

    public Paint getPaintAxisLine() {
        return this.mAxisLinePaint;
    }

    public Transformer getTransformer() {
        return this.mTrans;
    }
}
