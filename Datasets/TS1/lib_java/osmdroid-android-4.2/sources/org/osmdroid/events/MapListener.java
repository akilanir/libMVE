package org.osmdroid.events;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/events/MapListener.class */
public interface MapListener {
    boolean onScroll(ScrollEvent scrollEvent);

    boolean onZoom(ZoomEvent zoomEvent);
}
