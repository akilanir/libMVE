package org.osmdroid.events;

import org.osmdroid.views.MapView;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/events/ScrollEvent.class */
public class ScrollEvent implements MapEvent {
    protected MapView source;
    protected int x;
    protected int y;

    public ScrollEvent(MapView source, int x, int y) {
        this.source = source;
        this.x = x;
        this.y = y;
    }

    public MapView getSource() {
        return this.source;
    }

    public int getX() {
        return this.x;
    }

    public int getY() {
        return this.y;
    }

    public String toString() {
        return "ScrollEvent [source=" + this.source + ", x=" + this.x + ", y=" + this.y + "]";
    }
}
