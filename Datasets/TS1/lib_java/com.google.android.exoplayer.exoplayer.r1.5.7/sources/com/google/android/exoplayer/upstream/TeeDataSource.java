package com.google.android.exoplayer.upstream;

import com.google.android.exoplayer.util.Assertions;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/upstream/TeeDataSource.class */
public final class TeeDataSource implements DataSource {
    private final DataSource upstream;
    private final DataSink dataSink;

    public TeeDataSource(DataSource upstream, DataSink dataSink) {
        this.upstream = (DataSource) Assertions.checkNotNull(upstream);
        this.dataSink = (DataSink) Assertions.checkNotNull(dataSink);
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public long open(DataSpec dataSpec) throws IOException {
        long dataLength = this.upstream.open(dataSpec);
        if (dataSpec.length == -1 && dataLength != -1) {
            dataSpec = new DataSpec(dataSpec.uri, dataSpec.absoluteStreamPosition, dataSpec.position, dataLength, dataSpec.key, dataSpec.flags);
        }
        this.dataSink.open(dataSpec);
        return dataLength;
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public int read(byte[] buffer, int offset, int max) throws IOException {
        int num = this.upstream.read(buffer, offset, max);
        if (num > 0) {
            this.dataSink.write(buffer, offset, num);
        }
        return num;
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public void close() throws IOException {
        try {
            this.upstream.close();
            this.dataSink.close();
        } catch (Throwable th) {
            this.dataSink.close();
            throw th;
        }
    }
}
