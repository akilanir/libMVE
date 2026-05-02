package com.github.mikephil.charting.renderer;

import android.graphics.Canvas;
import android.graphics.Paint;
import com.github.mikephil.charting.animation.ChartAnimator;
import com.github.mikephil.charting.buffer.BarBuffer;
import com.github.mikephil.charting.buffer.HorizontalBarBuffer;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.data.BarEntry;
import com.github.mikephil.charting.formatter.ValueFormatter;
import com.github.mikephil.charting.interfaces.dataprovider.BarDataProvider;
import com.github.mikephil.charting.interfaces.datasets.IBarDataSet;
import com.github.mikephil.charting.utils.Transformer;
import com.github.mikephil.charting.utils.Utils;
import com.github.mikephil.charting.utils.ViewPortHandler;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/renderer/HorizontalBarChartRenderer.class */
public class HorizontalBarChartRenderer extends BarChartRenderer {
    public HorizontalBarChartRenderer(BarDataProvider chart, ChartAnimator animator, ViewPortHandler viewPortHandler) {
        super(chart, animator, viewPortHandler);
        this.mValuePaint.setTextAlign(Paint.Align.LEFT);
    }

    @Override // com.github.mikephil.charting.renderer.BarChartRenderer, com.github.mikephil.charting.renderer.DataRenderer
    public void initBuffers() {
        BarData barData = this.mChart.getBarData();
        this.mBarBuffers = new HorizontalBarBuffer[barData.getDataSetCount()];
        for (int i = 0; i < this.mBarBuffers.length; i++) {
            IBarDataSet set = (IBarDataSet) barData.getDataSetByIndex(i);
            this.mBarBuffers[i] = new HorizontalBarBuffer(set.getEntryCount() * 4 * (set.isStacked() ? set.getStackSize() : 1), barData.getGroupSpace(), barData.getDataSetCount(), set.isStacked());
        }
    }

    @Override // com.github.mikephil.charting.renderer.BarChartRenderer
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
        for (int j = 0; j < buffer.size() && this.mViewPortHandler.isInBoundsTop(buffer.buffer[j + 3]); j += 4) {
            if (this.mViewPortHandler.isInBoundsBottom(buffer.buffer[j + 1])) {
                if (this.mChart.isDrawBarShadowEnabled()) {
                    c.drawRect(this.mViewPortHandler.contentLeft(), buffer.buffer[j + 1], this.mViewPortHandler.contentRight(), buffer.buffer[j + 3], this.mShadowPaint);
                }
                this.mRenderPaint.setColor(dataSet.getColor(j / 4));
                c.drawRect(buffer.buffer[j], buffer.buffer[j + 1], buffer.buffer[j + 2], buffer.buffer[j + 3], this.mRenderPaint);
                if (drawBorder) {
                    c.drawRect(buffer.buffer[j], buffer.buffer[j + 1], buffer.buffer[j + 2], buffer.buffer[j + 3], this.mBarBorderPaint);
                }
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.github.mikephil.charting.renderer.BarChartRenderer, com.github.mikephil.charting.renderer.DataRenderer
    public void drawValues(Canvas c) {
        float y;
        if (passesCheck()) {
            List<T> dataSets = this.mChart.getBarData().getDataSets();
            float valueOffsetPlus = Utils.convertDpToPixel(5.0f);
            boolean drawValueAboveBar = this.mChart.isDrawValueAboveBarEnabled();
            for (int i = 0; i < this.mChart.getBarData().getDataSetCount(); i++) {
                IBarDataSet dataSet = (IBarDataSet) dataSets.get(i);
                if (dataSet.isDrawValuesEnabled() && dataSet.getEntryCount() != 0) {
                    boolean isInverted = this.mChart.isInverted(dataSet.getAxisDependency());
                    applyValueTextStyle(dataSet);
                    float halfTextHeight = Utils.calcTextHeight(this.mValuePaint, "10") / 2.0f;
                    ValueFormatter formatter = dataSet.getValueFormatter();
                    Transformer trans = this.mChart.getTransformer(dataSet.getAxisDependency());
                    float[] valuePoints = getTransformedValues(trans, dataSet, i);
                    if (!dataSet.isStacked()) {
                        for (int j = 0; j < valuePoints.length * this.mAnimator.getPhaseX() && this.mViewPortHandler.isInBoundsTop(valuePoints[j + 1]); j += 2) {
                            if (this.mViewPortHandler.isInBoundsX(valuePoints[j]) && this.mViewPortHandler.isInBoundsBottom(valuePoints[j + 1])) {
                                BarEntry e = (BarEntry) dataSet.getEntryForIndex(j / 2);
                                float val = e.getVal();
                                String formattedValue = formatter.getFormattedValue(val, e, i, this.mViewPortHandler);
                                float valueTextWidth = Utils.calcTextWidth(this.mValuePaint, formattedValue);
                                float posOffset = drawValueAboveBar ? valueOffsetPlus : -(valueTextWidth + valueOffsetPlus);
                                float negOffset = drawValueAboveBar ? -(valueTextWidth + valueOffsetPlus) : valueOffsetPlus;
                                if (isInverted) {
                                    posOffset = (-posOffset) - valueTextWidth;
                                    negOffset = (-negOffset) - valueTextWidth;
                                }
                                drawValue(c, formattedValue, valuePoints[j] + (val >= 0.0f ? posOffset : negOffset), valuePoints[j + 1] + halfTextHeight, dataSet.getValueTextColor(j / 2));
                            }
                        }
                    } else {
                        for (int j2 = 0; j2 < (valuePoints.length - 1) * this.mAnimator.getPhaseX(); j2 += 2) {
                            BarEntry e2 = (BarEntry) dataSet.getEntryForIndex(j2 / 2);
                            float[] vals = e2.getVals();
                            if (vals == null) {
                                if (!this.mViewPortHandler.isInBoundsTop(valuePoints[j2 + 1])) {
                                    break;
                                }
                                if (this.mViewPortHandler.isInBoundsX(valuePoints[j2]) && this.mViewPortHandler.isInBoundsBottom(valuePoints[j2 + 1])) {
                                    String formattedValue2 = formatter.getFormattedValue(e2.getVal(), e2, i, this.mViewPortHandler);
                                    float valueTextWidth2 = Utils.calcTextWidth(this.mValuePaint, formattedValue2);
                                    float posOffset2 = drawValueAboveBar ? valueOffsetPlus : -(valueTextWidth2 + valueOffsetPlus);
                                    float negOffset2 = drawValueAboveBar ? -(valueTextWidth2 + valueOffsetPlus) : valueOffsetPlus;
                                    if (isInverted) {
                                        posOffset2 = (-posOffset2) - valueTextWidth2;
                                        negOffset2 = (-negOffset2) - valueTextWidth2;
                                    }
                                    drawValue(c, formattedValue2, valuePoints[j2] + (e2.getVal() >= 0.0f ? posOffset2 : negOffset2), valuePoints[j2 + 1] + halfTextHeight, dataSet.getValueTextColor(j2 / 2));
                                }
                            } else {
                                float[] transformed = new float[vals.length * 2];
                                float posY = 0.0f;
                                float negY = -e2.getNegativeSum();
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
                                    transformed[k] = y * this.mAnimator.getPhaseY();
                                    k += 2;
                                    idx++;
                                }
                                trans.pointValuesToPixel(transformed);
                                for (int k2 = 0; k2 < transformed.length; k2 += 2) {
                                    float val2 = vals[k2 / 2];
                                    String formattedValue3 = formatter.getFormattedValue(val2, e2, i, this.mViewPortHandler);
                                    float valueTextWidth3 = Utils.calcTextWidth(this.mValuePaint, formattedValue3);
                                    float posOffset3 = drawValueAboveBar ? valueOffsetPlus : -(valueTextWidth3 + valueOffsetPlus);
                                    float negOffset3 = drawValueAboveBar ? -(valueTextWidth3 + valueOffsetPlus) : valueOffsetPlus;
                                    if (isInverted) {
                                        posOffset3 = (-posOffset3) - valueTextWidth3;
                                        negOffset3 = (-negOffset3) - valueTextWidth3;
                                    }
                                    float x = transformed[k2] + (val2 >= 0.0f ? posOffset3 : negOffset3);
                                    float y2 = valuePoints[j2 + 1];
                                    if (!this.mViewPortHandler.isInBoundsTop(y2)) {
                                        break;
                                    }
                                    if (this.mViewPortHandler.isInBoundsX(x) && this.mViewPortHandler.isInBoundsBottom(y2)) {
                                        drawValue(c, formattedValue3, x, y2 + halfTextHeight, dataSet.getValueTextColor(j2 / 2));
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    protected void drawValue(Canvas c, String valueText, float x, float y, int color) {
        this.mValuePaint.setColor(color);
        c.drawText(valueText, x, y, this.mValuePaint);
    }

    @Override // com.github.mikephil.charting.renderer.BarChartRenderer
    protected void prepareBarHighlight(float x, float y1, float y2, float barspaceHalf, Transformer trans) {
        float top = (x - 0.5f) + barspaceHalf;
        float bottom = (x + 0.5f) - barspaceHalf;
        this.mBarRect.set(y1, top, y2, bottom);
        trans.rectValueToPixelHorizontal(this.mBarRect, this.mAnimator.getPhaseY());
    }

    @Override // com.github.mikephil.charting.renderer.BarChartRenderer
    public float[] getTransformedValues(Transformer trans, IBarDataSet data, int dataSetIndex) {
        return trans.generateTransformedValuesHorizontalBarChart(data, dataSetIndex, this.mChart.getBarData(), this.mAnimator.getPhaseY());
    }

    @Override // com.github.mikephil.charting.renderer.BarChartRenderer
    protected boolean passesCheck() {
        return ((float) this.mChart.getBarData().getYValCount()) < ((float) this.mChart.getMaxVisibleCount()) * this.mViewPortHandler.getScaleY();
    }
}
