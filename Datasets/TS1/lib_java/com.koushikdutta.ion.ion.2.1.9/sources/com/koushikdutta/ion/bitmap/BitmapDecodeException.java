package com.koushikdutta.ion.bitmap;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/bitmap/BitmapDecodeException.class */
public class BitmapDecodeException extends Exception {
    public final int width;
    public final int height;

    public BitmapDecodeException(int width, int height) {
        this.width = width;
        this.height = height;
    }

    @Override // java.lang.Throwable
    public String toString() {
        return super.toString() + " size=" + this.width + 'x' + this.height;
    }
}
