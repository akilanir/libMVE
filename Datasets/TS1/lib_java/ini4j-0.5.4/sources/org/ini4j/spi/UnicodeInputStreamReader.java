package org.ini4j.spi;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PushbackInputStream;
import java.io.Reader;
import java.nio.charset.Charset;

/* loaded from: ini4j-0.5.4.jar:org/ini4j/spi/UnicodeInputStreamReader.class */
class UnicodeInputStreamReader extends Reader {
    private static final int BOM_SIZE = 4;
    private final Charset _defaultEncoding;
    private InputStreamReader _reader;
    private final PushbackInputStream _stream;

    /* loaded from: ini4j-0.5.4.jar:org/ini4j/spi/UnicodeInputStreamReader$Bom.class */
    private enum Bom {
        UTF32BE("UTF-32BE", new byte[]{0, 0, -2, -1}),
        UTF32LE("UTF-32LE", new byte[]{-1, -2, 0, 0}),
        UTF16BE("UTF-16BE", new byte[]{-2, -1}),
        UTF16LE("UTF-16LE", new byte[]{-1, -2}),
        UTF8("UTF-8", new byte[]{-17, -69, -65});

        private final byte[] _bytes;
        private Charset _charset;

        Bom(String charsetName, byte[] bytes) {
            try {
                this._charset = Charset.forName(charsetName);
            } catch (Exception e) {
                this._charset = null;
            }
            this._bytes = bytes;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static Bom find(byte[] data) {
            Bom ret = null;
            Bom[] arr$ = values();
            int len$ = arr$.length;
            int i$ = 0;
            while (true) {
                if (i$ >= len$) {
                    break;
                }
                Bom bom = arr$[i$];
                if (!bom.supported() || !bom.match(data)) {
                    i$++;
                } else {
                    ret = bom;
                    break;
                }
            }
            return ret;
        }

        private boolean match(byte[] data) {
            boolean ok = true;
            int i = 0;
            while (true) {
                if (i >= this._bytes.length) {
                    break;
                }
                if (data[i] == this._bytes[i]) {
                    i++;
                } else {
                    ok = false;
                    break;
                }
            }
            return ok;
        }

        private boolean supported() {
            return this._charset != null;
        }
    }

    UnicodeInputStreamReader(InputStream in, Charset defaultEnc) {
        this._stream = new PushbackInputStream(in, BOM_SIZE);
        this._defaultEncoding = defaultEnc;
    }

    @Override // java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        init();
        this._reader.close();
    }

    @Override // java.io.Reader
    public int read(char[] cbuf, int off, int len) throws IOException {
        init();
        return this._reader.read(cbuf, off, len);
    }

    protected void init() throws IOException {
        Charset encoding;
        int unread;
        if (this._reader != null) {
            return;
        }
        byte[] data = new byte[BOM_SIZE];
        int n = this._stream.read(data, 0, data.length);
        Bom bom = Bom.find(data);
        if (bom != null) {
            encoding = bom._charset;
            unread = data.length - bom._bytes.length;
        } else {
            encoding = this._defaultEncoding;
            unread = n;
        }
        if (unread > 0) {
            this._stream.unread(data, n - unread, unread);
        }
        this._reader = new InputStreamReader(this._stream, encoding);
    }
}
