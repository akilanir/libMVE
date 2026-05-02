package org.apache.commons.codec.binary;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: commons-codec-1.5.jar:org/apache/commons/codec/binary/BaseNCodecInputStream.class */
public class BaseNCodecInputStream extends FilterInputStream {
    private final boolean doEncode;
    private final BaseNCodec baseNCodec;
    private final byte[] singleByte;

    protected BaseNCodecInputStream(InputStream in, BaseNCodec baseNCodec, boolean doEncode) {
        super(in);
        this.singleByte = new byte[1];
        this.doEncode = doEncode;
        this.baseNCodec = baseNCodec;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        int r;
        int read = read(this.singleByte, 0, 1);
        while (true) {
            r = read;
            if (r != 0) {
                break;
            }
            read = read(this.singleByte, 0, 1);
        }
        if (r > 0) {
            return this.singleByte[0] < 0 ? 256 + this.singleByte[0] : this.singleByte[0];
        }
        return -1;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] b, int offset, int len) throws IOException {
        if (b == null) {
            throw new NullPointerException();
        }
        if (offset < 0 || len < 0) {
            throw new IndexOutOfBoundsException();
        }
        if (offset > b.length || offset + len > b.length) {
            throw new IndexOutOfBoundsException();
        }
        if (len == 0) {
            return 0;
        }
        int i = 0;
        while (true) {
            int readLen = i;
            if (readLen == 0) {
                if (!this.baseNCodec.hasData()) {
                    byte[] buf = new byte[this.doEncode ? 4096 : 8192];
                    int c = this.in.read(buf);
                    if (this.doEncode) {
                        this.baseNCodec.encode(buf, 0, c);
                    } else {
                        this.baseNCodec.decode(buf, 0, c);
                    }
                }
                i = this.baseNCodec.readResults(b, offset, len);
            } else {
                return readLen;
            }
        }
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public boolean markSupported() {
        return false;
    }
}
