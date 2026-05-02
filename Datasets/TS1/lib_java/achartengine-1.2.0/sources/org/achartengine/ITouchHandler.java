package org.achartengine;

import android.view.MotionEvent;
import org.achartengine.tools.PanListener;
import org.achartengine.tools.ZoomListener;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/ITouchHandler.class */
public interface ITouchHandler {
    boolean handleTouch(MotionEvent motionEvent);

    void addZoomListener(ZoomListener zoomListener);

    void removeZoomListener(ZoomListener zoomListener);

    void addPanListener(PanListener panListener);

    void removePanListener(PanListener panListener);
}
