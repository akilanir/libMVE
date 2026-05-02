package com.google.android.exoplayer.chunk;

import com.google.android.exoplayer.MediaFormat;
import java.io.IOException;
import java.util.List;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/chunk/ChunkSource.class */
public interface ChunkSource {
    void maybeThrowError() throws IOException;

    boolean prepare();

    int getTrackCount();

    MediaFormat getFormat(int i);

    void enable(int i);

    void continueBuffering(long j);

    void getChunkOperation(List<? extends MediaChunk> list, long j, ChunkOperationHolder chunkOperationHolder);

    void onChunkLoadCompleted(Chunk chunk);

    void onChunkLoadError(Chunk chunk, Exception exc);

    void disable(List<? extends MediaChunk> list);
}
