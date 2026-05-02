package com.google.android.exoplayer.chunk;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.drm.DrmInitData;
import com.google.android.exoplayer.extractor.DefaultTrackOutput;
import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.upstream.DataSpec;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/chunk/BaseMediaChunk.class */
public abstract class BaseMediaChunk extends MediaChunk {
    public final boolean isMediaFormatFinal;
    private DefaultTrackOutput output;
    private int firstSampleIndex;

    public abstract MediaFormat getMediaFormat();

    public abstract DrmInitData getDrmInitData();

    public BaseMediaChunk(DataSource dataSource, DataSpec dataSpec, int trigger, Format format, long startTimeUs, long endTimeUs, int chunkIndex, boolean isMediaFormatFinal, int parentId) {
        super(dataSource, dataSpec, trigger, format, startTimeUs, endTimeUs, chunkIndex, parentId);
        this.isMediaFormatFinal = isMediaFormatFinal;
    }

    public void init(DefaultTrackOutput output) {
        this.output = output;
        this.firstSampleIndex = output.getWriteIndex();
    }

    public final int getFirstSampleIndex() {
        return this.firstSampleIndex;
    }

    protected final DefaultTrackOutput getOutput() {
        return this.output;
    }
}
