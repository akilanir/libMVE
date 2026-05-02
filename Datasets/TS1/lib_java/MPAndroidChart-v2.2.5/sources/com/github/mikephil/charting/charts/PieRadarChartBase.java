package com.github.mikephil.charting.charts;

import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.PointF;
import android.graphics.RectF;
import android.os.Build;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import com.github.mikephil.charting.BuildConfig;
import com.github.mikephil.charting.animation.Easing;
import com.github.mikephil.charting.components.Legend;
import com.github.mikephil.charting.components.XAxis;
import com.github.mikephil.charting.data.ChartData;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.interfaces.datasets.IDataSet;
import com.github.mikephil.charting.listener.PieRadarChartTouchListener;
import com.github.mikephil.charting.utils.SelectionDetail;
import com.github.mikephil.charting.utils.Utils;
import java.util.ArrayList;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/charts/PieRadarChartBase.class */
public abstract class PieRadarChartBase<T extends ChartData<? extends IDataSet<? extends Entry>>> extends Chart<T> {
    private float mRotationAngle;
    private float mRawRotationAngle;
    protected boolean mRotateEnabled;
    protected float mMinOffset;

    public abstract int getIndexForAngle(float f);

    public abstract float getRadius();

    protected abstract float getRequiredLegendOffset();

    protected abstract float getRequiredBaseOffset();

    public PieRadarChartBase(Context context) {
        super(context);
        this.mRotationAngle = 270.0f;
        this.mRawRotationAngle = 270.0f;
        this.mRotateEnabled = true;
        this.mMinOffset = 0.0f;
    }

    public PieRadarChartBase(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mRotationAngle = 270.0f;
        this.mRawRotationAngle = 270.0f;
        this.mRotateEnabled = true;
        this.mMinOffset = 0.0f;
    }

    public PieRadarChartBase(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mRotationAngle = 270.0f;
        this.mRawRotationAngle = 270.0f;
        this.mRotateEnabled = true;
        this.mMinOffset = 0.0f;
    }

    @Override // com.github.mikephil.charting.charts.Chart
    protected void init() {
        super.init();
        this.mChartTouchListener = new PieRadarChartTouchListener(this);
    }

    @Override // com.github.mikephil.charting.charts.Chart
    protected void calcMinMax() {
        this.mXAxis.mAxisRange = this.mData.getXVals().size() - 1;
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        if (this.mTouchEnabled && this.mChartTouchListener != null) {
            return this.mChartTouchListener.onTouch(this, event);
        }
        return super.onTouchEvent(event);
    }

    @Override // android.view.View
    public void computeScroll() {
        if (this.mChartTouchListener instanceof PieRadarChartTouchListener) {
            ((PieRadarChartTouchListener) this.mChartTouchListener).computeScroll();
        }
    }

    @Override // com.github.mikephil.charting.charts.Chart
    public void notifyDataSetChanged() {
        if (this.mData == null) {
            return;
        }
        calcMinMax();
        if (this.mLegend != null) {
            this.mLegendRenderer.computeLegend(this.mData);
        }
        calculateOffsets();
    }

    @Override // com.github.mikephil.charting.charts.Chart
    public void calculateOffsets() {
        float legendLeft = 0.0f;
        float legendRight = 0.0f;
        float legendBottom = 0.0f;
        float legendTop = 0.0f;
        if (this.mLegend != null && this.mLegend.isEnabled() && !this.mLegend.isDrawInsideEnabled()) {
            float fullLegendWidth = Math.min(this.mLegend.mNeededWidth, this.mViewPortHandler.getChartWidth() * this.mLegend.getMaxSizePercent()) + this.mLegend.getFormSize() + this.mLegend.getFormToTextSpace();
            switch (AnonymousClass2.$SwitchMap$com$github$mikephil$charting$components$Legend$LegendOrientation[this.mLegend.getOrientation().ordinal()]) {
                case BuildConfig.VERSION_CODE /* 1 */:
                    float xLegendOffset = 0.0f;
                    if (this.mLegend.getHorizontalAlignment() == Legend.LegendHorizontalAlignment.LEFT || this.mLegend.getHorizontalAlignment() == Legend.LegendHorizontalAlignment.RIGHT) {
                        if (this.mLegend.getVerticalAlignment() == Legend.LegendVerticalAlignment.CENTER) {
                            float spacing = Utils.convertDpToPixel(13.0f);
                            xLegendOffset = fullLegendWidth + spacing;
                        } else {
                            float spacing2 = Utils.convertDpToPixel(8.0f);
                            float legendWidth = fullLegendWidth + spacing2;
                            float legendHeight = this.mLegend.mNeededHeight + this.mLegend.mTextHeightMax;
                            PointF c = getCenter();
                            float bottomX = this.mLegend.getHorizontalAlignment() == Legend.LegendHorizontalAlignment.RIGHT ? (getWidth() - legendWidth) + 15.0f : legendWidth - 15.0f;
                            float bottomY = legendHeight + 15.0f;
                            float distLegend = distanceToCenter(bottomX, bottomY);
                            PointF reference = getPosition(c, getRadius(), getAngleForPoint(bottomX, bottomY));
                            float distReference = distanceToCenter(reference.x, reference.y);
                            float minOffset = Utils.convertDpToPixel(5.0f);
                            if (bottomY >= c.y && getHeight() - legendWidth > getWidth()) {
                                xLegendOffset = legendWidth;
                            } else if (distLegend < distReference) {
                                float diff = distReference - distLegend;
                                xLegendOffset = minOffset + diff;
                            }
                        }
                    }
                    switch (AnonymousClass2.$SwitchMap$com$github$mikephil$charting$components$Legend$LegendHorizontalAlignment[this.mLegend.getHorizontalAlignment().ordinal()]) {
                        case BuildConfig.VERSION_CODE /* 1 */:
                            legendLeft = xLegendOffset;
                            break;
                        case 2:
                            legendRight = xLegendOffset;
                            break;
                        case 3:
                            switch (AnonymousClass2.$SwitchMap$com$github$mikephil$charting$components$Legend$LegendVerticalAlignment[this.mLegend.getVerticalAlignment().ordinal()]) {
                                case BuildConfig.VERSION_CODE /* 1 */:
                                    legendTop = Math.min(this.mLegend.mNeededHeight, this.mViewPortHandler.getChartHeight() * this.mLegend.getMaxSizePercent());
                                    break;
                                case 2:
                                    legendBottom = Math.min(this.mLegend.mNeededHeight, this.mViewPortHandler.getChartHeight() * this.mLegend.getMaxSizePercent());
                                    break;
                            }
                    }
                case 2:
                    if (this.mLegend.getVerticalAlignment() == Legend.LegendVerticalAlignment.TOP || this.mLegend.getVerticalAlignment() == Legend.LegendVerticalAlignment.BOTTOM) {
                        float yOffset = getRequiredLegendOffset();
                        float yLegendOffset = Math.min(this.mLegend.mNeededHeight + yOffset, this.mViewPortHandler.getChartHeight() * this.mLegend.getMaxSizePercent());
                        switch (AnonymousClass2.$SwitchMap$com$github$mikephil$charting$components$Legend$LegendVerticalAlignment[this.mLegend.getVerticalAlignment().ordinal()]) {
                            case BuildConfig.VERSION_CODE /* 1 */:
                                legendTop = yLegendOffset;
                                break;
                            case 2:
                                legendBottom = yLegendOffset;
                                break;
                        }
                    }
                    break;
            }
            legendLeft += getRequiredBaseOffset();
            legendRight += getRequiredBaseOffset();
            legendTop += getRequiredBaseOffset();
            legendBottom += getRequiredBaseOffset();
        }
        float minOffset2 = Utils.convertDpToPixel(this.mMinOffset);
        if (this instanceof RadarChart) {
            XAxis x = getXAxis();
            if (x.isEnabled() && x.isDrawLabelsEnabled()) {
                minOffset2 = Math.max(minOffset2, x.mLabelRotatedWidth);
            }
        }
        float legendTop2 = legendTop + getExtraTopOffset();
        float legendRight2 = legendRight + getExtraRightOffset();
        float legendBottom2 = legendBottom + getExtraBottomOffset();
        float offsetLeft = Math.max(minOffset2, legendLeft + getExtraLeftOffset());
        float offsetTop = Math.max(minOffset2, legendTop2);
        float offsetRight = Math.max(minOffset2, legendRight2);
        float offsetBottom = Math.max(minOffset2, Math.max(getRequiredBaseOffset(), legendBottom2));
        this.mViewPortHandler.restrainViewPort(offsetLeft, offsetTop, offsetRight, offsetBottom);
        if (this.mLogEnabled) {
            Log.i(Chart.LOG_TAG, "offsetLeft: " + offsetLeft + ", offsetTop: " + offsetTop + ", offsetRight: " + offsetRight + ", offsetBottom: " + offsetBottom);
        }
    }

    /* renamed from: com.github.mikephil.charting.charts.PieRadarChartBase$2, reason: invalid class name */
    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/charts/PieRadarChartBase$2.class */
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

    public float getAngleForPoint(float x, float y) {
        PointF c = getCenterOffsets();
        double tx = x - c.x;
        double ty = y - c.y;
        double length = Math.sqrt((tx * tx) + (ty * ty));
        double r = Math.acos(ty / length);
        float angle = (float) Math.toDegrees(r);
        if (x > c.x) {
            angle = 360.0f - angle;
        }
        float angle2 = angle + 90.0f;
        if (angle2 > 360.0f) {
            angle2 -= 360.0f;
        }
        return angle2;
    }

    protected PointF getPosition(PointF center, float dist, float angle) {
        PointF p = new PointF((float) (center.x + (dist * Math.cos(Math.toRadians(angle)))), (float) (center.y + (dist * Math.sin(Math.toRadians(angle)))));
        return p;
    }

    public float distanceToCenter(float x, float y) {
        float xDist;
        float yDist;
        PointF c = getCenterOffsets();
        if (x > c.x) {
            xDist = x - c.x;
        } else {
            xDist = c.x - x;
        }
        if (y > c.y) {
            yDist = y - c.y;
        } else {
            yDist = c.y - y;
        }
        float dist = (float) Math.sqrt(Math.pow(xDist, 2.0d) + Math.pow(yDist, 2.0d));
        return dist;
    }

    public void setRotationAngle(float angle) {
        this.mRawRotationAngle = angle;
        this.mRotationAngle = Utils.getNormalizedAngle(this.mRawRotationAngle);
    }

    public float getRawRotationAngle() {
        return this.mRawRotationAngle;
    }

    public float getRotationAngle() {
        return this.mRotationAngle;
    }

    public void setRotationEnabled(boolean enabled) {
        this.mRotateEnabled = enabled;
    }

    public boolean isRotationEnabled() {
        return this.mRotateEnabled;
    }

    public float getMinOffset() {
        return this.mMinOffset;
    }

    public void setMinOffset(float minOffset) {
        this.mMinOffset = minOffset;
    }

    public float getDiameter() {
        RectF content = this.mViewPortHandler.getContentRect();
        content.left += getExtraLeftOffset();
        content.top += getExtraTopOffset();
        content.right -= getExtraRightOffset();
        content.bottom -= getExtraBottomOffset();
        return Math.min(content.width(), content.height());
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.ChartInterface
    public float getYChartMax() {
        return 0.0f;
    }

    @Override // com.github.mikephil.charting.interfaces.dataprovider.ChartInterface
    public float getYChartMin() {
        return 0.0f;
    }

    public List<SelectionDetail> getSelectionDetailsAtIndex(int xIndex) {
        List<SelectionDetail> vals = new ArrayList<>();
        for (int i = 0; i < this.mData.getDataSetCount(); i++) {
            IDataSet<?> dataSet = this.mData.getDataSetByIndex(i);
            float yVal = dataSet.getYValForXIndex(xIndex);
            if (!Float.isNaN(yVal)) {
                vals.add(new SelectionDetail(yVal, i, dataSet));
            }
        }
        return vals;
    }

    @SuppressLint({"NewApi"})
    public void spin(int durationmillis, float fromangle, float toangle, Easing.EasingOption easing) {
        if (Build.VERSION.SDK_INT < 11) {
            return;
        }
        setRotationAngle(fromangle);
        ObjectAnimator spinAnimator = ObjectAnimator.ofFloat(this, "rotationAngle", fromangle, toangle);
        spinAnimator.setDuration(durationmillis);
        spinAnimator.setInterpolator(Easing.getEasingFunctionFromOption(easing));
        spinAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.github.mikephil.charting.charts.PieRadarChartBase.1
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator animation) {
                PieRadarChartBase.this.postInvalidate();
            }
        });
        spinAnimator.start();
    }
}
