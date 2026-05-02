package com.github.mikephil.charting.listener;

import android.view.MotionEvent;
import com.github.mikephil.charting.listener.ChartTouchListener;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/listener/OnChartGestureListener.class */
public interface OnChartGestureListener {
    void onChartGestureStart(MotionEvent motionEvent, ChartTouchListener.ChartGesture chartGesture);

    void onChartGestureEnd(MotionEvent motionEvent, ChartTouchListener.ChartGesture chartGesture);

    void onChartLongPressed(MotionEvent motionEvent);

    void onChartDoubleTapped(MotionEvent motionEvent);

    void onChartSingleTapped(MotionEvent motionEvent);

    void onChartFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2);

    void onChartScale(MotionEvent motionEvent, float f, float f2);

    void onChartTranslate(MotionEvent motionEvent, float f, float f2);
}
