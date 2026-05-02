package com.google.android.exoplayer.upstream;

import com.google.android.exoplayer.util.Assertions;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/upstream/PriorityDataSource.class */
public final class PriorityDataSource implements DataSource {
    private final DataSource upstream;
    private final int priority;

    public PriorityDataSource(int priority, DataSource upstream) {
        this.priority = priority;
        this.upstream = (DataSource) Assertions.checkNotNull(upstream);
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public long open(DataSpec dataSpec) throws IOException {
        NetworkLock.instance.proceedOrThrow(this.priority);
        return this.upstream.open(dataSpec);
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public int read(byte[] buffer, int offset, int max) throws IOException {
        NetworkLock.instance.proceedOrThrow(this.priority);
        return this.upstream.read(buffer, offset, max);
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public void close() throws IOException {
        this.upstream.close();
    }
}
