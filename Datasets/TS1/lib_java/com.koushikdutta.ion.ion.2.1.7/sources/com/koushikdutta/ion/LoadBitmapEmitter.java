package com.koushikdutta.ion;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/LoadBitmapEmitter.class */
class LoadBitmapEmitter extends LoadBitmapBase {
    final boolean animateGif;

    public LoadBitmapEmitter(Ion ion, String urlKey, boolean put, boolean animateGif) {
        super(ion, urlKey, put);
        this.animateGif = animateGif;
    }
}
