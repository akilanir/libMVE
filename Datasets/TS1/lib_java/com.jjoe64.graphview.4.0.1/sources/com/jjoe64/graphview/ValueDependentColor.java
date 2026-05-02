package com.jjoe64.graphview;

import com.jjoe64.graphview.series.DataPointInterface;

/* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/ValueDependentColor.class */
public interface ValueDependentColor<T extends DataPointInterface> {
    int get(T t);
}
