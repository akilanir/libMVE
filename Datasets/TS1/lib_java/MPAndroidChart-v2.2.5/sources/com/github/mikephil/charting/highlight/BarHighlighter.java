package com.github.mikephil.charting.highlight;

import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.data.BarEntry;
import com.github.mikephil.charting.interfaces.dataprovider.BarDataProvider;
import com.github.mikephil.charting.interfaces.datasets.IBarDataSet;
import com.github.mikephil.charting.interfaces.datasets.IDataSet;
import com.github.mikephil.charting.utils.SelectionDetail;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/highlight/BarHighlighter.class */
public class BarHighlighter extends ChartHighlighter<BarDataProvider> {
    public BarHighlighter(BarDataProvider chart) {
        super(chart);
    }

    @Override // com.github.mikephil.charting.highlight.ChartHighlighter
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
            float[] pts = {0.0f, y};
            ((BarDataProvider) this.mChart).getTransformer(set.getAxisDependency()).pixelsToValue(pts);
            return getStackedHighlight(selectionDetail, set, xIndex, pts[1]);
        }
        return new Highlight(xIndex, selectionDetail.value, selectionDetail.dataIndex, selectionDetail.dataSetIndex, -1);
    }

    @Override // com.github.mikephil.charting.highlight.ChartHighlighter
    protected int getXIndex(float x) {
        if (!((BarDataProvider) this.mChart).getBarData().isGrouped()) {
            return super.getXIndex(x);
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

    @Override // com.github.mikephil.charting.highlight.ChartHighlighter
    protected SelectionDetail getSelectionDetail(int xIndex, float y, int dataSetIndex) {
        int dataSetIndex2 = Math.max(dataSetIndex, 0);
        BarData barData = ((BarDataProvider) this.mChart).getBarData();
        IDataSet dataSet = barData.getDataSetCount() > dataSetIndex2 ? (IBarDataSet) barData.getDataSetByIndex(dataSetIndex2) : null;
        if (dataSet == null) {
            return null;
        }
        float yValue = dataSet.getYValForXIndex(xIndex);
        if (yValue == Double.NaN) {
            return null;
        }
        return new SelectionDetail(yValue, dataSetIndex2, dataSet);
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected Highlight getStackedHighlight(SelectionDetail selectionDetail, IBarDataSet set, int xIndex, double yValue) {
        BarEntry entry = (BarEntry) set.getEntryForXIndex(xIndex);
        if (entry == null) {
            return null;
        }
        if (entry.getVals() == null) {
            return new Highlight(xIndex, entry.getVal(), selectionDetail.dataIndex, selectionDetail.dataSetIndex);
        }
        Range[] ranges = getRanges(entry);
        if (ranges.length > 0) {
            int stackIndex = getClosestStackIndex(ranges, (float) yValue);
            return new Highlight(xIndex, entry.getPositiveSum() - entry.getNegativeSum(), selectionDetail.dataIndex, selectionDetail.dataSetIndex, stackIndex, ranges[stackIndex]);
        }
        return null;
    }

    protected int getClosestStackIndex(Range[] ranges, float value) {
        if (ranges == null || ranges.length == 0) {
            return 0;
        }
        int stackIndex = 0;
        for (Range range : ranges) {
            if (range.contains(value)) {
                return stackIndex;
            }
            stackIndex++;
        }
        int length = Math.max(ranges.length - 1, 0);
        if (value > ranges[length].to) {
            return length;
        }
        return 0;
    }

    protected float getBase(float x) {
        float[] pts = {x, 0.0f};
        ((BarDataProvider) this.mChart).getTransformer(YAxis.AxisDependency.LEFT).pixelsToValue(pts);
        float xVal = pts[0];
        int setCount = ((BarDataProvider) this.mChart).getBarData().getDataSetCount();
        int steps = (int) (xVal / (setCount + ((BarDataProvider) this.mChart).getBarData().getGroupSpace()));
        float groupSpaceSum = ((BarDataProvider) this.mChart).getBarData().getGroupSpace() * steps;
        float baseNoSpace = xVal - groupSpaceSum;
        return baseNoSpace;
    }

    protected Range[] getRanges(BarEntry entry) {
        float[] values = entry.getVals();
        if (values == null || values.length == 0) {
            return new Range[0];
        }
        Range[] ranges = new Range[values.length];
        float negRemain = -entry.getNegativeSum();
        float posRemain = 0.0f;
        for (int i = 0; i < ranges.length; i++) {
            float value = values[i];
            if (value < 0.0f) {
                ranges[i] = new Range(negRemain, negRemain + Math.abs(value));
                negRemain += Math.abs(value);
            } else {
                ranges[i] = new Range(posRemain, posRemain + value);
                posRemain += value;
            }
        }
        return ranges;
    }
}
