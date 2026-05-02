package com.google.android.exoplayer.hls;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/hls/HlsPlaylist.class */
public abstract class HlsPlaylist {
    public static final int TYPE_MASTER = 0;
    public static final int TYPE_MEDIA = 1;
    public final String baseUri;
    public final int type;

    protected HlsPlaylist(String baseUri, int type) {
        this.baseUri = baseUri;
        this.type = type;
    }
}
