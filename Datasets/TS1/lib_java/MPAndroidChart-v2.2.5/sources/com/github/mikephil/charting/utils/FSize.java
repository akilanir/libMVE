package com.github.mikephil.charting.utils;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/utils/FSize.class */
public final class FSize {
    public final float width;
    public final float height;

    public FSize(float width, float height) {
        this.width = width;
        this.height = height;
    }

    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        if (obj instanceof FSize) {
            FSize other = (FSize) obj;
            return this.width == other.width && this.height == other.height;
        }
        return false;
    }

    public String toString() {
        return this.width + "x" + this.height;
    }

    public int hashCode() {
        return Float.floatToIntBits(this.width) ^ Float.floatToIntBits(this.height);
    }
}
