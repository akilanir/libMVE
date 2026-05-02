package org.osmdroid.events;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/events/MapAdapter.class */
public abstract class MapAdapter implements MapListener {
    @Override // org.osmdroid.events.MapListener
    public boolean onScroll(ScrollEvent event) {
        return false;
    }

    @Override // org.osmdroid.events.MapListener
    public boolean onZoom(ZoomEvent event) {
        return false;
    }
}
