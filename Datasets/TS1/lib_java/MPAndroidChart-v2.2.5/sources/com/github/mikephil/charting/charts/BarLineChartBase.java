package com.github.mikephil.charting.charts;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PointF;
import android.graphics.RectF;
import android.os.Build;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import com.github.mikephil.charting.BuildConfig;
import com.github.mikephil.charting.components.Legend;
import com.github.mikephil.charting.components.XAxis;
import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.data.BarEntry;
import com.github.mikephil.charting.data.BarLineScatterCandleBubbleData;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.highlight.ChartHighlighter;
import com.github.mikephil.charting.highlight.Highlight;
import com.github.mikephil.charting.interfaces.dataprovider.BarLineScatterCandleBubbleDataProvider;
import com.github.mikephil.charting.interfaces.datasets.IBarLineScatterCandleBubbleDataSet;
import com.github.mikephil.charting.jobs.AnimatedMoveViewJob;
import com.github.mikephil.charting.jobs.AnimatedZoomJob;
import com.github.mikephil.charting.jobs.MoveViewJob;
import com.github.mikephil.charting.jobs.ZoomJob;
import com.github.mikephil.charting.listener.BarLineChartTouchListener;
import com.github.mikephil.charting.listener.OnDrawListener;
import com.github.mikephil.charting.renderer.XAxisRenderer;
import com.github.mikephil.charting.renderer.YAxisRenderer;
import com.github.mikephil.charting.utils.PointD;
import com.github.mikephil.charting.utils.Transformer;
import com.github.mikephil.charting.utils.Utils;

@SuppressLint({"RtlHardcoded"})
/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/charts/BarLineChartBase.class */
public abstract class BarLineChartBase<T extends BarLineScatterCandleBubbleData<? extends IBarLineScatterCandleBubbleDataSet<? extends Entry>>> extends Chart<T> implements BarLineScatterCandleBubbleDataProvider {
    protected int mMaxVisibleCount;
    private boolean mAutoScaleMinMaxEnabled;
    private Integer mAutoScaleLastLowestVisibleXIndex;
    private Integer mAutoScaleLastHighestVisibleXIndex;
    protected boolean mPinchZoomEnabled;
    protected boolean mDoubleTapToZoomEnabled;
    protected boolean mHighlightPerDragEnabled;
    protected boolean mHighlightFullBarEnabled;
    private boolean mDragEnabled;
    private boolean mScaleXEnabled;
    private boolean mScaleYEnabled;
    protected Paint mGridBackgroundPaint;
    protected Paint mBorderPaint;
    protected boolean mDrawGridBackground;
    protected boolean mDrawBorders;
    protected float mMinOffset;
    protected boolean mKeepPositionOnRotation;
    protected OnDrawListener mDrawListener;
    protected YAxis mAxisLeft;
    protected YAxis mAxisRight;
    protected YAxisRenderer mAxisRendererLeft;
    protected YAxisRenderer mAxisRendererRight;
    protected Transformer mLeftAxisTransformer;
    protected Transformer mRightAxisTransformer;
    protected XAxisRenderer mXAxisRenderer;
    private long totalTime;
    private long drawCycles;
    private RectF mOffsetsBuffer;
    private boolean mCustomViewPortEnabled;

    @Override // com.github.mikephil.charting.charts.Chart, com.github.mikephil.charting.interfaces.dataprovider.ChartInterface, com.github.mikephil.charting.interfaces.dataprovider.BarLineScatterCandleBubbleDataProvider
    public /* bridge */ /* synthetic */ BarLineScatterCandleBubbleData getData() {
        return (BarLineScatterCandleBubbleData) super.getData();
    }

    public BarLineChartBase(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mMaxVisibleCount = 100;
        this.mAutoScaleMinMaxEnabled = false;
        this.mAutoScaleLastLowestVisibleXIndex = null;
        this.mAutoScaleLastHighestVisibleXIndex = null;
        this.mPinchZoomEnabled = false;
        this.mDoubleTapToZoomEnabled = true;
        this.mHighlightPerDragEnabled = true;
        this.mHighlightFullBarEnabled = false;
        this.mDragEnabled = true;
        this.mScaleXEnabled = true;
        this.mScaleYEnabled = true;
        this.mDrawGridBackground = false;
        this.mDrawBorders = false;
        this.mMinOffset = 15.0f;
        this.mKeepPositionOnRotation = false;
        this.totalTime = 0L;
        this.drawCycles = 0L;
        this.mOffsetsBuffer = new RectF();
        this.mCustomViewPortEnabled = false;
    }

    public BarLineChartBase(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mMaxVisibleCount = 100;
        this.mAutoScaleMinMaxEnabled = false;
        this.mAutoScaleLastLowestVisibleXIndex = null;
        this.mAutoScaleLastHighestVisibleXIndex = null;
        this.mPinchZoomEnabled = false;
        this.mDoubleTapToZoomEnabled = true;
        this.mHighlightPerDragEnabled = true;
        this.mHighlightFullBarEnabled = false;
        this.mDragEnabled = true;
        this.mScaleXEnabled = true;
        this.mScaleYEnabled = true;
        this.mDrawGridBackground = false;
        this.mDrawBorders = false;
        this.mMinOffset = 15.0f;
        this.mKeepPositionOnRotation = false;
        this.totalTime = 0L;
        this.drawCycles = 0L;
        this.mOffsetsBuffer = new RectF();
        this.mCustomViewPortEnabled = false;
    }

    public BarLineChartBase(Context context) {
        super(context);
        this.mMaxVisibleCount = 100;
        this.mAutoScaleMinMaxEnabled = false;
        this.mAutoScaleLastLowestVisibleXIndex = null;
        this.mAutoScaleLastHighestVisibleXIndex = null;
        this.mPinchZoomEnabled = false;
        this.mDoubleTapToZoomEnabled = true;
        this.mHighlightPerDragEnabled = true;
        this.mHighlightFullBarEnabled = false;
        this.mDragEnabled = true;
        this.mScaleXEnabled = true;
        this.mScaleYEnabled = true;
        this.mDrawGridBackground = false;
        this.mDrawBorders = false;
        this.mMinOffset = 15.0f;
        this.mKeepPositionOnRotation = false;
        this.totalTime = 0L;
        this.drawCycles = 0L;
        this.mOffsetsBuffer = new RectF();
        this.mCustomViewPortEnabled = false;
    }

    @Override // com.github.mikephil.charting.charts.Chart
    protected void init() {
        super.init();
        this.mAxisLeft = new YAxis(YAxis.AxisDependency.LEFT);
        this.mAxisRight = new YAxis(YAxis.AxisDependency.RIGHT);
        this.mLeftAxisTransformer = new Transformer(this.mViewPortHandler);
        this.mRightAxisTransformer = new Transformer(this.mViewPortHandler);
        this.mAxisRendererLeft = new YAxisRenderer(this.mViewPortHandler, this.mAxisLeft, this.mLeftAxisTransformer);
        this.mAxisRendererRight = new YAxisRenderer(this.mViewPortHandler, this.mAxisRight, this.mRightAxisTransformer);
        this.mXAxisRenderer = new XAxisRenderer(this.mViewPortHandler, this.mXAxis, this.mLeftAxisTransformer);
        setHighlighter(new ChartHighlighter(this));
        this.mChartTouchListener = new BarLineChartTouchListener(this, this.mViewPortHandler.getMatrixTouch());
        this.mGridBackgroundPaint = new Paint();
        this.mGridBackgroundPaint.setStyle(Paint.Style.FILL);
        this.mGridBackgroundPaint.setColor(Color.rgb(240, 240, 240));
        this.mBorderPaint = new Paint();
        this.mBorderPaint.setStyle(Paint.Style.STROKE);
        this.mBorderPaint.setColor(-16777216);
        this.mBorderPaint.setStrokeWidth(Utils.convertDpToPixel(1.0f));
    }

    @Override // com.github.mikephil.charting.charts.Chart, android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.mData == 0) {
            return;
        }
        long starttime = System.currentTimeMillis();
        calcModulus();
        this.mXAxisRenderer.calcXBounds(this, this.mXAxis.mAxisLabelModulus);
        this.mRenderer.calcXBounds(this, this.mXAxis.mAxisLabelModulus);
        drawGridBackground(canvas);
        if (this.mAxisLeft.isEnabled()) {
            this.mAxisRendererLeft.computeAxis(this.mAxisLeft.mAxisMinimum, this.mAxisLeft.mAxisMaximum);
        }
        if (this.mAxisRight.isEnabled()) {
            this.mAxisRendererRight.computeAxis(this.mAxisRight.mAxisMinimum, this.mAxisRight.mAxisMaximum);
        }
        this.mXAxisRenderer.renderAxisLine(canvas);
        this.mAxisRendererLeft.renderAxisLine(canvas);
        this.mAxisRendererRight.renderAxisLine(canvas);
        if (this.mAutoScaleMinMaxEnabled) {
            int lowestVisibleXIndex = getLowestVisibleXIndex();
            int highestVisibleXIndex = getHighestVisibleXIndex();
            if (this.mAutoScaleLastLowestVisibleXIndex == null || this.mAutoScaleLastLowestVisibleXIndex.intValue() != lowestVisibleXIndex || this.mAutoScaleLastHighestVisibleXIndex == null || this.mAutoScaleLastHighestVisibleXIndex.intValue() != highestVisibleXIndex) {
                calcMinMax();
                calculateOffsets();
                this.mAutoScaleLastLowestVisibleXIndex = Integer.valueOf(lowestVisibleXIndex);
                this.mAutoScaleLastHighestVisibleXIndex = Integer.valueOf(highestVisibleXIndex);
            }
        }
        int clipRestoreCount = canvas.save();
        canvas.clipRect(this.mViewPortHandler.getContentRect());
        this.mXAxisRenderer.renderGridLines(canvas);
        this.mAxisRendererLeft.renderGridLines(canvas);
        this.mAxisRendererRight.renderGridLines(canvas);
        if (this.mXAxis.isDrawLimitLinesBehindDataEnabled()) {
            this.mXAxisRenderer.renderLimitLines(canvas);
        }
        if (this.mAxisLeft.isDrawLimitLinesBehindDataEnabled()) {
            this.mAxisRendererLeft.renderLimitLines(canvas);
        }
        if (this.mAxisRight.isDrawLimitLinesBehindDataEnabled()) {
            this.mAxisRendererRight.renderLimitLines(canvas);
        }
        this.mRenderer.drawData(canvas);
        if (valuesToHighlight()) {
            this.mRenderer.drawHighlighted(canvas, this.mIndicesToHighlight);
        }
        canvas.restoreToCount(clipRestoreCount);
        this.mRenderer.drawExtras(canvas);
        int clipRestoreCount2 = canvas.save();
        canvas.clipRect(this.mViewPortHandler.getContentRect());
        if (!this.mXAxis.isDrawLimitLinesBehindDataEnabled()) {
            this.mXAxisRenderer.renderLimitLines(canvas);
        }
        if (!this.mAxisLeft.isDrawLimitLinesBehindDataEnabled()) {
            this.mAxisRendererLeft.renderLimitLines(canvas);
        }
        if (!this.mAxisRight.isDrawLimitLinesBehindDataEnabled()) {
            this.mAxisRendererRight.renderLimitLines(canvas);
        }
        canvas.restoreToCount(clipRestoreCount2);
        this.mXAxisRenderer.renderAxisLabels(canvas);
        this.mAxisRendererLeft.renderAxisLabels(canvas);
        this.mAxisRendererRight.renderAxisLabels(canvas);
        this.mRenderer.drawValues(canvas);
        this.mLegendRenderer.renderLegend(canvas);
        drawMarkers(canvas);
        drawDescription(canvas);
        if (this.mLogEnabled) {
            long drawtime = System.currentTimeMillis() - starttime;
            this.totalTime += drawtime;
            this.drawCycles++;
            long average = this.totalTime / this.drawCycles;
            Log.i(Chart.LOG_TAG, "Drawtime: " + drawtime + " ms, average: " + average + " ms, cycles: " + this.drawCycles);
        }
    }

    public void resetTracking() {
        this.totalTime = 0L;
        this.drawCycles = 0L;
    }

    protected void prepareValuePxMatrix() {
        if (this.mLogEnabled) {
            Log.i(Chart.LOG_TAG, "Preparing Value-Px Matrix, xmin: " + this.mXAxis.mAxisMinimum + ", xmax: " + this.mXAxis.mAxisMaximum + ", xdelta: " + this.mXAxis.mAxisRange);
        }
        this.mRightAxisTransformer.prepareMatrixValuePx(this.mXAxis.mAxisMinimum, this.mXAxis.mAxisRange, this.mAxisRight.mAxisRange, this.mAxisRight.mAxisMinimum);
        this.mLeftAxisTransformer.prepareMatrixValuePx(this.mXAxis.mAxisMinimum, this.mXAxis.mAxisRange, this.mAxisLeft.mAxisRange, this.mAxisLeft.mAxisMinimum);
    }

    protected void prepareOffsetMatrix() {
        this.mRightAxisTransformer.prepareMatrixOffset(this.mAxisRight.isInverted());
        this.mLeftAxisTransformer.prepareMatrixOffset(this.mAxisLeft.isInverted());
    }

    @Override // com.github.mikephil.charting.charts.Chart
    public void notifyDataSetChanged() {
        if (this.mData == 0) {
            if (this.mLogEnabled) {
                Log.i(Chart.LOG_TAG, "Preparing... DATA NOT SET.");
                return;
            }
            return;
        }
        if (this.mLogEnabled) {
            Log.i(Chart.LOG_TAG, "Preparing...");
        }
        if (this.mRenderer != null) {
            this.mRenderer.initBuffers();
        }
        calcMinMax();
        this.mAxisRendererLeft.computeAxis(this.mAxisLeft.mAxisMinimum, this.mAxisLeft.mAxisMaximum);
        this.mAxisRendererRight.computeAxis(this.mAxisRight.mAxisMinimum, this.mAxisRight.mAxisMaximum);
        this.mXAxisRenderer.computeAxis(((BarLineScatterCandleBubbleData) this.mData).getXValMaximumLength(), ((BarLineScatterCandleBubbleData) this.mData).getXVals());
        if (this.mLegend != null) {
            this.mLegendRenderer.computeLegend(this.mData);
        }
        calculateOffsets();
    }

    @Override // com.github.mikephil.charting.charts.Chart
    protected void calcMinMax() {
        if (this.mAutoScaleMinMaxEnabled) {
            ((BarLineScatterCandleBubbleData) this.mData).calcMinMax(getLowestVisibleXIndex(), getHighestVisibleXIndex());
        }
        this.mXAxis.mAxisMaximum = ((BarLineScatterCandleBubbleData) this.mData).getXVals().size() - 1;
        this.mXAxis.mAxisRange = Math.abs(this.mXAxis.mAxisMaximum - this.mXAxis.mAxisMinimum);
        this.mAxisLeft.calculate(((BarLineScatterCandleBubbleData) this.mData).getYMin(YAxis.AxisDependency.LEFT), ((BarLineScatterCandleBubbleData) this.mData).getYMax(YAxis.AxisDependency.LEFT));
        this.mAxisRight.calculate(((BarLineScatterCandleBubbleData) this.mData).getYMin(YAxis.AxisDependency.RIGHT), ((BarLineScatterCandleBubbleData) this.mData).getYMax(YAxis.AxisDependency.RIGHT));
    }

    protected void calculateLegendOffsets(RectF offsets) {
        offsets.left = 0.0f;
        offsets.right = 0.0f;
        offsets.top = 0.0f;
        offsets.bottom = 0.0f;
        if (this.mLegend != null && this.mLegend.isEnabled() && !this.mLegend.isDrawInsideEnabled()) {
            switch (AnonymousClass2.$SwitchMap$com$github$mikephil$charting$components$Legend$LegendOrientation[this.mLegend.getOrientation().ordinal()]) {
                case BuildConfig.VERSION_CODE /* 1 */:
                    switch (AnonymousClass2.$SwitchMap$com$github$mikephil$charting$components$Legend$LegendHorizontalAlignment[this.mLegend.getHorizontalAlignment().ordinal()]) {
                        case BuildConfig.VERSION_CODE /* 1 */:
                            offsets.left += Math.min(this.mLegend.mNeededWidth, this.mViewPortHandler.getChartWidth() * this.mLegend.getMaxSizePercent()) + this.mLegend.getXOffset();
                            break;
                        case 2:
                            offsets.right += Math.min(this.mLegend.mNeededWidth, this.mViewPortHandler.getChartWidth() * this.mLegend.getMaxSizePercent()) + this.mLegend.getXOffset();
                            break;
                        case 3:
                            switch (AnonymousClass2.$SwitchMap$com$github$mikephil$charting$components$Legend$LegendVerticalAlignment[this.mLegend.getVerticalAlignment().ordinal()]) {
                                case BuildConfig.VERSION_CODE /* 1 */:
                                    offsets.top += Math.min(this.mLegend.mNeededHeight, this.mViewPortHandler.getChartHeight() * this.mLegend.getMaxSizePercent()) + this.mLegend.getYOffset();
                                    if (getXAxis().isEnabled() && getXAxis().isDrawLabelsEnabled()) {
                                        offsets.top += getXAxis().mLabelRotatedHeight;
                                        break;
                                    }
                                    break;
                                case 2:
                                    offsets.bottom += Math.min(this.mLegend.mNeededHeight, this.mViewPortHandler.getChartHeight() * this.mLegend.getMaxSizePercent()) + this.mLegend.getYOffset();
                                    if (getXAxis().isEnabled() && getXAxis().isDrawLabelsEnabled()) {
                                        offsets.bottom += getXAxis().mLabelRotatedHeight;
                                        break;
                                    }
                                    break;
                            }
                    }
                case 2:
                    switch (AnonymousClass2.$SwitchMap$com$github$mikephil$charting$components$Legend$LegendVerticalAlignment[this.mLegend.getVerticalAlignment().ordinal()]) {
                        case BuildConfig.VERSION_CODE /* 1 */:
                            offsets.top += Math.min(this.mLegend.mNeededHeight, this.mViewPortHandler.getChartHeight() * this.mLegend.getMaxSizePercent()) + this.mLegend.getYOffset();
                            if (getXAxis().isEnabled() && getXAxis().isDrawLabelsEnabled()) {
                                offsets.top += getXAxis().mLabelRotatedHeight;
                                break;
                            }
                            break;
                        case 2:
                            offsets.bottom += Math.min(this.mLegend.mNeededHeight, this.mViewPortHandler.getChartHeight() * this.mLegend.getMaxSizePercent()) + this.mLegend.getYOffset();
                            if (getXAxis().isEnabled() && getXAxis().isDrawLabelsEnabled()) {
                                offsets.bottom += getXAxis().mLabelRotatedHeight;
                                break;
                            }
                            break;
                    }
            }
        }
    }

    /* renamed from: com.github.mikephil.charting.charts.BarLineChartBase$2, reason: invalid class name */
    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/charts/BarLineChartBase$2.class */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] $SwitchMap$com$github$mikephil$charting$components$Legend$LegendVerticalAlignment;
        static final /* synthetic */ int[] $SwitchMap$com$github$mikephil$charting$components$Legend$LegendHorizontalAlignment;
        static final /* synthetic */ int[] $SwitchMap$com$github$mikephil$charting$components$Legend$LegendOrientation = new int[Legend.LegendOrientation.values().length];

        static {
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendOrientation[Legend.LegendOrientation.VERTICAL.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendOrientation[Legend.LegendOrientation.HORIZONTAL.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            $SwitchMap$com$github$mikephil$charting$components$Legend$LegendHorizontalAlignment = new int[Legend.LegendHorizontalAlignment.values().length];
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendHorizontalAlignment[Legend.LegendHorizontalAlignment.LEFT.ordinal()] = 1;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendHorizontalAlignment[Legend.LegendHorizontalAlignment.RIGHT.ordinal()] = 2;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendHorizontalAlignment[Legend.LegendHorizontalAlignment.CENTER.ordinal()] = 3;
            } catch (NoSuchFieldError e5) {
            }
            $SwitchMap$com$github$mikephil$charting$components$Legend$LegendVerticalAlignment = new int[Legend.LegendVerticalAlignment.values().length];
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendVerticalAlignment[Legend.LegendVerticalAlignment.TOP.ordinal()] = 1;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendVerticalAlignment[Legend.LegendVerticalAlignment.BOTTOM.ordinal()] = 2;
            } catch (NoSuchFieldError e7) {
            }
        }
    }

    @Override // com.github.mikephil.charting.charts.Chart
    public void calculateOffsets() {
        if (!this.mCustomViewPortEnabled) {
            calculateLegendOffsets(this.mOffsetsBuffer);
            float offsetLeft = 0.0f + this.mOffsetsBuffer.left;
            float offsetTop = 0.0f + this.mOffsetsBuffer.top;
            float offsetRight = 0.0f + this.mOffsetsBuffer.right;
            float offsetBottom = 0.0f + this.mOffsetsBuffer.bottom;
            if (this.mAxisLeft.needsOffset()) {
                offsetLeft += this.mAxisLeft.getRequiredWidthSpace(this.mAxisRendererLeft.getPaintAxisLabels());
            }
            if (this.mAxisRight.needsOffset()) {
                offsetRight += this.mAxisRight.getRequiredWidthSpace(this.mAxisRendererRight.getPaintAxisLabels());
            }
            if (this.mXAxis.isEnabled() && this.mXAxis.isDrawLabelsEnabled()) {
                float xlabelheight = this.mXAxis.mLabelRotatedHeight + this.mXAxis.getYOffset();
                if (this.mXAxis.getPosition() == XAxis.XAxisPosition.BOTTOM) {
                    offsetBottom += xlabelheight;
                } else if (this.mXAxis.getPosition() == XAxis.XAxisPosition.TOP) {
                    offsetTop += xlabelheight;
                } else if (this.mXAxis.getPosition() == XAxis.XAxisPosition.BOTH_SIDED) {
                    offsetBottom += xlabelheight;
                    offsetTop += xlabelheight;
                }
            }
            float offsetTop2 = offsetTop + getExtraTopOffset();
            float offsetRight2 = offsetRight + getExtraRightOffset();
            float offsetBottom2 = offsetBottom + getExtraBottomOffset();
            float offsetLeft2 = offsetLeft + getExtraLeftOffset();
            float minOffset = Utils.convertDpToPixel(this.mMinOffset);
            this.mViewPortHandler.restrainViewPort(Math.max(minOffset, offsetLeft2), Math.max(minOffset, offsetTop2), Math.max(minOffset, offsetRight2), Math.max(minOffset, offsetBottom2));
            if (this.mLogEnabled) {
                Log.i(Chart.LOG_TAG, "offsetLeft: " + offsetLeft2 + ", offsetTop: " + offsetTop2 + ", offsetRight: " + offsetRight2 + ", offsetBottom: " + offsetBottom2);
                Log.i(Chart.LOG_TAG, "Content: " + this.mViewPortHandler.getContentRect().toString());
            }
        }
        prepareOffsetMatrix();
        prepareValuePxMatrix();
    }

    protected void calcModulus() {
        if (this.mXAxis == null || !this.mXAxis.isEnabled()) {
            return;
        }
        if (!this.mXAxis.isAxisModulusCustom()) {
            float[] values = new float[9];
            this.mViewPortHandler.getMatrixTouch().getValues(values);
            this.mXAxis.mAxisLabelModulus = (int) Math.ceil((((BarLineScatterCandleBubbleData) this.mData).getXValCount() * this.mXAxis.mLabelRotatedWidth) / (this.mViewPortHandler.contentWidth() * values[0]));
        }
        if (this.mLogEnabled) {
            Log.i(Chart.LOG_TAG, "X-Axis modulus: " + this.mXAxis.mAxisLabelModulus + ", x-axis label width: " + this.mXAxis.mLabelWidth + ", x-axis label rotated width: " + this.mXAxis.mLabelRotatedWidth + ", content width: " + this.mViewPortHandler.contentWidth());
        }
        if (this.mXAxis.mAxisLabelModulus < 1) {
            this.mXAxis.mAxisLabelModulus = 1;
        }
    }

    @Override // com.github.mikephil.charting.charts.Chart
    protected float[] getMarkerPosition(Entry e, Highlight highlight) {
        float yPos;
        float yPos2;
        float xPos;
        int dataSetIndex = highlight.getDataSetIndex();
        float xPos2 = e.getXIndex();
        float yPos3 = e.getVal();
        if (this instanceof BarChart) {
            BarData bd = (BarData) this.mData;
            float space = bd.getGroupSpace();
            int setCount = ((BarLineScatterCandleBubbleData) this.mData).getDataSetCount();
            int i = e.getXIndex();
            if (this instanceof HorizontalBarChart) {
                float y = i + (i * (setCount - 1)) + dataSetIndex + (space * i) + (space / 2.0f);
                yPos = y;
                BarEntry entry = (BarEntry) e;
                if (entry.getVals() != null) {
                    xPos = highlight.getRange().to;
                } else {
                    xPos = e.getVal();
                }
                xPos2 = xPos * this.mAnimator.getPhaseY();
            } else {
                float x = i + (i * (setCount - 1)) + dataSetIndex + (space * i) + (space / 2.0f);
                xPos2 = x;
                BarEntry entry2 = (BarEntry) e;
                if (entry2.getVals() != null) {
                    yPos2 = highlight.getRange().to;
                } else {
                    yPos2 = e.getVal();
                }
                yPos = yPos2 * this.mAnimator.getPhaseY();
            }
        } else {
            yPos = yPos3 * this.mAnimator.getPhaseY();
        }
        float[] pts = {xPos2, yPos};
        getTransformer(((IBarLineScatterCandleBubbleDataSet) ((BarLineScatterCandleBubbleData) this.mData).getDataSetByIndex(dataSetIndex)).getAxisDependency()).pointValuesToPixel(pts);
        return pts;
    }

    protected void drawGridBackground(Canvas c) {
        if (this.mDrawGridBackground) {
            c.drawRect(this.mViewPortHandler.getContentRect(), this.mGridBackgroundPaint);
        }
        if (this.mDrawBorders) {
            c.drawRect(this.mViewPortHandler.getContentRect(), this.mBorderPaint);
        }
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.BarLineScatterCandleBubbleDataProvider
    public Transformer getTransformer(YAxis.AxisDependency which) {
        if (which == YAxis.AxisDependency.LEFT) {
            return this.mLeftAxisTransformer;
        }
        return this.mRightAxisTransformer;
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        super.onTouchEvent(event);
        if (this.mChartTouchListener == null || this.mData == 0 || !this.mTouchEnabled) {
            return false;
        }
        return this.mChartTouchListener.onTouch(this, event);
    }

    @Override // android.view.View
    public void computeScroll() {
        if (this.mChartTouchListener instanceof BarLineChartTouchListener) {
            ((BarLineChartTouchListener) this.mChartTouchListener).computeScroll();
        }
    }

    public void zoomIn() {
        PointF center = this.mViewPortHandler.getContentCenter();
        Matrix save = this.mViewPortHandler.zoomIn(center.x, -center.y);
        this.mViewPortHandler.refresh(save, this, false);
        calculateOffsets();
        postInvalidate();
    }

    public void zoomOut() {
        PointF center = this.mViewPortHandler.getContentCenter();
        Matrix save = this.mViewPortHandler.zoomOut(center.x, -center.y);
        this.mViewPortHandler.refresh(save, this, false);
        calculateOffsets();
        postInvalidate();
    }

    public void zoom(float scaleX, float scaleY, float x, float y) {
        Matrix save = this.mViewPortHandler.zoom(scaleX, scaleY, x, y);
        this.mViewPortHandler.refresh(save, this, false);
        calculateOffsets();
        postInvalidate();
    }

    public void zoom(float scaleX, float scaleY, float xValue, float yValue, YAxis.AxisDependency axis) {
        Runnable job = new ZoomJob(this.mViewPortHandler, scaleX, scaleY, xValue, yValue, getTransformer(axis), axis, this);
        addViewportJob(job);
    }

    @TargetApi(Chart.PAINT_DESCRIPTION)
    public void zoomAndCenterAnimated(float scaleX, float scaleY, float xValue, float yValue, YAxis.AxisDependency axis, long duration) {
        if (Build.VERSION.SDK_INT >= 11) {
            PointD origin = getValuesByTouchPoint(this.mViewPortHandler.contentLeft(), this.mViewPortHandler.contentTop(), axis);
            Runnable job = new AnimatedZoomJob(this.mViewPortHandler, this, getTransformer(axis), getAxis(axis), this.mXAxis.getValues().size(), scaleX, scaleY, this.mViewPortHandler.getScaleX(), this.mViewPortHandler.getScaleY(), xValue, yValue, (float) origin.x, (float) origin.y, duration);
            addViewportJob(job);
            return;
        }
        Log.e(Chart.LOG_TAG, "Unable to execute zoomAndCenterAnimated(...) on API level < 11");
    }

    public void fitScreen() {
        Matrix save = this.mViewPortHandler.fitScreen();
        this.mViewPortHandler.refresh(save, this, false);
        calculateOffsets();
        postInvalidate();
    }

    public void setScaleMinima(float scaleX, float scaleY) {
        this.mViewPortHandler.setMinimumScaleX(scaleX);
        this.mViewPortHandler.setMinimumScaleY(scaleY);
    }

    public void setVisibleXRangeMaximum(float maxXRange) {
        float xScale = this.mXAxis.mAxisRange / maxXRange;
        this.mViewPortHandler.setMinimumScaleX(xScale);
    }

    public void setVisibleXRangeMinimum(float minXRange) {
        float xScale = this.mXAxis.mAxisRange / minXRange;
        this.mViewPortHandler.setMaximumScaleX(xScale);
    }

    public void setVisibleXRange(float minXRange, float maxXRange) {
        float maxScale = this.mXAxis.mAxisRange / minXRange;
        float minScale = this.mXAxis.mAxisRange / maxXRange;
        this.mViewPortHandler.setMinMaxScaleX(minScale, maxScale);
    }

    public void setVisibleYRangeMaximum(float maxYRange, YAxis.AxisDependency axis) {
        float yScale = getDeltaY(axis) / maxYRange;
        this.mViewPortHandler.setMinimumScaleY(yScale);
    }

    public void moveViewToX(float xIndex) {
        Runnable job = new MoveViewJob(this.mViewPortHandler, xIndex, 0.0f, getTransformer(YAxis.AxisDependency.LEFT), this);
        addViewportJob(job);
    }

    public void moveViewToY(float yValue, YAxis.AxisDependency axis) {
        float valsInView = getDeltaY(axis) / this.mViewPortHandler.getScaleY();
        Runnable job = new MoveViewJob(this.mViewPortHandler, 0.0f, yValue + (valsInView / 2.0f), getTransformer(axis), this);
        addViewportJob(job);
    }

    public void moveViewTo(float xIndex, float yValue, YAxis.AxisDependency axis) {
        float valsInView = getDeltaY(axis) / this.mViewPortHandler.getScaleY();
        Runnable job = new MoveViewJob(this.mViewPortHandler, xIndex, yValue + (valsInView / 2.0f), getTransformer(axis), this);
        addViewportJob(job);
    }

    @TargetApi(Chart.PAINT_DESCRIPTION)
    public void moveViewToAnimated(float xIndex, float yValue, YAxis.AxisDependency axis, long duration) {
        if (Build.VERSION.SDK_INT >= 11) {
            PointD bounds = getValuesByTouchPoint(this.mViewPortHandler.contentLeft(), this.mViewPortHandler.contentTop(), axis);
            float valsInView = getDeltaY(axis) / this.mViewPortHandler.getScaleY();
            Runnable job = new AnimatedMoveViewJob(this.mViewPortHandler, xIndex, yValue + (valsInView / 2.0f), getTransformer(axis), this, (float) bounds.x, (float) bounds.y, duration);
            addViewportJob(job);
            return;
        }
        Log.e(Chart.LOG_TAG, "Unable to execute moveViewToAnimated(...) on API level < 11");
    }

    public void centerViewTo(float xIndex, float yValue, YAxis.AxisDependency axis) {
        float valsInView = getDeltaY(axis) / this.mViewPortHandler.getScaleY();
        float xsInView = getXAxis().getValues().size() / this.mViewPortHandler.getScaleX();
        Runnable job = new MoveViewJob(this.mViewPortHandler, xIndex - (xsInView / 2.0f), yValue + (valsInView / 2.0f), getTransformer(axis), this);
        addViewportJob(job);
    }

    @TargetApi(Chart.PAINT_DESCRIPTION)
    public void centerViewToAnimated(float xIndex, float yValue, YAxis.AxisDependency axis, long duration) {
        if (Build.VERSION.SDK_INT >= 11) {
            PointD bounds = getValuesByTouchPoint(this.mViewPortHandler.contentLeft(), this.mViewPortHandler.contentTop(), axis);
            float valsInView = getDeltaY(axis) / this.mViewPortHandler.getScaleY();
            float xsInView = getXAxis().getValues().size() / this.mViewPortHandler.getScaleX();
            Runnable job = new AnimatedMoveViewJob(this.mViewPortHandler, xIndex - (xsInView / 2.0f), yValue + (valsInView / 2.0f), getTransformer(axis), this, (float) bounds.x, (float) bounds.y, duration);
            addViewportJob(job);
            return;
        }
        Log.e(Chart.LOG_TAG, "Unable to execute centerViewToAnimated(...) on API level < 11");
    }

    public void setViewPortOffsets(final float left, final float top, final float right, final float bottom) {
        this.mCustomViewPortEnabled = true;
        post(new Runnable() { // from class: com.github.mikephil.charting.charts.BarLineChartBase.1
            @Override // java.lang.Runnable
            public void run() {
                BarLineChartBase.this.mViewPortHandler.restrainViewPort(left, top, right, bottom);
                BarLineChartBase.this.prepareOffsetMatrix();
                BarLineChartBase.this.prepareValuePxMatrix();
            }
        });
    }

    public void resetViewPortOffsets() {
        this.mCustomViewPortEnabled = false;
        calculateOffsets();
    }

    public float getDeltaY(YAxis.AxisDependency axis) {
        if (axis == YAxis.AxisDependency.LEFT) {
            return this.mAxisLeft.mAxisRange;
        }
        return this.mAxisRight.mAxisRange;
    }

    public void setOnDrawListener(OnDrawListener drawListener) {
        this.mDrawListener = drawListener;
    }

    public OnDrawListener getDrawListener() {
        return this.mDrawListener;
    }

    public PointF getPosition(Entry e, YAxis.AxisDependency axis) {
        if (e == null) {
            return null;
        }
        float[] vals = {e.getXIndex(), e.getVal()};
        getTransformer(axis).pointValuesToPixel(vals);
        return new PointF(vals[0], vals[1]);
    }

    public void setMaxVisibleValueCount(int count) {
        this.mMaxVisibleCount = count;
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.BarLineScatterCandleBubbleDataProvider
    public int getMaxVisibleCount() {
        return this.mMaxVisibleCount;
    }

    public void setHighlightPerDragEnabled(boolean enabled) {
        this.mHighlightPerDragEnabled = enabled;
    }

    public boolean isHighlightPerDragEnabled() {
        return this.mHighlightPerDragEnabled;
    }

    public void setHighlightFullBarEnabled(boolean enabled) {
        this.mHighlightFullBarEnabled = enabled;
    }

    public boolean isHighlightFullBarEnabled() {
        return this.mHighlightFullBarEnabled;
    }

    public void setGridBackgroundColor(int color) {
        this.mGridBackgroundPaint.setColor(color);
    }

    public void setDragEnabled(boolean enabled) {
        this.mDragEnabled = enabled;
    }

    public boolean isDragEnabled() {
        return this.mDragEnabled;
    }

    public void setScaleEnabled(boolean enabled) {
        this.mScaleXEnabled = enabled;
        this.mScaleYEnabled = enabled;
    }

    public void setScaleXEnabled(boolean enabled) {
        this.mScaleXEnabled = enabled;
    }

    public void setScaleYEnabled(boolean enabled) {
        this.mScaleYEnabled = enabled;
    }

    public boolean isScaleXEnabled() {
        return this.mScaleXEnabled;
    }

    public boolean isScaleYEnabled() {
        return this.mScaleYEnabled;
    }

    public void setDoubleTapToZoomEnabled(boolean enabled) {
        this.mDoubleTapToZoomEnabled = enabled;
    }

    public boolean isDoubleTapToZoomEnabled() {
        return this.mDoubleTapToZoomEnabled;
    }

    public void setDrawGridBackground(boolean enabled) {
        this.mDrawGridBackground = enabled;
    }

    public void setDrawBorders(boolean enabled) {
        this.mDrawBorders = enabled;
    }

    public void setBorderWidth(float width) {
        this.mBorderPaint.setStrokeWidth(Utils.convertDpToPixel(width));
    }

    public void setBorderColor(int color) {
        this.mBorderPaint.setColor(color);
    }

    public float getMinOffset() {
        return this.mMinOffset;
    }

    public void setMinOffset(float minOffset) {
        this.mMinOffset = minOffset;
    }

    public boolean isKeepPositionOnRotation() {
        return this.mKeepPositionOnRotation;
    }

    public void setKeepPositionOnRotation(boolean keepPositionOnRotation) {
        this.mKeepPositionOnRotation = keepPositionOnRotation;
    }

    public Highlight getHighlightByTouchPoint(float x, float y) {
        if (this.mData == 0) {
            Log.e(Chart.LOG_TAG, "Can't select by touch. No data set.");
            return null;
        }
        return getHighlighter().getHighlight(x, y);
    }

    public PointD getValuesByTouchPoint(float x, float y, YAxis.AxisDependency axis) {
        float[] pts = {x, y};
        getTransformer(axis).pixelsToValue(pts);
        double xTouchVal = pts[0];
        double yTouchVal = pts[1];
        return new PointD(xTouchVal, yTouchVal);
    }

    public PointD getPixelsForValues(float x, float y, YAxis.AxisDependency axis) {
        float[] pts = {x, y};
        getTransformer(axis).pointValuesToPixel(pts);
        return new PointD(pts[0], pts[1]);
    }

    public float getYValueByTouchPoint(float x, float y, YAxis.AxisDependency axis) {
        return (float) getValuesByTouchPoint(x, y, axis).y;
    }

    public Entry getEntryByTouchPoint(float x, float y) {
        Highlight h = getHighlightByTouchPoint(x, y);
        if (h != null) {
            return ((BarLineScatterCandleBubbleData) this.mData).getEntryForHighlight(h);
        }
        return null;
    }

    public IBarLineScatterCandleBubbleDataSet getDataSetByTouchPoint(float x, float y) {
        Highlight h = getHighlightByTouchPoint(x, y);
        if (h != null) {
            return (IBarLineScatterCandleBubbleDataSet) ((BarLineScatterCandleBubbleData) this.mData).getDataSetByIndex(h.getDataSetIndex());
        }
        return null;
    }

    public int getLowestVisibleXIndex() {
        float[] pts = {this.mViewPortHandler.contentLeft(), this.mViewPortHandler.contentBottom()};
        getTransformer(YAxis.AxisDependency.LEFT).pixelsToValue(pts);
        if (pts[0] <= 0.0f) {
            return 0;
        }
        return (int) Math.ceil(pts[0]);
    }

    public int getHighestVisibleXIndex() {
        float[] pts = {this.mViewPortHandler.contentRight(), this.mViewPortHandler.contentBottom()};
        getTransformer(YAxis.AxisDependency.LEFT).pixelsToValue(pts);
        return Math.min(((BarLineScatterCandleBubbleData) this.mData).getXValCount() - 1, (int) Math.floor(pts[0]));
    }

    @Override // android.view.View
    public float getScaleX() {
        if (this.mViewPortHandler == null) {
            return 1.0f;
        }
        return this.mViewPortHandler.getScaleX();
    }

    @Override // android.view.View
    public float getScaleY() {
        if (this.mViewPortHandler == null) {
            return 1.0f;
        }
        return this.mViewPortHandler.getScaleY();
    }

    public boolean isFullyZoomedOut() {
        return this.mViewPortHandler.isFullyZoomedOut();
    }

    public YAxis getAxisLeft() {
        return this.mAxisLeft;
    }

    public YAxis getAxisRight() {
        return this.mAxisRight;
    }

    public YAxis getAxis(YAxis.AxisDependency axis) {
        if (axis == YAxis.AxisDependency.LEFT) {
            return this.mAxisLeft;
        }
        return this.mAxisRight;
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.BarLineScatterCandleBubbleDataProvider
    public boolean isInverted(YAxis.AxisDependency axis) {
        return getAxis(axis).isInverted();
    }

    public void setPinchZoom(boolean enabled) {
        this.mPinchZoomEnabled = enabled;
    }

    public boolean isPinchZoomEnabled() {
        return this.mPinchZoomEnabled;
    }

    public void setDragOffsetX(float offset) {
        this.mViewPortHandler.setDragOffsetX(offset);
    }

    public void setDragOffsetY(float offset) {
        this.mViewPortHandler.setDragOffsetY(offset);
    }

    public boolean hasNoDragOffset() {
        return this.mViewPortHandler.hasNoDragOffset();
    }

    public XAxisRenderer getRendererXAxis() {
        return this.mXAxisRenderer;
    }

    public void setXAxisRenderer(XAxisRenderer xAxisRenderer) {
        this.mXAxisRenderer = xAxisRenderer;
    }

    public YAxisRenderer getRendererLeftYAxis() {
        return this.mAxisRendererLeft;
    }

    public void setRendererLeftYAxis(YAxisRenderer rendererLeftYAxis) {
        this.mAxisRendererLeft = rendererLeftYAxis;
    }

    public YAxisRenderer getRendererRightYAxis() {
        return this.mAxisRendererRight;
    }

    public void setRendererRightYAxis(YAxisRenderer rendererRightYAxis) {
        this.mAxisRendererRight = rendererRightYAxis;
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.ChartInterface
    public float getYChartMax() {
        return Math.max(this.mAxisLeft.mAxisMaximum, this.mAxisRight.mAxisMaximum);
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.ChartInterface
    public float getYChartMin() {
        return Math.min(this.mAxisLeft.mAxisMinimum, this.mAxisRight.mAxisMinimum);
    }

    public boolean isAnyAxisInverted() {
        if (this.mAxisLeft.isInverted() || this.mAxisRight.isInverted()) {
            return true;
        }
        return false;
    }

    public void setAutoScaleMinMaxEnabled(boolean enabled) {
        this.mAutoScaleMinMaxEnabled = enabled;
    }

    public boolean isAutoScaleMinMaxEnabled() {
        return this.mAutoScaleMinMaxEnabled;
    }

    @Override // com.github.mikephil.charting.charts.Chart
    public void setPaint(Paint p, int which) {
        super.setPaint(p, which);
        switch (which) {
            case Chart.PAINT_GRID_BACKGROUND /* 4 */:
                this.mGridBackgroundPaint = p;
                break;
        }
    }

    @Override // com.github.mikephil.charting.charts.Chart
    public Paint getPaint(int which) {
        Paint p = super.getPaint(which);
        if (p != null) {
            return p;
        }
        switch (which) {
            case Chart.PAINT_GRID_BACKGROUND /* 4 */:
                return this.mGridBackgroundPaint;
            default:
                return null;
        }
    }

    @Override // com.github.mikephil.charting.charts.Chart, android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        float[] pts = new float[2];
        if (this.mKeepPositionOnRotation) {
            pts[0] = this.mViewPortHandler.contentLeft();
            pts[1] = this.mViewPortHandler.contentTop();
            getTransformer(YAxis.AxisDependency.LEFT).pixelsToValue(pts);
        }
        super.onSizeChanged(w, h, oldw, oldh);
        if (this.mKeepPositionOnRotation) {
            getTransformer(YAxis.AxisDependency.LEFT).pointValuesToPixel(pts);
            this.mViewPortHandler.centerViewPort(pts, this);
        } else {
            this.mViewPortHandler.refresh(this.mViewPortHandler.getMatrixTouch(), this, true);
        }
    }
}
