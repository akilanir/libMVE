package com.google.android.exoplayer.upstream;

import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/upstream/DataSink.class */
public interface DataSink {
    DataSink open(DataSpec dataSpec) throws IOException;

    void close() throws IOException;

    void write(byte[] bArr, int i, int i2) throws IOException;
}
