package com.github.mikephil.charting.highlight;

import com.github.mikephil.charting.data.ChartData;
import com.github.mikephil.charting.data.CombinedData;
import com.github.mikephil.charting.interfaces.dataprovider.BarLineScatterCandleBubbleDataProvider;
import com.github.mikephil.charting.interfaces.datasets.IDataSet;
import com.github.mikephil.charting.utils.SelectionDetail;
import java.util.ArrayList;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/highlight/CombinedHighlighter.class */
public class CombinedHighlighter extends ChartHighlighter<BarLineScatterCandleBubbleDataProvider> {
    public CombinedHighlighter(BarLineScatterCandleBubbleDataProvider chart) {
        super(chart);
    }

    @Override // com.github.mikephil.charting.highlight.ChartHighlighter
    protected List<SelectionDetail> getSelectionDetailsAtIndex(int xIndex, int dataSetIndex) {
        List<SelectionDetail> vals = new ArrayList<>();
        float[] pts = new float[2];
        CombinedData data = (CombinedData) this.mChart.getData();
        List<ChartData> dataObjects = data.getAllData();
        for (int i = 0; i < dataObjects.size(); i++) {
            for (int j = 0; j < dataObjects.get(i).getDataSetCount(); j++) {
                IDataSet dataSet = dataObjects.get(i).getDataSetByIndex(j);
                if (dataSet.isHighlightEnabled()) {
                    float[] yVals = dataSet.getYValsForXIndex(xIndex);
                    for (float yVal : yVals) {
                        pts[1] = yVal;
                        this.mChart.getTransformer(dataSet.getAxisDependency()).pointValuesToPixel(pts);
                        if (!Float.isNaN(pts[1])) {
                            vals.add(new SelectionDetail(pts[1], yVal, i, j, dataSet));
                        }
                    }
                }
            }
        }
        return vals;
    }
}
