package org.osmdroid.util;

import android.graphics.PointF;
import android.os.Parcel;
import android.os.Parcelable;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import org.osmdroid.api.IGeoPoint;
import org.osmdroid.views.util.constants.MapViewConstants;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/util/BoundingBoxE6.class */
public class BoundingBoxE6 implements Parcelable, Serializable, MapViewConstants {
    static final long serialVersionUID = 2;
    protected final int mLatNorthE6;
    protected final int mLatSouthE6;
    protected final int mLonEastE6;
    protected final int mLonWestE6;
    public static final Parcelable.Creator<BoundingBoxE6> CREATOR = new Parcelable.Creator<BoundingBoxE6>() { // from class: org.osmdroid.util.BoundingBoxE6.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public BoundingBoxE6 createFromParcel(Parcel in) {
            return BoundingBoxE6.readFromParcel(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public BoundingBoxE6[] newArray(int size) {
            return new BoundingBoxE6[size];
        }
    };

    public BoundingBoxE6(int northE6, int eastE6, int southE6, int westE6) {
        this.mLatNorthE6 = northE6;
        this.mLonEastE6 = eastE6;
        this.mLatSouthE6 = southE6;
        this.mLonWestE6 = westE6;
    }

    public BoundingBoxE6(double north, double east, double south, double west) {
        this.mLatNorthE6 = (int) (north * 1000000.0d);
        this.mLonEastE6 = (int) (east * 1000000.0d);
        this.mLatSouthE6 = (int) (south * 1000000.0d);
        this.mLonWestE6 = (int) (west * 1000000.0d);
    }

    public GeoPoint getCenter() {
        return new GeoPoint((this.mLatNorthE6 + this.mLatSouthE6) / 2, (this.mLonEastE6 + this.mLonWestE6) / 2);
    }

    public int getDiagonalLengthInMeters() {
        return new GeoPoint(this.mLatNorthE6, this.mLonWestE6).distanceTo(new GeoPoint(this.mLatSouthE6, this.mLonEastE6));
    }

    public int getLatNorthE6() {
        return this.mLatNorthE6;
    }

    public int getLatSouthE6() {
        return this.mLatSouthE6;
    }

    public int getLonEastE6() {
        return this.mLonEastE6;
    }

    public int getLonWestE6() {
        return this.mLonWestE6;
    }

    public int getLatitudeSpanE6() {
        return Math.abs(this.mLatNorthE6 - this.mLatSouthE6);
    }

    public int getLongitudeSpanE6() {
        return Math.abs(this.mLonEastE6 - this.mLonWestE6);
    }

    public PointF getRelativePositionOfGeoPointInBoundingBoxWithLinearInterpolation(int aLatitude, int aLongitude, PointF reuse) {
        PointF out = reuse != null ? reuse : new PointF();
        float y = (this.mLatNorthE6 - aLatitude) / getLatitudeSpanE6();
        float x = 1.0f - ((this.mLonEastE6 - aLongitude) / getLongitudeSpanE6());
        out.set(x, y);
        return out;
    }

    public PointF getRelativePositionOfGeoPointInBoundingBoxWithExactGudermannInterpolation(int aLatitudeE6, int aLongitudeE6, PointF reuse) {
        PointF out = reuse != null ? reuse : new PointF();
        float y = (float) ((MyMath.gudermannInverse(this.mLatNorthE6 / 1000000.0d) - MyMath.gudermannInverse(aLatitudeE6 / 1000000.0d)) / (MyMath.gudermannInverse(this.mLatNorthE6 / 1000000.0d) - MyMath.gudermannInverse(this.mLatSouthE6 / 1000000.0d)));
        float x = 1.0f - ((this.mLonEastE6 - aLongitudeE6) / getLongitudeSpanE6());
        out.set(x, y);
        return out;
    }

    public GeoPoint getGeoPointOfRelativePositionWithLinearInterpolation(float relX, float relY) {
        int lat = (int) (this.mLatNorthE6 - (getLatitudeSpanE6() * relY));
        int lon = (int) (this.mLonWestE6 + (getLongitudeSpanE6() * relX));
        while (lat > 90500000) {
            lat -= 90500000;
        }
        while (lat < -90500000) {
            lat += 90500000;
        }
        while (lon > 180000000) {
            lon -= 180000000;
        }
        while (lon < -180000000) {
            lon += 180000000;
        }
        return new GeoPoint(lat, lon);
    }

    public GeoPoint getGeoPointOfRelativePositionWithExactGudermannInterpolation(float relX, float relY) {
        double gudNorth = MyMath.gudermannInverse(this.mLatNorthE6 / 1000000.0d);
        double gudSouth = MyMath.gudermannInverse(this.mLatSouthE6 / 1000000.0d);
        double latD = MyMath.gudermann(gudSouth + ((1.0f - relY) * (gudNorth - gudSouth)));
        int lat = (int) (latD * 1000000.0d);
        int lon = (int) (this.mLonWestE6 + (getLongitudeSpanE6() * relX));
        while (lat > 90500000) {
            lat -= 90500000;
        }
        while (lat < -90500000) {
            lat += 90500000;
        }
        while (lon > 180000000) {
            lon -= 180000000;
        }
        while (lon < -180000000) {
            lon += 180000000;
        }
        return new GeoPoint(lat, lon);
    }

    public BoundingBoxE6 increaseByScale(float pBoundingboxPaddingRelativeScale) {
        GeoPoint pCenter = getCenter();
        int mLatSpanE6Padded_2 = (int) ((getLatitudeSpanE6() * pBoundingboxPaddingRelativeScale) / 2.0f);
        int mLonSpanE6Padded_2 = (int) ((getLongitudeSpanE6() * pBoundingboxPaddingRelativeScale) / 2.0f);
        return new BoundingBoxE6(pCenter.getLatitudeE6() + mLatSpanE6Padded_2, pCenter.getLongitudeE6() + mLonSpanE6Padded_2, pCenter.getLatitudeE6() - mLatSpanE6Padded_2, pCenter.getLongitudeE6() - mLonSpanE6Padded_2);
    }

    public String toString() {
        return new StringBuffer().append("N:").append(this.mLatNorthE6).append("; E:").append(this.mLonEastE6).append("; S:").append(this.mLatSouthE6).append("; W:").append(this.mLonWestE6).toString();
    }

    public GeoPoint bringToBoundingBox(int aLatitudeE6, int aLongitudeE6) {
        return new GeoPoint(Math.max(this.mLatSouthE6, Math.min(this.mLatNorthE6, aLatitudeE6)), Math.max(this.mLonWestE6, Math.min(this.mLonEastE6, aLongitudeE6)));
    }

    public static BoundingBoxE6 fromGeoPoints(ArrayList<? extends GeoPoint> partialPolyLine) {
        int minLat = Integer.MAX_VALUE;
        int minLon = Integer.MAX_VALUE;
        int maxLat = Integer.MIN_VALUE;
        int maxLon = Integer.MIN_VALUE;
        Iterator i$ = partialPolyLine.iterator();
        while (i$.hasNext()) {
            GeoPoint gp = i$.next();
            int latitudeE6 = gp.getLatitudeE6();
            int longitudeE6 = gp.getLongitudeE6();
            minLat = Math.min(minLat, latitudeE6);
            minLon = Math.min(minLon, longitudeE6);
            maxLat = Math.max(maxLat, latitudeE6);
            maxLon = Math.max(maxLon, longitudeE6);
        }
        return new BoundingBoxE6(maxLat, maxLon, minLat, minLon);
    }

    public boolean contains(IGeoPoint pGeoPoint) {
        return contains(pGeoPoint.getLatitudeE6(), pGeoPoint.getLongitudeE6());
    }

    public boolean contains(int aLatitudeE6, int aLongitudeE6) {
        if (aLatitudeE6 < this.mLatNorthE6 && aLatitudeE6 > this.mLatSouthE6) {
            if (this.mLonWestE6 < this.mLonEastE6) {
                if (aLongitudeE6 < this.mLonEastE6 && aLongitudeE6 > this.mLonWestE6) {
                    return true;
                }
                return false;
            }
            if (aLongitudeE6 < this.mLonEastE6 || aLongitudeE6 > this.mLonWestE6) {
                return true;
            }
            return false;
        }
        return false;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int arg1) {
        out.writeInt(this.mLatNorthE6);
        out.writeInt(this.mLonEastE6);
        out.writeInt(this.mLatSouthE6);
        out.writeInt(this.mLonWestE6);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static BoundingBoxE6 readFromParcel(Parcel in) {
        int latNorthE6 = in.readInt();
        int lonEastE6 = in.readInt();
        int latSouthE6 = in.readInt();
        int lonWestE6 = in.readInt();
        return new BoundingBoxE6(latNorthE6, lonEastE6, latSouthE6, lonWestE6);
    }
}
