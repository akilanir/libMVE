package com.google.android.exoplayer.chunk;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.chunk.ChunkExtractorWrapper;
import com.google.android.exoplayer.drm.DrmInitData;
import com.google.android.exoplayer.extractor.DefaultExtractorInput;
import com.google.android.exoplayer.extractor.ExtractorInput;
import com.google.android.exoplayer.extractor.SeekMap;
import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.upstream.DataSpec;
import com.google.android.exoplayer.util.ParsableByteArray;
import com.google.android.exoplayer.util.Util;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/chunk/InitializationChunk.class */
public final class InitializationChunk extends Chunk implements ChunkExtractorWrapper.SingleTrackOutput {
    private final ChunkExtractorWrapper extractorWrapper;
    private MediaFormat mediaFormat;
    private DrmInitData drmInitData;
    private SeekMap seekMap;
    private volatile int bytesLoaded;
    private volatile boolean loadCanceled;

    public InitializationChunk(DataSource dataSource, DataSpec dataSpec, int trigger, Format format, ChunkExtractorWrapper extractorWrapper) {
        this(dataSource, dataSpec, trigger, format, extractorWrapper, -1);
    }

    public InitializationChunk(DataSource dataSource, DataSpec dataSpec, int trigger, Format format, ChunkExtractorWrapper extractorWrapper, int parentId) {
        super(dataSource, dataSpec, 2, trigger, format, parentId);
        this.extractorWrapper = extractorWrapper;
    }

    @Override // com.google.android.exoplayer.chunk.Chunk
    public long bytesLoaded() {
        return this.bytesLoaded;
    }

    public boolean hasFormat() {
        return this.mediaFormat != null;
    }

    public MediaFormat getFormat() {
        return this.mediaFormat;
    }

    public boolean hasDrmInitData() {
        return this.drmInitData != null;
    }

    public DrmInitData getDrmInitData() {
        return this.drmInitData;
    }

    public boolean hasSeekMap() {
        return this.seekMap != null;
    }

    public SeekMap getSeekMap() {
        return this.seekMap;
    }

    @Override // com.google.android.exoplayer.chunk.ChunkExtractorWrapper.SingleTrackOutput
    public void seekMap(SeekMap seekMap) {
        this.seekMap = seekMap;
    }

    @Override // com.google.android.exoplayer.chunk.ChunkExtractorWrapper.SingleTrackOutput
    public void drmInitData(DrmInitData drmInitData) {
        this.drmInitData = drmInitData;
    }

    @Override // com.google.android.exoplayer.extractor.TrackOutput
    public void format(MediaFormat mediaFormat) {
        this.mediaFormat = mediaFormat;
    }

    @Override // com.google.android.exoplayer.extractor.TrackOutput
    public int sampleData(ExtractorInput input, int length, boolean allowEndOfInput) throws IOException, InterruptedException {
        throw new IllegalStateException("Unexpected sample data in initialization chunk");
    }

    @Override // com.google.android.exoplayer.extractor.TrackOutput
    public void sampleData(ParsableByteArray data, int length) {
        throw new IllegalStateException("Unexpected sample data in initialization chunk");
    }

    @Override // com.google.android.exoplayer.extractor.TrackOutput
    public void sampleMetadata(long timeUs, int flags, int size, int offset, byte[] encryptionKey) {
        throw new IllegalStateException("Unexpected sample data in initialization chunk");
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Loadable
    public void cancelLoad() {
        this.loadCanceled = true;
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Loadable
    public boolean isLoadCanceled() {
        return this.loadCanceled;
    }

    /* JADX WARN: Finally extract failed */
    @Override // com.google.android.exoplayer.upstream.Loader.Loadable
    public void load() throws IOException, InterruptedException {
        DataSpec loadDataSpec = Util.getRemainderDataSpec(this.dataSpec, this.bytesLoaded);
        try {
            ExtractorInput input = new DefaultExtractorInput(this.dataSource, loadDataSpec.absoluteStreamPosition, this.dataSource.open(loadDataSpec));
            if (this.bytesLoaded == 0) {
                this.extractorWrapper.init(this);
            }
            int result = 0;
            while (result == 0) {
                try {
                    if (this.loadCanceled) {
                        break;
                    } else {
                        result = this.extractorWrapper.read(input);
                    }
                } catch (Throwable th) {
                    this.bytesLoaded = (int) (input.getPosition() - this.dataSpec.absoluteStreamPosition);
                    throw th;
                }
            }
            this.bytesLoaded = (int) (input.getPosition() - this.dataSpec.absoluteStreamPosition);
        } finally {
            this.dataSource.close();
        }
    }
}
