package com.jjoe64.graphview;

import android.R;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.support.v4.view.ViewCompat;
import android.util.TypedValue;
import com.jjoe64.graphview.Viewport;
import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/GridLabelRenderer.class */
public class GridLabelRenderer {
    protected Styles mStyles;
    private final GraphView mGraphView;
    private Map<Integer, Double> mStepsVertical;
    private Map<Integer, Double> mStepsVerticalSecondScale;
    private Map<Integer, Double> mStepsHorizontal;
    private Paint mPaintLine;
    private Paint mPaintLabel;
    private Paint mPaintAxisTitle;
    private boolean mIsAdjusted;
    private Integer mLabelVerticalWidth;
    private boolean mLabelVerticalWidthFixed;
    private Integer mLabelVerticalHeight;
    private boolean mLabelHorizontalHeightFixed;
    private Integer mLabelVerticalSecondScaleWidth;
    private Integer mLabelVerticalSecondScaleHeight;
    private Integer mLabelHorizontalWidth;
    private Integer mLabelHorizontalHeight;
    private LabelFormatter mLabelFormatter;
    private String mHorizontalAxisTitle;
    private String mVerticalAxisTitle;
    private int mNumVerticalLabels;
    private int mNumHorizontalLabels;

    /* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/GridLabelRenderer$Styles.class */
    public final class Styles {
        public float textSize;
        public Paint.Align verticalLabelsAlign;
        public Paint.Align verticalLabelsSecondScaleAlign;
        public int verticalLabelsColor;
        public int verticalLabelsSecondScaleColor;
        public int horizontalLabelsColor;
        public int gridColor;
        public boolean highlightZeroLines;
        public int padding;
        public float verticalAxisTitleTextSize;
        public int verticalAxisTitleColor;
        public float horizontalAxisTitleTextSize;
        public int horizontalAxisTitleColor;
        boolean horizontalLabelsVisible;
        boolean verticalLabelsVisible;
        GridStyle gridStyle;
        int labelsSpace;

        public Styles() {
        }
    }

    /* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/GridLabelRenderer$GridStyle.class */
    public enum GridStyle {
        BOTH,
        VERTICAL,
        HORIZONTAL,
        NONE;

        public boolean drawVertical() {
            return this == BOTH || (this == VERTICAL && this != NONE);
        }

        public boolean drawHorizontal() {
            return this == BOTH || (this == HORIZONTAL && this != NONE);
        }
    }

    public GridLabelRenderer(GraphView graphView) {
        this.mGraphView = graphView;
        setLabelFormatter(new DefaultLabelFormatter());
        this.mStyles = new Styles();
        resetStyles();
        this.mNumVerticalLabels = 5;
        this.mNumHorizontalLabels = 5;
    }

    public void resetStyles() {
        int color1;
        int color2;
        int size;
        int size2;
        TypedValue typedValue = new TypedValue();
        this.mGraphView.getContext().getTheme().resolveAttribute(R.attr.textAppearanceSmall, typedValue, true);
        try {
            TypedArray array = this.mGraphView.getContext().obtainStyledAttributes(typedValue.data, new int[]{R.attr.textColorPrimary, R.attr.textColorSecondary, R.attr.textSize, R.attr.horizontalGap});
            color1 = array.getColor(0, -16777216);
            color2 = array.getColor(1, -7829368);
            size = array.getDimensionPixelSize(2, 20);
            size2 = array.getDimensionPixelSize(3, 20);
            array.recycle();
        } catch (Exception e) {
            color1 = -16777216;
            color2 = -7829368;
            size = 20;
            size2 = 20;
        }
        this.mStyles.verticalLabelsColor = color1;
        this.mStyles.verticalLabelsSecondScaleColor = color1;
        this.mStyles.horizontalLabelsColor = color1;
        this.mStyles.gridColor = color2;
        this.mStyles.textSize = size;
        this.mStyles.padding = size2;
        this.mStyles.labelsSpace = ((int) this.mStyles.textSize) / 5;
        this.mStyles.verticalLabelsAlign = Paint.Align.RIGHT;
        this.mStyles.verticalLabelsSecondScaleAlign = Paint.Align.LEFT;
        this.mStyles.highlightZeroLines = true;
        this.mStyles.verticalAxisTitleColor = this.mStyles.verticalLabelsColor;
        this.mStyles.horizontalAxisTitleColor = this.mStyles.horizontalLabelsColor;
        this.mStyles.verticalAxisTitleTextSize = this.mStyles.textSize;
        this.mStyles.horizontalAxisTitleTextSize = this.mStyles.textSize;
        this.mStyles.horizontalLabelsVisible = true;
        this.mStyles.verticalLabelsVisible = true;
        this.mStyles.gridStyle = GridStyle.BOTH;
        reloadStyles();
    }

    public void reloadStyles() {
        this.mPaintLine = new Paint();
        this.mPaintLine.setColor(this.mStyles.gridColor);
        this.mPaintLine.setStrokeWidth(0.0f);
        this.mPaintLabel = new Paint();
        this.mPaintLabel.setTextSize(getTextSize());
        this.mPaintAxisTitle = new Paint();
        this.mPaintAxisTitle.setTextSize(getTextSize());
        this.mPaintAxisTitle.setTextAlign(Paint.Align.CENTER);
    }

    public float getTextSize() {
        return this.mStyles.textSize;
    }

    public int getVerticalLabelsColor() {
        return this.mStyles.verticalLabelsColor;
    }

    public Paint.Align getVerticalLabelsAlign() {
        return this.mStyles.verticalLabelsAlign;
    }

    public int getHorizontalLabelsColor() {
        return this.mStyles.horizontalLabelsColor;
    }

    public void invalidate(boolean keepLabelsSize, boolean keepViewport) {
        if (!keepViewport) {
            this.mIsAdjusted = false;
        }
        if (!keepLabelsSize) {
            if (!this.mLabelVerticalWidthFixed) {
                this.mLabelVerticalWidth = null;
            }
            this.mLabelVerticalHeight = null;
            this.mLabelVerticalSecondScaleWidth = null;
            this.mLabelVerticalSecondScaleHeight = null;
        }
    }

    protected boolean adjustVerticalSecondScale() {
        if (this.mLabelHorizontalHeight == null) {
            return false;
        }
        if (this.mGraphView.mSecondScale == null) {
            return true;
        }
        double minY = this.mGraphView.mSecondScale.getMinY();
        double maxY = this.mGraphView.mSecondScale.getMaxY();
        int numVerticalLabels = this.mNumVerticalLabels;
        if (this.mGraphView.mSecondScale.isYAxisBoundsManual()) {
            double rangeY = maxY - minY;
            double exactSteps = rangeY / (numVerticalLabels - 1);
            double newMaxY = minY + ((numVerticalLabels - 1) * exactSteps);
            if (this.mStepsVerticalSecondScale != null) {
                this.mStepsVerticalSecondScale.clear();
            } else {
                this.mStepsVerticalSecondScale = new LinkedHashMap(numVerticalLabels);
            }
            int height = this.mGraphView.getGraphContentHeight();
            double v = newMaxY;
            int p = this.mGraphView.getGraphContentTop();
            int pixelStep = height / (numVerticalLabels - 1);
            for (int i = 0; i < numVerticalLabels; i++) {
                this.mStepsVerticalSecondScale.put(Integer.valueOf(p), Double.valueOf(v));
                p += pixelStep;
                v -= exactSteps;
            }
            return true;
        }
        throw new IllegalStateException("Not yet implemented");
    }

    protected boolean adjustVertical() {
        double newMinY;
        double exactSteps;
        if (this.mLabelHorizontalHeight == null) {
            return false;
        }
        double minY = this.mGraphView.getViewport().getMinY(false);
        double maxY = this.mGraphView.getViewport().getMaxY(false);
        if (minY == maxY) {
            return false;
        }
        int numVerticalLabels = this.mNumVerticalLabels;
        if (this.mGraphView.getViewport().isYAxisBoundsManual()) {
            newMinY = minY;
            double rangeY = maxY - newMinY;
            exactSteps = rangeY / (numVerticalLabels - 1);
        } else {
            boolean adjusting = true;
            newMinY = minY;
            exactSteps = 0.0d;
            while (adjusting) {
                double rangeY2 = maxY - newMinY;
                double exactSteps2 = rangeY2 / (numVerticalLabels - 1);
                exactSteps = humanRound(exactSteps2, true);
                int count = 0;
                if (newMinY >= 0.0d) {
                    while (newMinY - exactSteps >= 0.0d) {
                        newMinY -= exactSteps;
                        count++;
                    }
                    newMinY = exactSteps * count;
                } else {
                    while (true) {
                        count++;
                        if (newMinY + exactSteps >= 0.0d) {
                            break;
                        }
                        newMinY += exactSteps;
                    }
                    newMinY = exactSteps * count * (-1.0d);
                }
                if (newMinY == minY) {
                    adjusting = false;
                } else {
                    minY = newMinY;
                }
            }
        }
        double newMaxY = newMinY + ((numVerticalLabels - 1) * exactSteps);
        this.mGraphView.getViewport().setMinY(newMinY);
        this.mGraphView.getViewport().setMaxY(newMaxY);
        if (!this.mGraphView.getViewport().isYAxisBoundsManual()) {
            this.mGraphView.getViewport().setYAxisBoundsStatus(Viewport.AxisBoundsStatus.AUTO_ADJUSTED);
        }
        if (this.mStepsVertical != null) {
            this.mStepsVertical.clear();
        } else {
            this.mStepsVertical = new LinkedHashMap(numVerticalLabels);
        }
        int height = this.mGraphView.getGraphContentHeight();
        double v = newMaxY;
        int p = this.mGraphView.getGraphContentTop();
        int pixelStep = height / (numVerticalLabels - 1);
        for (int i = 0; i < numVerticalLabels; i++) {
            this.mStepsVertical.put(Integer.valueOf(p), Double.valueOf(v));
            p += pixelStep;
            v -= exactSteps;
        }
        return true;
    }

    protected boolean adjustHorizontal() {
        double newMinX;
        double exactSteps;
        if (this.mLabelVerticalWidth == null) {
            return false;
        }
        double minX = this.mGraphView.getViewport().getMinX(false);
        double maxX = this.mGraphView.getViewport().getMaxX(false);
        if (minX == maxX) {
            return false;
        }
        int numHorizontalLabels = this.mNumHorizontalLabels;
        if (this.mGraphView.getViewport().isXAxisBoundsManual() && this.mGraphView.getViewport().getXAxisBoundsStatus() != Viewport.AxisBoundsStatus.READJUST_AFTER_SCALE) {
            if (this.mGraphView.getViewport().mScalingActive) {
                minX = this.mGraphView.getViewport().mScalingBeginLeft;
                maxX = minX + this.mGraphView.getViewport().mScalingBeginWidth;
            }
            newMinX = minX;
            double rangeX = maxX - newMinX;
            exactSteps = rangeX / (numHorizontalLabels - 1);
        } else {
            boolean adjusting = true;
            newMinX = minX;
            exactSteps = 0.0d;
            while (adjusting) {
                double rangeX2 = maxX - newMinX;
                double exactSteps2 = rangeX2 / (numHorizontalLabels - 1);
                boolean roundAlwaysUp = true;
                if (this.mGraphView.getViewport().getXAxisBoundsStatus() == Viewport.AxisBoundsStatus.READJUST_AFTER_SCALE && this.mGraphView.getViewport().mCurrentViewport.width() < this.mGraphView.getViewport().mScalingBeginWidth) {
                    roundAlwaysUp = false;
                }
                exactSteps = humanRound(exactSteps2, roundAlwaysUp);
                int count = 0;
                if (newMinX >= 0.0d) {
                    while (newMinX - exactSteps >= 0.0d) {
                        newMinX -= exactSteps;
                        count++;
                    }
                    newMinX = exactSteps * count;
                } else {
                    while (true) {
                        count++;
                        if (newMinX + exactSteps >= 0.0d) {
                            break;
                        }
                        newMinX += exactSteps;
                    }
                    newMinX = exactSteps * count * (-1.0d);
                }
                if (newMinX == minX) {
                    adjusting = false;
                } else {
                    minX = newMinX;
                }
            }
            double newMaxX = newMinX + ((numHorizontalLabels - 1) * exactSteps);
            this.mGraphView.getViewport().setMinX(newMinX);
            this.mGraphView.getViewport().setMaxX(newMaxX);
            if (this.mGraphView.getViewport().getXAxisBoundsStatus() == Viewport.AxisBoundsStatus.READJUST_AFTER_SCALE) {
                this.mGraphView.getViewport().setXAxisBoundsStatus(Viewport.AxisBoundsStatus.FIX);
            } else {
                this.mGraphView.getViewport().setXAxisBoundsStatus(Viewport.AxisBoundsStatus.AUTO_ADJUSTED);
            }
        }
        if (this.mStepsHorizontal != null) {
            this.mStepsHorizontal.clear();
        } else {
            this.mStepsHorizontal = new LinkedHashMap(numHorizontalLabels);
        }
        int width = this.mGraphView.getGraphContentWidth();
        float scrolled = 0.0f;
        float scrolledPixels = 0.0f;
        double v = newMinX;
        int p = this.mGraphView.getGraphContentLeft();
        float pixelStep = width / (numHorizontalLabels - 1);
        if (this.mGraphView.getViewport().mScalingActive) {
            float oldStep = this.mGraphView.getViewport().mScalingBeginWidth / (numHorizontalLabels - 1);
            float factor = (this.mGraphView.getViewport().mCurrentViewport.width() + oldStep) / (this.mGraphView.getViewport().mScalingBeginWidth + oldStep);
            pixelStep *= 1.0f / factor;
            float newWidth = (width * 1.0f) / factor;
            scrolledPixels = (newWidth - width) * (-0.5f);
        }
        if (!Float.isNaN(this.mGraphView.getViewport().mScrollingReferenceX)) {
            scrolled = this.mGraphView.getViewport().mScrollingReferenceX - ((float) newMinX);
            scrolledPixels += scrolled * (pixelStep / ((float) exactSteps));
            if (scrolled < 0.0d - exactSteps) {
                this.mGraphView.getViewport().mScrollingReferenceX = (float) (r0.mScrollingReferenceX + exactSteps);
            } else if (scrolled > exactSteps) {
                this.mGraphView.getViewport().mScrollingReferenceX = (float) (r0.mScrollingReferenceX - exactSteps);
            }
        }
        int p2 = (int) (p + scrolledPixels);
        double v2 = v + scrolled;
        for (int i = 0; i < numHorizontalLabels; i++) {
            if (p2 >= this.mGraphView.getGraphContentLeft()) {
                this.mStepsHorizontal.put(Integer.valueOf(p2), Double.valueOf(v2));
            }
            p2 = (int) (p2 + pixelStep);
            v2 += exactSteps;
        }
        return true;
    }

    protected void adjust() {
        this.mIsAdjusted = adjustVertical();
        this.mIsAdjusted &= adjustVerticalSecondScale();
        this.mIsAdjusted &= adjustHorizontal();
    }

    protected void calcLabelVerticalSize(Canvas canvas) {
        String testLabel = this.mLabelFormatter.formatLabel(this.mGraphView.getViewport().getMaxY(false), false);
        if (testLabel == null) {
            testLabel = BuildConfig.FLAVOR;
        }
        Rect textBounds = new Rect();
        this.mPaintLabel.getTextBounds(testLabel, 0, testLabel.length(), textBounds);
        this.mLabelVerticalWidth = Integer.valueOf(textBounds.width());
        this.mLabelVerticalHeight = Integer.valueOf(textBounds.height());
        String testLabel2 = this.mLabelFormatter.formatLabel(this.mGraphView.getViewport().getMinY(false), false);
        if (testLabel2 == null) {
            testLabel2 = BuildConfig.FLAVOR;
        }
        this.mPaintLabel.getTextBounds(testLabel2, 0, testLabel2.length(), textBounds);
        this.mLabelVerticalWidth = Integer.valueOf(Math.max(this.mLabelVerticalWidth.intValue(), textBounds.width()));
        this.mLabelVerticalWidth = Integer.valueOf(this.mLabelVerticalWidth.intValue() + 6);
        this.mLabelVerticalWidth = Integer.valueOf(this.mLabelVerticalWidth.intValue() + this.mStyles.labelsSpace);
        int lines = 1;
        for (byte c : testLabel2.getBytes()) {
            if (c == 10) {
                lines++;
            }
        }
        this.mLabelVerticalHeight = Integer.valueOf(this.mLabelVerticalHeight.intValue() * lines);
    }

    protected void calcLabelVerticalSecondScaleSize(Canvas canvas) {
        if (this.mGraphView.mSecondScale == null) {
            this.mLabelVerticalSecondScaleWidth = 0;
            this.mLabelVerticalSecondScaleHeight = 0;
            return;
        }
        double testY = ((this.mGraphView.mSecondScale.getMaxY() - this.mGraphView.mSecondScale.getMinY()) * 0.783d) + this.mGraphView.mSecondScale.getMinY();
        String testLabel = this.mGraphView.mSecondScale.getLabelFormatter().formatLabel(testY, false);
        Rect textBounds = new Rect();
        this.mPaintLabel.getTextBounds(testLabel, 0, testLabel.length(), textBounds);
        this.mLabelVerticalSecondScaleWidth = Integer.valueOf(textBounds.width());
        this.mLabelVerticalSecondScaleHeight = Integer.valueOf(textBounds.height());
        int lines = 1;
        for (byte c : testLabel.getBytes()) {
            if (c == 10) {
                lines++;
            }
        }
        this.mLabelVerticalSecondScaleHeight = Integer.valueOf(this.mLabelVerticalSecondScaleHeight.intValue() * lines);
    }

    protected void calcLabelHorizontalSize(Canvas canvas) {
        double testX = ((this.mGraphView.getViewport().getMaxX(false) - this.mGraphView.getViewport().getMinX(false)) * 0.783d) + this.mGraphView.getViewport().getMinX(false);
        String testLabel = this.mLabelFormatter.formatLabel(testX, true);
        if (testLabel == null) {
            testLabel = BuildConfig.FLAVOR;
        }
        Rect textBounds = new Rect();
        this.mPaintLabel.getTextBounds(testLabel, 0, testLabel.length(), textBounds);
        this.mLabelHorizontalWidth = Integer.valueOf(textBounds.width());
        if (!this.mLabelHorizontalHeightFixed) {
            this.mLabelHorizontalHeight = Integer.valueOf(textBounds.height());
            int lines = 1;
            for (byte c : testLabel.getBytes()) {
                if (c == 10) {
                    lines++;
                }
            }
            this.mLabelHorizontalHeight = Integer.valueOf(this.mLabelHorizontalHeight.intValue() * lines);
            this.mLabelHorizontalHeight = Integer.valueOf((int) Math.max(this.mLabelHorizontalHeight.intValue(), this.mStyles.textSize));
        }
        this.mLabelHorizontalHeight = Integer.valueOf(this.mLabelHorizontalHeight.intValue() + this.mStyles.labelsSpace);
    }

    public void draw(Canvas canvas) {
        boolean labelSizeChanged = false;
        if (this.mLabelHorizontalWidth == null) {
            calcLabelHorizontalSize(canvas);
            labelSizeChanged = true;
        }
        if (this.mLabelVerticalWidth == null) {
            calcLabelVerticalSize(canvas);
            labelSizeChanged = true;
        }
        if (this.mLabelVerticalSecondScaleWidth == null) {
            calcLabelVerticalSecondScaleSize(canvas);
            labelSizeChanged = true;
        }
        if (labelSizeChanged) {
            ViewCompat.postInvalidateOnAnimation(this.mGraphView);
            return;
        }
        if (!this.mIsAdjusted) {
            adjust();
        }
        if (this.mIsAdjusted) {
            drawVerticalSteps(canvas);
            drawVerticalStepsSecondScale(canvas);
            drawHorizontalSteps(canvas);
            drawHorizontalAxisTitle(canvas);
            drawVerticalAxisTitle(canvas);
        }
    }

    protected void drawHorizontalAxisTitle(Canvas canvas) {
        if (this.mHorizontalAxisTitle != null && this.mHorizontalAxisTitle.length() > 0) {
            this.mPaintAxisTitle.setColor(getHorizontalAxisTitleColor());
            this.mPaintAxisTitle.setTextSize(getHorizontalAxisTitleTextSize());
            float x = canvas.getWidth() / 2;
            float y = canvas.getHeight() - this.mStyles.padding;
            canvas.drawText(this.mHorizontalAxisTitle, x, y, this.mPaintAxisTitle);
        }
    }

    protected void drawVerticalAxisTitle(Canvas canvas) {
        if (this.mVerticalAxisTitle != null && this.mVerticalAxisTitle.length() > 0) {
            this.mPaintAxisTitle.setColor(getVerticalAxisTitleColor());
            this.mPaintAxisTitle.setTextSize(getVerticalAxisTitleTextSize());
            float x = getVerticalAxisTitleWidth();
            float y = canvas.getHeight() / 2;
            canvas.save();
            canvas.rotate(-90.0f, x, y);
            canvas.drawText(this.mVerticalAxisTitle, x, y, this.mPaintAxisTitle);
            canvas.restore();
        }
    }

    public int getHorizontalAxisTitleHeight() {
        if (this.mHorizontalAxisTitle != null && this.mHorizontalAxisTitle.length() > 0) {
            return (int) getHorizontalAxisTitleTextSize();
        }
        return 0;
    }

    public int getVerticalAxisTitleWidth() {
        if (this.mVerticalAxisTitle != null && this.mVerticalAxisTitle.length() > 0) {
            return (int) getVerticalAxisTitleTextSize();
        }
        return 0;
    }

    protected void drawHorizontalSteps(Canvas canvas) {
        this.mPaintLabel.setColor(getHorizontalLabelsColor());
        int i = 0;
        for (Map.Entry<Integer, Double> e : this.mStepsHorizontal.entrySet()) {
            if (this.mStyles.highlightZeroLines) {
                if (e.getValue().doubleValue() == 0.0d) {
                    this.mPaintLine.setStrokeWidth(5.0f);
                } else {
                    this.mPaintLine.setStrokeWidth(0.0f);
                }
            }
            if (this.mStyles.gridStyle.drawVertical()) {
                canvas.drawLine(e.getKey().intValue(), this.mGraphView.getGraphContentTop(), e.getKey().intValue(), this.mGraphView.getGraphContentTop() + this.mGraphView.getGraphContentHeight(), this.mPaintLine);
            }
            if (isHorizontalLabelsVisible()) {
                this.mPaintLabel.setTextAlign(Paint.Align.CENTER);
                if (i == this.mStepsHorizontal.size() - 1) {
                    this.mPaintLabel.setTextAlign(Paint.Align.RIGHT);
                }
                if (i == 0) {
                    this.mPaintLabel.setTextAlign(Paint.Align.LEFT);
                }
                String label = this.mLabelFormatter.formatLabel(e.getValue().doubleValue(), true);
                if (label == null) {
                    label = BuildConfig.FLAVOR;
                }
                String[] lines = label.split("\n");
                for (int li = 0; li < lines.length; li++) {
                    float y = (((canvas.getHeight() - this.mStyles.padding) - getHorizontalAxisTitleHeight()) - ((((lines.length - li) - 1) * getTextSize()) * 1.1f)) + this.mStyles.labelsSpace;
                    canvas.drawText(lines[li], e.getKey().intValue(), y, this.mPaintLabel);
                }
            }
            i++;
        }
    }

    protected void drawVerticalStepsSecondScale(Canvas canvas) {
        if (this.mGraphView.mSecondScale == null) {
            return;
        }
        float startLeft = this.mGraphView.getGraphContentLeft() + this.mGraphView.getGraphContentWidth();
        this.mPaintLabel.setColor(getVerticalLabelsSecondScaleColor());
        this.mPaintLabel.setTextAlign(getVerticalLabelsSecondScaleAlign());
        for (Map.Entry<Integer, Double> e : this.mStepsVerticalSecondScale.entrySet()) {
            int labelsWidth = this.mLabelVerticalSecondScaleWidth.intValue();
            int labelsOffset = (int) startLeft;
            if (getVerticalLabelsSecondScaleAlign() == Paint.Align.RIGHT) {
                labelsOffset += labelsWidth;
            } else if (getVerticalLabelsSecondScaleAlign() == Paint.Align.CENTER) {
                labelsOffset += labelsWidth / 2;
            }
            float y = e.getKey().intValue();
            String[] lines = this.mGraphView.mSecondScale.mLabelFormatter.formatLabel(e.getValue().doubleValue(), false).split("\n");
            float y2 = y + (((lines.length * getTextSize()) * 1.1f) / 2.0f);
            for (int li = 0; li < lines.length; li++) {
                float y22 = y2 - ((((lines.length - li) - 1) * getTextSize()) * 1.1f);
                canvas.drawText(lines[li], labelsOffset, y22, this.mPaintLabel);
            }
        }
    }

    protected void drawVerticalSteps(Canvas canvas) {
        float startLeft = this.mGraphView.getGraphContentLeft();
        this.mPaintLabel.setColor(getVerticalLabelsColor());
        this.mPaintLabel.setTextAlign(getVerticalLabelsAlign());
        for (Map.Entry<Integer, Double> e : this.mStepsVertical.entrySet()) {
            if (this.mStyles.highlightZeroLines) {
                if (e.getValue().doubleValue() == 0.0d) {
                    this.mPaintLine.setStrokeWidth(5.0f);
                } else {
                    this.mPaintLine.setStrokeWidth(0.0f);
                }
            }
            if (this.mStyles.gridStyle.drawHorizontal()) {
                canvas.drawLine(startLeft, e.getKey().intValue(), startLeft + this.mGraphView.getGraphContentWidth(), e.getKey().intValue(), this.mPaintLine);
            }
            if (isVerticalLabelsVisible()) {
                int labelsWidth = this.mLabelVerticalWidth.intValue();
                int labelsOffset = 0;
                if (getVerticalLabelsAlign() == Paint.Align.RIGHT) {
                    labelsOffset = labelsWidth - this.mStyles.labelsSpace;
                } else if (getVerticalLabelsAlign() == Paint.Align.CENTER) {
                    labelsOffset = labelsWidth / 2;
                }
                int labelsOffset2 = labelsOffset + this.mStyles.padding + getVerticalAxisTitleWidth();
                float y = e.getKey().intValue();
                String label = this.mLabelFormatter.formatLabel(e.getValue().doubleValue(), false);
                if (label == null) {
                    label = BuildConfig.FLAVOR;
                }
                String[] lines = label.split("\n");
                float y2 = y + (((lines.length * getTextSize()) * 1.1f) / 2.0f);
                for (int li = 0; li < lines.length; li++) {
                    float y22 = y2 - ((((lines.length - li) - 1) * getTextSize()) * 1.1f);
                    canvas.drawText(lines[li], labelsOffset2, y22, this.mPaintLabel);
                }
            }
        }
    }

    protected double humanRound(double in, boolean roundAlwaysUp) {
        int ten = 0;
        while (in >= 10.0d) {
            in /= 10.0d;
            ten++;
        }
        while (in < 1.0d) {
            in *= 10.0d;
            ten--;
        }
        if (roundAlwaysUp) {
            if (in != 1.0d) {
                if (in <= 2.0d) {
                    in = 2.0d;
                } else if (in <= 5.0d) {
                    in = 5.0d;
                } else if (in < 10.0d) {
                    in = 10.0d;
                }
            }
        } else if (in != 1.0d) {
            if (in <= 4.9d) {
                in = 2.0d;
            } else if (in <= 9.9d) {
                in = 5.0d;
            } else if (in < 15.0d) {
                in = 10.0d;
            }
        }
        return in * Math.pow(10.0d, ten);
    }

    public Styles getStyles() {
        return this.mStyles;
    }

    public int getLabelVerticalWidth() {
        if (this.mLabelVerticalWidth == null || !isVerticalLabelsVisible()) {
            return 0;
        }
        return this.mLabelVerticalWidth.intValue();
    }

    public void setLabelVerticalWidth(Integer width) {
        this.mLabelVerticalWidth = width;
        this.mLabelVerticalWidthFixed = this.mLabelVerticalWidth != null;
    }

    public int getLabelHorizontalHeight() {
        if (this.mLabelHorizontalHeight == null || !isHorizontalLabelsVisible()) {
            return 0;
        }
        return this.mLabelHorizontalHeight.intValue();
    }

    public void setLabelHorizontalHeight(Integer height) {
        this.mLabelHorizontalHeight = height;
        this.mLabelHorizontalHeightFixed = this.mLabelHorizontalHeight != null;
    }

    public int getGridColor() {
        return this.mStyles.gridColor;
    }

    public boolean isHighlightZeroLines() {
        return this.mStyles.highlightZeroLines;
    }

    public int getPadding() {
        return this.mStyles.padding;
    }

    public void setTextSize(float textSize) {
        this.mStyles.textSize = textSize;
    }

    public void setVerticalLabelsAlign(Paint.Align verticalLabelsAlign) {
        this.mStyles.verticalLabelsAlign = verticalLabelsAlign;
    }

    public void setVerticalLabelsColor(int verticalLabelsColor) {
        this.mStyles.verticalLabelsColor = verticalLabelsColor;
    }

    public void setHorizontalLabelsColor(int horizontalLabelsColor) {
        this.mStyles.horizontalLabelsColor = horizontalLabelsColor;
    }

    public void setGridColor(int gridColor) {
        this.mStyles.gridColor = gridColor;
    }

    public void setHighlightZeroLines(boolean highlightZeroLines) {
        this.mStyles.highlightZeroLines = highlightZeroLines;
    }

    public void setPadding(int padding) {
        this.mStyles.padding = padding;
    }

    public LabelFormatter getLabelFormatter() {
        return this.mLabelFormatter;
    }

    public void setLabelFormatter(LabelFormatter mLabelFormatter) {
        this.mLabelFormatter = mLabelFormatter;
        mLabelFormatter.setViewport(this.mGraphView.getViewport());
    }

    public String getHorizontalAxisTitle() {
        return this.mHorizontalAxisTitle;
    }

    public void setHorizontalAxisTitle(String mHorizontalAxisTitle) {
        this.mHorizontalAxisTitle = mHorizontalAxisTitle;
    }

    public String getVerticalAxisTitle() {
        return this.mVerticalAxisTitle;
    }

    public void setVerticalAxisTitle(String mVerticalAxisTitle) {
        this.mVerticalAxisTitle = mVerticalAxisTitle;
    }

    public float getVerticalAxisTitleTextSize() {
        return this.mStyles.verticalAxisTitleTextSize;
    }

    public void setVerticalAxisTitleTextSize(float verticalAxisTitleTextSize) {
        this.mStyles.verticalAxisTitleTextSize = verticalAxisTitleTextSize;
    }

    public int getVerticalAxisTitleColor() {
        return this.mStyles.verticalAxisTitleColor;
    }

    public void setVerticalAxisTitleColor(int verticalAxisTitleColor) {
        this.mStyles.verticalAxisTitleColor = verticalAxisTitleColor;
    }

    public float getHorizontalAxisTitleTextSize() {
        return this.mStyles.horizontalAxisTitleTextSize;
    }

    public void setHorizontalAxisTitleTextSize(float horizontalAxisTitleTextSize) {
        this.mStyles.horizontalAxisTitleTextSize = horizontalAxisTitleTextSize;
    }

    public int getHorizontalAxisTitleColor() {
        return this.mStyles.horizontalAxisTitleColor;
    }

    public void setHorizontalAxisTitleColor(int horizontalAxisTitleColor) {
        this.mStyles.horizontalAxisTitleColor = horizontalAxisTitleColor;
    }

    public Paint.Align getVerticalLabelsSecondScaleAlign() {
        return this.mStyles.verticalLabelsSecondScaleAlign;
    }

    public void setVerticalLabelsSecondScaleAlign(Paint.Align verticalLabelsSecondScaleAlign) {
        this.mStyles.verticalLabelsSecondScaleAlign = verticalLabelsSecondScaleAlign;
    }

    public int getVerticalLabelsSecondScaleColor() {
        return this.mStyles.verticalLabelsSecondScaleColor;
    }

    public void setVerticalLabelsSecondScaleColor(int verticalLabelsSecondScaleColor) {
        this.mStyles.verticalLabelsSecondScaleColor = verticalLabelsSecondScaleColor;
    }

    public int getLabelVerticalSecondScaleWidth() {
        if (this.mLabelVerticalSecondScaleWidth == null) {
            return 0;
        }
        return this.mLabelVerticalSecondScaleWidth.intValue();
    }

    public boolean isHorizontalLabelsVisible() {
        return this.mStyles.horizontalLabelsVisible;
    }

    public void setHorizontalLabelsVisible(boolean horizontalTitleVisible) {
        this.mStyles.horizontalLabelsVisible = horizontalTitleVisible;
    }

    public boolean isVerticalLabelsVisible() {
        return this.mStyles.verticalLabelsVisible;
    }

    public void setVerticalLabelsVisible(boolean verticalTitleVisible) {
        this.mStyles.verticalLabelsVisible = verticalTitleVisible;
    }

    public int getNumVerticalLabels() {
        return this.mNumVerticalLabels;
    }

    public void setNumVerticalLabels(int mNumVerticalLabels) {
        this.mNumVerticalLabels = mNumVerticalLabels;
    }

    public int getNumHorizontalLabels() {
        return this.mNumHorizontalLabels;
    }

    public void setNumHorizontalLabels(int mNumHorizontalLabels) {
        this.mNumHorizontalLabels = mNumHorizontalLabels;
    }

    public GridStyle getGridStyle() {
        return this.mStyles.gridStyle;
    }

    public void setGridStyle(GridStyle gridStyle) {
        this.mStyles.gridStyle = gridStyle;
    }

    public int getLabelsSpace() {
        return this.mStyles.labelsSpace;
    }

    public void setLabelsSpace(int labelsSpace) {
        this.mStyles.labelsSpace = labelsSpace;
    }
}
