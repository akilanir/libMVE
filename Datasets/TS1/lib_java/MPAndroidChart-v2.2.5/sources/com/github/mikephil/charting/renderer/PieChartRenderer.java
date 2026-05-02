package com.github.mikephil.charting.renderer;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PointF;
import android.graphics.RectF;
import android.os.Build;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import com.github.mikephil.charting.animation.ChartAnimator;
import com.github.mikephil.charting.charts.PieChart;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.PieData;
import com.github.mikephil.charting.data.PieDataSet;
import com.github.mikephil.charting.formatter.ValueFormatter;
import com.github.mikephil.charting.highlight.Highlight;
import com.github.mikephil.charting.interfaces.datasets.IPieDataSet;
import com.github.mikephil.charting.utils.Utils;
import com.github.mikephil.charting.utils.ViewPortHandler;
import java.lang.ref.WeakReference;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/renderer/PieChartRenderer.class */
public class PieChartRenderer extends DataRenderer {
    protected PieChart mChart;
    protected Paint mHolePaint;
    protected Paint mTransparentCirclePaint;
    protected Paint mValueLinePaint;
    private TextPaint mCenterTextPaint;
    private StaticLayout mCenterTextLayout;
    private CharSequence mCenterTextLastValue;
    private RectF mCenterTextLastBounds;
    private RectF[] mRectBuffer;
    protected WeakReference<Bitmap> mDrawBitmap;
    protected Canvas mBitmapCanvas;
    private Path mPathBuffer;
    private RectF mInnerRectBuffer;
    private Path mHoleCirclePath;

    public PieChartRenderer(PieChart chart, ChartAnimator animator, ViewPortHandler viewPortHandler) {
        super(animator, viewPortHandler);
        this.mCenterTextLastBounds = new RectF();
        this.mRectBuffer = new RectF[]{new RectF(), new RectF(), new RectF()};
        this.mPathBuffer = new Path();
        this.mInnerRectBuffer = new RectF();
        this.mHoleCirclePath = new Path();
        this.mChart = chart;
        this.mHolePaint = new Paint(1);
        this.mHolePaint.setColor(-1);
        this.mHolePaint.setStyle(Paint.Style.FILL);
        this.mTransparentCirclePaint = new Paint(1);
        this.mTransparentCirclePaint.setColor(-1);
        this.mTransparentCirclePaint.setStyle(Paint.Style.FILL);
        this.mTransparentCirclePaint.setAlpha(105);
        this.mCenterTextPaint = new TextPaint(1);
        this.mCenterTextPaint.setColor(-16777216);
        this.mCenterTextPaint.setTextSize(Utils.convertDpToPixel(12.0f));
        this.mValuePaint.setTextSize(Utils.convertDpToPixel(13.0f));
        this.mValuePaint.setColor(-1);
        this.mValuePaint.setTextAlign(Paint.Align.CENTER);
        this.mValueLinePaint = new Paint(1);
        this.mValueLinePaint.setStyle(Paint.Style.STROKE);
    }

    public Paint getPaintHole() {
        return this.mHolePaint;
    }

    public Paint getPaintTransparentCircle() {
        return this.mTransparentCirclePaint;
    }

    public TextPaint getPaintCenterText() {
        return this.mCenterTextPaint;
    }

    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void initBuffers() {
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawData(Canvas c) {
        int width = (int) this.mViewPortHandler.getChartWidth();
        int height = (int) this.mViewPortHandler.getChartHeight();
        if (this.mDrawBitmap == null || this.mDrawBitmap.get().getWidth() != width || this.mDrawBitmap.get().getHeight() != height) {
            if (width > 0 && height > 0) {
                this.mDrawBitmap = new WeakReference<>(Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_4444));
                this.mBitmapCanvas = new Canvas(this.mDrawBitmap.get());
            } else {
                return;
            }
        }
        this.mDrawBitmap.get().eraseColor(0);
        PieData pieData = (PieData) this.mChart.getData();
        for (IPieDataSet set : pieData.getDataSets()) {
            if (set.isVisible() && set.getEntryCount() > 0) {
                drawDataSet(c, set);
            }
        }
    }

    protected float calculateMinimumRadiusForSpacedSlice(PointF center, float radius, float angle, float arcStartPointX, float arcStartPointY, float startAngle, float sweepAngle) {
        float angleMiddle = startAngle + (sweepAngle / 2.0f);
        float arcEndPointX = center.x + (radius * ((float) Math.cos((startAngle + sweepAngle) * 0.017453292f)));
        float arcEndPointY = center.y + (radius * ((float) Math.sin((startAngle + sweepAngle) * 0.017453292f)));
        float arcMidPointX = center.x + (radius * ((float) Math.cos(angleMiddle * 0.017453292f)));
        float arcMidPointY = center.y + (radius * ((float) Math.sin(angleMiddle * 0.017453292f)));
        double basePointsDistance = Math.sqrt(Math.pow(arcEndPointX - arcStartPointX, 2.0d) + Math.pow(arcEndPointY - arcStartPointY, 2.0d));
        float containedTriangleHeight = (float) ((basePointsDistance / 2.0d) * Math.tan(((180.0d - angle) / 2.0d) * 0.017453292519943295d));
        float spacedRadius = radius - containedTriangleHeight;
        return (float) (spacedRadius - Math.sqrt(Math.pow(arcMidPointX - ((arcEndPointX + arcStartPointX) / 2.0f), 2.0d) + Math.pow(arcMidPointY - ((arcEndPointY + arcStartPointY) / 2.0f), 2.0d)));
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected void drawDataSet(Canvas c, IPieDataSet dataSet) {
        float angle = 0.0f;
        float rotationAngle = this.mChart.getRotationAngle();
        float phaseX = this.mAnimator.getPhaseX();
        float phaseY = this.mAnimator.getPhaseY();
        RectF circleBox = this.mChart.getCircleBox();
        int entryCount = dataSet.getEntryCount();
        float[] drawAngles = this.mChart.getDrawAngles();
        PointF center = this.mChart.getCenterCircleBox();
        float radius = this.mChart.getRadius();
        boolean drawInnerArc = this.mChart.isDrawHoleEnabled() && !this.mChart.isDrawSlicesUnderHoleEnabled();
        float userInnerRadius = drawInnerArc ? radius * (this.mChart.getHoleRadius() / 100.0f) : 0.0f;
        int visibleAngleCount = 0;
        for (int j = 0; j < entryCount; j++) {
            if (Math.abs(dataSet.getEntryForIndex(j).getVal()) > 1.0E-6d) {
                visibleAngleCount++;
            }
        }
        float sliceSpace = visibleAngleCount <= 1 ? 0.0f : dataSet.getSliceSpace();
        for (int j2 = 0; j2 < entryCount; j2++) {
            float sliceAngle = drawAngles[j2];
            float innerRadius = userInnerRadius;
            Entry e = dataSet.getEntryForIndex(j2);
            if (Math.abs(e.getVal()) > 1.0E-6d && !this.mChart.needsHighlight(e.getXIndex(), ((PieData) this.mChart.getData()).getIndexOfDataSet(dataSet))) {
                boolean accountForSliceSpacing = sliceSpace > 0.0f && sliceAngle <= 180.0f;
                this.mRenderPaint.setColor(dataSet.getColor(j2));
                float sliceSpaceAngleOuter = visibleAngleCount == 1 ? 0.0f : sliceSpace / (0.017453292f * radius);
                float startAngleOuter = rotationAngle + ((angle + (sliceSpaceAngleOuter / 2.0f)) * phaseY);
                float sweepAngleOuter = (sliceAngle - sliceSpaceAngleOuter) * phaseY;
                if (sweepAngleOuter < 0.0f) {
                    sweepAngleOuter = 0.0f;
                }
                this.mPathBuffer.reset();
                float arcStartPointX = 0.0f;
                float arcStartPointY = 0.0f;
                if (sweepAngleOuter % 360.0f == 0.0f) {
                    this.mPathBuffer.addCircle(center.x, center.y, radius, Path.Direction.CW);
                } else {
                    arcStartPointX = center.x + (radius * ((float) Math.cos(startAngleOuter * 0.017453292f)));
                    arcStartPointY = center.y + (radius * ((float) Math.sin(startAngleOuter * 0.017453292f)));
                    this.mPathBuffer.moveTo(arcStartPointX, arcStartPointY);
                    this.mPathBuffer.arcTo(circleBox, startAngleOuter, sweepAngleOuter);
                }
                this.mInnerRectBuffer.set(center.x - innerRadius, center.y - innerRadius, center.x + innerRadius, center.y + innerRadius);
                if (drawInnerArc && (innerRadius > 0.0f || accountForSliceSpacing)) {
                    if (accountForSliceSpacing) {
                        float minSpacedRadius = calculateMinimumRadiusForSpacedSlice(center, radius, sliceAngle * phaseY, arcStartPointX, arcStartPointY, startAngleOuter, sweepAngleOuter);
                        if (minSpacedRadius < 0.0f) {
                            minSpacedRadius = -minSpacedRadius;
                        }
                        innerRadius = Math.max(innerRadius, minSpacedRadius);
                    }
                    float sliceSpaceAngleInner = (visibleAngleCount == 1 || innerRadius == 0.0f) ? 0.0f : sliceSpace / (0.017453292f * innerRadius);
                    float startAngleInner = rotationAngle + ((angle + (sliceSpaceAngleInner / 2.0f)) * phaseY);
                    float sweepAngleInner = (sliceAngle - sliceSpaceAngleInner) * phaseY;
                    if (sweepAngleInner < 0.0f) {
                        sweepAngleInner = 0.0f;
                    }
                    float endAngleInner = startAngleInner + sweepAngleInner;
                    if (sweepAngleOuter % 360.0f == 0.0f) {
                        this.mPathBuffer.addCircle(center.x, center.y, innerRadius, Path.Direction.CCW);
                    } else {
                        this.mPathBuffer.lineTo(center.x + (innerRadius * ((float) Math.cos(endAngleInner * 0.017453292f))), center.y + (innerRadius * ((float) Math.sin(endAngleInner * 0.017453292f))));
                        this.mPathBuffer.arcTo(this.mInnerRectBuffer, endAngleInner, -sweepAngleInner);
                    }
                } else if (sweepAngleOuter % 360.0f != 0.0f) {
                    if (accountForSliceSpacing) {
                        float angleMiddle = startAngleOuter + (sweepAngleOuter / 2.0f);
                        float sliceSpaceOffset = calculateMinimumRadiusForSpacedSlice(center, radius, sliceAngle * phaseY, arcStartPointX, arcStartPointY, startAngleOuter, sweepAngleOuter);
                        float arcEndPointX = center.x + (sliceSpaceOffset * ((float) Math.cos(angleMiddle * 0.017453292f)));
                        float arcEndPointY = center.y + (sliceSpaceOffset * ((float) Math.sin(angleMiddle * 0.017453292f)));
                        this.mPathBuffer.lineTo(arcEndPointX, arcEndPointY);
                    } else {
                        this.mPathBuffer.lineTo(center.x, center.y);
                    }
                }
                this.mPathBuffer.close();
                this.mBitmapCanvas.drawPath(this.mPathBuffer, this.mRenderPaint);
            }
            angle += sliceAngle * phaseX;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawValues(Canvas c) {
        float angle;
        float line1Radius;
        float pt2x;
        float pt2y;
        float labelPtx;
        float labelPty;
        PointF center = this.mChart.getCenterCircleBox();
        float radius = this.mChart.getRadius();
        float rotationAngle = this.mChart.getRotationAngle();
        float[] drawAngles = this.mChart.getDrawAngles();
        float[] absoluteAngles = this.mChart.getAbsoluteAngles();
        float phaseX = this.mAnimator.getPhaseX();
        float phaseY = this.mAnimator.getPhaseY();
        float holeRadiusPercent = this.mChart.getHoleRadius() / 100.0f;
        float labelRadiusOffset = (radius / 10.0f) * 3.6f;
        if (this.mChart.isDrawHoleEnabled()) {
            labelRadiusOffset = (radius - (radius * holeRadiusPercent)) / 2.0f;
        }
        float labelRadius = radius - labelRadiusOffset;
        PieData data = (PieData) this.mChart.getData();
        List<IPieDataSet> dataSets = data.getDataSets();
        float yValueSum = data.getYValueSum();
        boolean drawXVals = this.mChart.isDrawSliceTextEnabled();
        int xIndex = 0;
        c.save();
        for (int i = 0; i < dataSets.size(); i++) {
            IPieDataSet dataSet = dataSets.get(i);
            boolean drawYVals = dataSet.isDrawValuesEnabled();
            if (drawYVals || drawXVals) {
                PieDataSet.ValuePosition xValuePosition = dataSet.getXValuePosition();
                PieDataSet.ValuePosition yValuePosition = dataSet.getYValuePosition();
                applyValueTextStyle(dataSet);
                float lineHeight = Utils.calcTextHeight(this.mValuePaint, "Q") + Utils.convertDpToPixel(4.0f);
                ValueFormatter formatter = dataSet.getValueFormatter();
                int entryCount = dataSet.getEntryCount();
                this.mValueLinePaint.setColor(dataSet.getValueLineColor());
                this.mValueLinePaint.setStrokeWidth(Utils.convertDpToPixel(dataSet.getValueLineWidth()));
                for (int j = 0; j < entryCount; j++) {
                    Entry entry = dataSet.getEntryForIndex(j);
                    if (xIndex == 0) {
                        angle = 0.0f;
                    } else {
                        angle = absoluteAngles[xIndex - 1] * phaseX;
                    }
                    float sliceAngle = drawAngles[xIndex];
                    float sliceSpace = dataSet.getSliceSpace();
                    float sliceSpaceMiddleAngle = sliceSpace / (0.017453292f * labelRadius);
                    float angleOffset = (sliceAngle - (sliceSpaceMiddleAngle / 2.0f)) / 2.0f;
                    float transformedAngle = rotationAngle + ((angle + angleOffset) * phaseY);
                    float value = this.mChart.isUsePercentValuesEnabled() ? (entry.getVal() / yValueSum) * 100.0f : entry.getVal();
                    float sliceXBase = (float) Math.cos(transformedAngle * 0.017453292f);
                    float sliceYBase = (float) Math.sin(transformedAngle * 0.017453292f);
                    boolean drawXOutside = drawXVals && xValuePosition == PieDataSet.ValuePosition.OUTSIDE_SLICE;
                    boolean drawYOutside = drawYVals && yValuePosition == PieDataSet.ValuePosition.OUTSIDE_SLICE;
                    boolean drawXInside = drawXVals && xValuePosition == PieDataSet.ValuePosition.INSIDE_SLICE;
                    boolean drawYInside = drawYVals && yValuePosition == PieDataSet.ValuePosition.INSIDE_SLICE;
                    if (drawXOutside || drawYOutside) {
                        float valueLineLength1 = dataSet.getValueLinePart1Length();
                        float valueLineLength2 = dataSet.getValueLinePart2Length();
                        float valueLinePart1OffsetPercentage = dataSet.getValueLinePart1OffsetPercentage() / 100.0f;
                        if (this.mChart.isDrawHoleEnabled()) {
                            line1Radius = ((radius - (radius * holeRadiusPercent)) * valueLinePart1OffsetPercentage) + (radius * holeRadiusPercent);
                        } else {
                            line1Radius = radius * valueLinePart1OffsetPercentage;
                        }
                        float polyline2Width = dataSet.isValueLineVariableLength() ? labelRadius * valueLineLength2 * ((float) Math.abs(Math.sin(transformedAngle * 0.017453292f))) : labelRadius * valueLineLength2;
                        float pt0x = (line1Radius * sliceXBase) + center.x;
                        float pt0y = (line1Radius * sliceYBase) + center.y;
                        float pt1x = (labelRadius * (1.0f + valueLineLength1) * sliceXBase) + center.x;
                        float pt1y = (labelRadius * (1.0f + valueLineLength1) * sliceYBase) + center.y;
                        if (transformedAngle % 360.0d >= 90.0d && transformedAngle % 360.0d <= 270.0d) {
                            pt2x = pt1x - polyline2Width;
                            pt2y = pt1y;
                            this.mValuePaint.setTextAlign(Paint.Align.RIGHT);
                            labelPtx = pt2x - Utils.convertDpToPixel(5.0f);
                            labelPty = pt2y;
                        } else {
                            pt2x = pt1x + polyline2Width;
                            pt2y = pt1y;
                            this.mValuePaint.setTextAlign(Paint.Align.LEFT);
                            labelPtx = pt2x + Utils.convertDpToPixel(5.0f);
                            labelPty = pt2y;
                        }
                        if (dataSet.getValueLineColor() != 1122867) {
                            c.drawLine(pt0x, pt0y, pt1x, pt1y, this.mValueLinePaint);
                            c.drawLine(pt1x, pt1y, pt2x, pt2y, this.mValueLinePaint);
                        }
                        if (drawXOutside && drawYOutside) {
                            drawValue(c, formatter, value, entry, 0, labelPtx, labelPty, dataSet.getValueTextColor(j));
                            if (j < data.getXValCount()) {
                                c.drawText(data.getXVals().get(j), labelPtx, labelPty + lineHeight, this.mValuePaint);
                            }
                        } else if (drawXOutside) {
                            if (j < data.getXValCount()) {
                                this.mValuePaint.setColor(dataSet.getValueTextColor(j));
                                c.drawText(data.getXVals().get(j), labelPtx, labelPty + (lineHeight / 2.0f), this.mValuePaint);
                            }
                        } else if (drawYOutside) {
                            drawValue(c, formatter, value, entry, 0, labelPtx, labelPty + (lineHeight / 2.0f), dataSet.getValueTextColor(j));
                        }
                    }
                    if (drawXInside || drawYInside) {
                        float x = (labelRadius * sliceXBase) + center.x;
                        float y = (labelRadius * sliceYBase) + center.y;
                        this.mValuePaint.setTextAlign(Paint.Align.CENTER);
                        if (drawXInside && drawYInside) {
                            drawValue(c, formatter, value, entry, 0, x, y, dataSet.getValueTextColor(j));
                            if (j < data.getXValCount()) {
                                c.drawText(data.getXVals().get(j), x, y + lineHeight, this.mValuePaint);
                            }
                        } else if (drawXInside) {
                            if (j < data.getXValCount()) {
                                this.mValuePaint.setColor(dataSet.getValueTextColor(j));
                                c.drawText(data.getXVals().get(j), x, y + (lineHeight / 2.0f), this.mValuePaint);
                            }
                        } else if (drawYInside) {
                            drawValue(c, formatter, value, entry, 0, x, y + (lineHeight / 2.0f), dataSet.getValueTextColor(j));
                        }
                    }
                    xIndex++;
                }
            }
        }
        c.restore();
    }

    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawExtras(Canvas c) {
        drawHole(c);
        c.drawBitmap(this.mDrawBitmap.get(), 0.0f, 0.0f, (Paint) null);
        drawCenterText(c);
    }

    protected void drawHole(Canvas c) {
        if (this.mChart.isDrawHoleEnabled()) {
            float radius = this.mChart.getRadius();
            float holeRadius = radius * (this.mChart.getHoleRadius() / 100.0f);
            PointF center = this.mChart.getCenterCircleBox();
            if (Color.alpha(this.mHolePaint.getColor()) > 0) {
                this.mBitmapCanvas.drawCircle(center.x, center.y, holeRadius, this.mHolePaint);
            }
            if (Color.alpha(this.mTransparentCirclePaint.getColor()) > 0 && this.mChart.getTransparentCircleRadius() > this.mChart.getHoleRadius()) {
                int alpha = this.mTransparentCirclePaint.getAlpha();
                float secondHoleRadius = radius * (this.mChart.getTransparentCircleRadius() / 100.0f);
                this.mTransparentCirclePaint.setAlpha((int) (alpha * this.mAnimator.getPhaseX() * this.mAnimator.getPhaseY()));
                this.mHoleCirclePath.reset();
                this.mHoleCirclePath.addCircle(center.x, center.y, secondHoleRadius, Path.Direction.CW);
                this.mHoleCirclePath.addCircle(center.x, center.y, holeRadius, Path.Direction.CCW);
                this.mBitmapCanvas.drawPath(this.mHoleCirclePath, this.mTransparentCirclePaint);
                this.mTransparentCirclePaint.setAlpha(alpha);
            }
        }
    }

    protected void drawCenterText(Canvas c) {
        CharSequence centerText = this.mChart.getCenterText();
        if (this.mChart.isDrawCenterTextEnabled() && centerText != null) {
            PointF center = this.mChart.getCenterCircleBox();
            float innerRadius = (!this.mChart.isDrawHoleEnabled() || this.mChart.isDrawSlicesUnderHoleEnabled()) ? this.mChart.getRadius() : this.mChart.getRadius() * (this.mChart.getHoleRadius() / 100.0f);
            RectF holeRect = this.mRectBuffer[0];
            holeRect.left = center.x - innerRadius;
            holeRect.top = center.y - innerRadius;
            holeRect.right = center.x + innerRadius;
            holeRect.bottom = center.y + innerRadius;
            RectF boundingRect = this.mRectBuffer[1];
            boundingRect.set(holeRect);
            float radiusPercent = this.mChart.getCenterTextRadiusPercent() / 100.0f;
            if (radiusPercent > 0.0d) {
                boundingRect.inset((boundingRect.width() - (boundingRect.width() * radiusPercent)) / 2.0f, (boundingRect.height() - (boundingRect.height() * radiusPercent)) / 2.0f);
            }
            if (!centerText.equals(this.mCenterTextLastValue) || !boundingRect.equals(this.mCenterTextLastBounds)) {
                this.mCenterTextLastBounds.set(boundingRect);
                this.mCenterTextLastValue = centerText;
                float width = this.mCenterTextLastBounds.width();
                this.mCenterTextLayout = new StaticLayout(centerText, 0, centerText.length(), this.mCenterTextPaint, (int) Math.max(Math.ceil(width), 1.0d), Layout.Alignment.ALIGN_CENTER, 1.0f, 0.0f, false);
            }
            float layoutHeight = this.mCenterTextLayout.getHeight();
            c.save();
            if (Build.VERSION.SDK_INT >= 18) {
                Path path = new Path();
                path.addOval(holeRect, Path.Direction.CW);
                c.clipPath(path);
            }
            c.translate(boundingRect.left, boundingRect.top + ((boundingRect.height() - layoutHeight) / 2.0f));
            this.mCenterTextLayout.draw(c);
            c.restore();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawHighlighted(Canvas c, Highlight[] indices) {
        IPieDataSet set;
        float angle;
        float phaseX = this.mAnimator.getPhaseX();
        float phaseY = this.mAnimator.getPhaseY();
        float rotationAngle = this.mChart.getRotationAngle();
        float[] drawAngles = this.mChart.getDrawAngles();
        float[] absoluteAngles = this.mChart.getAbsoluteAngles();
        PointF center = this.mChart.getCenterCircleBox();
        float radius = this.mChart.getRadius();
        boolean drawInnerArc = this.mChart.isDrawHoleEnabled() && !this.mChart.isDrawSlicesUnderHoleEnabled();
        float userInnerRadius = drawInnerArc ? radius * (this.mChart.getHoleRadius() / 100.0f) : 0.0f;
        RectF highlightedCircleBox = new RectF();
        for (int i = 0; i < indices.length; i++) {
            int xIndex = indices[i].getXIndex();
            if (xIndex < drawAngles.length && (set = ((PieData) this.mChart.getData()).getDataSetByIndex(indices[i].getDataSetIndex())) != null && set.isHighlightEnabled()) {
                int entryCount = set.getEntryCount();
                int visibleAngleCount = 0;
                for (int j = 0; j < entryCount; j++) {
                    if (Math.abs(set.getEntryForIndex(j).getVal()) > 1.0E-6d) {
                        visibleAngleCount++;
                    }
                }
                if (xIndex == 0) {
                    angle = 0.0f;
                } else {
                    angle = absoluteAngles[xIndex - 1] * phaseX;
                }
                float sliceSpace = visibleAngleCount <= 1 ? 0.0f : set.getSliceSpace();
                float sliceAngle = drawAngles[xIndex];
                float innerRadius = userInnerRadius;
                float shift = set.getSelectionShift();
                float highlightedRadius = radius + shift;
                highlightedCircleBox.set(this.mChart.getCircleBox());
                highlightedCircleBox.inset(-shift, -shift);
                boolean accountForSliceSpacing = sliceSpace > 0.0f && sliceAngle <= 180.0f;
                this.mRenderPaint.setColor(set.getColor(xIndex));
                float sliceSpaceAngleOuter = visibleAngleCount == 1 ? 0.0f : sliceSpace / (0.017453292f * radius);
                float sliceSpaceAngleShifted = visibleAngleCount == 1 ? 0.0f : sliceSpace / (0.017453292f * highlightedRadius);
                float startAngleOuter = rotationAngle + ((angle + (sliceSpaceAngleOuter / 2.0f)) * phaseY);
                float sweepAngleOuter = (sliceAngle - sliceSpaceAngleOuter) * phaseY;
                if (sweepAngleOuter < 0.0f) {
                    sweepAngleOuter = 0.0f;
                }
                float startAngleShifted = rotationAngle + ((angle + (sliceSpaceAngleShifted / 2.0f)) * phaseY);
                float sweepAngleShifted = (sliceAngle - sliceSpaceAngleShifted) * phaseY;
                if (sweepAngleShifted < 0.0f) {
                    sweepAngleShifted = 0.0f;
                }
                this.mPathBuffer.reset();
                if (sweepAngleOuter % 360.0f == 0.0f) {
                    this.mPathBuffer.addCircle(center.x, center.y, highlightedRadius, Path.Direction.CW);
                } else {
                    this.mPathBuffer.moveTo(center.x + (highlightedRadius * ((float) Math.cos(startAngleShifted * 0.017453292f))), center.y + (highlightedRadius * ((float) Math.sin(startAngleShifted * 0.017453292f))));
                    this.mPathBuffer.arcTo(highlightedCircleBox, startAngleShifted, sweepAngleShifted);
                }
                float sliceSpaceRadius = 0.0f;
                if (accountForSliceSpacing) {
                    sliceSpaceRadius = calculateMinimumRadiusForSpacedSlice(center, radius, sliceAngle * phaseY, center.x + (radius * ((float) Math.cos(startAngleOuter * 0.017453292f))), center.y + (radius * ((float) Math.sin(startAngleOuter * 0.017453292f))), startAngleOuter, sweepAngleOuter);
                }
                this.mInnerRectBuffer.set(center.x - innerRadius, center.y - innerRadius, center.x + innerRadius, center.y + innerRadius);
                if (drawInnerArc && (innerRadius > 0.0f || accountForSliceSpacing)) {
                    if (accountForSliceSpacing) {
                        float minSpacedRadius = sliceSpaceRadius;
                        if (minSpacedRadius < 0.0f) {
                            minSpacedRadius = -minSpacedRadius;
                        }
                        innerRadius = Math.max(innerRadius, minSpacedRadius);
                    }
                    float sliceSpaceAngleInner = (visibleAngleCount == 1 || innerRadius == 0.0f) ? 0.0f : sliceSpace / (0.017453292f * innerRadius);
                    float startAngleInner = rotationAngle + ((angle + (sliceSpaceAngleInner / 2.0f)) * phaseY);
                    float sweepAngleInner = (sliceAngle - sliceSpaceAngleInner) * phaseY;
                    if (sweepAngleInner < 0.0f) {
                        sweepAngleInner = 0.0f;
                    }
                    float endAngleInner = startAngleInner + sweepAngleInner;
                    if (sweepAngleOuter % 360.0f == 0.0f) {
                        this.mPathBuffer.addCircle(center.x, center.y, innerRadius, Path.Direction.CCW);
                    } else {
                        this.mPathBuffer.lineTo(center.x + (innerRadius * ((float) Math.cos(endAngleInner * 0.017453292f))), center.y + (innerRadius * ((float) Math.sin(endAngleInner * 0.017453292f))));
                        this.mPathBuffer.arcTo(this.mInnerRectBuffer, endAngleInner, -sweepAngleInner);
                    }
                } else if (sweepAngleOuter % 360.0f != 0.0f) {
                    if (accountForSliceSpacing) {
                        float angleMiddle = startAngleOuter + (sweepAngleOuter / 2.0f);
                        float arcEndPointX = center.x + (sliceSpaceRadius * ((float) Math.cos(angleMiddle * 0.017453292f)));
                        float arcEndPointY = center.y + (sliceSpaceRadius * ((float) Math.sin(angleMiddle * 0.017453292f)));
                        this.mPathBuffer.lineTo(arcEndPointX, arcEndPointY);
                    } else {
                        this.mPathBuffer.lineTo(center.x, center.y);
                    }
                }
                this.mPathBuffer.close();
                this.mBitmapCanvas.drawPath(this.mPathBuffer, this.mRenderPaint);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected void drawRoundedSlices(Canvas c) {
        if (!this.mChart.isDrawRoundedSlicesEnabled()) {
            return;
        }
        IPieDataSet dataSet = ((PieData) this.mChart.getData()).getDataSet();
        if (!dataSet.isVisible()) {
            return;
        }
        float phaseX = this.mAnimator.getPhaseX();
        float phaseY = this.mAnimator.getPhaseY();
        PointF center = this.mChart.getCenterCircleBox();
        float r = this.mChart.getRadius();
        float circleRadius = (r - ((r * this.mChart.getHoleRadius()) / 100.0f)) / 2.0f;
        float[] drawAngles = this.mChart.getDrawAngles();
        float angle = this.mChart.getRotationAngle();
        for (int j = 0; j < dataSet.getEntryCount(); j++) {
            float sliceAngle = drawAngles[j];
            Entry e = dataSet.getEntryForIndex(j);
            if (Math.abs(e.getVal()) > 1.0E-6d) {
                float x = (float) (((r - circleRadius) * Math.cos(Math.toRadians((angle + sliceAngle) * phaseY))) + center.x);
                float y = (float) (((r - circleRadius) * Math.sin(Math.toRadians((angle + sliceAngle) * phaseY))) + center.y);
                this.mRenderPaint.setColor(dataSet.getColor(j));
                this.mBitmapCanvas.drawCircle(x, y, circleRadius, this.mRenderPaint);
            }
            angle += sliceAngle * phaseX;
        }
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
