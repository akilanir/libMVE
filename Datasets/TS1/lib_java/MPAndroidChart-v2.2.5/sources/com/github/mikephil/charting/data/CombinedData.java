package com.github.mikephil.charting.data;

import com.github.mikephil.charting.highlight.Highlight;
import com.github.mikephil.charting.interfaces.datasets.IBarLineScatterCandleBubbleDataSet;
import java.util.ArrayList;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/CombinedData.class */
public class CombinedData extends BarLineScatterCandleBubbleData<IBarLineScatterCandleBubbleDataSet<?>> {
    private LineData mLineData;
    private BarData mBarData;
    private ScatterData mScatterData;
    private CandleData mCandleData;
    private BubbleData mBubbleData;

    public CombinedData() {
    }

    public CombinedData(List<String> xVals) {
        super(xVals);
    }

    public CombinedData(String[] xVals) {
        super(xVals);
    }

    public void setData(LineData data) {
        this.mLineData = data;
        this.mDataSets.addAll(data.getDataSets());
        init();
    }

    public void setData(BarData data) {
        this.mBarData = data;
        this.mDataSets.addAll(data.getDataSets());
        init();
    }

    public void setData(ScatterData data) {
        this.mScatterData = data;
        this.mDataSets.addAll(data.getDataSets());
        init();
    }

    public void setData(CandleData data) {
        this.mCandleData = data;
        this.mDataSets.addAll(data.getDataSets());
        init();
    }

    public void setData(BubbleData data) {
        this.mBubbleData = data;
        this.mDataSets.addAll(data.getDataSets());
        init();
    }

    public BubbleData getBubbleData() {
        return this.mBubbleData;
    }

    public LineData getLineData() {
        return this.mLineData;
    }

    public BarData getBarData() {
        return this.mBarData;
    }

    public ScatterData getScatterData() {
        return this.mScatterData;
    }

    public CandleData getCandleData() {
        return this.mCandleData;
    }

    public List<ChartData> getAllData() {
        List<ChartData> data = new ArrayList<>();
        if (this.mLineData != null) {
            data.add(this.mLineData);
        }
        if (this.mBarData != null) {
            data.add(this.mBarData);
        }
        if (this.mScatterData != null) {
            data.add(this.mScatterData);
        }
        if (this.mCandleData != null) {
            data.add(this.mCandleData);
        }
        if (this.mBubbleData != null) {
            data.add(this.mBubbleData);
        }
        return data;
    }

    @Override // com.github.mikephil.charting.data.ChartData
    public void notifyDataChanged() {
        if (this.mLineData != null) {
            this.mLineData.notifyDataChanged();
        }
        if (this.mBarData != null) {
            this.mBarData.notifyDataChanged();
        }
        if (this.mCandleData != null) {
            this.mCandleData.notifyDataChanged();
        }
        if (this.mScatterData != null) {
            this.mScatterData.notifyDataChanged();
        }
        if (this.mBubbleData != null) {
            this.mBubbleData.notifyDataChanged();
        }
        init();
    }

    @Override // com.github.mikephil.charting.data.ChartData
    public Entry getEntryForHighlight(Highlight highlight) {
        List<ChartData> dataObjects = getAllData();
        if (highlight.getDataIndex() >= dataObjects.size()) {
            return null;
        }
        ChartData data = dataObjects.get(highlight.getDataIndex());
        if (highlight.getDataSetIndex() >= data.getDataSetCount()) {
            return null;
        }
        List<?> entries = data.getDataSetByIndex(highlight.getDataSetIndex()).getEntriesForXIndex(highlight.getXIndex());
        for (Object entry : entries) {
            if (((Entry) entry).getVal() == highlight.getValue() || Float.isNaN(highlight.getValue())) {
                return (Entry) entry;
            }
        }
        return null;
    }
}
