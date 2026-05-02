package com.google.android.exoplayer.upstream;

import com.google.android.exoplayer.util.Assertions;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/upstream/ByteArrayDataSink.class */
public final class ByteArrayDataSink implements DataSink {
    private ByteArrayOutputStream stream;

    @Override // com.google.android.exoplayer.upstream.DataSink
    public DataSink open(DataSpec dataSpec) throws IOException {
        if (dataSpec.length == -1) {
            this.stream = new ByteArrayOutputStream();
        } else {
            Assertions.checkArgument(dataSpec.length <= 2147483647L);
            this.stream = new ByteArrayOutputStream((int) dataSpec.length);
        }
        return this;
    }

    @Override // com.google.android.exoplayer.upstream.DataSink
    public void close() throws IOException {
        this.stream.close();
    }

    @Override // com.google.android.exoplayer.upstream.DataSink
    public void write(byte[] buffer, int offset, int length) throws IOException {
        this.stream.write(buffer, offset, length);
    }

    public byte[] getData() {
        if (this.stream == null) {
            return null;
        }
        return this.stream.toByteArray();
    }
}
