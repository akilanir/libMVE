package com.github.mikephil.charting.highlight;

import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.interfaces.dataprovider.BarLineScatterCandleBubbleDataProvider;
import com.github.mikephil.charting.utils.SelectionDetail;
import com.github.mikephil.charting.utils.Utils;
import java.util.ArrayList;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/highlight/ChartHighlighter.class */
public class ChartHighlighter<T extends BarLineScatterCandleBubbleDataProvider> {
    protected T mChart;

    public ChartHighlighter(T chart) {
        this.mChart = chart;
    }

    public Highlight getHighlight(float x, float y) {
        int xIndex = getXIndex(x);
        SelectionDetail selectionDetail = getSelectionDetail(xIndex, y, -1);
        if (selectionDetail == null) {
            return null;
        }
        return new Highlight(xIndex, selectionDetail.value, selectionDetail.dataIndex, selectionDetail.dataSetIndex);
    }

    protected int getXIndex(float x) {
        float[] pts = {x, 0.0f};
        this.mChart.getTransformer(YAxis.AxisDependency.LEFT).pixelsToValue(pts);
        return Math.round(pts[0]);
    }

    protected SelectionDetail getSelectionDetail(int xIndex, float y, int dataSetIndex) {
        List<SelectionDetail> valsAtIndex = getSelectionDetailsAtIndex(xIndex, dataSetIndex);
        float leftdist = Utils.getMinimumDistance(valsAtIndex, y, YAxis.AxisDependency.LEFT);
        float rightdist = Utils.getMinimumDistance(valsAtIndex, y, YAxis.AxisDependency.RIGHT);
        YAxis.AxisDependency axis = leftdist < rightdist ? YAxis.AxisDependency.LEFT : YAxis.AxisDependency.RIGHT;
        SelectionDetail detail = Utils.getClosestSelectionDetailByPixelY(valsAtIndex, y, axis);
        return detail;
    }

    /* JADX WARN: Type inference failed for: r0v17, types: [com.github.mikephil.charting.interfaces.datasets.IDataSet] */
    protected List<SelectionDetail> getSelectionDetailsAtIndex(int xIndex, int dataSetIndex) {
        List<SelectionDetail> vals = new ArrayList<>();
        if (this.mChart.getData() == null) {
            return vals;
        }
        float[] pts = new float[2];
        int dataSetCount = this.mChart.getData().getDataSetCount();
        for (int i = 0; i < dataSetCount; i++) {
            if (dataSetIndex <= -1 || dataSetIndex == i) {
                ?? dataSetByIndex = this.mChart.getData().getDataSetByIndex(i);
                if (dataSetByIndex.isHighlightEnabled()) {
                    float[] yVals = dataSetByIndex.getYValsForXIndex(xIndex);
                    for (float yVal : yVals) {
                        if (!Float.isNaN(yVal)) {
                            pts[1] = yVal;
                            this.mChart.getTransformer(dataSetByIndex.getAxisDependency()).pointValuesToPixel(pts);
                            if (!Float.isNaN(pts[1])) {
                                vals.add(new SelectionDetail(pts[1], yVal, i, dataSetByIndex));
                            }
                        }
                    }
                }
            }
        }
        return vals;
    }
}
