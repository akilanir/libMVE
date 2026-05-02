package com.bumptech.glide.gifdecoder;

import java.util.ArrayList;
import java.util.List;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/gifdecoder/GifHeader.class */
public class GifHeader {
    GifFrame currentFrame;
    int width;
    int height;
    boolean gctFlag;
    int gctSize;
    int bgIndex;
    int pixelAspect;
    int bgColor;
    int loopCount;
    int[] gct = null;
    int status = 0;
    int frameCount = 0;
    List<GifFrame> frames = new ArrayList();

    public int getHeight() {
        return this.height;
    }

    public int getWidth() {
        return this.width;
    }

    public int getNumFrames() {
        return this.frameCount;
    }

    public int getStatus() {
        return this.status;
    }
}
