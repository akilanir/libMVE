package com.google.android.exoplayer.upstream;

import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/upstream/DataSource.class */
public interface DataSource {
    long open(DataSpec dataSpec) throws IOException;

    void close() throws IOException;

    int read(byte[] bArr, int i, int i2) throws IOException;
}
