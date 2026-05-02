package com.koushikdutta.ion;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/DeferredLoadBitmap.class */
public class DeferredLoadBitmap extends BitmapCallback {
    public static int DEFER_COUNTER = 0;
    BitmapFetcher fetcher;
    int priority;

    public DeferredLoadBitmap(Ion ion, String key, BitmapFetcher fetcher) {
        super(ion, key, false);
        int i = DEFER_COUNTER + 1;
        DEFER_COUNTER = i;
        this.priority = i;
        this.fetcher = fetcher;
    }
}
