package org.osmdroid.events;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/events/MapListener.class */
public interface MapListener {
    boolean onScroll(ScrollEvent scrollEvent);

    boolean onZoom(ZoomEvent zoomEvent);
}
