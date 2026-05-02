package org.osmdroid.events;

import org.osmdroid.views.MapView;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/events/ZoomEvent.class */
public class ZoomEvent implements MapEvent {
    protected MapView source;
    protected int zoomLevel;

    public ZoomEvent(MapView source, int zoomLevel) {
        this.source = source;
        this.zoomLevel = zoomLevel;
    }

    public MapView getSource() {
        return this.source;
    }

    public int getZoomLevel() {
        return this.zoomLevel;
    }

    public String toString() {
        return "ZoomEvent [source=" + this.source + ", zoomLevel=" + this.zoomLevel + "]";
    }
}
