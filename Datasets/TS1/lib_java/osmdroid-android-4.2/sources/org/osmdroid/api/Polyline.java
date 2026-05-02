package org.osmdroid.api;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/api/Polyline.class */
public class Polyline {
    public int color = -16777216;
    public float width = 2.0f;
    public List<IGeoPoint> points = new ArrayList();

    public Polyline color(int aColor) {
        this.color = aColor;
        return this;
    }

    public Polyline width(float aWidth) {
        this.width = aWidth;
        return this;
    }

    public Polyline points(List<IGeoPoint> aPoints) {
        this.points = aPoints;
        return this;
    }

    public Polyline points(IGeoPoint... aPoints) {
        return points(Arrays.asList(aPoints));
    }
}
