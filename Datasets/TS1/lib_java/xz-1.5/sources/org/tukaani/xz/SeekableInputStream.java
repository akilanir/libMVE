package org.tukaani.xz;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: xz-1.5.jar:org/tukaani/xz/SeekableInputStream.class */
public abstract class SeekableInputStream extends InputStream {
    @Override // java.io.InputStream
    public long skip(long j) throws IOException {
        if (j <= 0) {
            return 0L;
        }
        long length = length();
        long position = position();
        if (position >= length) {
            return 0L;
        }
        if (length - position < j) {
            j = length - position;
        }
        seek(position + j);
        return j;
    }

    public abstract long length() throws IOException;

    public abstract long position() throws IOException;

    public abstract void seek(long j) throws IOException;
}
