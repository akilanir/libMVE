package com.github.mikephil.charting.renderer;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import com.github.mikephil.charting.animation.ChartAnimator;
import com.github.mikephil.charting.buffer.BarBuffer;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.data.BarEntry;
import com.github.mikephil.charting.highlight.Highlight;
import com.github.mikephil.charting.interfaces.dataprovider.BarDataProvider;
import com.github.mikephil.charting.interfaces.datasets.IBarDataSet;
import com.github.mikephil.charting.utils.Transformer;
import com.github.mikephil.charting.utils.Utils;
import com.github.mikephil.charting.utils.ViewPortHandler;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/renderer/BarChartRenderer.class */
public class BarChartRenderer extends DataRenderer {
    protected BarDataProvider mChart;
    protected RectF mBarRect;
    protected BarBuffer[] mBarBuffers;
    protected Paint mShadowPaint;
    protected Paint mBarBorderPaint;

    public BarChartRenderer(BarDataProvider chart, ChartAnimator animator, ViewPortHandler viewPortHandler) {
        super(animator, viewPortHandler);
        this.mBarRect = new RectF();
        this.mChart = chart;
        this.mHighlightPaint = new Paint(1);
        this.mHighlightPaint.setStyle(Paint.Style.FILL);
        this.mHighlightPaint.setColor(Color.rgb(0, 0, 0));
        this.mHighlightPaint.setAlpha(120);
        this.mShadowPaint = new Paint(1);
        this.mShadowPaint.setStyle(Paint.Style.FILL);
        this.mBarBorderPaint = new Paint(1);
        this.mBarBorderPaint.setStyle(Paint.Style.STROKE);
    }

    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void initBuffers() {
        BarData barData = this.mChart.getBarData();
        this.mBarBuffers = new BarBuffer[barData.getDataSetCount()];
        for (int i = 0; i < this.mBarBuffers.length; i++) {
            IBarDataSet set = (IBarDataSet) barData.getDataSetByIndex(i);
            this.mBarBuffers[i] = new BarBuffer(set.getEntryCount() * 4 * (set.isStacked() ? set.getStackSize() : 1), barData.getGroupSpace(), barData.getDataSetCount(), set.isStacked());
        }
    }

    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawData(Canvas c) {
        BarData barData = this.mChart.getBarData();
        for (int i = 0; i < barData.getDataSetCount(); i++) {
            IBarDataSet set = (IBarDataSet) barData.getDataSetByIndex(i);
            if (set.isVisible() && set.getEntryCount() > 0) {
                drawDataSet(c, set, i);
            }
        }
    }

    protected void drawDataSet(Canvas c, IBarDataSet dataSet, int index) {
        Transformer trans = this.mChart.getTransformer(dataSet.getAxisDependency());
        this.mShadowPaint.setColor(dataSet.getBarShadowColor());
        this.mBarBorderPaint.setColor(dataSet.getBarBorderColor());
        this.mBarBorderPaint.setStrokeWidth(Utils.convertDpToPixel(dataSet.getBarBorderWidth()));
        boolean drawBorder = dataSet.getBarBorderWidth() > 0.0f;
        float phaseX = this.mAnimator.getPhaseX();
        float phaseY = this.mAnimator.getPhaseY();
        BarBuffer buffer = this.mBarBuffers[index];
        buffer.setPhases(phaseX, phaseY);
        buffer.setBarSpace(dataSet.getBarSpace());
        buffer.setDataSet(index);
        buffer.setInverted(this.mChart.isInverted(dataSet.getAxisDependency()));
        buffer.feed(dataSet);
        trans.pointValuesToPixel(buffer.buffer);
        if (this.mChart.isDrawBarShadowEnabled()) {
            for (int j = 0; j < buffer.size(); j += 4) {
                if (this.mViewPortHandler.isInBoundsLeft(buffer.buffer[j + 2])) {
                    if (!this.mViewPortHandler.isInBoundsRight(buffer.buffer[j])) {
                        break;
                    } else {
                        c.drawRect(buffer.buffer[j], this.mViewPortHandler.contentTop(), buffer.buffer[j + 2], this.mViewPortHandler.contentBottom(), this.mShadowPaint);
                    }
                }
            }
        }
        if (dataSet.getColors().size() > 1) {
            for (int j2 = 0; j2 < buffer.size(); j2 += 4) {
                if (this.mViewPortHandler.isInBoundsLeft(buffer.buffer[j2 + 2])) {
                    if (this.mViewPortHandler.isInBoundsRight(buffer.buffer[j2])) {
                        this.mRenderPaint.setColor(dataSet.getColor(j2 / 4));
                        c.drawRect(buffer.buffer[j2], buffer.buffer[j2 + 1], buffer.buffer[j2 + 2], buffer.buffer[j2 + 3], this.mRenderPaint);
                        if (drawBorder) {
                            c.drawRect(buffer.buffer[j2], buffer.buffer[j2 + 1], buffer.buffer[j2 + 2], buffer.buffer[j2 + 3], this.mBarBorderPaint);
                        }
                    } else {
                        return;
                    }
                }
            }
            return;
        }
        this.mRenderPaint.setColor(dataSet.getColor());
        for (int j3 = 0; j3 < buffer.size(); j3 += 4) {
            if (this.mViewPortHandler.isInBoundsLeft(buffer.buffer[j3 + 2])) {
                if (this.mViewPortHandler.isInBoundsRight(buffer.buffer[j3])) {
                    c.drawRect(buffer.buffer[j3], buffer.buffer[j3 + 1], buffer.buffer[j3 + 2], buffer.buffer[j3 + 3], this.mRenderPaint);
                    if (drawBorder) {
                        c.drawRect(buffer.buffer[j3], buffer.buffer[j3 + 1], buffer.buffer[j3 + 2], buffer.buffer[j3 + 3], this.mBarBorderPaint);
                    }
                } else {
                    return;
                }
            }
        }
    }

    protected void prepareBarHighlight(float x, float y1, float y2, float barspaceHalf, Transformer trans) {
        float left = (x - 0.5f) + barspaceHalf;
        float right = (x + 0.5f) - barspaceHalf;
        this.mBarRect.set(left, y1, right, y2);
        trans.rectValueToPixel(this.mBarRect, this.mAnimator.getPhaseY());
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawValues(Canvas c) {
        float y;
        if (passesCheck()) {
            List<T> dataSets = this.mChart.getBarData().getDataSets();
            float valueOffsetPlus = Utils.convertDpToPixel(4.5f);
            boolean drawValueAboveBar = this.mChart.isDrawValueAboveBarEnabled();
            for (int i = 0; i < this.mChart.getBarData().getDataSetCount(); i++) {
                IBarDataSet dataSet = (IBarDataSet) dataSets.get(i);
                if (dataSet.isDrawValuesEnabled() && dataSet.getEntryCount() != 0) {
                    applyValueTextStyle(dataSet);
                    boolean isInverted = this.mChart.isInverted(dataSet.getAxisDependency());
                    float valueTextHeight = Utils.calcTextHeight(this.mValuePaint, "8");
                    float posOffset = drawValueAboveBar ? -valueOffsetPlus : valueTextHeight + valueOffsetPlus;
                    float negOffset = drawValueAboveBar ? valueTextHeight + valueOffsetPlus : -valueOffsetPlus;
                    if (isInverted) {
                        posOffset = (-posOffset) - valueTextHeight;
                        negOffset = (-negOffset) - valueTextHeight;
                    }
                    Transformer trans = this.mChart.getTransformer(dataSet.getAxisDependency());
                    float[] valuePoints = getTransformedValues(trans, dataSet, i);
                    if (!dataSet.isStacked()) {
                        for (int j = 0; j < valuePoints.length * this.mAnimator.getPhaseX() && this.mViewPortHandler.isInBoundsRight(valuePoints[j]); j += 2) {
                            if (this.mViewPortHandler.isInBoundsY(valuePoints[j + 1]) && this.mViewPortHandler.isInBoundsLeft(valuePoints[j])) {
                                BarEntry entry = (BarEntry) dataSet.getEntryForIndex(j / 2);
                                float val = entry.getVal();
                                drawValue(c, dataSet.getValueFormatter(), val, entry, i, valuePoints[j], valuePoints[j + 1] + (val >= 0.0f ? posOffset : negOffset), dataSet.getValueTextColor(j / 2));
                            }
                        }
                    } else {
                        for (int j2 = 0; j2 < (valuePoints.length - 1) * this.mAnimator.getPhaseX(); j2 += 2) {
                            BarEntry entry2 = (BarEntry) dataSet.getEntryForIndex(j2 / 2);
                            float[] vals = entry2.getVals();
                            if (vals == null) {
                                if (!this.mViewPortHandler.isInBoundsRight(valuePoints[j2])) {
                                    break;
                                } else if (this.mViewPortHandler.isInBoundsY(valuePoints[j2 + 1]) && this.mViewPortHandler.isInBoundsLeft(valuePoints[j2])) {
                                    drawValue(c, dataSet.getValueFormatter(), entry2.getVal(), entry2, i, valuePoints[j2], valuePoints[j2 + 1] + (entry2.getVal() >= 0.0f ? posOffset : negOffset), dataSet.getValueTextColor(j2 / 2));
                                }
                            } else {
                                int color = dataSet.getValueTextColor(j2 / 2);
                                float[] transformed = new float[vals.length * 2];
                                float posY = 0.0f;
                                float negY = -entry2.getNegativeSum();
                                int k = 0;
                                int idx = 0;
                                while (k < transformed.length) {
                                    float value = vals[idx];
                                    if (value >= 0.0f) {
                                        posY += value;
                                        y = posY;
                                    } else {
                                        y = negY;
                                        negY -= value;
                                    }
                                    transformed[k + 1] = y * this.mAnimator.getPhaseY();
                                    k += 2;
                                    idx++;
                                }
                                trans.pointValuesToPixel(transformed);
                                for (int k2 = 0; k2 < transformed.length; k2 += 2) {
                                    float x = valuePoints[j2];
                                    float y2 = transformed[k2 + 1] + (vals[k2 / 2] >= 0.0f ? posOffset : negOffset);
                                    if (!this.mViewPortHandler.isInBoundsRight(x)) {
                                        break;
                                    }
                                    if (this.mViewPortHandler.isInBoundsY(y2) && this.mViewPortHandler.isInBoundsLeft(x)) {
                                        drawValue(c, dataSet.getValueFormatter(), vals[k2 / 2], entry2, i, x, y2, color);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawHighlighted(Canvas c, Highlight[] indices) {
        BarEntry e;
        float y1;
        float y2;
        BarData barData = this.mChart.getBarData();
        int setCount = barData.getDataSetCount();
        for (Highlight high : indices) {
            int minDataSetIndex = high.getDataSetIndex() == -1 ? 0 : high.getDataSetIndex();
            int maxDataSetIndex = high.getDataSetIndex() == -1 ? barData.getDataSetCount() : high.getDataSetIndex() + 1;
            if (maxDataSetIndex - minDataSetIndex >= 1) {
                for (int dataSetIndex = minDataSetIndex; dataSetIndex < maxDataSetIndex; dataSetIndex++) {
                    IBarDataSet set = (IBarDataSet) barData.getDataSetByIndex(dataSetIndex);
                    if (set != null && set.isHighlightEnabled()) {
                        float barspaceHalf = set.getBarSpace() / 2.0f;
                        Transformer trans = this.mChart.getTransformer(set.getAxisDependency());
                        this.mHighlightPaint.setColor(set.getHighLightColor());
                        this.mHighlightPaint.setAlpha(set.getHighLightAlpha());
                        int index = high.getXIndex();
                        if (index >= 0 && index < (this.mChart.getXChartMax() * this.mAnimator.getPhaseX()) / setCount && (e = (BarEntry) set.getEntryForXIndex(index)) != null && e.getXIndex() == index) {
                            float groupspace = barData.getGroupSpace();
                            boolean isStack = high.getStackIndex() >= 0;
                            float x = (index * setCount) + dataSetIndex + (groupspace / 2.0f) + (groupspace * index);
                            if (isStack) {
                                y1 = high.getRange().from;
                                y2 = high.getRange().to;
                            } else {
                                y1 = e.getVal();
                                y2 = 0.0f;
                            }
                            prepareBarHighlight(x, y1, y2, barspaceHalf, trans);
                            c.drawRect(this.mBarRect, this.mHighlightPaint);
                            if (this.mChart.isDrawHighlightArrowEnabled()) {
                                this.mHighlightPaint.setAlpha(255);
                                float offsetY = this.mAnimator.getPhaseY() * 0.07f;
                                float[] values = new float[9];
                                trans.getPixelToValueMatrix().getValues(values);
                                float xToYRel = Math.abs(values[4] / values[0]);
                                float arrowWidth = set.getBarSpace() / 2.0f;
                                float arrowHeight = arrowWidth * xToYRel;
                                float yArrow = (y1 > (-y2) ? y1 : y1) * this.mAnimator.getPhaseY();
                                Path arrow = new Path();
                                arrow.moveTo(x + 0.4f, yArrow + offsetY);
                                arrow.lineTo(x + 0.4f + arrowWidth, (yArrow + offsetY) - arrowHeight);
                                arrow.lineTo(x + 0.4f + arrowWidth, yArrow + offsetY + arrowHeight);
                                trans.pathValueToPixel(arrow);
                                c.drawPath(arrow, this.mHighlightPaint);
                            }
                        }
                    }
                }
            }
        }
    }

    public float[] getTransformedValues(Transformer trans, IBarDataSet data, int dataSetIndex) {
        return trans.generateTransformedValuesBarChart(data, dataSetIndex, this.mChart.getBarData(), this.mAnimator.getPhaseY());
    }

    protected boolean passesCheck() {
        return ((float) this.mChart.getBarData().getYValCount()) < ((float) this.mChart.getMaxVisibleCount()) * this.mViewPortHandler.getScaleX();
    }

    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawExtras(Canvas c) {
    }
}
