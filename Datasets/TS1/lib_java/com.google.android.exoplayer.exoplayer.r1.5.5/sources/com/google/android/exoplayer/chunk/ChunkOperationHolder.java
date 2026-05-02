package com.google.android.exoplayer.chunk;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/chunk/ChunkOperationHolder.class */
public final class ChunkOperationHolder {
    public int queueSize;
    public Chunk chunk;
    public boolean endOfStream;

    public void clear() {
        this.queueSize = 0;
        this.chunk = null;
        this.endOfStream = false;
    }
}
