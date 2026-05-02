package org.achartengine.chart;

import org.achartengine.chart.BarChart;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/chart/RangeStackedBarChart.class */
public class RangeStackedBarChart extends RangeBarChart {
    public static final String TYPE = "RangeStackedBar";

    RangeStackedBarChart() {
        super(BarChart.Type.STACKED);
    }

    @Override // org.achartengine.chart.RangeBarChart, org.achartengine.chart.BarChart, org.achartengine.chart.XYChart
    public String getChartType() {
        return TYPE;
    }
}
