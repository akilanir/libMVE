package com.google.android.exoplayer.chunk;

import com.google.android.exoplayer.util.Assertions;
import java.util.Comparator;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/chunk/Format.class */
public class Format {
    public final String id;
    public final String mimeType;
    public final int bitrate;
    public final int width;
    public final int height;
    public final float frameRate;
    public final int audioChannels;
    public final int audioSamplingRate;
    public final String codecs;
    public final String language;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/chunk/Format$DecreasingBandwidthComparator.class */
    public static final class DecreasingBandwidthComparator implements Comparator<Format> {
        @Override // java.util.Comparator
        public int compare(Format a, Format b) {
            return b.bitrate - a.bitrate;
        }
    }

    public Format(String id, String mimeType, int width, int height, float frameRate, int numChannels, int audioSamplingRate, int bitrate) {
        this(id, mimeType, width, height, frameRate, numChannels, audioSamplingRate, bitrate, null);
    }

    public Format(String id, String mimeType, int width, int height, float frameRate, int numChannels, int audioSamplingRate, int bitrate, String language) {
        this(id, mimeType, width, height, frameRate, numChannels, audioSamplingRate, bitrate, language, null);
    }

    public Format(String id, String mimeType, int width, int height, float frameRate, int audioChannels, int audioSamplingRate, int bitrate, String language, String codecs) {
        this.id = (String) Assertions.checkNotNull(id);
        this.mimeType = mimeType;
        this.width = width;
        this.height = height;
        this.frameRate = frameRate;
        this.audioChannels = audioChannels;
        this.audioSamplingRate = audioSamplingRate;
        this.bitrate = bitrate;
        this.language = language;
        this.codecs = codecs;
    }

    public int hashCode() {
        return this.id.hashCode();
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Format other = (Format) obj;
        return other.id.equals(this.id);
    }
}
