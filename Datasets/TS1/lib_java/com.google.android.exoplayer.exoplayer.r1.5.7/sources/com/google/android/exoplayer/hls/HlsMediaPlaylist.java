package com.google.android.exoplayer.hls;

import java.util.List;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/hls/HlsMediaPlaylist.class */
public final class HlsMediaPlaylist extends HlsPlaylist {
    public static final String ENCRYPTION_METHOD_NONE = "NONE";
    public static final String ENCRYPTION_METHOD_AES_128 = "AES-128";
    public final int mediaSequence;
    public final int targetDurationSecs;
    public final int version;
    public final List<Segment> segments;
    public final boolean live;
    public final long durationUs;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/hls/HlsMediaPlaylist$Segment.class */
    public static final class Segment implements Comparable<Long> {
        public final String url;
        public final double durationSecs;
        public final int discontinuitySequenceNumber;
        public final long startTimeUs;
        public final boolean isEncrypted;
        public final String encryptionKeyUri;
        public final String encryptionIV;
        public final long byterangeOffset;
        public final long byterangeLength;

        public Segment(String uri, double durationSecs, int discontinuitySequenceNumber, long startTimeUs, boolean isEncrypted, String encryptionKeyUri, String encryptionIV, long byterangeOffset, long byterangeLength) {
            this.url = uri;
            this.durationSecs = durationSecs;
            this.discontinuitySequenceNumber = discontinuitySequenceNumber;
            this.startTimeUs = startTimeUs;
            this.isEncrypted = isEncrypted;
            this.encryptionKeyUri = encryptionKeyUri;
            this.encryptionIV = encryptionIV;
            this.byterangeOffset = byterangeOffset;
            this.byterangeLength = byterangeLength;
        }

        @Override // java.lang.Comparable
        public int compareTo(Long startTimeUs) {
            if (this.startTimeUs > startTimeUs.longValue()) {
                return 1;
            }
            return this.startTimeUs < startTimeUs.longValue() ? -1 : 0;
        }
    }

    public HlsMediaPlaylist(String baseUri, int mediaSequence, int targetDurationSecs, int version, boolean live, List<Segment> segments) {
        super(baseUri, 1);
        this.mediaSequence = mediaSequence;
        this.targetDurationSecs = targetDurationSecs;
        this.version = version;
        this.live = live;
        this.segments = segments;
        if (!segments.isEmpty()) {
            Segment last = segments.get(segments.size() - 1);
            this.durationUs = last.startTimeUs + ((long) (last.durationSecs * 1000000.0d));
        } else {
            this.durationUs = 0L;
        }
    }
}
