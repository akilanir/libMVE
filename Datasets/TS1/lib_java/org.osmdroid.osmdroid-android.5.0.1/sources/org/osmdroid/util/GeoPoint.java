package org.osmdroid.util;

import android.location.Location;
import android.os.Parcel;
import android.os.Parcelable;
import java.io.Serializable;
import org.osmdroid.api.IGeoPoint;
import org.osmdroid.util.constants.GeoConstants;
import org.osmdroid.views.util.constants.MathConstants;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/util/GeoPoint.class */
public class GeoPoint implements IGeoPoint, MathConstants, GeoConstants, Parcelable, Serializable, Cloneable {
    static final long serialVersionUID = 1;
    private int mLongitudeE6;
    private int mLatitudeE6;
    private int mAltitude;
    public static final Parcelable.Creator<GeoPoint> CREATOR = new Parcelable.Creator<GeoPoint>() { // from class: org.osmdroid.util.GeoPoint.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public GeoPoint createFromParcel(Parcel in) {
            return new GeoPoint(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public GeoPoint[] newArray(int size) {
            return new GeoPoint[size];
        }
    };

    public GeoPoint(int aLatitudeE6, int aLongitudeE6) {
        this.mLatitudeE6 = aLatitudeE6;
        this.mLongitudeE6 = aLongitudeE6;
    }

    public GeoPoint(int aLatitudeE6, int aLongitudeE6, int aAltitude) {
        this.mLatitudeE6 = aLatitudeE6;
        this.mLongitudeE6 = aLongitudeE6;
        this.mAltitude = aAltitude;
    }

    public GeoPoint(double aLatitude, double aLongitude) {
        this.mLatitudeE6 = (int) (aLatitude * 1000000.0d);
        this.mLongitudeE6 = (int) (aLongitude * 1000000.0d);
    }

    public GeoPoint(double aLatitude, double aLongitude, double aAltitude) {
        this.mLatitudeE6 = (int) (aLatitude * 1000000.0d);
        this.mLongitudeE6 = (int) (aLongitude * 1000000.0d);
        this.mAltitude = (int) aAltitude;
    }

    public GeoPoint(Location aLocation) {
        this(aLocation.getLatitude(), aLocation.getLongitude(), aLocation.getAltitude());
    }

    public GeoPoint(GeoPoint aGeopoint) {
        this.mLatitudeE6 = aGeopoint.mLatitudeE6;
        this.mLongitudeE6 = aGeopoint.mLongitudeE6;
        this.mAltitude = aGeopoint.mAltitude;
    }

    public static GeoPoint fromDoubleString(String s, char spacer) {
        int spacerPos1 = s.indexOf(spacer);
        int spacerPos2 = s.indexOf(spacer, spacerPos1 + 1);
        if (spacerPos2 == -1) {
            return new GeoPoint((int) (Double.parseDouble(s.substring(0, spacerPos1)) * 1000000.0d), (int) (Double.parseDouble(s.substring(spacerPos1 + 1, s.length())) * 1000000.0d));
        }
        return new GeoPoint((int) (Double.parseDouble(s.substring(0, spacerPos1)) * 1000000.0d), (int) (Double.parseDouble(s.substring(spacerPos1 + 1, spacerPos2)) * 1000000.0d), (int) Double.parseDouble(s.substring(spacerPos2 + 1, s.length())));
    }

    public static GeoPoint fromInvertedDoubleString(String s, char spacer) {
        int spacerPos1 = s.indexOf(spacer);
        int spacerPos2 = s.indexOf(spacer, spacerPos1 + 1);
        if (spacerPos2 == -1) {
            return new GeoPoint((int) (Double.parseDouble(s.substring(spacerPos1 + 1, s.length())) * 1000000.0d), (int) (Double.parseDouble(s.substring(0, spacerPos1)) * 1000000.0d));
        }
        return new GeoPoint((int) (Double.parseDouble(s.substring(spacerPos1 + 1, spacerPos2)) * 1000000.0d), (int) (Double.parseDouble(s.substring(0, spacerPos1)) * 1000000.0d), (int) Double.parseDouble(s.substring(spacerPos2 + 1, s.length())));
    }

    public static GeoPoint fromIntString(String s) {
        int commaPos1 = s.indexOf(44);
        int commaPos2 = s.indexOf(44, commaPos1 + 1);
        if (commaPos2 == -1) {
            return new GeoPoint(Integer.parseInt(s.substring(0, commaPos1)), Integer.parseInt(s.substring(commaPos1 + 1, s.length())));
        }
        return new GeoPoint(Integer.parseInt(s.substring(0, commaPos1)), Integer.parseInt(s.substring(commaPos1 + 1, commaPos2)), Integer.parseInt(s.substring(commaPos2 + 1, s.length())));
    }

    @Override // org.osmdroid.api.IGeoPoint
    public int getLongitudeE6() {
        return this.mLongitudeE6;
    }

    @Override // org.osmdroid.api.IGeoPoint
    public int getLatitudeE6() {
        return this.mLatitudeE6;
    }

    @Override // org.osmdroid.api.IGeoPoint
    public double getLongitude() {
        return this.mLongitudeE6 * 1.0E-6d;
    }

    @Override // org.osmdroid.api.IGeoPoint
    public double getLatitude() {
        return this.mLatitudeE6 * 1.0E-6d;
    }

    public int getAltitude() {
        return this.mAltitude;
    }

    public void setLongitudeE6(int aLongitudeE6) {
        this.mLongitudeE6 = aLongitudeE6;
    }

    public void setLatitudeE6(int aLatitudeE6) {
        this.mLatitudeE6 = aLatitudeE6;
    }

    public void setAltitude(int aAltitude) {
        this.mAltitude = aAltitude;
    }

    public void setCoordsE6(int aLatitudeE6, int aLongitudeE6) {
        this.mLatitudeE6 = aLatitudeE6;
        this.mLongitudeE6 = aLongitudeE6;
    }

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public GeoPoint m14clone() {
        return new GeoPoint(this.mLatitudeE6, this.mLongitudeE6, this.mAltitude);
    }

    public String toString() {
        return this.mLatitudeE6 + "," + this.mLongitudeE6 + "," + this.mAltitude;
    }

    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        if (obj.getClass() != getClass()) {
            return false;
        }
        GeoPoint rhs = (GeoPoint) obj;
        return rhs.mLatitudeE6 == this.mLatitudeE6 && rhs.mLongitudeE6 == this.mLongitudeE6 && rhs.mAltitude == this.mAltitude;
    }

    public int hashCode() {
        return (37 * ((17 * this.mLatitudeE6) + this.mLongitudeE6)) + this.mAltitude;
    }

    private GeoPoint(Parcel in) {
        this.mLatitudeE6 = in.readInt();
        this.mLongitudeE6 = in.readInt();
        this.mAltitude = in.readInt();
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        out.writeInt(this.mLatitudeE6);
        out.writeInt(this.mLongitudeE6);
        out.writeInt(this.mAltitude);
    }

    public int distanceTo(IGeoPoint other) {
        double a1 = (0.017453292f * this.mLatitudeE6) / 1000000.0d;
        double a2 = (0.017453292f * this.mLongitudeE6) / 1000000.0d;
        double b1 = (0.017453292f * other.getLatitudeE6()) / 1000000.0d;
        double b2 = (0.017453292f * other.getLongitudeE6()) / 1000000.0d;
        double cosa1 = Math.cos(a1);
        double cosb1 = Math.cos(b1);
        double t1 = cosa1 * Math.cos(a2) * cosb1 * Math.cos(b2);
        double t2 = cosa1 * Math.sin(a2) * cosb1 * Math.sin(b2);
        double t3 = Math.sin(a1) * Math.sin(b1);
        double tt = Math.acos(t1 + t2 + t3);
        return (int) (6378137.0d * tt);
    }

    public double bearingTo(IGeoPoint other) {
        double lat1 = Math.toRadians(this.mLatitudeE6 / 1000000.0d);
        double long1 = Math.toRadians(this.mLongitudeE6 / 1000000.0d);
        double lat2 = Math.toRadians(other.getLatitudeE6() / 1000000.0d);
        double long2 = Math.toRadians(other.getLongitudeE6() / 1000000.0d);
        double delta_long = long2 - long1;
        double a = Math.sin(delta_long) * Math.cos(lat2);
        double b = (Math.cos(lat1) * Math.sin(lat2)) - ((Math.sin(lat1) * Math.cos(lat2)) * Math.cos(delta_long));
        double bearing = Math.toDegrees(Math.atan2(a, b));
        double bearing_normalized = (bearing + 360.0d) % 360.0d;
        return bearing_normalized;
    }

    public GeoPoint destinationPoint(double aDistanceInMeters, float aBearingInDegrees) {
        double dist = aDistanceInMeters / 6378137.0d;
        float brng = 0.017453292f * aBearingInDegrees;
        double lat1 = (0.017453292f * getLatitudeE6()) / 1000000.0d;
        double lon1 = (0.017453292f * getLongitudeE6()) / 1000000.0d;
        double lat2 = Math.asin((Math.sin(lat1) * Math.cos(dist)) + (Math.cos(lat1) * Math.sin(dist) * Math.cos(brng)));
        double lon2 = lon1 + Math.atan2(Math.sin(brng) * Math.sin(dist) * Math.cos(lat1), Math.cos(dist) - (Math.sin(lat1) * Math.sin(lat2)));
        double lat2deg = lat2 / 0.01745329238474369d;
        double lon2deg = lon2 / 0.01745329238474369d;
        return new GeoPoint(lat2deg, lon2deg);
    }

    public static GeoPoint fromCenterBetween(GeoPoint geoPointA, GeoPoint geoPointB) {
        return new GeoPoint((geoPointA.getLatitudeE6() + geoPointB.getLatitudeE6()) / 2, (geoPointA.getLongitudeE6() + geoPointB.getLongitudeE6()) / 2);
    }

    public String toDoubleString() {
        return (this.mLatitudeE6 / 1000000.0d) + "," + (this.mLongitudeE6 / 1000000.0d) + "," + this.mAltitude;
    }

    public String toInvertedDoubleString() {
        return (this.mLongitudeE6 / 1000000.0d) + "," + (this.mLatitudeE6 / 1000000.0d) + "," + this.mAltitude;
    }
}
