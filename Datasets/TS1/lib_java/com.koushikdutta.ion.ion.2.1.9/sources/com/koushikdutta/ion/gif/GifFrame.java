package com.koushikdutta.ion.gif;

import android.graphics.Bitmap;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/gif/GifFrame.class */
public class GifFrame {
    public Bitmap image;
    public int delay;

    public GifFrame(Bitmap im, int del) {
        this.image = im;
        this.delay = del;
    }
}
