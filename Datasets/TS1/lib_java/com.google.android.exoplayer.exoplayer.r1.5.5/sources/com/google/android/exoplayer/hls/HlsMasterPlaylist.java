package com.google.android.exoplayer.hls;

import java.util.Collections;
import java.util.List;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/hls/HlsMasterPlaylist.class */
public final class HlsMasterPlaylist extends HlsPlaylist {
    public final List<Variant> variants;
    public final List<Variant> subtitles;

    public HlsMasterPlaylist(String baseUri, List<Variant> variants, List<Variant> subtitles) {
        super(baseUri, 0);
        this.variants = Collections.unmodifiableList(variants);
        this.subtitles = Collections.unmodifiableList(subtitles);
    }
}
