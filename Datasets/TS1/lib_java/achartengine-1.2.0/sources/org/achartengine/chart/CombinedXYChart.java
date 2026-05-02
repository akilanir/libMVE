package org.achartengine.chart;

import android.graphics.Canvas;
import android.graphics.Paint;
import java.io.Serializable;
import java.util.List;
import org.achartengine.model.XYMultipleSeriesDataset;
import org.achartengine.model.XYSeries;
import org.achartengine.renderer.SimpleSeriesRenderer;
import org.achartengine.renderer.XYMultipleSeriesRenderer;
import org.achartengine.renderer.XYSeriesRenderer;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/chart/CombinedXYChart.class */
public class CombinedXYChart extends XYChart {
    private XYCombinedChartDef[] chartDefinitions;
    private XYChart[] mCharts;
    private Class<?>[] xyChartTypes;

    public CombinedXYChart(XYMultipleSeriesDataset dataset, XYMultipleSeriesRenderer renderer, XYCombinedChartDef[] chartDefinitions) {
        super(dataset, renderer);
        this.xyChartTypes = new Class[]{TimeChart.class, LineChart.class, CubicLineChart.class, BarChart.class, BubbleChart.class, ScatterChart.class, RangeBarChart.class, RangeStackedBarChart.class};
        this.chartDefinitions = chartDefinitions;
        int length = chartDefinitions.length;
        this.mCharts = new XYChart[length];
        for (int i = 0; i < length; i++) {
            try {
                this.mCharts[i] = getXYChart(chartDefinitions[i].getType());
            } catch (Exception e) {
            }
            if (this.mCharts[i] == null) {
                throw new IllegalArgumentException("Unknown chart type " + chartDefinitions[i].getType());
            }
            XYMultipleSeriesDataset newDataset = new XYMultipleSeriesDataset();
            XYMultipleSeriesRenderer newRenderer = new XYMultipleSeriesRenderer();
            int[] arr$ = chartDefinitions[i].getSeriesIndex();
            for (int seriesIndex : arr$) {
                newDataset.addSeries(dataset.getSeriesAt(seriesIndex));
                newRenderer.addSeriesRenderer(renderer.getSeriesRendererAt(seriesIndex));
            }
            newRenderer.setBarSpacing(renderer.getBarSpacing());
            newRenderer.setPointSize(renderer.getPointSize());
            this.mCharts[i].setDatasetRenderer(newDataset, newRenderer);
        }
    }

    private XYChart getXYChart(String type) throws IllegalAccessException, InstantiationException {
        XYChart chart = null;
        int length = this.xyChartTypes.length;
        for (int i = 0; i < length && chart == null; i++) {
            XYChart newChart = (XYChart) this.xyChartTypes[i].newInstance();
            if (type.equals(newChart.getChartType())) {
                chart = newChart;
            }
        }
        return chart;
    }

    @Override // org.achartengine.chart.XYChart
    public void drawSeries(Canvas canvas, Paint paint, List<Float> points, XYSeriesRenderer seriesRenderer, float yAxisValue, int seriesIndex, int startIndex) {
        XYChart chart = getXYChart(seriesIndex);
        chart.setScreenR(getScreenR());
        chart.setCalcRange(getCalcRange(this.mDataset.getSeriesAt(seriesIndex).getScaleNumber()), 0);
        chart.drawSeries(canvas, paint, points, seriesRenderer, yAxisValue, getChartSeriesIndex(seriesIndex), startIndex);
    }

    @Override // org.achartengine.chart.XYChart
    protected ClickableArea[] clickableAreasForPoints(List<Float> points, List<Double> values, float yAxisValue, int seriesIndex, int startIndex) {
        XYChart chart = getXYChart(seriesIndex);
        return chart.clickableAreasForPoints(points, values, yAxisValue, getChartSeriesIndex(seriesIndex), startIndex);
    }

    @Override // org.achartengine.chart.XYChart
    protected void drawSeries(XYSeries series, Canvas canvas, Paint paint, List<Float> pointsList, XYSeriesRenderer seriesRenderer, float yAxisValue, int seriesIndex, XYMultipleSeriesRenderer.Orientation or, int startIndex) {
        XYChart chart = getXYChart(seriesIndex);
        chart.setScreenR(getScreenR());
        chart.setCalcRange(getCalcRange(this.mDataset.getSeriesAt(seriesIndex).getScaleNumber()), 0);
        chart.drawSeries(series, canvas, paint, pointsList, seriesRenderer, yAxisValue, getChartSeriesIndex(seriesIndex), or, startIndex);
    }

    @Override // org.achartengine.chart.AbstractChart
    public int getLegendShapeWidth(int seriesIndex) {
        XYChart chart = getXYChart(seriesIndex);
        return chart.getLegendShapeWidth(getChartSeriesIndex(seriesIndex));
    }

    @Override // org.achartengine.chart.AbstractChart
    public void drawLegendShape(Canvas canvas, SimpleSeriesRenderer renderer, float x, float y, int seriesIndex, Paint paint) {
        XYChart chart = getXYChart(seriesIndex);
        chart.drawLegendShape(canvas, renderer, x, y, getChartSeriesIndex(seriesIndex), paint);
    }

    @Override // org.achartengine.chart.XYChart
    public String getChartType() {
        return "Combined";
    }

    private XYChart getXYChart(int seriesIndex) {
        for (int i = 0; i < this.chartDefinitions.length; i++) {
            if (this.chartDefinitions[i].containsSeries(seriesIndex)) {
                return this.mCharts[i];
            }
        }
        throw new IllegalArgumentException("Unknown series with index " + seriesIndex);
    }

    private int getChartSeriesIndex(int seriesIndex) {
        for (int i = 0; i < this.chartDefinitions.length; i++) {
            if (this.chartDefinitions[i].containsSeries(seriesIndex)) {
                return this.chartDefinitions[i].getChartSeriesIndex(seriesIndex);
            }
        }
        throw new IllegalArgumentException("Unknown series with index " + seriesIndex);
    }

    /* loaded from: achartengine-1.2.0.jar:org/achartengine/chart/CombinedXYChart$XYCombinedChartDef.class */
    public static class XYCombinedChartDef implements Serializable {
        private String type;
        private int[] seriesIndex;

        public XYCombinedChartDef(String type, int... seriesIndex) {
            this.type = type;
            this.seriesIndex = seriesIndex;
        }

        public boolean containsSeries(int seriesIndex) {
            return getChartSeriesIndex(seriesIndex) >= 0;
        }

        public int getChartSeriesIndex(int seriesIndex) {
            for (int i = 0; i < getSeriesIndex().length; i++) {
                if (this.seriesIndex[i] == seriesIndex) {
                    return i;
                }
            }
            return -1;
        }

        public String getType() {
            return this.type;
        }

        public int[] getSeriesIndex() {
            return this.seriesIndex;
        }
    }
}
