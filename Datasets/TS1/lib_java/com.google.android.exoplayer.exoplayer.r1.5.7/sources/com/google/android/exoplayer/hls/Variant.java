package com.google.android.exoplayer.hls;

import com.google.android.exoplayer.chunk.Format;
import com.google.android.exoplayer.chunk.FormatWrapper;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/hls/Variant.class */
public final class Variant implements FormatWrapper {
    public final String url;
    public final Format format;

    public Variant(String url, Format format) {
        this.url = url;
        this.format = format;
    }

    @Override // com.google.android.exoplayer.chunk.FormatWrapper
    public Format getFormat() {
        return this.format;
    }
}
