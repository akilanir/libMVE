package com.bea.xml.stream.reader;

import java.io.CharConversionException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PushbackInputStream;
import java.io.Reader;
import java.util.Hashtable;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/reader/XmlReader.class */
public final class XmlReader extends Reader {
    private static final int MAXPUSHBACK = 512;
    private Reader in;
    private String assignedEncoding;
    private boolean closed;
    private static final Hashtable charsets = new Hashtable(31);

    public static Reader createReader(InputStream in) throws IOException {
        return new XmlReader(in);
    }

    public static Reader createReader(InputStream in, String encoding) throws IOException {
        if (encoding == null) {
            return new XmlReader(in);
        }
        if ("UTF-8".equalsIgnoreCase(encoding) || "UTF8".equalsIgnoreCase(encoding)) {
            return new Utf8Reader(in);
        }
        if ("US-ASCII".equalsIgnoreCase(encoding) || "ASCII".equalsIgnoreCase(encoding)) {
            return new AsciiReader(in);
        }
        if ("ISO-8859-1".equalsIgnoreCase(encoding)) {
            return new Iso8859_1Reader(in);
        }
        return new InputStreamReader(in, std2java(encoding));
    }

    static {
        charsets.put("UTF-16", "Unicode");
        charsets.put("ISO-10646-UCS-2", "Unicode");
        charsets.put("EBCDIC-CP-US", "cp037");
        charsets.put("EBCDIC-CP-CA", "cp037");
        charsets.put("EBCDIC-CP-NL", "cp037");
        charsets.put("EBCDIC-CP-WT", "cp037");
        charsets.put("EBCDIC-CP-DK", "cp277");
        charsets.put("EBCDIC-CP-NO", "cp277");
        charsets.put("EBCDIC-CP-FI", "cp278");
        charsets.put("EBCDIC-CP-SE", "cp278");
        charsets.put("EBCDIC-CP-IT", "cp280");
        charsets.put("EBCDIC-CP-ES", "cp284");
        charsets.put("EBCDIC-CP-GB", "cp285");
        charsets.put("EBCDIC-CP-FR", "cp297");
        charsets.put("EBCDIC-CP-AR1", "cp420");
        charsets.put("EBCDIC-CP-HE", "cp424");
        charsets.put("EBCDIC-CP-BE", "cp500");
        charsets.put("EBCDIC-CP-CH", "cp500");
        charsets.put("EBCDIC-CP-ROECE", "cp870");
        charsets.put("EBCDIC-CP-YU", "cp870");
        charsets.put("EBCDIC-CP-IS", "cp871");
        charsets.put("EBCDIC-CP-AR2", "cp918");
    }

    private static String std2java(String encoding) {
        String temp = (String) charsets.get(encoding.toUpperCase());
        return temp != null ? temp : encoding;
    }

    public String getEncoding() {
        return this.assignedEncoding;
    }

    private XmlReader(InputStream stream) throws IOException {
        super(stream);
        PushbackInputStream pb = new PushbackInputStream(stream, MAXPUSHBACK);
        byte[] buf = new byte[4];
        int len = pb.read(buf);
        if (len > 0) {
            pb.unread(buf, 0, len);
        }
        if (len == 4) {
            switch (buf[0] & 255) {
                case 0:
                    if (buf[1] == 60 && buf[2] == 0 && buf[3] == 63) {
                        setEncoding(pb, "UnicodeBig");
                        return;
                    }
                    break;
                case 60:
                    switch (buf[1] & 255) {
                        case 0:
                            if (buf[2] == 63 && buf[3] == 0) {
                                setEncoding(pb, "UnicodeLittle");
                                return;
                            }
                            break;
                        case 63:
                            if (buf[2] == 120 && buf[3] == 109) {
                                useEncodingDecl(pb, "UTF8");
                                return;
                            }
                            break;
                    }
                case 76:
                    if (buf[1] == 111 && (255 & buf[2]) == 167 && (255 & buf[3]) == 148) {
                        useEncodingDecl(pb, "CP037");
                        return;
                    }
                    break;
                case 254:
                    if ((buf[1] & 255) == 255) {
                        setEncoding(pb, "UTF-16");
                        return;
                    }
                    break;
                case 255:
                    if ((buf[1] & 255) == 254) {
                        setEncoding(pb, "UTF-16");
                        return;
                    }
                    break;
            }
        }
        setEncoding(pb, "UTF-8");
    }

    /* JADX WARN: Removed duplicated region for block: B:98:0x01f2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void useEncodingDecl(java.io.PushbackInputStream r9, java.lang.String r10) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 521
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bea.xml.stream.reader.XmlReader.useEncodingDecl(java.io.PushbackInputStream, java.lang.String):void");
    }

    private void setEncoding(InputStream stream, String encoding) throws IOException {
        this.assignedEncoding = encoding;
        this.in = createReader(stream, encoding);
    }

    @Override // java.io.Reader
    public int read(char[] buf, int off, int len) throws IOException {
        if (this.closed) {
            return -1;
        }
        int val = this.in.read(buf, off, len);
        if (val == -1) {
            close();
        }
        return val;
    }

    @Override // java.io.Reader
    public int read() throws IOException {
        if (this.closed) {
            throw new IOException("Stream closed");
        }
        int val = this.in.read();
        if (val == -1) {
            close();
        }
        return val;
    }

    @Override // java.io.Reader
    public boolean markSupported() {
        if (this.in == null) {
            return false;
        }
        return this.in.markSupported();
    }

    @Override // java.io.Reader
    public void mark(int value) throws IOException {
        if (this.in != null) {
            this.in.mark(value);
        }
    }

    @Override // java.io.Reader
    public void reset() throws IOException {
        if (this.in != null) {
            this.in.reset();
        }
    }

    @Override // java.io.Reader
    public long skip(long value) throws IOException {
        if (this.in == null) {
            return 0L;
        }
        return this.in.skip(value);
    }

    @Override // java.io.Reader
    public boolean ready() throws IOException {
        if (this.in == null) {
            return false;
        }
        return this.in.ready();
    }

    @Override // java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.closed) {
            return;
        }
        this.in.close();
        this.in = null;
        this.closed = true;
    }

    /* loaded from: stax-1.2.0.jar:com/bea/xml/stream/reader/XmlReader$BaseReader.class */
    public static abstract class BaseReader extends Reader {
        protected InputStream instream;
        protected byte[] buffer;
        protected int start;
        protected int finish;

        public abstract String getEncoding();

        BaseReader(InputStream stream) {
            super(stream);
            this.instream = stream;
            this.buffer = new byte[8192];
        }

        @Override // java.io.Reader
        public boolean ready() throws IOException {
            return this.instream == null || this.finish - this.start > 0 || this.instream.available() != 0;
        }

        @Override // java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            if (this.instream != null) {
                this.instream.close();
                this.finish = 0;
                this.start = 0;
                this.buffer = null;
                this.instream = null;
            }
        }
    }

    /* loaded from: stax-1.2.0.jar:com/bea/xml/stream/reader/XmlReader$Utf8Reader.class */
    static final class Utf8Reader extends BaseReader {
        private char nextChar;

        Utf8Reader(InputStream stream) {
            super(stream);
        }

        @Override // com.bea.xml.stream.reader.XmlReader.BaseReader
        public String getEncoding() {
            return "UTF-8";
        }

        /* JADX WARN: Code restructure failed: missing block: B:71:0x0304, code lost:
        
            if (r11 <= 0) goto L74;
         */
        /* JADX WARN: Code restructure failed: missing block: B:73:0x0309, code lost:
        
            return r11;
         */
        /* JADX WARN: Code restructure failed: missing block: B:75:0x030d, code lost:
        
            if (r12 != (-1)) goto L77;
         */
        /* JADX WARN: Code restructure failed: missing block: B:76:0x0310, code lost:
        
            return -1;
         */
        /* JADX WARN: Code restructure failed: missing block: B:77:0x0314, code lost:
        
            return 0;
         */
        @Override // java.io.Reader
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public int read(char[] r8, int r9, int r10) throws java.io.IOException {
            /*
                Method dump skipped, instructions count: 790
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.bea.xml.stream.reader.XmlReader.Utf8Reader.read(char[], int, int):int");
        }
    }

    /* loaded from: stax-1.2.0.jar:com/bea/xml/stream/reader/XmlReader$AsciiReader.class */
    static final class AsciiReader extends BaseReader {
        AsciiReader(InputStream in) {
            super(in);
        }

        @Override // com.bea.xml.stream.reader.XmlReader.BaseReader
        public String getEncoding() {
            return "US-ASCII";
        }

        @Override // java.io.Reader
        public int read(char[] buf, int offset, int len) throws IOException {
            if (this.instream == null) {
                return -1;
            }
            if (offset + len > buf.length || offset < 0) {
                throw new ArrayIndexOutOfBoundsException();
            }
            int avail = this.finish - this.start;
            if (avail < 1) {
                this.start = 0;
                this.finish = this.instream.read(this.buffer, 0, this.buffer.length);
                if (this.finish <= 0) {
                    close();
                    return -1;
                }
                if (len > this.finish) {
                    len = this.finish;
                }
            } else if (len > avail) {
                len = avail;
            }
            for (int i = 0; i < len; i++) {
                byte[] bArr = this.buffer;
                int i2 = this.start;
                this.start = i2 + 1;
                byte b = bArr[i2];
                if (b < 0) {
                    throw new CharConversionException(new StringBuffer().append("Illegal ASCII character, 0x").append(Integer.toHexString(b & 255)).toString());
                }
                buf[offset + i] = (char) b;
            }
            return len;
        }
    }

    /* loaded from: stax-1.2.0.jar:com/bea/xml/stream/reader/XmlReader$Iso8859_1Reader.class */
    static final class Iso8859_1Reader extends BaseReader {
        Iso8859_1Reader(InputStream in) {
            super(in);
        }

        @Override // com.bea.xml.stream.reader.XmlReader.BaseReader
        public String getEncoding() {
            return "ISO-8859-1";
        }

        @Override // java.io.Reader
        public int read(char[] buf, int offset, int len) throws IOException {
            if (this.instream == null) {
                return -1;
            }
            if (offset + len > buf.length || offset < 0) {
                throw new ArrayIndexOutOfBoundsException();
            }
            int avail = this.finish - this.start;
            if (avail < 1) {
                this.start = 0;
                this.finish = this.instream.read(this.buffer, 0, this.buffer.length);
                if (this.finish <= 0) {
                    close();
                    return -1;
                }
                if (len > this.finish) {
                    len = this.finish;
                }
            } else if (len > avail) {
                len = avail;
            }
            for (int i = 0; i < len; i++) {
                byte[] bArr = this.buffer;
                int i2 = this.start;
                this.start = i2 + 1;
                buf[offset + i] = (char) (bArr[i2] & 255);
            }
            return len;
        }
    }
}
