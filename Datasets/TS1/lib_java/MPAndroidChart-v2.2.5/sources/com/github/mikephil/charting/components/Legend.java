package com.github.mikephil.charting.components;

import android.graphics.Paint;
import com.github.mikephil.charting.BuildConfig;
import com.github.mikephil.charting.charts.Chart;
import com.github.mikephil.charting.utils.FSize;
import com.github.mikephil.charting.utils.Utils;
import com.github.mikephil.charting.utils.ViewPortHandler;
import java.util.ArrayList;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/components/Legend.class */
public class Legend extends ComponentBase {
    private int[] mColors;
    private String[] mLabels;
    private int[] mExtraColors;
    private String[] mExtraLabels;
    private boolean mIsLegendCustom;
    private LegendHorizontalAlignment mHorizontalAlignment;
    private LegendVerticalAlignment mVerticalAlignment;
    private LegendOrientation mOrientation;
    private boolean mDrawInside;
    private LegendDirection mDirection;
    private LegendForm mShape;
    private float mFormSize;
    private float mXEntrySpace;
    private float mYEntrySpace;
    private float mFormToTextSpace;
    private float mStackSpace;
    private float mMaxSizePercent;
    public float mNeededWidth;
    public float mNeededHeight;
    public float mTextHeightMax;
    public float mTextWidthMax;
    private boolean mWordWrapEnabled;
    private FSize[] mCalculatedLabelSizes;
    private Boolean[] mCalculatedLabelBreakPoints;
    private FSize[] mCalculatedLineSizes;

    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/components/Legend$LegendDirection.class */
    public enum LegendDirection {
        LEFT_TO_RIGHT,
        RIGHT_TO_LEFT
    }

    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/components/Legend$LegendForm.class */
    public enum LegendForm {
        SQUARE,
        CIRCLE,
        LINE
    }

    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/components/Legend$LegendHorizontalAlignment.class */
    public enum LegendHorizontalAlignment {
        LEFT,
        CENTER,
        RIGHT
    }

    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/components/Legend$LegendOrientation.class */
    public enum LegendOrientation {
        HORIZONTAL,
        VERTICAL
    }

    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/components/Legend$LegendPosition.class */
    public enum LegendPosition {
        RIGHT_OF_CHART,
        RIGHT_OF_CHART_CENTER,
        RIGHT_OF_CHART_INSIDE,
        LEFT_OF_CHART,
        LEFT_OF_CHART_CENTER,
        LEFT_OF_CHART_INSIDE,
        BELOW_CHART_LEFT,
        BELOW_CHART_RIGHT,
        BELOW_CHART_CENTER,
        ABOVE_CHART_LEFT,
        ABOVE_CHART_RIGHT,
        ABOVE_CHART_CENTER,
        PIECHART_CENTER
    }

    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/components/Legend$LegendVerticalAlignment.class */
    public enum LegendVerticalAlignment {
        TOP,
        CENTER,
        BOTTOM
    }

    public Legend() {
        this.mIsLegendCustom = false;
        this.mHorizontalAlignment = LegendHorizontalAlignment.LEFT;
        this.mVerticalAlignment = LegendVerticalAlignment.BOTTOM;
        this.mOrientation = LegendOrientation.HORIZONTAL;
        this.mDrawInside = false;
        this.mDirection = LegendDirection.LEFT_TO_RIGHT;
        this.mShape = LegendForm.SQUARE;
        this.mFormSize = 8.0f;
        this.mXEntrySpace = 6.0f;
        this.mYEntrySpace = 0.0f;
        this.mFormToTextSpace = 5.0f;
        this.mStackSpace = 3.0f;
        this.mMaxSizePercent = 0.95f;
        this.mNeededWidth = 0.0f;
        this.mNeededHeight = 0.0f;
        this.mTextHeightMax = 0.0f;
        this.mTextWidthMax = 0.0f;
        this.mWordWrapEnabled = false;
        this.mCalculatedLabelSizes = new FSize[0];
        this.mCalculatedLabelBreakPoints = new Boolean[0];
        this.mCalculatedLineSizes = new FSize[0];
        this.mFormSize = Utils.convertDpToPixel(8.0f);
        this.mXEntrySpace = Utils.convertDpToPixel(6.0f);
        this.mYEntrySpace = Utils.convertDpToPixel(0.0f);
        this.mFormToTextSpace = Utils.convertDpToPixel(5.0f);
        this.mTextSize = Utils.convertDpToPixel(10.0f);
        this.mStackSpace = Utils.convertDpToPixel(3.0f);
        this.mXOffset = Utils.convertDpToPixel(5.0f);
        this.mYOffset = Utils.convertDpToPixel(3.0f);
    }

    public Legend(int[] colors, String[] labels) {
        this();
        if (colors == null || labels == null) {
            throw new IllegalArgumentException("colors array or labels array is NULL");
        }
        if (colors.length != labels.length) {
            throw new IllegalArgumentException("colors array and labels array need to be of same size");
        }
        this.mColors = colors;
        this.mLabels = labels;
    }

    public Legend(List<Integer> colors, List<String> labels) {
        this();
        if (colors == null || labels == null) {
            throw new IllegalArgumentException("colors array or labels array is NULL");
        }
        if (colors.size() != labels.size()) {
            throw new IllegalArgumentException("colors array and labels array need to be of same size");
        }
        this.mColors = Utils.convertIntegers(colors);
        this.mLabels = Utils.convertStrings(labels);
    }

    public void setComputedColors(List<Integer> colors) {
        this.mColors = Utils.convertIntegers(colors);
    }

    public void setComputedLabels(List<String> labels) {
        this.mLabels = Utils.convertStrings(labels);
    }

    public float getMaximumEntryWidth(Paint p) {
        float max = 0.0f;
        for (int i = 0; i < this.mLabels.length; i++) {
            if (this.mLabels[i] != null) {
                float length = Utils.calcTextWidth(p, this.mLabels[i]);
                if (length > max) {
                    max = length;
                }
            }
        }
        return max + this.mFormSize + this.mFormToTextSpace;
    }

    public float getMaximumEntryHeight(Paint p) {
        float max = 0.0f;
        for (int i = 0; i < this.mLabels.length; i++) {
            if (this.mLabels[i] != null) {
                float length = Utils.calcTextHeight(p, this.mLabels[i]);
                if (length > max) {
                    max = length;
                }
            }
        }
        return max;
    }

    public int[] getColors() {
        return this.mColors;
    }

    public String[] getLabels() {
        return this.mLabels;
    }

    public String getLabel(int index) {
        return this.mLabels[index];
    }

    public int[] getExtraColors() {
        return this.mExtraColors;
    }

    public String[] getExtraLabels() {
        return this.mExtraLabels;
    }

    public void setExtra(List<Integer> colors, List<String> labels) {
        this.mExtraColors = Utils.convertIntegers(colors);
        this.mExtraLabels = Utils.convertStrings(labels);
    }

    public void setExtra(int[] colors, String[] labels) {
        this.mExtraColors = colors;
        this.mExtraLabels = labels;
    }

    public void setCustom(int[] colors, String[] labels) {
        if (colors.length != labels.length) {
            throw new IllegalArgumentException("colors array and labels array need to be of same size");
        }
        this.mLabels = labels;
        this.mColors = colors;
        this.mIsLegendCustom = true;
    }

    public void setCustom(List<Integer> colors, List<String> labels) {
        if (colors.size() != labels.size()) {
            throw new IllegalArgumentException("colors array and labels array need to be of same size");
        }
        this.mColors = Utils.convertIntegers(colors);
        this.mLabels = Utils.convertStrings(labels);
        this.mIsLegendCustom = true;
    }

    public void resetCustom() {
        this.mIsLegendCustom = false;
    }

    public boolean isLegendCustom() {
        return this.mIsLegendCustom;
    }

    public LegendPosition getPosition() {
        if (this.mOrientation == LegendOrientation.VERTICAL && this.mHorizontalAlignment == LegendHorizontalAlignment.CENTER && this.mVerticalAlignment == LegendVerticalAlignment.CENTER) {
            return LegendPosition.PIECHART_CENTER;
        }
        return this.mOrientation == LegendOrientation.HORIZONTAL ? this.mVerticalAlignment == LegendVerticalAlignment.TOP ? this.mHorizontalAlignment == LegendHorizontalAlignment.LEFT ? LegendPosition.ABOVE_CHART_LEFT : this.mHorizontalAlignment == LegendHorizontalAlignment.RIGHT ? LegendPosition.ABOVE_CHART_RIGHT : LegendPosition.ABOVE_CHART_CENTER : this.mHorizontalAlignment == LegendHorizontalAlignment.LEFT ? LegendPosition.BELOW_CHART_LEFT : this.mHorizontalAlignment == LegendHorizontalAlignment.RIGHT ? LegendPosition.BELOW_CHART_RIGHT : LegendPosition.BELOW_CHART_CENTER : this.mHorizontalAlignment == LegendHorizontalAlignment.LEFT ? (this.mVerticalAlignment == LegendVerticalAlignment.TOP && this.mDrawInside) ? LegendPosition.LEFT_OF_CHART_INSIDE : this.mVerticalAlignment == LegendVerticalAlignment.CENTER ? LegendPosition.LEFT_OF_CHART_CENTER : LegendPosition.LEFT_OF_CHART : (this.mVerticalAlignment == LegendVerticalAlignment.TOP && this.mDrawInside) ? LegendPosition.RIGHT_OF_CHART_INSIDE : this.mVerticalAlignment == LegendVerticalAlignment.CENTER ? LegendPosition.RIGHT_OF_CHART_CENTER : LegendPosition.RIGHT_OF_CHART;
    }

    public void setPosition(LegendPosition newValue) {
        switch (AnonymousClass1.$SwitchMap$com$github$mikephil$charting$components$Legend$LegendPosition[newValue.ordinal()]) {
            case BuildConfig.VERSION_CODE /* 1 */:
            case 2:
            case 3:
                this.mHorizontalAlignment = LegendHorizontalAlignment.LEFT;
                this.mVerticalAlignment = newValue == LegendPosition.LEFT_OF_CHART_CENTER ? LegendVerticalAlignment.CENTER : LegendVerticalAlignment.TOP;
                this.mOrientation = LegendOrientation.VERTICAL;
                break;
            case Chart.PAINT_GRID_BACKGROUND /* 4 */:
            case 5:
            case 6:
                this.mHorizontalAlignment = LegendHorizontalAlignment.RIGHT;
                this.mVerticalAlignment = newValue == LegendPosition.RIGHT_OF_CHART_CENTER ? LegendVerticalAlignment.CENTER : LegendVerticalAlignment.TOP;
                this.mOrientation = LegendOrientation.VERTICAL;
                break;
            case Chart.PAINT_INFO /* 7 */:
            case 8:
            case 9:
                this.mHorizontalAlignment = newValue == LegendPosition.ABOVE_CHART_LEFT ? LegendHorizontalAlignment.LEFT : newValue == LegendPosition.ABOVE_CHART_RIGHT ? LegendHorizontalAlignment.RIGHT : LegendHorizontalAlignment.CENTER;
                this.mVerticalAlignment = LegendVerticalAlignment.TOP;
                this.mOrientation = LegendOrientation.HORIZONTAL;
                break;
            case 10:
            case Chart.PAINT_DESCRIPTION /* 11 */:
            case 12:
                this.mHorizontalAlignment = newValue == LegendPosition.BELOW_CHART_LEFT ? LegendHorizontalAlignment.LEFT : newValue == LegendPosition.BELOW_CHART_RIGHT ? LegendHorizontalAlignment.RIGHT : LegendHorizontalAlignment.CENTER;
                this.mVerticalAlignment = LegendVerticalAlignment.BOTTOM;
                this.mOrientation = LegendOrientation.HORIZONTAL;
                break;
            case Chart.PAINT_HOLE /* 13 */:
                this.mHorizontalAlignment = LegendHorizontalAlignment.CENTER;
                this.mVerticalAlignment = LegendVerticalAlignment.CENTER;
                this.mOrientation = LegendOrientation.VERTICAL;
                break;
        }
        this.mDrawInside = newValue == LegendPosition.LEFT_OF_CHART_INSIDE || newValue == LegendPosition.RIGHT_OF_CHART_INSIDE;
    }

    public LegendHorizontalAlignment getHorizontalAlignment() {
        return this.mHorizontalAlignment;
    }

    public void setHorizontalAlignment(LegendHorizontalAlignment value) {
        this.mHorizontalAlignment = value;
    }

    public LegendVerticalAlignment getVerticalAlignment() {
        return this.mVerticalAlignment;
    }

    public void setVerticalAlignment(LegendVerticalAlignment value) {
        this.mVerticalAlignment = value;
    }

    public LegendOrientation getOrientation() {
        return this.mOrientation;
    }

    public void setOrientation(LegendOrientation value) {
        this.mOrientation = value;
    }

    public boolean isDrawInsideEnabled() {
        return this.mDrawInside;
    }

    public void setDrawInside(boolean value) {
        this.mDrawInside = value;
    }

    public LegendDirection getDirection() {
        return this.mDirection;
    }

    public void setDirection(LegendDirection pos) {
        this.mDirection = pos;
    }

    public LegendForm getForm() {
        return this.mShape;
    }

    public void setForm(LegendForm shape) {
        this.mShape = shape;
    }

    public void setFormSize(float size) {
        this.mFormSize = Utils.convertDpToPixel(size);
    }

    public float getFormSize() {
        return this.mFormSize;
    }

    public float getXEntrySpace() {
        return this.mXEntrySpace;
    }

    public void setXEntrySpace(float space) {
        this.mXEntrySpace = Utils.convertDpToPixel(space);
    }

    public float getYEntrySpace() {
        return this.mYEntrySpace;
    }

    public void setYEntrySpace(float space) {
        this.mYEntrySpace = Utils.convertDpToPixel(space);
    }

    public float getFormToTextSpace() {
        return this.mFormToTextSpace;
    }

    public void setFormToTextSpace(float space) {
        this.mFormToTextSpace = Utils.convertDpToPixel(space);
    }

    public float getStackSpace() {
        return this.mStackSpace;
    }

    public void setStackSpace(float space) {
        this.mStackSpace = space;
    }

    public float getFullWidth(Paint labelpaint) {
        float width = 0.0f;
        for (int i = 0; i < this.mLabels.length; i++) {
            if (this.mLabels[i] != null) {
                if (this.mColors[i] != 1122868) {
                    width += this.mFormSize + this.mFormToTextSpace;
                }
                width += Utils.calcTextWidth(labelpaint, this.mLabels[i]);
                if (i < this.mLabels.length - 1) {
                    width += this.mXEntrySpace;
                }
            } else {
                width += this.mFormSize;
                if (i < this.mLabels.length - 1) {
                    width += this.mStackSpace;
                }
            }
        }
        return width;
    }

    public float getFullHeight(Paint labelpaint) {
        float height = 0.0f;
        for (int i = 0; i < this.mLabels.length; i++) {
            if (this.mLabels[i] != null) {
                height += Utils.calcTextHeight(labelpaint, this.mLabels[i]);
                if (i < this.mLabels.length - 1) {
                    height += this.mYEntrySpace;
                }
            }
        }
        return height;
    }

    public void setWordWrapEnabled(boolean enabled) {
        this.mWordWrapEnabled = enabled;
    }

    public boolean isWordWrapEnabled() {
        return this.mWordWrapEnabled;
    }

    public float getMaxSizePercent() {
        return this.mMaxSizePercent;
    }

    public void setMaxSizePercent(float maxSize) {
        this.mMaxSizePercent = maxSize;
    }

    public FSize[] getCalculatedLabelSizes() {
        return this.mCalculatedLabelSizes;
    }

    public Boolean[] getCalculatedLabelBreakPoints() {
        return this.mCalculatedLabelBreakPoints;
    }

    public FSize[] getCalculatedLineSizes() {
        return this.mCalculatedLineSizes;
    }

    public void calculateDimensions(Paint labelpaint, ViewPortHandler viewPortHandler) {
        float requiredWidth;
        this.mTextWidthMax = getMaximumEntryWidth(labelpaint);
        this.mTextHeightMax = getMaximumEntryHeight(labelpaint);
        switch (AnonymousClass1.$SwitchMap$com$github$mikephil$charting$components$Legend$LegendOrientation[this.mOrientation.ordinal()]) {
            case BuildConfig.VERSION_CODE /* 1 */:
                float maxWidth = 0.0f;
                float maxHeight = 0.0f;
                float width = 0.0f;
                float labelLineHeight = Utils.getLineHeight(labelpaint);
                int count = this.mLabels.length;
                boolean wasStacked = false;
                for (int i = 0; i < count; i++) {
                    boolean drawingForm = this.mColors[i] != 1122868;
                    if (!wasStacked) {
                        width = 0.0f;
                    }
                    if (drawingForm) {
                        if (wasStacked) {
                            width += this.mStackSpace;
                        }
                        width += this.mFormSize;
                    }
                    if (this.mLabels[i] != null) {
                        if (drawingForm && !wasStacked) {
                            width += this.mFormToTextSpace;
                        } else if (wasStacked) {
                            maxWidth = Math.max(maxWidth, width);
                            maxHeight += labelLineHeight + this.mYEntrySpace;
                            width = 0.0f;
                            wasStacked = false;
                        }
                        width += Utils.calcTextWidth(labelpaint, this.mLabels[i]);
                        if (i < count - 1) {
                            maxHeight += labelLineHeight + this.mYEntrySpace;
                        }
                    } else {
                        wasStacked = true;
                        width += this.mFormSize;
                        if (i < count - 1) {
                            width += this.mStackSpace;
                        }
                    }
                    maxWidth = Math.max(maxWidth, width);
                }
                this.mNeededWidth = maxWidth;
                this.mNeededHeight = maxHeight;
                break;
            case 2:
                int labelCount = this.mLabels.length;
                float labelLineHeight2 = Utils.getLineHeight(labelpaint);
                float labelLineSpacing = Utils.getLineSpacing(labelpaint) + this.mYEntrySpace;
                float contentWidth = viewPortHandler.contentWidth() * this.mMaxSizePercent;
                ArrayList<FSize> calculatedLabelSizes = new ArrayList<>(labelCount);
                ArrayList<Boolean> calculatedLabelBreakPoints = new ArrayList<>(labelCount);
                ArrayList<FSize> calculatedLineSizes = new ArrayList<>();
                float maxLineWidth = 0.0f;
                float currentLineWidth = 0.0f;
                float requiredWidth2 = 0.0f;
                int stackedStartIndex = -1;
                for (int i2 = 0; i2 < labelCount; i2++) {
                    boolean drawingForm2 = this.mColors[i2] != 1122868;
                    calculatedLabelBreakPoints.add(false);
                    if (stackedStartIndex == -1) {
                        requiredWidth = 0.0f;
                    } else {
                        requiredWidth = requiredWidth2 + this.mStackSpace;
                    }
                    if (this.mLabels[i2] != null) {
                        calculatedLabelSizes.add(Utils.calcTextSize(labelpaint, this.mLabels[i2]));
                        requiredWidth2 = requiredWidth + (drawingForm2 ? this.mFormToTextSpace + this.mFormSize : 0.0f) + calculatedLabelSizes.get(i2).width;
                    } else {
                        calculatedLabelSizes.add(new FSize(0.0f, 0.0f));
                        requiredWidth2 = requiredWidth + (drawingForm2 ? this.mFormSize : 0.0f);
                        if (stackedStartIndex == -1) {
                            stackedStartIndex = i2;
                        }
                    }
                    if (this.mLabels[i2] != null || i2 == labelCount - 1) {
                        float requiredSpacing = currentLineWidth == 0.0f ? 0.0f : this.mXEntrySpace;
                        if (!this.mWordWrapEnabled || currentLineWidth == 0.0f || contentWidth - currentLineWidth >= requiredSpacing + requiredWidth2) {
                            currentLineWidth += requiredSpacing + requiredWidth2;
                        } else {
                            calculatedLineSizes.add(new FSize(currentLineWidth, labelLineHeight2));
                            maxLineWidth = Math.max(maxLineWidth, currentLineWidth);
                            calculatedLabelBreakPoints.set(stackedStartIndex > -1 ? stackedStartIndex : i2, true);
                            currentLineWidth = requiredWidth2;
                        }
                        if (i2 == labelCount - 1) {
                            calculatedLineSizes.add(new FSize(currentLineWidth, labelLineHeight2));
                            maxLineWidth = Math.max(maxLineWidth, currentLineWidth);
                        }
                    }
                    stackedStartIndex = this.mLabels[i2] != null ? -1 : stackedStartIndex;
                }
                this.mCalculatedLabelSizes = (FSize[]) calculatedLabelSizes.toArray(new FSize[calculatedLabelSizes.size()]);
                this.mCalculatedLabelBreakPoints = (Boolean[]) calculatedLabelBreakPoints.toArray(new Boolean[calculatedLabelBreakPoints.size()]);
                this.mCalculatedLineSizes = (FSize[]) calculatedLineSizes.toArray(new FSize[calculatedLineSizes.size()]);
                this.mNeededWidth = maxLineWidth;
                this.mNeededHeight = (labelLineHeight2 * this.mCalculatedLineSizes.length) + (labelLineSpacing * (this.mCalculatedLineSizes.length == 0 ? 0 : this.mCalculatedLineSizes.length - 1));
                break;
        }
    }

    /* renamed from: com.github.mikephil.charting.components.Legend$1, reason: invalid class name */
    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/components/Legend$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$github$mikephil$charting$components$Legend$LegendPosition;
        static final /* synthetic */ int[] $SwitchMap$com$github$mikephil$charting$components$Legend$LegendOrientation = new int[LegendOrientation.values().length];

        static {
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendOrientation[LegendOrientation.VERTICAL.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendOrientation[LegendOrientation.HORIZONTAL.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            $SwitchMap$com$github$mikephil$charting$components$Legend$LegendPosition = new int[LegendPosition.values().length];
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendPosition[LegendPosition.LEFT_OF_CHART.ordinal()] = 1;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendPosition[LegendPosition.LEFT_OF_CHART_INSIDE.ordinal()] = 2;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendPosition[LegendPosition.LEFT_OF_CHART_CENTER.ordinal()] = 3;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendPosition[LegendPosition.RIGHT_OF_CHART.ordinal()] = 4;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendPosition[LegendPosition.RIGHT_OF_CHART_INSIDE.ordinal()] = 5;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendPosition[LegendPosition.RIGHT_OF_CHART_CENTER.ordinal()] = 6;
            } catch (NoSuchFieldError e8) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendPosition[LegendPosition.ABOVE_CHART_LEFT.ordinal()] = 7;
            } catch (NoSuchFieldError e9) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendPosition[LegendPosition.ABOVE_CHART_CENTER.ordinal()] = 8;
            } catch (NoSuchFieldError e10) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendPosition[LegendPosition.ABOVE_CHART_RIGHT.ordinal()] = 9;
            } catch (NoSuchFieldError e11) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendPosition[LegendPosition.BELOW_CHART_LEFT.ordinal()] = 10;
            } catch (NoSuchFieldError e12) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendPosition[LegendPosition.BELOW_CHART_CENTER.ordinal()] = 11;
            } catch (NoSuchFieldError e13) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendPosition[LegendPosition.BELOW_CHART_RIGHT.ordinal()] = 12;
            } catch (NoSuchFieldError e14) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendPosition[LegendPosition.PIECHART_CENTER.ordinal()] = 13;
            } catch (NoSuchFieldError e15) {
            }
        }
    }
}
