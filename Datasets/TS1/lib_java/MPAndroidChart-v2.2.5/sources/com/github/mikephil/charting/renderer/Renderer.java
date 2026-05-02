package com.github.mikephil.charting.renderer;

import com.github.mikephil.charting.interfaces.dataprovider.BarLineScatterCandleBubbleDataProvider;
import com.github.mikephil.charting.utils.ViewPortHandler;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/renderer/Renderer.class */
public abstract class Renderer {
    protected ViewPortHandler mViewPortHandler;
    protected int mMinX = 0;
    protected int mMaxX = 0;

    public Renderer(ViewPortHandler viewPortHandler) {
        this.mViewPortHandler = viewPortHandler;
    }

    protected boolean fitsBounds(float val, float min, float max) {
        if (val < min || val > max) {
            return false;
        }
        return true;
    }

    public void calcXBounds(BarLineScatterCandleBubbleDataProvider dataProvider, int xAxisModulus) {
        int low = dataProvider.getLowestVisibleXIndex();
        int high = dataProvider.getHighestVisibleXIndex();
        int subLow = low % xAxisModulus == 0 ? xAxisModulus : 0;
        this.mMinX = Math.max(((low / xAxisModulus) * xAxisModulus) - subLow, 0);
        this.mMaxX = Math.min(((high / xAxisModulus) * xAxisModulus) + xAxisModulus, (int) dataProvider.getXChartMax());
    }
}
