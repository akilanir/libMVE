package com.sun.mail.util;

import com.sun.mail.iap.Response;
import java.io.EOFException;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/BASE64DecoderStream.class */
public class BASE64DecoderStream extends FilterInputStream {
    private byte[] buffer;
    private int bufsize;
    private int index;
    private byte[] input_buffer;
    private int input_pos;
    private int input_len;
    private boolean ignoreErrors;
    private static final char[] pem_array = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'};
    private static final byte[] pem_convert_array = new byte[256];

    public BASE64DecoderStream(InputStream in) {
        super(in);
        this.buffer = new byte[3];
        this.bufsize = 0;
        this.index = 0;
        this.input_buffer = new byte[8190];
        this.input_pos = 0;
        this.input_len = 0;
        this.ignoreErrors = false;
        this.ignoreErrors = PropUtil.getBooleanSystemProperty("mail.mime.base64.ignoreerrors", false);
    }

    public BASE64DecoderStream(InputStream in, boolean ignoreErrors) {
        super(in);
        this.buffer = new byte[3];
        this.bufsize = 0;
        this.index = 0;
        this.input_buffer = new byte[8190];
        this.input_pos = 0;
        this.input_len = 0;
        this.ignoreErrors = false;
        this.ignoreErrors = ignoreErrors;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        if (this.index >= this.bufsize) {
            this.bufsize = decode(this.buffer, 0, this.buffer.length);
            if (this.bufsize <= 0) {
                return -1;
            }
            this.index = 0;
        }
        byte[] bArr = this.buffer;
        int i = this.index;
        this.index = i + 1;
        return bArr[i] & 255;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] buf, int off, int len) throws IOException {
        int c;
        while (this.index < this.bufsize && len > 0) {
            int i = off;
            off++;
            byte[] bArr = this.buffer;
            int i2 = this.index;
            this.index = i2 + 1;
            buf[i] = bArr[i2];
            len--;
        }
        if (this.index >= this.bufsize) {
            this.index = 0;
            this.bufsize = 0;
        }
        int bsize = (len / 3) * 3;
        if (bsize > 0) {
            int size = decode(buf, off, bsize);
            off += size;
            len -= size;
            if (size != bsize) {
                if (off == off) {
                    return -1;
                }
                return off - off;
            }
        }
        while (len > 0 && (c = read()) != -1) {
            int i3 = off;
            off++;
            buf[i3] = (byte) c;
            len--;
        }
        if (off != off) {
            return off - off;
        }
        return -1;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public long skip(long n) throws IOException {
        long skipped;
        long j = 0;
        while (true) {
            skipped = j;
            long j2 = n;
            n = j2 - 1;
            if (j2 <= 0 || read() < 0) {
                break;
            }
            j = skipped + 1;
        }
        return skipped;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public boolean markSupported() {
        return false;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int available() throws IOException {
        return ((this.in.available() * 3) / 4) + (this.bufsize - this.index);
    }

    static {
        for (int i = 0; i < 255; i++) {
            pem_convert_array[i] = -1;
        }
        for (int i2 = 0; i2 < pem_array.length; i2++) {
            pem_convert_array[pem_array[i2]] = (byte) i2;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:61:0x0183, code lost:
    
        r6[r7 + 2] = (byte) (r11 & 255);
        r0 = r11 >> 8;
        r6[r7 + 1] = (byte) (r0 & 255);
        r6[r7] = (byte) ((r0 >> 8) & 255);
        r8 = r8 - 3;
        r7 = r7 + 3;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private int decode(byte[] r6, int r7, int r8) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 449
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.sun.mail.util.BASE64DecoderStream.decode(byte[], int, int):int");
    }

    private int getByte() throws IOException {
        byte b;
        do {
            if (this.input_pos >= this.input_len) {
                try {
                    this.input_len = this.in.read(this.input_buffer);
                    if (this.input_len <= 0) {
                        return -1;
                    }
                    this.input_pos = 0;
                } catch (EOFException e) {
                    return -1;
                }
            }
            byte[] bArr = this.input_buffer;
            int i = this.input_pos;
            this.input_pos = i + 1;
            int c = bArr[i] & 255;
            if (c == 61) {
                return -2;
            }
            b = pem_convert_array[c];
        } while (b == -1);
        return b;
    }

    private String recentChars() {
        String str;
        String errstr = "";
        int nc = this.input_pos > 10 ? 10 : this.input_pos;
        if (nc > 0) {
            String errstr2 = errstr + ", the " + nc + " most recent characters were: \"";
            for (int k = this.input_pos - nc; k < this.input_pos; k++) {
                char c = (char) (this.input_buffer[k] & 255);
                switch (c) {
                    case '\t':
                        str = errstr2 + "\\t";
                        break;
                    case '\n':
                        str = errstr2 + "\\n";
                        break;
                    case 11:
                    case Response.BAD /* 12 */:
                    default:
                        if (c >= ' ' && c < 127) {
                            str = errstr2 + c;
                            break;
                        } else {
                            str = errstr2 + "\\" + ((int) c);
                            break;
                        }
                        break;
                    case '\r':
                        str = errstr2 + "\\r";
                        break;
                }
                errstr2 = str;
            }
            errstr = errstr2 + "\"";
        }
        return errstr;
    }

    public static byte[] decode(byte[] inbuf) {
        int size = (inbuf.length / 4) * 3;
        if (size == 0) {
            return inbuf;
        }
        if (inbuf[inbuf.length - 1] == 61) {
            size--;
            if (inbuf[inbuf.length - 2] == 61) {
                size--;
            }
        }
        byte[] outbuf = new byte[size];
        int inpos = 0;
        int outpos = 0;
        for (int size2 = inbuf.length; size2 > 0; size2 -= 4) {
            int osize = 3;
            int i = inpos;
            int inpos2 = inpos + 1;
            inpos = inpos2 + 1;
            int val = ((pem_convert_array[inbuf[i] & 255] << 6) | pem_convert_array[inbuf[inpos2] & 255]) << 6;
            if (inbuf[inpos] != 61) {
                inpos++;
                val |= pem_convert_array[inbuf[inpos] & 255];
            } else {
                osize = 3 - 1;
            }
            int val2 = val << 6;
            if (inbuf[inpos] != 61) {
                int i2 = inpos;
                inpos++;
                val2 |= pem_convert_array[inbuf[i2] & 255];
            } else {
                osize--;
            }
            if (osize > 2) {
                outbuf[outpos + 2] = (byte) (val2 & 255);
            }
            int val3 = val2 >> 8;
            if (osize > 1) {
                outbuf[outpos + 1] = (byte) (val3 & 255);
            }
            outbuf[outpos] = (byte) ((val3 >> 8) & 255);
            outpos += osize;
        }
        return outbuf;
    }
}
