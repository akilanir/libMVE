package com.google.android.exoplayer.dash.mpd;

import android.net.Uri;
import com.google.android.exoplayer.chunk.Format;
import com.google.android.exoplayer.chunk.FormatWrapper;
import com.google.android.exoplayer.dash.DashSegmentIndex;
import com.google.android.exoplayer.dash.mpd.SegmentBase;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/mpd/Representation.class */
public abstract class Representation implements FormatWrapper {
    public final String contentId;
    public final long revisionId;
    public final Format format;
    public final long presentationTimeOffsetUs;
    private final String cacheKey;
    private final RangedUri initializationUri;

    public abstract RangedUri getIndexUri();

    public abstract DashSegmentIndex getIndex();

    public static Representation newInstance(String contentId, long revisionId, Format format, SegmentBase segmentBase) {
        return newInstance(contentId, revisionId, format, segmentBase, null);
    }

    public static Representation newInstance(String contentId, long revisionId, Format format, SegmentBase segmentBase, String customCacheKey) {
        if (segmentBase instanceof SegmentBase.SingleSegmentBase) {
            return new SingleSegmentRepresentation(contentId, revisionId, format, (SegmentBase.SingleSegmentBase) segmentBase, customCacheKey, -1L);
        }
        if (segmentBase instanceof SegmentBase.MultiSegmentBase) {
            return new MultiSegmentRepresentation(contentId, revisionId, format, (SegmentBase.MultiSegmentBase) segmentBase, customCacheKey);
        }
        throw new IllegalArgumentException("segmentBase must be of type SingleSegmentBase or MultiSegmentBase");
    }

    private Representation(String contentId, long revisionId, Format format, SegmentBase segmentBase, String customCacheKey) {
        this.contentId = contentId;
        this.revisionId = revisionId;
        this.format = format;
        this.cacheKey = customCacheKey != null ? customCacheKey : contentId + "." + format.id + "." + revisionId;
        this.initializationUri = segmentBase.getInitialization(this);
        this.presentationTimeOffsetUs = segmentBase.getPresentationTimeOffsetUs();
    }

    @Override // com.google.android.exoplayer.chunk.FormatWrapper
    public Format getFormat() {
        return this.format;
    }

    public RangedUri getInitializationUri() {
        return this.initializationUri;
    }

    public String getCacheKey() {
        return this.cacheKey;
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation.class */
    public static class SingleSegmentRepresentation extends Representation {
        public final Uri uri;
        public final long contentLength;
        private final RangedUri indexUri;
        private final DashSingleSegmentIndex segmentIndex;

        public static SingleSegmentRepresentation newInstance(String contentId, long revisionId, Format format, String uri, long initializationStart, long initializationEnd, long indexStart, long indexEnd, String customCacheKey, long contentLength) {
            RangedUri rangedUri = new RangedUri(uri, null, initializationStart, (initializationEnd - initializationStart) + 1);
            SegmentBase.SingleSegmentBase segmentBase = new SegmentBase.SingleSegmentBase(rangedUri, 1L, 0L, uri, indexStart, (indexEnd - indexStart) + 1);
            return new SingleSegmentRepresentation(contentId, revisionId, format, segmentBase, customCacheKey, contentLength);
        }

        public SingleSegmentRepresentation(String contentId, long revisionId, Format format, SegmentBase.SingleSegmentBase segmentBase, String customCacheKey, long contentLength) {
            super(contentId, revisionId, format, segmentBase, customCacheKey);
            this.uri = Uri.parse(segmentBase.uri);
            this.indexUri = segmentBase.getIndex();
            this.contentLength = contentLength;
            this.segmentIndex = this.indexUri != null ? null : new DashSingleSegmentIndex(new RangedUri(segmentBase.uri, null, 0L, contentLength));
        }

        @Override // com.google.android.exoplayer.dash.mpd.Representation
        public RangedUri getIndexUri() {
            return this.indexUri;
        }

        @Override // com.google.android.exoplayer.dash.mpd.Representation
        public DashSegmentIndex getIndex() {
            return this.segmentIndex;
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/mpd/Representation$MultiSegmentRepresentation.class */
    public static class MultiSegmentRepresentation extends Representation implements DashSegmentIndex {
        private final SegmentBase.MultiSegmentBase segmentBase;

        public MultiSegmentRepresentation(String contentId, long revisionId, Format format, SegmentBase.MultiSegmentBase segmentBase, String customCacheKey) {
            super(contentId, revisionId, format, segmentBase, customCacheKey);
            this.segmentBase = segmentBase;
        }

        @Override // com.google.android.exoplayer.dash.mpd.Representation
        public RangedUri getIndexUri() {
            return null;
        }

        @Override // com.google.android.exoplayer.dash.mpd.Representation
        public DashSegmentIndex getIndex() {
            return this;
        }

        @Override // com.google.android.exoplayer.dash.DashSegmentIndex
        public RangedUri getSegmentUrl(int segmentIndex) {
            return this.segmentBase.getSegmentUrl(this, segmentIndex);
        }

        @Override // com.google.android.exoplayer.dash.DashSegmentIndex
        public int getSegmentNum(long timeUs, long periodDurationUs) {
            return this.segmentBase.getSegmentNum(timeUs, periodDurationUs);
        }

        @Override // com.google.android.exoplayer.dash.DashSegmentIndex
        public long getTimeUs(int segmentIndex) {
            return this.segmentBase.getSegmentTimeUs(segmentIndex);
        }

        @Override // com.google.android.exoplayer.dash.DashSegmentIndex
        public long getDurationUs(int segmentIndex, long periodDurationUs) {
            return this.segmentBase.getSegmentDurationUs(segmentIndex, periodDurationUs);
        }

        @Override // com.google.android.exoplayer.dash.DashSegmentIndex
        public int getFirstSegmentNum() {
            return this.segmentBase.getFirstSegmentNum();
        }

        @Override // com.google.android.exoplayer.dash.DashSegmentIndex
        public int getLastSegmentNum(long periodDurationUs) {
            return this.segmentBase.getLastSegmentNum(periodDurationUs);
        }

        @Override // com.google.android.exoplayer.dash.DashSegmentIndex
        public boolean isExplicit() {
            return this.segmentBase.isExplicit();
        }
    }
}
