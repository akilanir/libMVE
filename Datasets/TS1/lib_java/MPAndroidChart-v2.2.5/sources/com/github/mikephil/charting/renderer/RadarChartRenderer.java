package com.github.mikephil.charting.renderer;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PointF;
import android.graphics.drawable.Drawable;
import com.github.mikephil.charting.animation.ChartAnimator;
import com.github.mikephil.charting.charts.RadarChart;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.RadarData;
import com.github.mikephil.charting.highlight.Highlight;
import com.github.mikephil.charting.interfaces.datasets.IRadarDataSet;
import com.github.mikephil.charting.utils.ColorTemplate;
import com.github.mikephil.charting.utils.Utils;
import com.github.mikephil.charting.utils.ViewPortHandler;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/renderer/RadarChartRenderer.class */
public class RadarChartRenderer extends LineRadarRenderer {
    protected RadarChart mChart;
    protected Paint mWebPaint;
    protected Paint mHighlightCirclePaint;

    public RadarChartRenderer(RadarChart chart, ChartAnimator animator, ViewPortHandler viewPortHandler) {
        super(animator, viewPortHandler);
        this.mChart = chart;
        this.mHighlightPaint = new Paint(1);
        this.mHighlightPaint.setStyle(Paint.Style.STROKE);
        this.mHighlightPaint.setStrokeWidth(2.0f);
        this.mHighlightPaint.setColor(Color.rgb(255, 187, 115));
        this.mWebPaint = new Paint(1);
        this.mWebPaint.setStyle(Paint.Style.STROKE);
        this.mHighlightCirclePaint = new Paint(1);
    }

    public Paint getWebPaint() {
        return this.mWebPaint;
    }

    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void initBuffers() {
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawData(Canvas c) {
        RadarData radarData = (RadarData) this.mChart.getData();
        int mostEntries = 0;
        for (IRadarDataSet set : radarData.getDataSets()) {
            if (set.getEntryCount() > mostEntries) {
                mostEntries = set.getEntryCount();
            }
        }
        for (IRadarDataSet set2 : radarData.getDataSets()) {
            if (set2.isVisible() && set2.getEntryCount() > 0) {
                drawDataSet(c, set2, mostEntries);
            }
        }
    }

    /* JADX WARN: Type inference failed for: r0v42, types: [com.github.mikephil.charting.data.Entry] */
    protected void drawDataSet(Canvas c, IRadarDataSet dataSet, int mostEntries) {
        float phaseX = this.mAnimator.getPhaseX();
        float phaseY = this.mAnimator.getPhaseY();
        float sliceangle = this.mChart.getSliceAngle();
        float factor = this.mChart.getFactor();
        PointF center = this.mChart.getCenterOffsets();
        Path surface = new Path();
        boolean hasMovedToPoint = false;
        for (int j = 0; j < dataSet.getEntryCount(); j++) {
            this.mRenderPaint.setColor(dataSet.getColor(j));
            PointF p = Utils.getPosition(center, (dataSet.getEntryForIndex(j).getVal() - this.mChart.getYChartMin()) * factor * phaseY, (sliceangle * j * phaseX) + this.mChart.getRotationAngle());
            if (!Float.isNaN(p.x)) {
                if (!hasMovedToPoint) {
                    surface.moveTo(p.x, p.y);
                    hasMovedToPoint = true;
                } else {
                    surface.lineTo(p.x, p.y);
                }
            }
        }
        if (dataSet.getEntryCount() > mostEntries) {
            surface.lineTo(center.x, center.y);
        }
        surface.close();
        if (dataSet.isDrawFilledEnabled()) {
            Drawable drawable = dataSet.getFillDrawable();
            if (drawable != null) {
                drawFilledPath(c, surface, drawable);
            } else {
                drawFilledPath(c, surface, dataSet.getFillColor(), dataSet.getFillAlpha());
            }
        }
        this.mRenderPaint.setStrokeWidth(dataSet.getLineWidth());
        this.mRenderPaint.setStyle(Paint.Style.STROKE);
        if (!dataSet.isDrawFilledEnabled() || dataSet.getFillAlpha() < 255) {
            c.drawPath(surface, this.mRenderPaint);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawValues(Canvas c) {
        float phaseX = this.mAnimator.getPhaseX();
        float phaseY = this.mAnimator.getPhaseY();
        float sliceangle = this.mChart.getSliceAngle();
        float factor = this.mChart.getFactor();
        PointF center = this.mChart.getCenterOffsets();
        float yoffset = Utils.convertDpToPixel(5.0f);
        for (int i = 0; i < ((RadarData) this.mChart.getData()).getDataSetCount(); i++) {
            IRadarDataSet dataSet = ((RadarData) this.mChart.getData()).getDataSetByIndex(i);
            if (dataSet.isDrawValuesEnabled() && dataSet.getEntryCount() != 0) {
                applyValueTextStyle(dataSet);
                for (int j = 0; j < dataSet.getEntryCount(); j++) {
                    Entry entry = dataSet.getEntryForIndex(j);
                    PointF p = Utils.getPosition(center, (entry.getVal() - this.mChart.getYChartMin()) * factor * phaseY, (sliceangle * j * phaseX) + this.mChart.getRotationAngle());
                    drawValue(c, dataSet.getValueFormatter(), entry.getVal(), entry, i, p.x, p.y - yoffset, dataSet.getValueTextColor(j));
                }
            }
        }
    }

    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawExtras(Canvas c) {
        drawWeb(c);
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected void drawWeb(Canvas c) {
        float sliceangle = this.mChart.getSliceAngle();
        float factor = this.mChart.getFactor();
        float rotationangle = this.mChart.getRotationAngle();
        PointF center = this.mChart.getCenterOffsets();
        this.mWebPaint.setStrokeWidth(this.mChart.getWebLineWidth());
        this.mWebPaint.setColor(this.mChart.getWebColor());
        this.mWebPaint.setAlpha(this.mChart.getWebAlpha());
        int xIncrements = 1 + this.mChart.getSkipWebLineCount();
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= ((RadarData) this.mChart.getData()).getXValCount()) {
                break;
            }
            PointF p = Utils.getPosition(center, this.mChart.getYRange() * factor, (sliceangle * i2) + rotationangle);
            c.drawLine(center.x, center.y, p.x, p.y, this.mWebPaint);
            i = i2 + xIncrements;
        }
        this.mWebPaint.setStrokeWidth(this.mChart.getWebLineWidthInner());
        this.mWebPaint.setColor(this.mChart.getWebColorInner());
        this.mWebPaint.setAlpha(this.mChart.getWebAlpha());
        int labelCount = this.mChart.getYAxis().mEntryCount;
        for (int j = 0; j < labelCount; j++) {
            for (int i3 = 0; i3 < ((RadarData) this.mChart.getData()).getXValCount(); i3++) {
                float r = (this.mChart.getYAxis().mEntries[j] - this.mChart.getYChartMin()) * factor;
                PointF p1 = Utils.getPosition(center, r, (sliceangle * i3) + rotationangle);
                PointF p2 = Utils.getPosition(center, r, (sliceangle * (i3 + 1)) + rotationangle);
                c.drawLine(p1.x, p1.y, p2.x, p2.y, this.mWebPaint);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v30, types: [com.github.mikephil.charting.data.Entry] */
    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawHighlighted(Canvas c, Highlight[] indices) {
        int xIndex;
        ?? entryForXIndex;
        float phaseX = this.mAnimator.getPhaseX();
        float phaseY = this.mAnimator.getPhaseY();
        float sliceangle = this.mChart.getSliceAngle();
        float factor = this.mChart.getFactor();
        PointF center = this.mChart.getCenterOffsets();
        for (int i = 0; i < indices.length; i++) {
            IRadarDataSet set = ((RadarData) this.mChart.getData()).getDataSetByIndex(indices[i].getDataSetIndex());
            if (set != null && set.isHighlightEnabled() && (entryForXIndex = set.getEntryForXIndex((xIndex = indices[i].getXIndex()))) != 0 && entryForXIndex.getXIndex() == xIndex) {
                int j = set.getEntryIndex(entryForXIndex);
                float y = entryForXIndex.getVal() - this.mChart.getYChartMin();
                if (!Float.isNaN(y)) {
                    PointF p = Utils.getPosition(center, y * factor * phaseY, (sliceangle * j * phaseX) + this.mChart.getRotationAngle());
                    float[] pts = {p.x, p.y};
                    drawHighlightLines(c, pts, set);
                    if (set.isDrawHighlightCircleEnabled() && !Float.isNaN(pts[0]) && !Float.isNaN(pts[1])) {
                        int strokeColor = set.getHighlightCircleStrokeColor();
                        if (strokeColor == 1122867) {
                            strokeColor = set.getColor(0);
                        }
                        if (set.getHighlightCircleStrokeAlpha() < 255) {
                            strokeColor = ColorTemplate.getColorWithAlphaComponent(strokeColor, set.getHighlightCircleStrokeAlpha());
                        }
                        drawHighlightCircle(c, p, set.getHighlightCircleInnerRadius(), set.getHighlightCircleOuterRadius(), set.getHighlightCircleFillColor(), strokeColor, set.getHighlightCircleStrokeWidth());
                    }
                }
            }
        }
    }

    public void drawHighlightCircle(Canvas c, PointF point, float innerRadius, float outerRadius, int fillColor, int strokeColor, float strokeWidth) {
        c.save();
        float outerRadius2 = Utils.convertDpToPixel(outerRadius);
        float innerRadius2 = Utils.convertDpToPixel(innerRadius);
        if (fillColor != 1122867) {
            Path p = new Path();
            p.addCircle(point.x, point.y, outerRadius2, Path.Direction.CW);
            if (innerRadius2 > 0.0f) {
                p.addCircle(point.x, point.y, innerRadius2, Path.Direction.CCW);
            }
            this.mHighlightCirclePaint.setColor(fillColor);
            this.mHighlightCirclePaint.setStyle(Paint.Style.FILL);
            c.drawPath(p, this.mHighlightCirclePaint);
        }
        if (strokeColor != 1122867) {
            this.mHighlightCirclePaint.setColor(strokeColor);
            this.mHighlightCirclePaint.setStyle(Paint.Style.STROKE);
            this.mHighlightCirclePaint.setStrokeWidth(Utils.convertDpToPixel(strokeWidth));
            c.drawCircle(point.x, point.y, outerRadius2, this.mHighlightCirclePaint);
        }
        c.restore();
    }
}
