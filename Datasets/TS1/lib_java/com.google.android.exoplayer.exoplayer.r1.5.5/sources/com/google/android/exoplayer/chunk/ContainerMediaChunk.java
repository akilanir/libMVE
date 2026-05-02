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

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/chunk/ContainerMediaChunk.class */
public class ContainerMediaChunk extends BaseMediaChunk implements ChunkExtractorWrapper.SingleTrackOutput {
    private final ChunkExtractorWrapper extractorWrapper;
    private final long sampleOffsetUs;
    private final int adaptiveMaxWidth;
    private final int adaptiveMaxHeight;
    private MediaFormat mediaFormat;
    private DrmInitData drmInitData;
    private volatile int bytesLoaded;
    private volatile boolean loadCanceled;

    public ContainerMediaChunk(DataSource dataSource, DataSpec dataSpec, int trigger, Format format, long startTimeUs, long endTimeUs, int chunkIndex, long sampleOffsetUs, ChunkExtractorWrapper extractorWrapper, MediaFormat mediaFormat, int adaptiveMaxWidth, int adaptiveMaxHeight, DrmInitData drmInitData, boolean isMediaFormatFinal, int parentId) {
        super(dataSource, dataSpec, trigger, format, startTimeUs, endTimeUs, chunkIndex, isMediaFormatFinal, parentId);
        this.extractorWrapper = extractorWrapper;
        this.sampleOffsetUs = sampleOffsetUs;
        this.adaptiveMaxWidth = adaptiveMaxWidth;
        this.adaptiveMaxHeight = adaptiveMaxHeight;
        this.mediaFormat = getAdjustedMediaFormat(mediaFormat, sampleOffsetUs, adaptiveMaxWidth, adaptiveMaxHeight);
        this.drmInitData = drmInitData;
    }

    @Override // com.google.android.exoplayer.chunk.Chunk
    public final long bytesLoaded() {
        return this.bytesLoaded;
    }

    @Override // com.google.android.exoplayer.chunk.BaseMediaChunk
    public final MediaFormat getMediaFormat() {
        return this.mediaFormat;
    }

    @Override // com.google.android.exoplayer.chunk.BaseMediaChunk
    public final DrmInitData getDrmInitData() {
        return this.drmInitData;
    }

    @Override // com.google.android.exoplayer.chunk.ChunkExtractorWrapper.SingleTrackOutput
    public final void seekMap(SeekMap seekMap) {
    }

    @Override // com.google.android.exoplayer.chunk.ChunkExtractorWrapper.SingleTrackOutput
    public final void drmInitData(DrmInitData drmInitData) {
        this.drmInitData = drmInitData;
    }

    @Override // com.google.android.exoplayer.extractor.TrackOutput
    public final void format(MediaFormat mediaFormat) {
        this.mediaFormat = getAdjustedMediaFormat(mediaFormat, this.sampleOffsetUs, this.adaptiveMaxWidth, this.adaptiveMaxHeight);
    }

    @Override // com.google.android.exoplayer.extractor.TrackOutput
    public final int sampleData(ExtractorInput input, int length, boolean allowEndOfInput) throws IOException, InterruptedException {
        return getOutput().sampleData(input, length, allowEndOfInput);
    }

    @Override // com.google.android.exoplayer.extractor.TrackOutput
    public final void sampleData(ParsableByteArray data, int length) {
        getOutput().sampleData(data, length);
    }

    @Override // com.google.android.exoplayer.extractor.TrackOutput
    public final void sampleMetadata(long timeUs, int flags, int size, int offset, byte[] encryptionKey) {
        getOutput().sampleMetadata(timeUs + this.sampleOffsetUs, flags, size, offset, encryptionKey);
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Loadable
    public final void cancelLoad() {
        this.loadCanceled = true;
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Loadable
    public final boolean isLoadCanceled() {
        return this.loadCanceled;
    }

    /* JADX WARN: Finally extract failed */
    @Override // com.google.android.exoplayer.upstream.Loader.Loadable
    public final void load() throws IOException, InterruptedException {
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

    private static MediaFormat getAdjustedMediaFormat(MediaFormat format, long sampleOffsetUs, int adaptiveMaxWidth, int adaptiveMaxHeight) {
        if (format == null) {
            return null;
        }
        if (sampleOffsetUs != 0 && format.subsampleOffsetUs != Long.MAX_VALUE) {
            format = format.copyWithSubsampleOffsetUs(format.subsampleOffsetUs + sampleOffsetUs);
        }
        if (adaptiveMaxWidth != -1 || adaptiveMaxHeight != -1) {
            format = format.copyWithMaxVideoDimensions(adaptiveMaxWidth, adaptiveMaxHeight);
        }
        return format;
    }
}
