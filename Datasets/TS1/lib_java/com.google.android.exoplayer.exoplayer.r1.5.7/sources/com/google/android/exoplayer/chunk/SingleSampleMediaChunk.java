package com.google.android.exoplayer.chunk;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.drm.DrmInitData;
import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.upstream.DataSpec;
import com.google.android.exoplayer.util.Util;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/chunk/SingleSampleMediaChunk.class */
public final class SingleSampleMediaChunk extends BaseMediaChunk {
    private final MediaFormat sampleFormat;
    private final DrmInitData sampleDrmInitData;
    private volatile int bytesLoaded;
    private volatile boolean loadCanceled;

    public SingleSampleMediaChunk(DataSource dataSource, DataSpec dataSpec, int trigger, Format format, long startTimeUs, long endTimeUs, int chunkIndex, MediaFormat sampleFormat, DrmInitData sampleDrmInitData, int parentId) {
        super(dataSource, dataSpec, trigger, format, startTimeUs, endTimeUs, chunkIndex, true, parentId);
        this.sampleFormat = sampleFormat;
        this.sampleDrmInitData = sampleDrmInitData;
    }

    @Override // com.google.android.exoplayer.chunk.Chunk
    public long bytesLoaded() {
        return this.bytesLoaded;
    }

    @Override // com.google.android.exoplayer.chunk.BaseMediaChunk
    public MediaFormat getMediaFormat() {
        return this.sampleFormat;
    }

    @Override // com.google.android.exoplayer.chunk.BaseMediaChunk
    public DrmInitData getDrmInitData() {
        return this.sampleDrmInitData;
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Loadable
    public void cancelLoad() {
        this.loadCanceled = true;
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Loadable
    public boolean isLoadCanceled() {
        return this.loadCanceled;
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Loadable
    public void load() throws IOException, InterruptedException {
        DataSpec loadDataSpec = Util.getRemainderDataSpec(this.dataSpec, this.bytesLoaded);
        try {
            this.dataSource.open(loadDataSpec);
            int result = 0;
            while (result != -1) {
                this.bytesLoaded += result;
                result = getOutput().sampleData(this.dataSource, Integer.MAX_VALUE, true);
            }
            int sampleSize = this.bytesLoaded;
            getOutput().sampleMetadata(this.startTimeUs, 1, sampleSize, 0, null);
            this.dataSource.close();
        } catch (Throwable th) {
            this.dataSource.close();
            throw th;
        }
    }
}
