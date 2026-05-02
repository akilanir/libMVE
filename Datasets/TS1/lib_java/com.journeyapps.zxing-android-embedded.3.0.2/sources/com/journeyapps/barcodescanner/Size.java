package com.journeyapps.barcodescanner;

/* loaded from: com.journeyapps.zxing-android-embedded.3.0.2.jar:com/journeyapps/barcodescanner/Size.class */
public class Size implements Comparable<Size> {
    public final int width;
    public final int height;

    public Size(int width, int height) {
        this.width = width;
        this.height = height;
    }

    public Size rotate() {
        return new Size(this.height, this.width);
    }

    public Size scale(int n, int d) {
        return new Size((this.width * n) / d, (this.height * n) / d);
    }

    public boolean fitsIn(Size other) {
        return this.width <= other.width && this.height <= other.height;
    }

    @Override // java.lang.Comparable
    public int compareTo(Size other) {
        int aPixels = this.height * this.width;
        int bPixels = other.height * other.width;
        if (bPixels < aPixels) {
            return 1;
        }
        if (bPixels > aPixels) {
            return -1;
        }
        return 0;
    }

    public String toString() {
        return this.width + "x" + this.height;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Size size = (Size) o;
        return this.width == size.width && this.height == size.height;
    }

    public int hashCode() {
        int result = this.width;
        return (31 * result) + this.height;
    }
}
