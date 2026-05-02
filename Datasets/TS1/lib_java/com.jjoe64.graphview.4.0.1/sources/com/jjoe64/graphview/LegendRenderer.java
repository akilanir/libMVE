package com.jjoe64.graphview;

import android.R;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.TypedValue;
import com.jjoe64.graphview.series.Series;
import java.util.ArrayList;
import java.util.List;

/* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/LegendRenderer.class */
public class LegendRenderer {
    private Styles mStyles;
    private final GraphView mGraphView;
    private boolean mIsVisible = false;
    private Paint mPaint = new Paint();
    private int cachedLegendWidth;

    /* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/LegendRenderer$LegendAlign.class */
    public enum LegendAlign {
        TOP,
        MIDDLE,
        BOTTOM
    }

    /* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/LegendRenderer$Styles.class */
    private final class Styles {
        float textSize;
        int spacing;
        int padding;
        int width;
        int backgroundColor;
        int textColor;
        int margin;
        LegendAlign align;
        Point fixedPosition;

        private Styles() {
        }

        /* synthetic */ Styles(LegendRenderer x0, AnonymousClass1 x1) {
            this();
        }
    }

    public LegendRenderer(GraphView graphView) {
        this.mGraphView = graphView;
        this.mPaint.setTextAlign(Paint.Align.LEFT);
        this.mStyles = new Styles(this, null);
        this.cachedLegendWidth = 0;
        resetStyles();
    }

    public void resetStyles() {
        int color1;
        this.mStyles.align = LegendAlign.MIDDLE;
        this.mStyles.textSize = this.mGraphView.getGridLabelRenderer().getTextSize();
        this.mStyles.spacing = (int) (this.mStyles.textSize / 5.0f);
        this.mStyles.padding = (int) (this.mStyles.textSize / 2.0f);
        this.mStyles.width = 0;
        this.mStyles.backgroundColor = Color.argb(180, 100, 100, 100);
        this.mStyles.margin = (int) (this.mStyles.textSize / 5.0f);
        TypedValue typedValue = new TypedValue();
        this.mGraphView.getContext().getTheme().resolveAttribute(R.attr.textAppearanceSmall, typedValue, true);
        try {
            TypedArray array = this.mGraphView.getContext().obtainStyledAttributes(typedValue.data, new int[]{R.attr.textColorPrimary});
            color1 = array.getColor(0, -16777216);
            array.recycle();
        } catch (Exception e) {
            color1 = -16777216;
        }
        this.mStyles.textColor = color1;
        this.cachedLegendWidth = 0;
    }

    public void draw(Canvas canvas) {
        float lLeft;
        float lTop;
        if (this.mIsVisible) {
            this.mPaint.setTextSize(this.mStyles.textSize);
            int shapeSize = (int) (this.mStyles.textSize * 0.8d);
            List<Series> allSeries = new ArrayList<>();
            allSeries.addAll(this.mGraphView.getSeries());
            if (this.mGraphView.mSecondScale != null) {
                allSeries.addAll(this.mGraphView.getSecondScale().getSeries());
            }
            int legendWidth = this.mStyles.width;
            if (legendWidth == 0) {
                legendWidth = this.cachedLegendWidth;
                if (legendWidth == 0) {
                    Rect textBounds = new Rect();
                    for (Series s : allSeries) {
                        if (s.getTitle() != null) {
                            this.mPaint.getTextBounds(s.getTitle(), 0, s.getTitle().length(), textBounds);
                            legendWidth = Math.max(legendWidth, textBounds.width());
                        }
                    }
                    if (legendWidth == 0) {
                        legendWidth = 1;
                    }
                    legendWidth += shapeSize + (this.mStyles.padding * 2) + this.mStyles.spacing;
                    this.cachedLegendWidth = legendWidth;
                }
            }
            float legendHeight = ((this.mStyles.textSize + this.mStyles.spacing) * allSeries.size()) - this.mStyles.spacing;
            if (this.mStyles.fixedPosition != null) {
                lLeft = this.mGraphView.getGraphContentLeft() + this.mStyles.margin + this.mStyles.fixedPosition.x;
                lTop = this.mGraphView.getGraphContentTop() + this.mStyles.margin + this.mStyles.fixedPosition.y;
            } else {
                lLeft = ((this.mGraphView.getGraphContentLeft() + this.mGraphView.getGraphContentWidth()) - legendWidth) - this.mStyles.margin;
                switch (AnonymousClass1.$SwitchMap$com$jjoe64$graphview$LegendRenderer$LegendAlign[this.mStyles.align.ordinal()]) {
                    case BuildConfig.VERSION_CODE /* 1 */:
                        lTop = this.mGraphView.getGraphContentTop() + this.mStyles.margin;
                        break;
                    case 2:
                        lTop = (this.mGraphView.getHeight() / 2) - (legendHeight / 2.0f);
                        break;
                    default:
                        lTop = (((this.mGraphView.getGraphContentTop() + this.mGraphView.getGraphContentHeight()) - this.mStyles.margin) - legendHeight) - (2 * this.mStyles.padding);
                        break;
                }
            }
            float lRight = lLeft + legendWidth;
            float lBottom = lTop + legendHeight + (2 * this.mStyles.padding);
            this.mPaint.setColor(this.mStyles.backgroundColor);
            canvas.drawRoundRect(new RectF(lLeft, lTop, lRight, lBottom), 8.0f, 8.0f, this.mPaint);
            int i = 0;
            for (Series series : allSeries) {
                this.mPaint.setColor(series.getColor());
                canvas.drawRect(new RectF(lLeft + this.mStyles.padding, lTop + this.mStyles.padding + (i * (this.mStyles.textSize + this.mStyles.spacing)), lLeft + this.mStyles.padding + shapeSize, lTop + this.mStyles.padding + (i * (this.mStyles.textSize + this.mStyles.spacing)) + shapeSize), this.mPaint);
                if (series.getTitle() != null) {
                    this.mPaint.setColor(this.mStyles.textColor);
                    canvas.drawText(series.getTitle(), lLeft + this.mStyles.padding + shapeSize + this.mStyles.spacing, lTop + this.mStyles.padding + this.mStyles.textSize + (i * (this.mStyles.textSize + this.mStyles.spacing)), this.mPaint);
                }
                i++;
            }
        }
    }

    /* renamed from: com.jjoe64.graphview.LegendRenderer$1, reason: invalid class name */
    /* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/LegendRenderer$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$jjoe64$graphview$LegendRenderer$LegendAlign = new int[LegendAlign.values().length];

        static {
            try {
                $SwitchMap$com$jjoe64$graphview$LegendRenderer$LegendAlign[LegendAlign.TOP.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$jjoe64$graphview$LegendRenderer$LegendAlign[LegendAlign.MIDDLE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
        }
    }

    public boolean isVisible() {
        return this.mIsVisible;
    }

    public void setVisible(boolean mIsVisible) {
        this.mIsVisible = mIsVisible;
    }

    public float getTextSize() {
        return this.mStyles.textSize;
    }

    public void setTextSize(float textSize) {
        this.mStyles.textSize = textSize;
        this.cachedLegendWidth = 0;
    }

    public int getSpacing() {
        return this.mStyles.spacing;
    }

    public void setSpacing(int spacing) {
        this.mStyles.spacing = spacing;
    }

    public int getPadding() {
        return this.mStyles.padding;
    }

    public void setPadding(int padding) {
        this.mStyles.padding = padding;
    }

    public int getWidth() {
        return this.mStyles.width;
    }

    public void setWidth(int width) {
        this.mStyles.width = width;
    }

    public int getBackgroundColor() {
        return this.mStyles.backgroundColor;
    }

    public void setBackgroundColor(int backgroundColor) {
        this.mStyles.backgroundColor = backgroundColor;
    }

    public int getMargin() {
        return this.mStyles.margin;
    }

    public void setMargin(int margin) {
        this.mStyles.margin = margin;
    }

    public LegendAlign getAlign() {
        return this.mStyles.align;
    }

    public void setAlign(LegendAlign align) {
        this.mStyles.align = align;
    }

    public int getTextColor() {
        return this.mStyles.textColor;
    }

    public void setTextColor(int textColor) {
        this.mStyles.textColor = textColor;
    }

    public void setFixedPosition(int x, int y) {
        this.mStyles.fixedPosition = new Point(x, y);
    }
}
