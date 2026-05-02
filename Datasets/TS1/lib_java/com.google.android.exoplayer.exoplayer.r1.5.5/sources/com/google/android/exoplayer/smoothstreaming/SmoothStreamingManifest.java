package com.google.android.exoplayer.smoothstreaming;

import android.net.Uri;
import com.google.android.exoplayer.C;
import com.google.android.exoplayer.chunk.Format;
import com.google.android.exoplayer.chunk.FormatWrapper;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.UriUtil;
import com.google.android.exoplayer.util.Util;
import java.util.List;
import java.util.UUID;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest.class */
public class SmoothStreamingManifest {
    public final int majorVersion;
    public final int minorVersion;
    public final int lookAheadCount;
    public final boolean isLive;
    public final ProtectionElement protectionElement;
    public final StreamElement[] streamElements;
    public final long durationUs;
    public final long dvrWindowLengthUs;

    public SmoothStreamingManifest(int majorVersion, int minorVersion, long timescale, long duration, long dvrWindowLength, int lookAheadCount, boolean isLive, ProtectionElement protectionElement, StreamElement[] streamElements) {
        this.majorVersion = majorVersion;
        this.minorVersion = minorVersion;
        this.lookAheadCount = lookAheadCount;
        this.isLive = isLive;
        this.protectionElement = protectionElement;
        this.streamElements = streamElements;
        this.dvrWindowLengthUs = dvrWindowLength == 0 ? -1L : Util.scaleLargeTimestamp(dvrWindowLength, C.MICROS_PER_SECOND, timescale);
        this.durationUs = duration == 0 ? -1L : Util.scaleLargeTimestamp(duration, C.MICROS_PER_SECOND, timescale);
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$ProtectionElement.class */
    public static class ProtectionElement {
        public final UUID uuid;
        public final byte[] data;

        public ProtectionElement(UUID uuid, byte[] data) {
            this.uuid = uuid;
            this.data = data;
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement.class */
    public static class TrackElement implements FormatWrapper {
        public final Format format;
        public final byte[][] csd;

        public TrackElement(int index, int bitrate, String mimeType, byte[][] csd, int maxWidth, int maxHeight, int sampleRate, int numChannels, String language) {
            this.csd = csd;
            this.format = new Format(String.valueOf(index), mimeType, maxWidth, maxHeight, -1.0f, numChannels, sampleRate, bitrate, language);
        }

        @Override // com.google.android.exoplayer.chunk.FormatWrapper
        public Format getFormat() {
            return this.format;
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement.class */
    public static class StreamElement {
        public static final int TYPE_UNKNOWN = -1;
        public static final int TYPE_AUDIO = 0;
        public static final int TYPE_VIDEO = 1;
        public static final int TYPE_TEXT = 2;
        private static final String URL_PLACEHOLDER_START_TIME = "{start time}";
        private static final String URL_PLACEHOLDER_BITRATE = "{bitrate}";
        public final int type;
        public final String subType;
        public final long timescale;
        public final String name;
        public final int qualityLevels;
        public final int maxWidth;
        public final int maxHeight;
        public final int displayWidth;
        public final int displayHeight;
        public final String language;
        public final TrackElement[] tracks;
        public final int chunkCount;
        private final String baseUri;
        private final String chunkTemplate;
        private final List<Long> chunkStartTimes;
        private final long[] chunkStartTimesUs;
        private final long lastChunkDurationUs;

        public StreamElement(String baseUri, String chunkTemplate, int type, String subType, long timescale, String name, int qualityLevels, int maxWidth, int maxHeight, int displayWidth, int displayHeight, String language, TrackElement[] tracks, List<Long> chunkStartTimes, long lastChunkDuration) {
            this.baseUri = baseUri;
            this.chunkTemplate = chunkTemplate;
            this.type = type;
            this.subType = subType;
            this.timescale = timescale;
            this.name = name;
            this.qualityLevels = qualityLevels;
            this.maxWidth = maxWidth;
            this.maxHeight = maxHeight;
            this.displayWidth = displayWidth;
            this.displayHeight = displayHeight;
            this.language = language;
            this.tracks = tracks;
            this.chunkCount = chunkStartTimes.size();
            this.chunkStartTimes = chunkStartTimes;
            this.lastChunkDurationUs = Util.scaleLargeTimestamp(lastChunkDuration, C.MICROS_PER_SECOND, timescale);
            this.chunkStartTimesUs = Util.scaleLargeTimestamps(chunkStartTimes, C.MICROS_PER_SECOND, timescale);
        }

        public int getChunkIndex(long timeUs) {
            return Util.binarySearchFloor(this.chunkStartTimesUs, timeUs, true, true);
        }

        public long getStartTimeUs(int chunkIndex) {
            return this.chunkStartTimesUs[chunkIndex];
        }

        public long getChunkDurationUs(int chunkIndex) {
            return chunkIndex == this.chunkCount - 1 ? this.lastChunkDurationUs : this.chunkStartTimesUs[chunkIndex + 1] - this.chunkStartTimesUs[chunkIndex];
        }

        public Uri buildRequestUri(int track, int chunkIndex) {
            Assertions.checkState(this.tracks != null);
            Assertions.checkState(this.chunkStartTimes != null);
            Assertions.checkState(chunkIndex < this.chunkStartTimes.size());
            String chunkUrl = this.chunkTemplate.replace(URL_PLACEHOLDER_BITRATE, Integer.toString(this.tracks[track].format.bitrate)).replace(URL_PLACEHOLDER_START_TIME, this.chunkStartTimes.get(chunkIndex).toString());
            return UriUtil.resolveToUri(this.baseUri, chunkUrl);
        }
    }
}
