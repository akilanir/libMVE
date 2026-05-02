package org.osmdroid.tileprovider;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/tileprovider/MapTile.class */
public class MapTile {
    public static final int MAPTILE_SUCCESS_ID = 0;
    public static final int MAPTILE_FAIL_ID = 1;
    private final int x;
    private final int y;
    private final int zoomLevel;

    public MapTile(int zoomLevel, int tileX, int tileY) {
        this.zoomLevel = zoomLevel;
        this.x = tileX;
        this.y = tileY;
    }

    public int getZoomLevel() {
        return this.zoomLevel;
    }

    public int getX() {
        return this.x;
    }

    public int getY() {
        return this.y;
    }

    public String toString() {
        return "/" + this.zoomLevel + "/" + this.x + "/" + this.y;
    }

    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof MapTile)) {
            return false;
        }
        MapTile rhs = (MapTile) obj;
        return this.zoomLevel == rhs.zoomLevel && this.x == rhs.x && this.y == rhs.y;
    }

    public int hashCode() {
        int code = 17 * (37 + this.zoomLevel);
        return code * (37 + this.x) * (37 + this.y);
    }
}
