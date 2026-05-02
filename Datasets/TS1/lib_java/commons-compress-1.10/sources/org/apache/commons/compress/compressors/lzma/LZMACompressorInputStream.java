package org.apache.commons.compress.compressors.lzma;

import java.io.IOException;
import java.io.InputStream;
import org.apache.commons.compress.compressors.CompressorInputStream;
import org.tukaani.xz.LZMAInputStream;

/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/compressors/lzma/LZMACompressorInputStream.class */
public class LZMACompressorInputStream extends CompressorInputStream {
    private final InputStream in;

    public LZMACompressorInputStream(InputStream inputStream) throws IOException {
        this.in = new LZMAInputStream(inputStream);
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        int ret = this.in.read();
        count(ret == -1 ? 0 : 1);
        return ret;
    }

    @Override // java.io.InputStream
    public int read(byte[] buf, int off, int len) throws IOException {
        int ret = this.in.read(buf, off, len);
        count(ret);
        return ret;
    }

    @Override // java.io.InputStream
    public long skip(long n) throws IOException {
        return this.in.skip(n);
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        return this.in.available();
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.in.close();
    }

    public static boolean matches(byte[] signature, int length) {
        if (signature == null || length < 3 || signature[0] != 93 || signature[1] != 0 || signature[2] != 0) {
            return false;
        }
        return true;
    }
}
