package com.nostra13.universalimageloader.core.assist;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/core/assist/FlushedInputStream.class */
public class FlushedInputStream extends FilterInputStream {
    public FlushedInputStream(InputStream inputStream) {
        super(inputStream);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public long skip(long n) throws IOException {
        long totalBytesSkipped;
        long j = 0;
        while (true) {
            totalBytesSkipped = j;
            if (totalBytesSkipped >= n) {
                break;
            }
            long bytesSkipped = this.in.skip(n - totalBytesSkipped);
            if (bytesSkipped == 0) {
                int by_te = read();
                if (by_te < 0) {
                    break;
                }
                bytesSkipped = 1;
            }
            j = totalBytesSkipped + bytesSkipped;
        }
        return totalBytesSkipped;
    }
}
