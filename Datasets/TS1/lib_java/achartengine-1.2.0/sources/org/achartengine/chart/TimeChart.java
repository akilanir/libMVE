package org.achartengine.chart;

import android.graphics.Canvas;
import android.graphics.Paint;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.achartengine.model.XYMultipleSeriesDataset;
import org.achartengine.model.XYSeries;
import org.achartengine.renderer.XYMultipleSeriesRenderer;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/chart/TimeChart.class */
public class TimeChart extends LineChart {
    public static final String TYPE = "Time";
    public static final long DAY = 86400000;
    private String mDateFormat;
    private Double mStartPoint;

    TimeChart() {
    }

    public TimeChart(XYMultipleSeriesDataset dataset, XYMultipleSeriesRenderer renderer) {
        super(dataset, renderer);
    }

    public String getDateFormat() {
        return this.mDateFormat;
    }

    public void setDateFormat(String format) {
        this.mDateFormat = format;
    }

    @Override // org.achartengine.chart.XYChart
    protected void drawXLabels(List<Double> xLabels, Double[] xTextLabelLocations, Canvas canvas, Paint paint, int left, int top, int bottom, double xPixelsPerUnit, double minX, double maxX) {
        int length = xLabels.size();
        if (length > 0) {
            boolean showLabels = this.mRenderer.isShowLabels();
            boolean showGridY = this.mRenderer.isShowGridY();
            boolean showTickMarks = this.mRenderer.isShowTickMarks();
            DateFormat format = getDateFormat(xLabels.get(0).doubleValue(), xLabels.get(length - 1).doubleValue());
            for (int i = 0; i < length; i++) {
                long label = Math.round(xLabels.get(i).doubleValue());
                float xLabel = (float) (left + (xPixelsPerUnit * (label - minX)));
                if (showLabels) {
                    paint.setColor(this.mRenderer.getXLabelsColor());
                    if (showTickMarks) {
                        canvas.drawLine(xLabel, bottom, xLabel, bottom + (this.mRenderer.getLabelsTextSize() / 3.0f), paint);
                    }
                    drawText(canvas, format.format(new Date(label)), xLabel, bottom + ((this.mRenderer.getLabelsTextSize() * 4.0f) / 3.0f) + this.mRenderer.getXLabelsPadding(), paint, this.mRenderer.getXLabelsAngle());
                }
                if (showGridY) {
                    paint.setColor(this.mRenderer.getGridColor(0));
                    canvas.drawLine(xLabel, bottom, xLabel, top, paint);
                }
            }
        }
        drawXTextLabels(xTextLabelLocations, canvas, paint, true, left, top, bottom, xPixelsPerUnit, minX, maxX);
    }

    private DateFormat getDateFormat(double start, double end) {
        if (this.mDateFormat != null) {
            try {
                SimpleDateFormat format = new SimpleDateFormat(this.mDateFormat);
                return format;
            } catch (Exception e) {
            }
        }
        DateFormat format2 = SimpleDateFormat.getDateInstance(2);
        double diff = end - start;
        if (diff > 8.64E7d && diff < 4.32E8d) {
            format2 = SimpleDateFormat.getDateTimeInstance(3, 3);
        } else if (diff < 8.64E7d) {
            format2 = SimpleDateFormat.getTimeInstance(2);
        }
        return format2;
    }

    @Override // org.achartengine.chart.LineChart, org.achartengine.chart.XYChart
    public String getChartType() {
        return TYPE;
    }

    @Override // org.achartengine.chart.XYChart
    protected List<Double> getXLabels(double min, double max, int count) {
        List<Double> result = new ArrayList<>();
        if (!this.mRenderer.isXRoundedLabels()) {
            if (this.mDataset.getSeriesCount() > 0) {
                XYSeries series = this.mDataset.getSeriesAt(0);
                int length = series.getItemCount();
                int intervalLength = 0;
                int startIndex = -1;
                for (int i = 0; i < length; i++) {
                    double value = series.getX(i);
                    if (min <= value && value <= max) {
                        intervalLength++;
                        if (startIndex < 0) {
                            startIndex = i;
                        }
                    }
                }
                if (intervalLength < count) {
                    for (int i2 = startIndex; i2 < startIndex + intervalLength; i2++) {
                        result.add(Double.valueOf(series.getX(i2)));
                    }
                } else {
                    float step = intervalLength / count;
                    int intervalCount = 0;
                    for (int i3 = 0; i3 < length && intervalCount < count; i3++) {
                        double value2 = series.getX(Math.round(i3 * step));
                        if (min <= value2 && value2 <= max) {
                            result.add(Double.valueOf(value2));
                            intervalCount++;
                        }
                    }
                }
                return result;
            }
            return super.getXLabels(min, max, count);
        }
        if (this.mStartPoint == null) {
            this.mStartPoint = Double.valueOf((min - (min % 8.64E7d)) + 8.64E7d + (new Date(Math.round(min)).getTimezoneOffset() * 60 * 1000));
        }
        if (count > 25) {
            count = 25;
        }
        double cycleMath = (max - min) / count;
        if (cycleMath <= 0.0d) {
            return result;
        }
        double cycle = 8.64E7d;
        if (cycleMath <= 8.64E7d) {
            while (cycleMath < cycle / 2.0d) {
                cycle /= 2.0d;
            }
        } else {
            while (cycleMath > cycle) {
                cycle *= 2.0d;
            }
        }
        int i4 = 0;
        for (double val = this.mStartPoint.doubleValue() - (Math.floor((this.mStartPoint.doubleValue() - min) / cycle) * cycle); val < max; val += cycle) {
            int i5 = i4;
            i4++;
            if (i5 > count) {
                break;
            }
            result.add(Double.valueOf(val));
        }
        return result;
    }
}
