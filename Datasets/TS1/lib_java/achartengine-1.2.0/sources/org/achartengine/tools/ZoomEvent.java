package org.achartengine.tools;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/tools/ZoomEvent.class */
public class ZoomEvent {
    private boolean mZoomIn;
    private float mZoomRate;

    public ZoomEvent(boolean in, float rate) {
        this.mZoomIn = in;
        this.mZoomRate = rate;
    }

    public boolean isZoomIn() {
        return this.mZoomIn;
    }

    public float getZoomRate() {
        return this.mZoomRate;
    }
}
