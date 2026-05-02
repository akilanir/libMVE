package com.jjoe64.graphview.series;

import android.graphics.Canvas;
import com.jjoe64.graphview.GraphView;
import com.jjoe64.graphview.series.DataPointInterface;
import java.util.Iterator;

/* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/series/Series.class */
public interface Series<E extends DataPointInterface> {
    double getLowestValueX();

    double getHighestValueX();

    double getLowestValueY();

    double getHighestValueY();

    Iterator<E> getValues(double d, double d2);

    void draw(GraphView graphView, Canvas canvas, boolean z);

    String getTitle();

    int getColor();

    void setOnDataPointTapListener(OnDataPointTapListener onDataPointTapListener);

    void onTap(float f, float f2);

    void onGraphViewAttached(GraphView graphView);

    boolean isEmpty();
}
