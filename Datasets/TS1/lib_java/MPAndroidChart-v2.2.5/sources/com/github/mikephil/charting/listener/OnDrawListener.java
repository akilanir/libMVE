package com.github.mikephil.charting.listener;

import com.github.mikephil.charting.data.DataSet;
import com.github.mikephil.charting.data.Entry;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/listener/OnDrawListener.class */
public interface OnDrawListener {
    void onEntryAdded(Entry entry);

    void onEntryMoved(Entry entry);

    void onDrawFinished(DataSet<?> dataSet);
}
