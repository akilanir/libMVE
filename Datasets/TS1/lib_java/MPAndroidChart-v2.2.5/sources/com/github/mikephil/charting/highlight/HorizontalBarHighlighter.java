package com.github.mikephil.charting.highlight;

import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.interfaces.dataprovider.BarDataProvider;
import com.github.mikephil.charting.interfaces.datasets.IBarDataSet;
import com.github.mikephil.charting.utils.SelectionDetail;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/highlight/HorizontalBarHighlighter.class */
public class HorizontalBarHighlighter extends BarHighlighter {
    public HorizontalBarHighlighter(BarDataProvider chart) {
        super(chart);
    }

    @Override // com.github.mikephil.charting.highlight.BarHighlighter, com.github.mikephil.charting.highlight.ChartHighlighter
    public Highlight getHighlight(float x, float y) {
        BarData barData = ((BarDataProvider) this.mChart).getBarData();
        int xIndex = getXIndex(x);
        float baseNoSpace = getBase(x);
        int setCount = barData.getDataSetCount();
        int dataSetIndex = ((int) baseNoSpace) % setCount;
        if (dataSetIndex < 0) {
            dataSetIndex = 0;
        } else if (dataSetIndex >= setCount) {
            dataSetIndex = setCount - 1;
        }
        SelectionDetail selectionDetail = getSelectionDetail(xIndex, y, dataSetIndex);
        if (selectionDetail == null) {
            return null;
        }
        IBarDataSet set = (IBarDataSet) barData.getDataSetByIndex(dataSetIndex);
        if (set.isStacked()) {
            float[] pts = {y, 0.0f};
            ((BarDataProvider) this.mChart).getTransformer(set.getAxisDependency()).pixelsToValue(pts);
            return getStackedHighlight(selectionDetail, set, xIndex, pts[0]);
        }
        return new Highlight(xIndex, selectionDetail.value, selectionDetail.dataIndex, selectionDetail.dataSetIndex, -1);
    }

    @Override // com.github.mikephil.charting.highlight.BarHighlighter, com.github.mikephil.charting.highlight.ChartHighlighter
    protected int getXIndex(float x) {
        if (!((BarDataProvider) this.mChart).getBarData().isGrouped()) {
            float[] pts = {0.0f, x};
            ((BarDataProvider) this.mChart).getTransformer(YAxis.AxisDependency.LEFT).pixelsToValue(pts);
            return Math.round(pts[1]);
        }
        float baseNoSpace = getBase(x);
        int setCount = ((BarDataProvider) this.mChart).getBarData().getDataSetCount();
        int xIndex = ((int) baseNoSpace) / setCount;
        int valCount = ((BarDataProvider) this.mChart).getData().getXValCount();
        if (xIndex < 0) {
            xIndex = 0;
        } else if (xIndex >= valCount) {
            xIndex = valCount - 1;
        }
        return xIndex;
    }

    @Override // com.github.mikephil.charting.highlight.BarHighlighter
    protected float getBase(float y) {
        float[] pts = {0.0f, y};
        ((BarDataProvider) this.mChart).getTransformer(YAxis.AxisDependency.LEFT).pixelsToValue(pts);
        float yVal = pts[1];
        int setCount = ((BarDataProvider) this.mChart).getBarData().getDataSetCount();
        int steps = (int) (yVal / (setCount + ((BarDataProvider) this.mChart).getBarData().getGroupSpace()));
        float groupSpaceSum = ((BarDataProvider) this.mChart).getBarData().getGroupSpace() * steps;
        float baseNoSpace = yVal - groupSpaceSum;
        return baseNoSpace;
    }
}
