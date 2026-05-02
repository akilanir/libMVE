package org.osmdroid.views.overlay;

import android.graphics.Point;
import android.graphics.drawable.Drawable;
import org.osmdroid.api.IGeoPoint;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/views/overlay/OverlayItem.class */
public class OverlayItem {
    public static final int ITEM_STATE_FOCUSED_MASK = 4;
    public static final int ITEM_STATE_PRESSED_MASK = 1;
    public static final int ITEM_STATE_SELECTED_MASK = 2;
    protected static final Point DEFAULT_MARKER_SIZE = new Point(26, 94);
    protected final String mUid;
    protected final String mTitle;
    protected final String mSnippet;
    protected final IGeoPoint mGeoPoint;
    protected Drawable mMarker;
    protected HotspotPlace mHotspotPlace;

    /* loaded from: osmdroid-android-4.3.jar:org/osmdroid/views/overlay/OverlayItem$HotspotPlace.class */
    public enum HotspotPlace {
        NONE,
        CENTER,
        BOTTOM_CENTER,
        TOP_CENTER,
        RIGHT_CENTER,
        LEFT_CENTER,
        UPPER_RIGHT_CORNER,
        LOWER_RIGHT_CORNER,
        UPPER_LEFT_CORNER,
        LOWER_LEFT_CORNER
    }

    public OverlayItem(String aTitle, String aSnippet, IGeoPoint aGeoPoint) {
        this(null, aTitle, aSnippet, aGeoPoint);
    }

    public OverlayItem(String aUid, String aTitle, String aDescription, IGeoPoint aGeoPoint) {
        this.mTitle = aTitle;
        this.mSnippet = aDescription;
        this.mGeoPoint = aGeoPoint;
        this.mUid = aUid;
    }

    public String getUid() {
        return this.mUid;
    }

    public String getTitle() {
        return this.mTitle;
    }

    public String getSnippet() {
        return this.mSnippet;
    }

    public IGeoPoint getPoint() {
        return this.mGeoPoint;
    }

    public Drawable getMarker(int stateBitset) {
        if (this.mMarker == null) {
            return null;
        }
        setState(this.mMarker, stateBitset);
        return this.mMarker;
    }

    public void setMarker(Drawable marker) {
        this.mMarker = marker;
    }

    public void setMarkerHotspot(HotspotPlace place) {
        this.mHotspotPlace = place == null ? HotspotPlace.BOTTOM_CENTER : place;
    }

    public HotspotPlace getMarkerHotspot() {
        return this.mHotspotPlace;
    }

    public static void setState(Drawable drawable, int stateBitset) {
        int[] states = new int[3];
        int index = 0;
        if ((stateBitset & 1) > 0) {
            index = 0 + 1;
            states[0] = 16842919;
        }
        if ((stateBitset & 2) > 0) {
            int i = index;
            index++;
            states[i] = 16842913;
        }
        if ((stateBitset & 4) > 0) {
            int i2 = index;
            int i3 = index + 1;
            states[i2] = 16842908;
        }
        drawable.setState(states);
    }

    public Drawable getDrawable() {
        return this.mMarker;
    }

    public int getWidth() {
        return this.mMarker.getIntrinsicWidth();
    }

    public int getHeight() {
        return this.mMarker.getIntrinsicHeight();
    }
}
