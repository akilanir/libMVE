package com.google.android.exoplayer.hls;

import java.util.Collections;
import java.util.List;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/hls/HlsMasterPlaylist.class */
public final class HlsMasterPlaylist extends HlsPlaylist {
    public final List<Variant> variants;
    public final List<Variant> audios;
    public final List<Variant> subtitles;
    public final String muxedAudioLanguage;
    public final String muxedCaptionLanguage;

    public HlsMasterPlaylist(String baseUri, List<Variant> variants, List<Variant> audios, List<Variant> subtitles, String muxedAudioLanguage, String muxedCaptionLanguage) {
        super(baseUri, 0);
        this.variants = Collections.unmodifiableList(variants);
        this.audios = Collections.unmodifiableList(audios);
        this.subtitles = Collections.unmodifiableList(subtitles);
        this.muxedAudioLanguage = muxedAudioLanguage;
        this.muxedCaptionLanguage = muxedCaptionLanguage;
    }
}
