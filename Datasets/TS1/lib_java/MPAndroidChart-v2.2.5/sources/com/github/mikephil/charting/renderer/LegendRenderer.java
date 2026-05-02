package com.github.mikephil.charting.renderer;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Typeface;
import com.github.mikephil.charting.BuildConfig;
import com.github.mikephil.charting.components.Legend;
import com.github.mikephil.charting.data.ChartData;
import com.github.mikephil.charting.interfaces.datasets.IBarDataSet;
import com.github.mikephil.charting.interfaces.datasets.ICandleDataSet;
import com.github.mikephil.charting.interfaces.datasets.IDataSet;
import com.github.mikephil.charting.interfaces.datasets.IPieDataSet;
import com.github.mikephil.charting.utils.ColorTemplate;
import com.github.mikephil.charting.utils.FSize;
import com.github.mikephil.charting.utils.Utils;
import com.github.mikephil.charting.utils.ViewPortHandler;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/renderer/LegendRenderer.class */
public class LegendRenderer extends Renderer {
    protected Paint mLegendLabelPaint;
    protected Paint mLegendFormPaint;
    protected Legend mLegend;

    public LegendRenderer(ViewPortHandler viewPortHandler, Legend legend) {
        super(viewPortHandler);
        this.mLegend = legend;
        this.mLegendLabelPaint = new Paint(1);
        this.mLegendLabelPaint.setTextSize(Utils.convertDpToPixel(9.0f));
        this.mLegendLabelPaint.setTextAlign(Paint.Align.LEFT);
        this.mLegendFormPaint = new Paint(1);
        this.mLegendFormPaint.setStyle(Paint.Style.FILL);
        this.mLegendFormPaint.setStrokeWidth(3.0f);
    }

    public Paint getLabelPaint() {
        return this.mLegendLabelPaint;
    }

    public Paint getFormPaint() {
        return this.mLegendFormPaint;
    }

    public void computeLegend(ChartData<?> data) {
        if (!this.mLegend.isLegendCustom()) {
            List<String> labels = new ArrayList<>();
            List<Integer> colors = new ArrayList<>();
            for (int i = 0; i < data.getDataSetCount(); i++) {
                IDataSet dataSet = data.getDataSetByIndex(i);
                List<Integer> clrs = dataSet.getColors();
                int entryCount = dataSet.getEntryCount();
                if ((dataSet instanceof IBarDataSet) && ((IBarDataSet) dataSet).isStacked()) {
                    IBarDataSet bds = (IBarDataSet) dataSet;
                    String[] sLabels = bds.getStackLabels();
                    for (int j = 0; j < clrs.size() && j < bds.getStackSize(); j++) {
                        labels.add(sLabels[j % sLabels.length]);
                        colors.add(clrs.get(j));
                    }
                    if (bds.getLabel() != null) {
                        colors.add(Integer.valueOf(ColorTemplate.COLOR_SKIP));
                        labels.add(bds.getLabel());
                    }
                } else if (dataSet instanceof IPieDataSet) {
                    List<String> xVals = data.getXVals();
                    IPieDataSet pds = (IPieDataSet) dataSet;
                    for (int j2 = 0; j2 < clrs.size() && j2 < entryCount && j2 < xVals.size(); j2++) {
                        labels.add(xVals.get(j2));
                        colors.add(clrs.get(j2));
                    }
                    if (pds.getLabel() != null) {
                        colors.add(Integer.valueOf(ColorTemplate.COLOR_SKIP));
                        labels.add(pds.getLabel());
                    }
                } else if ((dataSet instanceof ICandleDataSet) && ((ICandleDataSet) dataSet).getDecreasingColor() != 1122867) {
                    colors.add(Integer.valueOf(((ICandleDataSet) dataSet).getDecreasingColor()));
                    colors.add(Integer.valueOf(((ICandleDataSet) dataSet).getIncreasingColor()));
                    labels.add(null);
                    labels.add(dataSet.getLabel());
                } else {
                    for (int j3 = 0; j3 < clrs.size() && j3 < entryCount; j3++) {
                        if (j3 < clrs.size() - 1 && j3 < entryCount - 1) {
                            labels.add(null);
                        } else {
                            String label = data.getDataSetByIndex(i).getLabel();
                            labels.add(label);
                        }
                        colors.add(clrs.get(j3));
                    }
                }
            }
            if (this.mLegend.getExtraColors() != null && this.mLegend.getExtraLabels() != null) {
                int[] arr$ = this.mLegend.getExtraColors();
                for (int color : arr$) {
                    colors.add(Integer.valueOf(color));
                }
                Collections.addAll(labels, this.mLegend.getExtraLabels());
            }
            this.mLegend.setComputedColors(colors);
            this.mLegend.setComputedLabels(labels);
        }
        Typeface tf = this.mLegend.getTypeface();
        if (tf != null) {
            this.mLegendLabelPaint.setTypeface(tf);
        }
        this.mLegendLabelPaint.setTextSize(this.mLegend.getTextSize());
        this.mLegendLabelPaint.setColor(this.mLegend.getTextColor());
        this.mLegend.calculateDimensions(this.mLegendLabelPaint, this.mViewPortHandler);
    }

    public void renderLegend(Canvas c) {
        float f;
        float f2;
        float originPosX;
        if (!this.mLegend.isEnabled()) {
        }
        Typeface tf = this.mLegend.getTypeface();
        if (tf != null) {
            this.mLegendLabelPaint.setTypeface(tf);
        }
        this.mLegendLabelPaint.setTextSize(this.mLegend.getTextSize());
        this.mLegendLabelPaint.setColor(this.mLegend.getTextColor());
        float labelLineHeight = Utils.getLineHeight(this.mLegendLabelPaint);
        float labelLineSpacing = Utils.getLineSpacing(this.mLegendLabelPaint) + this.mLegend.getYEntrySpace();
        float formYOffset = labelLineHeight - (Utils.calcTextHeight(this.mLegendLabelPaint, "ABC") / 2.0f);
        String[] labels = this.mLegend.getLabels();
        int[] colors = this.mLegend.getColors();
        float formToTextSpace = this.mLegend.getFormToTextSpace();
        float xEntrySpace = this.mLegend.getXEntrySpace();
        Legend.LegendOrientation orientation = this.mLegend.getOrientation();
        Legend.LegendHorizontalAlignment horizontalAlignment = this.mLegend.getHorizontalAlignment();
        Legend.LegendVerticalAlignment verticalAlignment = this.mLegend.getVerticalAlignment();
        Legend.LegendDirection direction = this.mLegend.getDirection();
        float formSize = this.mLegend.getFormSize();
        float stackSpace = this.mLegend.getStackSpace();
        float yoffset = this.mLegend.getYOffset();
        float xoffset = this.mLegend.getXOffset();
        float originPosX2 = 0.0f;
        switch (AnonymousClass1.$SwitchMap$com$github$mikephil$charting$components$Legend$LegendHorizontalAlignment[horizontalAlignment.ordinal()]) {
            case BuildConfig.VERSION_CODE /* 1 */:
                if (orientation == Legend.LegendOrientation.VERTICAL) {
                    originPosX2 = xoffset;
                } else {
                    originPosX2 = this.mViewPortHandler.contentLeft() + xoffset;
                }
                if (direction == Legend.LegendDirection.RIGHT_TO_LEFT) {
                    originPosX2 += this.mLegend.mNeededWidth;
                    break;
                }
                break;
            case 2:
                if (orientation == Legend.LegendOrientation.VERTICAL) {
                    originPosX2 = this.mViewPortHandler.getChartWidth() - xoffset;
                } else {
                    originPosX2 = this.mViewPortHandler.contentRight() - xoffset;
                }
                if (direction == Legend.LegendDirection.LEFT_TO_RIGHT) {
                    originPosX2 -= this.mLegend.mNeededWidth;
                    break;
                }
                break;
            case 3:
                if (orientation == Legend.LegendOrientation.VERTICAL) {
                    originPosX = this.mViewPortHandler.getChartWidth() / 2.0f;
                } else {
                    originPosX = this.mViewPortHandler.contentLeft() + (this.mViewPortHandler.contentWidth() / 2.0f);
                }
                originPosX2 = originPosX + (direction == Legend.LegendDirection.LEFT_TO_RIGHT ? xoffset : -xoffset);
                if (orientation == Legend.LegendOrientation.VERTICAL) {
                    originPosX2 = (float) (originPosX2 + (direction == Legend.LegendDirection.LEFT_TO_RIGHT ? ((-this.mLegend.mNeededWidth) / 2.0d) + xoffset : (this.mLegend.mNeededWidth / 2.0d) - xoffset));
                    break;
                }
                break;
        }
        switch (AnonymousClass1.$SwitchMap$com$github$mikephil$charting$components$Legend$LegendOrientation[orientation.ordinal()]) {
            case BuildConfig.VERSION_CODE /* 1 */:
                FSize[] calculatedLineSizes = this.mLegend.getCalculatedLineSizes();
                FSize[] calculatedLabelSizes = this.mLegend.getCalculatedLabelSizes();
                Boolean[] calculatedLabelBreakPoints = this.mLegend.getCalculatedLabelBreakPoints();
                float posX = originPosX2;
                float posY = 0.0f;
                switch (AnonymousClass1.$SwitchMap$com$github$mikephil$charting$components$Legend$LegendVerticalAlignment[verticalAlignment.ordinal()]) {
                    case BuildConfig.VERSION_CODE /* 1 */:
                        posY = yoffset;
                        break;
                    case 2:
                        posY = (this.mViewPortHandler.getChartHeight() - yoffset) - this.mLegend.mNeededHeight;
                        break;
                    case 3:
                        posY = ((this.mViewPortHandler.getChartHeight() - this.mLegend.mNeededHeight) / 2.0f) + yoffset;
                        break;
                }
                int lineIndex = 0;
                int count = labels.length;
                for (int i = 0; i < count; i++) {
                    if (i < calculatedLabelBreakPoints.length && calculatedLabelBreakPoints[i].booleanValue()) {
                        posX = originPosX2;
                        posY += labelLineHeight + labelLineSpacing;
                    }
                    if (posX == originPosX2 && horizontalAlignment == Legend.LegendHorizontalAlignment.CENTER && lineIndex < calculatedLineSizes.length) {
                        posX += (direction == Legend.LegendDirection.RIGHT_TO_LEFT ? calculatedLineSizes[lineIndex].width : -calculatedLineSizes[lineIndex].width) / 2.0f;
                        lineIndex++;
                    }
                    boolean drawingForm = colors[i] != 1122868;
                    boolean isStacked = labels[i] == null;
                    if (drawingForm) {
                        if (direction == Legend.LegendDirection.RIGHT_TO_LEFT) {
                            posX -= formSize;
                        }
                        drawForm(c, posX, posY + formYOffset, i, this.mLegend);
                        if (direction == Legend.LegendDirection.LEFT_TO_RIGHT) {
                            posX += formSize;
                        }
                    }
                    if (!isStacked) {
                        if (drawingForm) {
                            posX += direction == Legend.LegendDirection.RIGHT_TO_LEFT ? -formToTextSpace : formToTextSpace;
                        }
                        if (direction == Legend.LegendDirection.RIGHT_TO_LEFT) {
                            posX -= calculatedLabelSizes[i].width;
                        }
                        drawLabel(c, posX, posY + labelLineHeight, labels[i]);
                        if (direction == Legend.LegendDirection.LEFT_TO_RIGHT) {
                            posX += calculatedLabelSizes[i].width;
                        }
                        f = posX;
                        f2 = direction == Legend.LegendDirection.RIGHT_TO_LEFT ? -xEntrySpace : xEntrySpace;
                    } else {
                        f = posX;
                        f2 = direction == Legend.LegendDirection.RIGHT_TO_LEFT ? -stackSpace : stackSpace;
                    }
                    posX = f + f2;
                }
                break;
            case 2:
                float stack = 0.0f;
                boolean wasStacked = false;
                float posY2 = 0.0f;
                switch (AnonymousClass1.$SwitchMap$com$github$mikephil$charting$components$Legend$LegendVerticalAlignment[verticalAlignment.ordinal()]) {
                    case BuildConfig.VERSION_CODE /* 1 */:
                        float posY3 = horizontalAlignment == Legend.LegendHorizontalAlignment.CENTER ? 0.0f : this.mViewPortHandler.contentTop();
                        posY2 = posY3 + yoffset;
                        break;
                    case 2:
                        float posY4 = horizontalAlignment == Legend.LegendHorizontalAlignment.CENTER ? this.mViewPortHandler.getChartHeight() : this.mViewPortHandler.contentBottom();
                        posY2 = posY4 - (this.mLegend.mNeededHeight + yoffset);
                        break;
                    case 3:
                        posY2 = ((this.mViewPortHandler.getChartHeight() / 2.0f) - (this.mLegend.mNeededHeight / 2.0f)) + this.mLegend.getYOffset();
                        break;
                }
                for (int i2 = 0; i2 < labels.length; i2++) {
                    Boolean drawingForm2 = Boolean.valueOf(colors[i2] != 1122868);
                    float posX2 = originPosX2;
                    if (drawingForm2.booleanValue()) {
                        if (direction == Legend.LegendDirection.LEFT_TO_RIGHT) {
                            posX2 += stack;
                        } else {
                            posX2 -= formSize - stack;
                        }
                        drawForm(c, posX2, posY2 + formYOffset, i2, this.mLegend);
                        if (direction == Legend.LegendDirection.LEFT_TO_RIGHT) {
                            posX2 += formSize;
                        }
                    }
                    if (labels[i2] != null) {
                        if (drawingForm2.booleanValue() && !wasStacked) {
                            posX2 += direction == Legend.LegendDirection.LEFT_TO_RIGHT ? formToTextSpace : -formToTextSpace;
                        } else if (wasStacked) {
                            posX2 = originPosX2;
                        }
                        if (direction == Legend.LegendDirection.RIGHT_TO_LEFT) {
                            posX2 -= Utils.calcTextWidth(this.mLegendLabelPaint, labels[i2]);
                        }
                        if (!wasStacked) {
                            drawLabel(c, posX2, posY2 + labelLineHeight, labels[i2]);
                        } else {
                            posY2 += labelLineHeight + labelLineSpacing;
                            drawLabel(c, posX2, posY2 + labelLineHeight, labels[i2]);
                        }
                        posY2 += labelLineHeight + labelLineSpacing;
                        stack = 0.0f;
                    } else {
                        stack += formSize + stackSpace;
                        wasStacked = true;
                    }
                }
                break;
        }
    }

    protected void drawForm(Canvas c, float x, float y, int index, Legend legend) {
        if (legend.getColors()[index] == 1122868) {
        }
        this.mLegendFormPaint.setColor(legend.getColors()[index]);
        float formsize = legend.getFormSize();
        float half = formsize / 2.0f;
        switch (AnonymousClass1.$SwitchMap$com$github$mikephil$charting$components$Legend$LegendForm[legend.getForm().ordinal()]) {
            case BuildConfig.VERSION_CODE /* 1 */:
                c.drawCircle(x + half, y, half, this.mLegendFormPaint);
                break;
            case 2:
                c.drawRect(x, y - half, x + formsize, y + half, this.mLegendFormPaint);
                break;
            case 3:
                c.drawLine(x, y, x + formsize, y, this.mLegendFormPaint);
                break;
        }
    }

    /* renamed from: com.github.mikephil.charting.renderer.LegendRenderer$1, reason: invalid class name */
    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/renderer/LegendRenderer$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$github$mikephil$charting$components$Legend$LegendHorizontalAlignment;
        static final /* synthetic */ int[] $SwitchMap$com$github$mikephil$charting$components$Legend$LegendVerticalAlignment;
        static final /* synthetic */ int[] $SwitchMap$com$github$mikephil$charting$components$Legend$LegendOrientation;
        static final /* synthetic */ int[] $SwitchMap$com$github$mikephil$charting$components$Legend$LegendForm = new int[Legend.LegendForm.values().length];

        static {
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendForm[Legend.LegendForm.CIRCLE.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendForm[Legend.LegendForm.SQUARE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendForm[Legend.LegendForm.LINE.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            $SwitchMap$com$github$mikephil$charting$components$Legend$LegendOrientation = new int[Legend.LegendOrientation.values().length];
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendOrientation[Legend.LegendOrientation.HORIZONTAL.ordinal()] = 1;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendOrientation[Legend.LegendOrientation.VERTICAL.ordinal()] = 2;
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
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendVerticalAlignment[Legend.LegendVerticalAlignment.CENTER.ordinal()] = 3;
            } catch (NoSuchFieldError e8) {
            }
            $SwitchMap$com$github$mikephil$charting$components$Legend$LegendHorizontalAlignment = new int[Legend.LegendHorizontalAlignment.values().length];
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendHorizontalAlignment[Legend.LegendHorizontalAlignment.LEFT.ordinal()] = 1;
            } catch (NoSuchFieldError e9) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendHorizontalAlignment[Legend.LegendHorizontalAlignment.RIGHT.ordinal()] = 2;
            } catch (NoSuchFieldError e10) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$components$Legend$LegendHorizontalAlignment[Legend.LegendHorizontalAlignment.CENTER.ordinal()] = 3;
            } catch (NoSuchFieldError e11) {
            }
        }
    }

    protected void drawLabel(Canvas c, float x, float y, String label) {
        c.drawText(label, x, y, this.mLegendLabelPaint);
    }
}
