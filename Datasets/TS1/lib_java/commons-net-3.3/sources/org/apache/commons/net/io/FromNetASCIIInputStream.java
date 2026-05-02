package org.apache.commons.net.io;

import java.io.IOException;
import java.io.InputStream;
import java.io.PushbackInputStream;
import java.io.UnsupportedEncodingException;
import org.apache.commons.net.SocketClient;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/io/FromNetASCIIInputStream.class */
public final class FromNetASCIIInputStream extends PushbackInputStream {
    static final byte[] _lineSeparatorBytes;
    private int __length;
    static final String _lineSeparator = System.getProperty("line.separator");
    static final boolean _noConversionRequired = _lineSeparator.equals(SocketClient.NETASCII_EOL);

    static {
        try {
            _lineSeparatorBytes = _lineSeparator.getBytes("US-ASCII");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("Broken JVM - cannot find US-ASCII charset!", e);
        }
    }

    public static final boolean isConversionRequired() {
        return !_noConversionRequired;
    }

    public FromNetASCIIInputStream(InputStream input) {
        super(input, _lineSeparatorBytes.length + 1);
        this.__length = 0;
    }

    private int __read() throws IOException {
        int ch = super.read();
        if (ch == 13) {
            int ch2 = super.read();
            if (ch2 == 10) {
                unread(_lineSeparatorBytes);
                ch = super.read();
                this.__length--;
            } else {
                if (ch2 != -1) {
                    unread(ch2);
                    return 13;
                }
                return 13;
            }
        }
        return ch;
    }

    @Override // java.io.PushbackInputStream, java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        if (_noConversionRequired) {
            return super.read();
        }
        return __read();
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] buffer) throws IOException {
        return read(buffer, 0, buffer.length);
    }

    @Override // java.io.PushbackInputStream, java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] buffer, int offset, int length) throws IOException {
        int __read;
        if (_noConversionRequired) {
            return super.read(buffer, offset, length);
        }
        if (length < 1) {
            return 0;
        }
        int ch = available();
        this.__length = length > ch ? ch : length;
        if (this.__length < 1) {
            this.__length = 1;
        }
        int __read2 = __read();
        int ch2 = __read2;
        if (__read2 == -1) {
            return -1;
        }
        do {
            int i = offset;
            offset++;
            buffer[i] = (byte) ch2;
            int i2 = this.__length - 1;
            this.__length = i2;
            if (i2 <= 0) {
                break;
            }
            __read = __read();
            ch2 = __read;
        } while (__read != -1);
        return offset - offset;
    }

    @Override // java.io.PushbackInputStream, java.io.FilterInputStream, java.io.InputStream
    public int available() throws IOException {
        if (this.in == null) {
            throw new IOException("Stream closed");
        }
        return (this.buf.length - this.pos) + this.in.available();
    }
}
