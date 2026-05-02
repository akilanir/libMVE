package com.github.mikephil.charting.renderer;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.drawable.Drawable;
import com.github.mikephil.charting.BuildConfig;
import com.github.mikephil.charting.animation.ChartAnimator;
import com.github.mikephil.charting.charts.Chart;
import com.github.mikephil.charting.data.DataSet;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.LineData;
import com.github.mikephil.charting.data.LineDataSet;
import com.github.mikephil.charting.highlight.Highlight;
import com.github.mikephil.charting.interfaces.dataprovider.LineDataProvider;
import com.github.mikephil.charting.interfaces.datasets.ILineDataSet;
import com.github.mikephil.charting.utils.Transformer;
import com.github.mikephil.charting.utils.ViewPortHandler;
import java.lang.ref.WeakReference;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/renderer/LineChartRenderer.class */
public class LineChartRenderer extends LineRadarRenderer {
    protected LineDataProvider mChart;
    protected Paint mCirclePaintInner;
    protected WeakReference<Bitmap> mDrawBitmap;
    protected Canvas mBitmapCanvas;
    protected Bitmap.Config mBitmapConfig;
    protected Path cubicPath;
    protected Path cubicFillPath;
    private float[] mLineBuffer;
    private Path mCirclePathBuffer;

    public LineChartRenderer(LineDataProvider chart, ChartAnimator animator, ViewPortHandler viewPortHandler) {
        super(animator, viewPortHandler);
        this.mBitmapConfig = Bitmap.Config.ARGB_8888;
        this.cubicPath = new Path();
        this.cubicFillPath = new Path();
        this.mLineBuffer = new float[4];
        this.mCirclePathBuffer = new Path();
        this.mChart = chart;
        this.mCirclePaintInner = new Paint(1);
        this.mCirclePaintInner.setStyle(Paint.Style.FILL);
        this.mCirclePaintInner.setColor(-1);
    }

    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void initBuffers() {
    }

    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawData(Canvas c) {
        int width = (int) this.mViewPortHandler.getChartWidth();
        int height = (int) this.mViewPortHandler.getChartHeight();
        if (this.mDrawBitmap == null || this.mDrawBitmap.get().getWidth() != width || this.mDrawBitmap.get().getHeight() != height) {
            if (width > 0 && height > 0) {
                this.mDrawBitmap = new WeakReference<>(Bitmap.createBitmap(width, height, this.mBitmapConfig));
                this.mBitmapCanvas = new Canvas(this.mDrawBitmap.get());
            } else {
                return;
            }
        }
        this.mDrawBitmap.get().eraseColor(0);
        LineData lineData = this.mChart.getLineData();
        for (T set : lineData.getDataSets()) {
            if (set.isVisible() && set.getEntryCount() > 0) {
                drawDataSet(c, set);
            }
        }
        c.drawBitmap(this.mDrawBitmap.get(), 0.0f, 0.0f, this.mRenderPaint);
    }

    protected void drawDataSet(Canvas c, ILineDataSet dataSet) {
        if (dataSet.getEntryCount() < 1) {
            return;
        }
        this.mRenderPaint.setStrokeWidth(dataSet.getLineWidth());
        this.mRenderPaint.setPathEffect(dataSet.getDashPathEffect());
        switch (AnonymousClass1.$SwitchMap$com$github$mikephil$charting$data$LineDataSet$Mode[dataSet.getMode().ordinal()]) {
            case BuildConfig.VERSION_CODE /* 1 */:
            case 2:
            default:
                drawLinear(c, dataSet);
                break;
            case 3:
                drawCubicBezier(c, dataSet);
                break;
            case Chart.PAINT_GRID_BACKGROUND /* 4 */:
                drawHorizontalBezier(c, dataSet);
                break;
        }
        this.mRenderPaint.setPathEffect(null);
    }

    /* renamed from: com.github.mikephil.charting.renderer.LineChartRenderer$1, reason: invalid class name */
    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/renderer/LineChartRenderer$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$github$mikephil$charting$data$LineDataSet$Mode = new int[LineDataSet.Mode.values().length];

        static {
            try {
                $SwitchMap$com$github$mikephil$charting$data$LineDataSet$Mode[LineDataSet.Mode.LINEAR.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$data$LineDataSet$Mode[LineDataSet.Mode.STEPPED.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$data$LineDataSet$Mode[LineDataSet.Mode.CUBIC_BEZIER.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$data$LineDataSet$Mode[LineDataSet.Mode.HORIZONTAL_BEZIER.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
        }
    }

    /* JADX WARN: Type inference failed for: r0v55, types: [com.github.mikephil.charting.data.Entry] */
    /* JADX WARN: Type inference failed for: r0v65, types: [com.github.mikephil.charting.data.Entry] */
    /* JADX WARN: Type inference failed for: r0v67, types: [com.github.mikephil.charting.data.Entry] */
    protected void drawHorizontalBezier(Canvas c, ILineDataSet dataSet) {
        Transformer trans = this.mChart.getTransformer(dataSet.getAxisDependency());
        int entryCount = dataSet.getEntryCount();
        T entryForXIndex = dataSet.getEntryForXIndex(this.mMinX < 0 ? 0 : this.mMinX, DataSet.Rounding.DOWN);
        T entryForXIndex2 = dataSet.getEntryForXIndex(this.mMaxX, DataSet.Rounding.UP);
        int diff = entryForXIndex == entryForXIndex2 ? 1 : 0;
        int minx = Math.max(dataSet.getEntryIndex(entryForXIndex) - diff, 0);
        int maxx = Math.min(Math.max(minx + 2, dataSet.getEntryIndex(entryForXIndex2) + 1), entryCount);
        float phaseX = Math.max(0.0f, Math.min(1.0f, this.mAnimator.getPhaseX()));
        float phaseY = this.mAnimator.getPhaseY();
        this.cubicPath.reset();
        int size = (int) Math.ceil(((maxx - minx) * phaseX) + minx);
        if (size - minx >= 2) {
            this.cubicPath.moveTo(r0.getXIndex(), dataSet.getEntryForIndex(minx).getVal() * phaseY);
            int count = Math.min(size, entryCount);
            for (int j = minx + 1; j < count; j++) {
                ?? entryForIndex = dataSet.getEntryForIndex(j - 1);
                ?? entryForIndex2 = dataSet.getEntryForIndex(j);
                float cpx = entryForIndex.getXIndex() + ((entryForIndex2.getXIndex() - entryForIndex.getXIndex()) / 2.0f);
                this.cubicPath.cubicTo(cpx, entryForIndex.getVal() * phaseY, cpx, entryForIndex2.getVal() * phaseY, entryForIndex2.getXIndex(), entryForIndex2.getVal() * phaseY);
            }
        }
        if (dataSet.isDrawFilledEnabled()) {
            this.cubicFillPath.reset();
            this.cubicFillPath.addPath(this.cubicPath);
            drawCubicFill(this.mBitmapCanvas, dataSet, this.cubicFillPath, trans, minx, size);
        }
        this.mRenderPaint.setColor(dataSet.getColor());
        this.mRenderPaint.setStyle(Paint.Style.STROKE);
        trans.pathValueToPixel(this.cubicPath);
        this.mBitmapCanvas.drawPath(this.cubicPath, this.mRenderPaint);
        this.mRenderPaint.setPathEffect(null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v104, types: [com.github.mikephil.charting.data.Entry] */
    /* JADX WARN: Type inference failed for: r0v62, types: [com.github.mikephil.charting.data.Entry] */
    /* JADX WARN: Type inference failed for: r0v75, types: [com.github.mikephil.charting.data.Entry] */
    /* JADX WARN: Type inference failed for: r0v77, types: [com.github.mikephil.charting.data.Entry] */
    /* JADX WARN: Type inference failed for: r0v79, types: [com.github.mikephil.charting.data.Entry] */
    /* JADX WARN: Type inference failed for: r0v81 */
    /* JADX WARN: Type inference failed for: r0v82 */
    protected void drawCubicBezier(Canvas c, ILineDataSet dataSet) {
        Transformer trans = this.mChart.getTransformer(dataSet.getAxisDependency());
        int entryCount = dataSet.getEntryCount();
        Object entryForXIndex = dataSet.getEntryForXIndex(this.mMinX < 0 ? 0 : this.mMinX, DataSet.Rounding.DOWN);
        Object entryForXIndex2 = dataSet.getEntryForXIndex(this.mMaxX, DataSet.Rounding.UP);
        int diff = entryForXIndex == entryForXIndex2 ? 1 : 0;
        int minx = Math.max((dataSet.getEntryIndex(entryForXIndex) - diff) - 1, 0);
        int maxx = Math.min(Math.max(minx + 2, dataSet.getEntryIndex(entryForXIndex2) + 1), entryCount);
        float phaseX = Math.max(0.0f, Math.min(1.0f, this.mAnimator.getPhaseX()));
        float phaseY = this.mAnimator.getPhaseY();
        float intensity = dataSet.getCubicIntensity();
        this.cubicPath.reset();
        int size = (int) Math.ceil(((maxx - minx) * phaseX) + minx);
        if (size - minx >= 2) {
            ?? entryForIndex = dataSet.getEntryForIndex(minx);
            dataSet.getEntryForIndex(minx + 1);
            this.cubicPath.moveTo(entryForIndex.getXIndex(), entryForIndex.getVal() * phaseY);
            int j = minx + 1;
            int count = Math.min(size, entryCount);
            while (j < count) {
                ?? entryForIndex2 = dataSet.getEntryForIndex(j == 1 ? 0 : j - 2);
                ?? entryForIndex3 = dataSet.getEntryForIndex(j - 1);
                ?? entryForIndex4 = dataSet.getEntryForIndex(j);
                Entry next = entryCount > j + 1 ? dataSet.getEntryForIndex(j + 1) : entryForIndex4;
                float prevDx = (entryForIndex4.getXIndex() - entryForIndex2.getXIndex()) * intensity;
                float prevDy = (entryForIndex4.getVal() - entryForIndex2.getVal()) * intensity;
                float curDx = (next.getXIndex() - entryForIndex3.getXIndex()) * intensity;
                float curDy = (next.getVal() - entryForIndex3.getVal()) * intensity;
                this.cubicPath.cubicTo(entryForIndex3.getXIndex() + prevDx, (entryForIndex3.getVal() + prevDy) * phaseY, entryForIndex4.getXIndex() - curDx, (entryForIndex4.getVal() - curDy) * phaseY, entryForIndex4.getXIndex(), entryForIndex4.getVal() * phaseY);
                j++;
            }
        }
        if (dataSet.isDrawFilledEnabled()) {
            this.cubicFillPath.reset();
            this.cubicFillPath.addPath(this.cubicPath);
            drawCubicFill(this.mBitmapCanvas, dataSet, this.cubicFillPath, trans, minx, size);
        }
        this.mRenderPaint.setColor(dataSet.getColor());
        this.mRenderPaint.setStyle(Paint.Style.STROKE);
        trans.pathValueToPixel(this.cubicPath);
        this.mBitmapCanvas.drawPath(this.cubicPath, this.mRenderPaint);
        this.mRenderPaint.setPathEffect(null);
    }

    /* JADX WARN: Type inference failed for: r0v6, types: [com.github.mikephil.charting.data.Entry] */
    /* JADX WARN: Type inference failed for: r0v8, types: [com.github.mikephil.charting.data.Entry] */
    protected void drawCubicFill(Canvas c, ILineDataSet dataSet, Path spline, Transformer trans, int from, int to) {
        if (to - from <= 1) {
            return;
        }
        float fillMin = dataSet.getFillFormatter().getFillLinePosition(dataSet, this.mChart);
        ?? entryForIndex = dataSet.getEntryForIndex(to - 1);
        ?? entryForIndex2 = dataSet.getEntryForIndex(from);
        float xTo = entryForIndex == 0 ? 0.0f : entryForIndex.getXIndex();
        float xFrom = entryForIndex2 == 0 ? 0.0f : entryForIndex2.getXIndex();
        spline.lineTo(xTo, fillMin);
        spline.lineTo(xFrom, fillMin);
        spline.close();
        trans.pathValueToPixel(spline);
        Drawable drawable = dataSet.getFillDrawable();
        if (drawable != null) {
            drawFilledPath(c, spline, drawable);
        } else {
            drawFilledPath(c, spline, dataSet.getFillColor(), dataSet.getFillAlpha());
        }
    }

    /* JADX WARN: Type inference failed for: r0v109, types: [com.github.mikephil.charting.data.Entry] */
    /* JADX WARN: Type inference failed for: r0v144, types: [com.github.mikephil.charting.data.Entry] */
    /* JADX WARN: Type inference failed for: r0v70, types: [com.github.mikephil.charting.data.Entry] */
    /* JADX WARN: Type inference failed for: r0v72, types: [com.github.mikephil.charting.data.Entry] */
    protected void drawLinear(Canvas c, ILineDataSet dataSet) {
        Canvas canvas;
        int entryCount = dataSet.getEntryCount();
        boolean isDrawSteppedEnabled = dataSet.isDrawSteppedEnabled();
        int pointsPerEntryPair = isDrawSteppedEnabled ? 4 : 2;
        Transformer trans = this.mChart.getTransformer(dataSet.getAxisDependency());
        float phaseX = Math.max(0.0f, Math.min(1.0f, this.mAnimator.getPhaseX()));
        float phaseY = this.mAnimator.getPhaseY();
        this.mRenderPaint.setStyle(Paint.Style.STROKE);
        if (dataSet.isDashedLineEnabled()) {
            canvas = this.mBitmapCanvas;
        } else {
            canvas = c;
        }
        T entryForXIndex = dataSet.getEntryForXIndex(this.mMinX < 0 ? 0 : this.mMinX, DataSet.Rounding.DOWN);
        T entryForXIndex2 = dataSet.getEntryForXIndex(this.mMaxX, DataSet.Rounding.UP);
        int diff = entryForXIndex == entryForXIndex2 ? 1 : 0;
        int minx = Math.max(dataSet.getEntryIndex(entryForXIndex) - diff, 0);
        int maxx = Math.min(Math.max(minx + 2, dataSet.getEntryIndex(entryForXIndex2) + 1), entryCount);
        int count = (int) Math.ceil(((maxx - minx) * phaseX) + minx);
        if (dataSet.getColors().size() > 1) {
            if (this.mLineBuffer.length != pointsPerEntryPair * 2) {
                this.mLineBuffer = new float[pointsPerEntryPair * 2];
            }
            for (int j = minx; j < count && (count <= 1 || j != count - 1); j++) {
                ?? entryForIndex = dataSet.getEntryForIndex(j);
                if (entryForIndex != 0) {
                    this.mLineBuffer[0] = entryForIndex.getXIndex();
                    this.mLineBuffer[1] = entryForIndex.getVal() * phaseY;
                    if (j + 1 < count) {
                        ?? entryForIndex2 = dataSet.getEntryForIndex(j + 1);
                        if (entryForIndex2 == 0) {
                            break;
                        }
                        if (isDrawSteppedEnabled) {
                            this.mLineBuffer[2] = entryForIndex2.getXIndex();
                            this.mLineBuffer[3] = this.mLineBuffer[1];
                            this.mLineBuffer[4] = this.mLineBuffer[2];
                            this.mLineBuffer[5] = this.mLineBuffer[3];
                            this.mLineBuffer[6] = entryForIndex2.getXIndex();
                            this.mLineBuffer[7] = entryForIndex2.getVal() * phaseY;
                        } else {
                            this.mLineBuffer[2] = entryForIndex2.getXIndex();
                            this.mLineBuffer[3] = entryForIndex2.getVal() * phaseY;
                        }
                    } else {
                        this.mLineBuffer[2] = this.mLineBuffer[0];
                        this.mLineBuffer[3] = this.mLineBuffer[1];
                    }
                    trans.pointValuesToPixel(this.mLineBuffer);
                    if (!this.mViewPortHandler.isInBoundsRight(this.mLineBuffer[0])) {
                        break;
                    }
                    if (this.mViewPortHandler.isInBoundsLeft(this.mLineBuffer[2]) && ((this.mViewPortHandler.isInBoundsTop(this.mLineBuffer[1]) || this.mViewPortHandler.isInBoundsBottom(this.mLineBuffer[3])) && (this.mViewPortHandler.isInBoundsTop(this.mLineBuffer[1]) || this.mViewPortHandler.isInBoundsBottom(this.mLineBuffer[3])))) {
                        this.mRenderPaint.setColor(dataSet.getColor(j));
                        canvas.drawLines(this.mLineBuffer, 0, pointsPerEntryPair * 2, this.mRenderPaint);
                    }
                }
            }
        } else {
            if (this.mLineBuffer.length != Math.max((entryCount - 1) * pointsPerEntryPair, pointsPerEntryPair) * 2) {
                this.mLineBuffer = new float[Math.max((entryCount - 1) * pointsPerEntryPair, pointsPerEntryPair) * 2];
            }
            if (dataSet.getEntryForIndex(minx) != 0) {
                int j2 = 0;
                int x = count > 1 ? minx + 1 : minx;
                while (x < count) {
                    ?? entryForIndex3 = dataSet.getEntryForIndex(x == 0 ? 0 : x - 1);
                    ?? entryForIndex4 = dataSet.getEntryForIndex(x);
                    if (entryForIndex3 != 0 && entryForIndex4 != 0) {
                        int i = j2;
                        int j3 = j2 + 1;
                        this.mLineBuffer[i] = entryForIndex3.getXIndex();
                        int j4 = j3 + 1;
                        this.mLineBuffer[j3] = entryForIndex3.getVal() * phaseY;
                        if (isDrawSteppedEnabled) {
                            int j5 = j4 + 1;
                            this.mLineBuffer[j4] = entryForIndex4.getXIndex();
                            int j6 = j5 + 1;
                            this.mLineBuffer[j5] = entryForIndex3.getVal() * phaseY;
                            int j7 = j6 + 1;
                            this.mLineBuffer[j6] = entryForIndex4.getXIndex();
                            j4 = j7 + 1;
                            this.mLineBuffer[j7] = entryForIndex3.getVal() * phaseY;
                        }
                        int i2 = j4;
                        int j8 = j4 + 1;
                        this.mLineBuffer[i2] = entryForIndex4.getXIndex();
                        j2 = j8 + 1;
                        this.mLineBuffer[j8] = entryForIndex4.getVal() * phaseY;
                    }
                    x++;
                }
                if (j2 > 0) {
                    trans.pointValuesToPixel(this.mLineBuffer);
                    int size = Math.max(((count - minx) - 1) * pointsPerEntryPair, pointsPerEntryPair) * 2;
                    this.mRenderPaint.setColor(dataSet.getColor());
                    canvas.drawLines(this.mLineBuffer, 0, size, this.mRenderPaint);
                }
            }
        }
        this.mRenderPaint.setPathEffect(null);
        if (dataSet.isDrawFilledEnabled() && entryCount > 0) {
            drawLinearFill(c, dataSet, minx, maxx, trans);
        }
    }

    protected void drawLinearFill(Canvas c, ILineDataSet dataSet, int minx, int maxx, Transformer trans) {
        Path filled = generateFilledPath(dataSet, minx, maxx);
        trans.pathValueToPixel(filled);
        Drawable drawable = dataSet.getFillDrawable();
        if (drawable != null) {
            drawFilledPath(c, filled, drawable);
        } else {
            drawFilledPath(c, filled, dataSet.getFillColor(), dataSet.getFillAlpha());
        }
    }

    /* JADX WARN: Type inference failed for: r0v12, types: [com.github.mikephil.charting.data.Entry] */
    /* JADX WARN: Type inference failed for: r0v30, types: [com.github.mikephil.charting.data.Entry] */
    /* JADX WARN: Type inference failed for: r0v34, types: [com.github.mikephil.charting.data.Entry] */
    /* JADX WARN: Type inference failed for: r1v18, types: [com.github.mikephil.charting.data.Entry] */
    private Path generateFilledPath(ILineDataSet dataSet, int from, int to) {
        float fillMin = dataSet.getFillFormatter().getFillLinePosition(dataSet, this.mChart);
        float phaseX = Math.max(0.0f, Math.min(1.0f, this.mAnimator.getPhaseX()));
        float phaseY = this.mAnimator.getPhaseY();
        boolean isDrawSteppedEnabled = dataSet.isDrawSteppedEnabled();
        Path filled = new Path();
        ?? entryForIndex = dataSet.getEntryForIndex(from);
        filled.moveTo(entryForIndex.getXIndex(), fillMin);
        filled.lineTo(entryForIndex.getXIndex(), entryForIndex.getVal() * phaseY);
        int count = (int) Math.ceil(((to - from) * phaseX) + from);
        for (int x = from + 1; x < count; x++) {
            ?? entryForIndex2 = dataSet.getEntryForIndex(x);
            if (isDrawSteppedEnabled) {
                ?? entryForIndex3 = dataSet.getEntryForIndex(x - 1);
                if (entryForIndex3 != 0) {
                    filled.lineTo(entryForIndex2.getXIndex(), entryForIndex3.getVal() * phaseY);
                    filled.lineTo(entryForIndex2.getXIndex(), entryForIndex2.getVal() * phaseY);
                }
            } else {
                filled.lineTo(entryForIndex2.getXIndex(), entryForIndex2.getVal() * phaseY);
            }
        }
        filled.lineTo(dataSet.getEntryForIndex(Math.max(Math.min(((int) Math.ceil(((to - from) * phaseX) + from)) - 1, dataSet.getEntryCount() - 1), 0)).getXIndex(), fillMin);
        filled.close();
        return filled;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v66, types: [com.github.mikephil.charting.data.Entry] */
    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawValues(Canvas c) {
        if (this.mChart.getLineData().getYValCount() < this.mChart.getMaxVisibleCount() * this.mViewPortHandler.getScaleX()) {
            List<T> dataSets = this.mChart.getLineData().getDataSets();
            for (int i = 0; i < dataSets.size(); i++) {
                ILineDataSet dataSet = (ILineDataSet) dataSets.get(i);
                if (dataSet.isDrawValuesEnabled() && dataSet.getEntryCount() != 0) {
                    applyValueTextStyle(dataSet);
                    Transformer trans = this.mChart.getTransformer(dataSet.getAxisDependency());
                    int valOffset = (int) (dataSet.getCircleRadius() * 1.75f);
                    if (!dataSet.isDrawCirclesEnabled()) {
                        valOffset /= 2;
                    }
                    int entryCount = dataSet.getEntryCount();
                    T entryForXIndex = dataSet.getEntryForXIndex(this.mMinX < 0 ? 0 : this.mMinX, DataSet.Rounding.DOWN);
                    T entryForXIndex2 = dataSet.getEntryForXIndex(this.mMaxX, DataSet.Rounding.UP);
                    int diff = entryForXIndex == entryForXIndex2 ? 1 : 0;
                    if (dataSet.getMode() == LineDataSet.Mode.CUBIC_BEZIER) {
                        diff++;
                    }
                    int minx = Math.max(dataSet.getEntryIndex(entryForXIndex) - diff, 0);
                    int maxx = Math.min(Math.max(minx + 2, dataSet.getEntryIndex(entryForXIndex2) + 1), entryCount);
                    float[] positions = trans.generateTransformedValuesLine(dataSet, this.mAnimator.getPhaseX(), this.mAnimator.getPhaseY(), minx, maxx);
                    for (int j = 0; j < positions.length; j += 2) {
                        float x = positions[j];
                        float y = positions[j + 1];
                        if (!this.mViewPortHandler.isInBoundsRight(x)) {
                            break;
                        }
                        if (this.mViewPortHandler.isInBoundsLeft(x) && this.mViewPortHandler.isInBoundsY(y)) {
                            ?? entryForIndex = dataSet.getEntryForIndex((j / 2) + minx);
                            drawValue(c, dataSet.getValueFormatter(), entryForIndex.getVal(), entryForIndex, i, x, y - valOffset, dataSet.getValueTextColor(j / 2));
                        }
                    }
                }
            }
        }
    }

    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawExtras(Canvas c) {
        drawCircles(c);
    }

    /* JADX WARN: Type inference failed for: r0v70, types: [com.github.mikephil.charting.data.Entry] */
    protected void drawCircles(Canvas c) {
        ?? entryForIndex;
        this.mRenderPaint.setStyle(Paint.Style.FILL);
        float phaseX = Math.max(0.0f, Math.min(1.0f, this.mAnimator.getPhaseX()));
        float phaseY = this.mAnimator.getPhaseY();
        float[] circlesBuffer = new float[2];
        List<T> dataSets = this.mChart.getLineData().getDataSets();
        for (int i = 0; i < dataSets.size(); i++) {
            ILineDataSet dataSet = (ILineDataSet) dataSets.get(i);
            if (dataSet.isVisible() && dataSet.isDrawCirclesEnabled() && dataSet.getEntryCount() != 0) {
                this.mCirclePaintInner.setColor(dataSet.getCircleHoleColor());
                Transformer trans = this.mChart.getTransformer(dataSet.getAxisDependency());
                int entryCount = dataSet.getEntryCount();
                T entryForXIndex = dataSet.getEntryForXIndex(this.mMinX < 0 ? 0 : this.mMinX, DataSet.Rounding.DOWN);
                T entryForXIndex2 = dataSet.getEntryForXIndex(this.mMaxX, DataSet.Rounding.UP);
                int diff = entryForXIndex == entryForXIndex2 ? 1 : 0;
                if (dataSet.getMode() == LineDataSet.Mode.CUBIC_BEZIER) {
                    diff++;
                }
                int minx = Math.max(dataSet.getEntryIndex(entryForXIndex) - diff, 0);
                int maxx = Math.min(Math.max(minx + 2, dataSet.getEntryIndex(entryForXIndex2) + 1), entryCount);
                float circleRadius = dataSet.getCircleRadius();
                float circleHoleRadius = dataSet.getCircleHoleRadius();
                boolean drawCircleHole = dataSet.isDrawCircleHoleEnabled() && circleHoleRadius < circleRadius && circleHoleRadius > 0.0f;
                boolean drawTransparentCircleHole = drawCircleHole && dataSet.getCircleHoleColor() == 1122867;
                int count = (int) Math.ceil(((maxx - minx) * phaseX) + minx);
                for (int j = minx; j < count && (entryForIndex = dataSet.getEntryForIndex(j)) != 0; j++) {
                    circlesBuffer[0] = entryForIndex.getXIndex();
                    circlesBuffer[1] = entryForIndex.getVal() * phaseY;
                    trans.pointValuesToPixel(circlesBuffer);
                    if (!this.mViewPortHandler.isInBoundsRight(circlesBuffer[0])) {
                        break;
                    }
                    if (this.mViewPortHandler.isInBoundsLeft(circlesBuffer[0]) && this.mViewPortHandler.isInBoundsY(circlesBuffer[1])) {
                        this.mRenderPaint.setColor(dataSet.getCircleColor(j));
                        if (drawTransparentCircleHole) {
                            this.mCirclePathBuffer.reset();
                            this.mCirclePathBuffer.addCircle(circlesBuffer[0], circlesBuffer[1], circleRadius, Path.Direction.CW);
                            this.mCirclePathBuffer.addCircle(circlesBuffer[0], circlesBuffer[1], circleHoleRadius, Path.Direction.CCW);
                            c.drawPath(this.mCirclePathBuffer, this.mRenderPaint);
                        } else {
                            c.drawCircle(circlesBuffer[0], circlesBuffer[1], circleRadius, this.mRenderPaint);
                            if (drawCircleHole) {
                                c.drawCircle(circlesBuffer[0], circlesBuffer[1], circleHoleRadius, this.mCirclePaintInner);
                            }
                        }
                    }
                }
            }
        }
    }

    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawHighlighted(Canvas c, Highlight[] indices) {
        LineData lineData = this.mChart.getLineData();
        for (Highlight high : indices) {
            int minDataSetIndex = high.getDataSetIndex() == -1 ? 0 : high.getDataSetIndex();
            int maxDataSetIndex = high.getDataSetIndex() == -1 ? lineData.getDataSetCount() : high.getDataSetIndex() + 1;
            if (maxDataSetIndex - minDataSetIndex >= 1) {
                for (int dataSetIndex = minDataSetIndex; dataSetIndex < maxDataSetIndex; dataSetIndex++) {
                    ILineDataSet set = (ILineDataSet) lineData.getDataSetByIndex(dataSetIndex);
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

    public void setBitmapConfig(Bitmap.Config config) {
        this.mBitmapConfig = config;
        releaseBitmap();
    }

    public Bitmap.Config getBitmapConfig() {
        return this.mBitmapConfig;
    }

    public void releaseBitmap() {
        if (this.mBitmapCanvas != null) {
            this.mBitmapCanvas.setBitmap(null);
            this.mBitmapCanvas = null;
        }
        if (this.mDrawBitmap != null) {
            this.mDrawBitmap.get().recycle();
            this.mDrawBitmap.clear();
            this.mDrawBitmap = null;
        }
    }
}
