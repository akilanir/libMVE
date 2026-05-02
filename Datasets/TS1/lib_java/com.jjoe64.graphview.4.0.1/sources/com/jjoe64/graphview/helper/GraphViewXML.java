package com.jjoe64.graphview.helper;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.Log;
import com.jjoe64.graphview.GraphView;
import com.jjoe64.graphview.R;
import com.jjoe64.graphview.series.BarGraphSeries;
import com.jjoe64.graphview.series.BaseSeries;
import com.jjoe64.graphview.series.DataPoint;
import com.jjoe64.graphview.series.LineGraphSeries;
import com.jjoe64.graphview.series.PointsGraphSeries;

/* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/helper/GraphViewXML.class */
public class GraphViewXML extends GraphView {
    public GraphViewXML(Context context, AttributeSet attrs) {
        BaseSeries<DataPoint> series;
        super(context, attrs);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.GraphViewXML);
        String dataStr = a.getString(R.styleable.GraphViewXML_seriesData);
        int color = a.getColor(R.styleable.GraphViewXML_seriesColor, 0);
        String type = a.getString(R.styleable.GraphViewXML_seriesType);
        String seriesTitle = a.getString(R.styleable.GraphViewXML_seriesTitle);
        String title = a.getString(R.styleable.GraphViewXML_android_title);
        a.recycle();
        if (dataStr == null || dataStr.isEmpty()) {
            throw new IllegalArgumentException("Attribute seriesData is required in the format: 0=5.0;1=5;2=4;3=9");
        }
        String[] d = dataStr.split(";");
        try {
            DataPoint[] data = new DataPoint[d.length];
            int i = 0;
            for (String dd : d) {
                String[] xy = dd.split("=");
                data[i] = new DataPoint(Double.parseDouble(xy[0]), Double.parseDouble(xy[1]));
                i++;
            }
            type = (type == null || type.isEmpty()) ? "line" : type;
            if (type.equals("line")) {
                series = new LineGraphSeries<>(data);
            } else if (type.equals("bar")) {
                series = new BarGraphSeries<>(data);
            } else if (type.equals("points")) {
                series = new PointsGraphSeries<>(data);
            } else {
                throw new IllegalArgumentException("unknown graph type: " + type + ". Possible is line|bar|points");
            }
            if (color != 0) {
                series.setColor(color);
            }
            addSeries(series);
            if (seriesTitle != null && !seriesTitle.isEmpty()) {
                series.setTitle(seriesTitle);
                getLegendRenderer().setVisible(true);
            }
            if (title != null && !title.isEmpty()) {
                setTitle(title);
            }
        } catch (Exception e) {
            Log.e("GraphViewXML", e.toString());
            throw new IllegalArgumentException("Attribute seriesData is broken. Use this format: 0=5.0;1=5;2=4;3=9");
        }
    }
}
