package org.osmdroid.api;

import android.graphics.Bitmap;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/api/Marker.class */
public class Marker {
    public final double latitude;
    public final double longitude;
    public String title;
    public String snippet;
    public int icon;
    public Bitmap bitmap;
    public Anchor anchor;

    /* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/api/Marker$Anchor.class */
    public enum Anchor {
        NONE,
        CENTER,
        BOTTOM_CENTER
    }

    public Marker title(String aTitle) {
        this.title = aTitle;
        return this;
    }

    public Marker snippet(String aSnippet) {
        this.snippet = aSnippet;
        return this;
    }

    public Marker icon(int aIcon) {
        this.icon = aIcon;
        return this;
    }

    public Marker bitmap(Bitmap aBitmap) {
        this.bitmap = aBitmap;
        return this;
    }

    public Marker anchor(Anchor aAnchor) {
        this.anchor = aAnchor;
        return this;
    }

    public Marker(double aLatitude, double aLongitude) {
        this.latitude = aLatitude;
        this.longitude = aLongitude;
    }
}
