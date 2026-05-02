package com.google.android.exoplayer.upstream;

import com.google.android.exoplayer.util.Assertions;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/upstream/ByteArrayDataSource.class */
public final class ByteArrayDataSource implements DataSource {
    private final byte[] data;
    private int readPosition;
    private int remainingBytes;

    public ByteArrayDataSource(byte[] data) {
        Assertions.checkNotNull(data);
        Assertions.checkArgument(data.length > 0);
        this.data = data;
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public long open(DataSpec dataSpec) throws IOException {
        this.readPosition = (int) dataSpec.position;
        this.remainingBytes = (int) (dataSpec.length == -1 ? this.data.length - dataSpec.position : dataSpec.length);
        if (this.remainingBytes <= 0 || this.readPosition + this.remainingBytes > this.data.length) {
            throw new IOException("Unsatisfiable range: [" + this.readPosition + ", " + dataSpec.length + "], length: " + this.data.length);
        }
        return this.remainingBytes;
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public void close() throws IOException {
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public int read(byte[] buffer, int offset, int length) throws IOException {
        if (this.remainingBytes == 0) {
            return -1;
        }
        int length2 = Math.min(length, this.remainingBytes);
        System.arraycopy(this.data, this.readPosition, buffer, offset, length2);
        this.readPosition += length2;
        this.remainingBytes -= length2;
        return length2;
    }
}
