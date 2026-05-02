package com.github.mikephil.charting.renderer;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import com.github.mikephil.charting.BuildConfig;
import com.github.mikephil.charting.animation.ChartAnimator;
import com.github.mikephil.charting.buffer.ScatterBuffer;
import com.github.mikephil.charting.charts.Chart;
import com.github.mikephil.charting.charts.ScatterChart;
import com.github.mikephil.charting.data.ScatterData;
import com.github.mikephil.charting.highlight.Highlight;
import com.github.mikephil.charting.interfaces.dataprovider.ScatterDataProvider;
import com.github.mikephil.charting.interfaces.datasets.IScatterDataSet;
import com.github.mikephil.charting.utils.Transformer;
import com.github.mikephil.charting.utils.Utils;
import com.github.mikephil.charting.utils.ViewPortHandler;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/renderer/ScatterChartRenderer.class */
public class ScatterChartRenderer extends LineScatterCandleRadarRenderer {
    protected ScatterDataProvider mChart;
    protected ScatterBuffer[] mScatterBuffers;

    public ScatterChartRenderer(ScatterDataProvider chart, ChartAnimator animator, ViewPortHandler viewPortHandler) {
        super(animator, viewPortHandler);
        this.mChart = chart;
    }

    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void initBuffers() {
        ScatterData scatterData = this.mChart.getScatterData();
        this.mScatterBuffers = new ScatterBuffer[scatterData.getDataSetCount()];
        for (int i = 0; i < this.mScatterBuffers.length; i++) {
            IScatterDataSet set = (IScatterDataSet) scatterData.getDataSetByIndex(i);
            this.mScatterBuffers[i] = new ScatterBuffer(set.getEntryCount() * 2);
        }
    }

    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawData(Canvas c) {
        ScatterData scatterData = this.mChart.getScatterData();
        for (T set : scatterData.getDataSets()) {
            if (set.isVisible()) {
                drawDataSet(c, set);
            }
        }
    }

    protected void drawDataSet(Canvas c, IScatterDataSet dataSet) {
        Transformer trans = this.mChart.getTransformer(dataSet.getAxisDependency());
        float phaseX = Math.max(0.0f, Math.min(1.0f, this.mAnimator.getPhaseX()));
        float phaseY = this.mAnimator.getPhaseY();
        float shapeSize = Utils.convertDpToPixel(dataSet.getScatterShapeSize());
        float shapeHalf = shapeSize / 2.0f;
        float shapeHoleSizeHalf = Utils.convertDpToPixel(dataSet.getScatterShapeHoleRadius());
        float shapeHoleSize = shapeHoleSizeHalf * 2.0f;
        int shapeHoleColor = dataSet.getScatterShapeHoleColor();
        float shapeStrokeSize = (shapeSize - shapeHoleSize) / 2.0f;
        float shapeStrokeSizeHalf = shapeStrokeSize / 2.0f;
        ScatterChart.ScatterShape shape = dataSet.getScatterShape();
        ScatterBuffer buffer = this.mScatterBuffers[this.mChart.getScatterData().getIndexOfDataSet(dataSet)];
        buffer.setPhases(phaseX, phaseY);
        buffer.feed(dataSet);
        trans.pointValuesToPixel(buffer.buffer);
        switch (AnonymousClass1.$SwitchMap$com$github$mikephil$charting$charts$ScatterChart$ScatterShape[shape.ordinal()]) {
            case BuildConfig.VERSION_CODE /* 1 */:
                for (int i = 0; i < buffer.size() && this.mViewPortHandler.isInBoundsRight(buffer.buffer[i]); i += 2) {
                    if (this.mViewPortHandler.isInBoundsLeft(buffer.buffer[i]) && this.mViewPortHandler.isInBoundsY(buffer.buffer[i + 1])) {
                        this.mRenderPaint.setColor(dataSet.getColor(i / 2));
                        if (shapeHoleSize > 0.0d) {
                            this.mRenderPaint.setStyle(Paint.Style.STROKE);
                            this.mRenderPaint.setStrokeWidth(shapeStrokeSize);
                            c.drawRect((buffer.buffer[i] - shapeHoleSizeHalf) - shapeStrokeSizeHalf, (buffer.buffer[i + 1] - shapeHoleSizeHalf) - shapeStrokeSizeHalf, buffer.buffer[i] + shapeHoleSizeHalf + shapeStrokeSizeHalf, buffer.buffer[i + 1] + shapeHoleSizeHalf + shapeStrokeSizeHalf, this.mRenderPaint);
                            if (shapeHoleColor != 1122867) {
                                this.mRenderPaint.setStyle(Paint.Style.FILL);
                                this.mRenderPaint.setColor(shapeHoleColor);
                                c.drawRect(buffer.buffer[i] - shapeHoleSizeHalf, buffer.buffer[i + 1] - shapeHoleSizeHalf, buffer.buffer[i] + shapeHoleSizeHalf, buffer.buffer[i + 1] + shapeHoleSizeHalf, this.mRenderPaint);
                            }
                        } else {
                            this.mRenderPaint.setStyle(Paint.Style.FILL);
                            c.drawRect(buffer.buffer[i] - shapeHalf, buffer.buffer[i + 1] - shapeHalf, buffer.buffer[i] + shapeHalf, buffer.buffer[i + 1] + shapeHalf, this.mRenderPaint);
                        }
                    }
                }
                break;
            case 2:
                for (int i2 = 0; i2 < buffer.size() && this.mViewPortHandler.isInBoundsRight(buffer.buffer[i2]); i2 += 2) {
                    if (this.mViewPortHandler.isInBoundsLeft(buffer.buffer[i2]) && this.mViewPortHandler.isInBoundsY(buffer.buffer[i2 + 1])) {
                        this.mRenderPaint.setColor(dataSet.getColor(i2 / 2));
                        if (shapeHoleSize > 0.0d) {
                            this.mRenderPaint.setStyle(Paint.Style.STROKE);
                            this.mRenderPaint.setStrokeWidth(shapeStrokeSize);
                            c.drawCircle(buffer.buffer[i2], buffer.buffer[i2 + 1], shapeHoleSizeHalf + shapeStrokeSizeHalf, this.mRenderPaint);
                            if (shapeHoleColor != 1122867) {
                                this.mRenderPaint.setStyle(Paint.Style.FILL);
                                this.mRenderPaint.setColor(shapeHoleColor);
                                c.drawCircle(buffer.buffer[i2], buffer.buffer[i2 + 1], shapeHoleSizeHalf, this.mRenderPaint);
                            }
                        } else {
                            this.mRenderPaint.setStyle(Paint.Style.FILL);
                            c.drawCircle(buffer.buffer[i2], buffer.buffer[i2 + 1], shapeHalf, this.mRenderPaint);
                        }
                    }
                }
                break;
            case 3:
                this.mRenderPaint.setStyle(Paint.Style.FILL);
                Path tri = new Path();
                for (int i3 = 0; i3 < buffer.size() && this.mViewPortHandler.isInBoundsRight(buffer.buffer[i3]); i3 += 2) {
                    if (this.mViewPortHandler.isInBoundsLeft(buffer.buffer[i3]) && this.mViewPortHandler.isInBoundsY(buffer.buffer[i3 + 1])) {
                        this.mRenderPaint.setColor(dataSet.getColor(i3 / 2));
                        tri.moveTo(buffer.buffer[i3], buffer.buffer[i3 + 1] - shapeHalf);
                        tri.lineTo(buffer.buffer[i3] + shapeHalf, buffer.buffer[i3 + 1] + shapeHalf);
                        tri.lineTo(buffer.buffer[i3] - shapeHalf, buffer.buffer[i3 + 1] + shapeHalf);
                        if (shapeHoleSize > 0.0d) {
                            tri.lineTo(buffer.buffer[i3], buffer.buffer[i3 + 1] - shapeHalf);
                            tri.moveTo((buffer.buffer[i3] - shapeHalf) + shapeStrokeSize, (buffer.buffer[i3 + 1] + shapeHalf) - shapeStrokeSize);
                            tri.lineTo((buffer.buffer[i3] + shapeHalf) - shapeStrokeSize, (buffer.buffer[i3 + 1] + shapeHalf) - shapeStrokeSize);
                            tri.lineTo(buffer.buffer[i3], (buffer.buffer[i3 + 1] - shapeHalf) + shapeStrokeSize);
                            tri.lineTo((buffer.buffer[i3] - shapeHalf) + shapeStrokeSize, (buffer.buffer[i3 + 1] + shapeHalf) - shapeStrokeSize);
                        }
                        tri.close();
                        c.drawPath(tri, this.mRenderPaint);
                        tri.reset();
                        if (shapeHoleSize > 0.0d && shapeHoleColor != 1122867) {
                            this.mRenderPaint.setColor(shapeHoleColor);
                            tri.moveTo(buffer.buffer[i3], (buffer.buffer[i3 + 1] - shapeHalf) + shapeStrokeSize);
                            tri.lineTo((buffer.buffer[i3] + shapeHalf) - shapeStrokeSize, (buffer.buffer[i3 + 1] + shapeHalf) - shapeStrokeSize);
                            tri.lineTo((buffer.buffer[i3] - shapeHalf) + shapeStrokeSize, (buffer.buffer[i3 + 1] + shapeHalf) - shapeStrokeSize);
                            tri.close();
                            c.drawPath(tri, this.mRenderPaint);
                            tri.reset();
                        }
                    }
                }
                break;
            case Chart.PAINT_GRID_BACKGROUND /* 4 */:
                this.mRenderPaint.setStyle(Paint.Style.STROKE);
                this.mRenderPaint.setStrokeWidth(Utils.convertDpToPixel(1.0f));
                for (int i4 = 0; i4 < buffer.size() && this.mViewPortHandler.isInBoundsRight(buffer.buffer[i4]); i4 += 2) {
                    if (this.mViewPortHandler.isInBoundsLeft(buffer.buffer[i4]) && this.mViewPortHandler.isInBoundsY(buffer.buffer[i4 + 1])) {
                        this.mRenderPaint.setColor(dataSet.getColor(i4 / 2));
                        c.drawLine(buffer.buffer[i4] - shapeHalf, buffer.buffer[i4 + 1], buffer.buffer[i4] + shapeHalf, buffer.buffer[i4 + 1], this.mRenderPaint);
                        c.drawLine(buffer.buffer[i4], buffer.buffer[i4 + 1] - shapeHalf, buffer.buffer[i4], buffer.buffer[i4 + 1] + shapeHalf, this.mRenderPaint);
                    }
                }
                break;
            case 5:
                this.mRenderPaint.setStyle(Paint.Style.STROKE);
                this.mRenderPaint.setStrokeWidth(Utils.convertDpToPixel(1.0f));
                for (int i5 = 0; i5 < buffer.size() && this.mViewPortHandler.isInBoundsRight(buffer.buffer[i5]); i5 += 2) {
                    if (this.mViewPortHandler.isInBoundsLeft(buffer.buffer[i5]) && this.mViewPortHandler.isInBoundsY(buffer.buffer[i5 + 1])) {
                        this.mRenderPaint.setColor(dataSet.getColor(i5 / 2));
                        c.drawLine(buffer.buffer[i5] - shapeHalf, buffer.buffer[i5 + 1] - shapeHalf, buffer.buffer[i5] + shapeHalf, buffer.buffer[i5 + 1] + shapeHalf, this.mRenderPaint);
                        c.drawLine(buffer.buffer[i5] + shapeHalf, buffer.buffer[i5 + 1] - shapeHalf, buffer.buffer[i5] - shapeHalf, buffer.buffer[i5 + 1] + shapeHalf, this.mRenderPaint);
                    }
                }
                break;
        }
    }

    /* renamed from: com.github.mikephil.charting.renderer.ScatterChartRenderer$1, reason: invalid class name */
    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/renderer/ScatterChartRenderer$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$github$mikephil$charting$charts$ScatterChart$ScatterShape = new int[ScatterChart.ScatterShape.values().length];

        static {
            try {
                $SwitchMap$com$github$mikephil$charting$charts$ScatterChart$ScatterShape[ScatterChart.ScatterShape.SQUARE.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$charts$ScatterChart$ScatterShape[ScatterChart.ScatterShape.CIRCLE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$charts$ScatterChart$ScatterShape[ScatterChart.ScatterShape.TRIANGLE.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$charts$ScatterChart$ScatterShape[ScatterChart.ScatterShape.CROSS.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$charts$ScatterChart$ScatterShape[ScatterChart.ScatterShape.X.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v41, types: [com.github.mikephil.charting.data.Entry] */
    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawValues(Canvas c) {
        if (this.mChart.getScatterData().getYValCount() < this.mChart.getMaxVisibleCount() * this.mViewPortHandler.getScaleX()) {
            List<T> dataSets = this.mChart.getScatterData().getDataSets();
            for (int i = 0; i < this.mChart.getScatterData().getDataSetCount(); i++) {
                IScatterDataSet dataSet = (IScatterDataSet) dataSets.get(i);
                if (dataSet.isDrawValuesEnabled() && dataSet.getEntryCount() != 0) {
                    applyValueTextStyle(dataSet);
                    float[] positions = this.mChart.getTransformer(dataSet.getAxisDependency()).generateTransformedValuesScatter(dataSet, this.mAnimator.getPhaseY());
                    float shapeSize = Utils.convertDpToPixel(dataSet.getScatterShapeSize());
                    for (int j = 0; j < positions.length * this.mAnimator.getPhaseX() && this.mViewPortHandler.isInBoundsRight(positions[j]); j += 2) {
                        if (this.mViewPortHandler.isInBoundsLeft(positions[j]) && this.mViewPortHandler.isInBoundsY(positions[j + 1])) {
                            ?? entryForIndex = dataSet.getEntryForIndex(j / 2);
                            drawValue(c, dataSet.getValueFormatter(), entryForIndex.getVal(), entryForIndex, i, positions[j], positions[j + 1] - shapeSize, dataSet.getValueTextColor(j / 2));
                        }
                    }
                }
            }
        }
    }

    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawExtras(Canvas c) {
    }

    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawHighlighted(Canvas c, Highlight[] indices) {
        ScatterData scatterData = this.mChart.getScatterData();
        for (Highlight high : indices) {
            int minDataSetIndex = high.getDataSetIndex() == -1 ? 0 : high.getDataSetIndex();
            int maxDataSetIndex = high.getDataSetIndex() == -1 ? scatterData.getDataSetCount() : high.getDataSetIndex() + 1;
            if (maxDataSetIndex - minDataSetIndex >= 1) {
                for (int dataSetIndex = minDataSetIndex; dataSetIndex < maxDataSetIndex; dataSetIndex++) {
                    IScatterDataSet set = (IScatterDataSet) scatterData.getDataSetByIndex(dataSetIndex);
                    if (set != null && set.isHighlightEnabled()) {
                        int xIndex = high.getXIndex();
                        if (xIndex <= this.mChart.getXChartMax() * this.mAnimator.getPhaseX()) {
                            float yVal = set.getYValForXIndex(xIndex);
                            if (!Float.isNaN(yVal)) {
                                float y = yVal * this.mAnimator.getPhaseY();
                                float[] pts = {xIndex, y};
                                this.mChart.getTransformer(set.getAxisDependency()).pointValuesToPixel(pts);
                                drawHighlightLines(c, pts, set);
                            }
                        }
                    }
                }
            }
        }
    }
}
