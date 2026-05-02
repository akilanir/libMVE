package com.fasterxml.jackson.core.json;

import com.fasterxml.jackson.core.JsonEncoding;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonTokenId;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.format.InputAccessor;
import com.fasterxml.jackson.core.format.MatchStrength;
import com.fasterxml.jackson.core.io.IOContext;
import com.fasterxml.jackson.core.io.MergedStream;
import com.fasterxml.jackson.core.io.UTF32Reader;
import com.fasterxml.jackson.core.sym.BytesToNameCanonicalizer;
import com.fasterxml.jackson.core.sym.CharsToNameCanonicalizer;
import java.io.ByteArrayInputStream;
import java.io.CharConversionException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;

/* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper.class */
public final class ByteSourceJsonBootstrapper {
    static final byte UTF8_BOM_1 = -17;
    static final byte UTF8_BOM_2 = -69;
    static final byte UTF8_BOM_3 = -65;
    protected final IOContext _context;
    protected final InputStream _in;
    protected final byte[] _inputBuffer;
    private int _inputPtr;
    private int _inputEnd;
    private final boolean _bufferRecyclable;
    protected int _inputProcessed;
    protected boolean _bigEndian;
    protected int _bytesPerChar;

    public ByteSourceJsonBootstrapper(IOContext iOContext, InputStream inputStream) {
        this._bigEndian = true;
        this._bytesPerChar = 0;
        this._context = iOContext;
        this._in = inputStream;
        this._inputBuffer = iOContext.allocReadIOBuffer();
        this._inputPtr = 0;
        this._inputEnd = 0;
        this._inputProcessed = 0;
        this._bufferRecyclable = true;
    }

    public ByteSourceJsonBootstrapper(IOContext iOContext, byte[] bArr, int i, int i2) {
        this._bigEndian = true;
        this._bytesPerChar = 0;
        this._context = iOContext;
        this._in = null;
        this._inputBuffer = bArr;
        this._inputPtr = i;
        this._inputEnd = i + i2;
        this._inputProcessed = -i;
        this._bufferRecyclable = false;
    }

    public JsonEncoding detectEncoding() throws IOException, JsonParseException {
        JsonEncoding jsonEncoding;
        boolean z = false;
        if (ensureLoaded(4)) {
            int i = (this._inputBuffer[this._inputPtr] << 24) | ((this._inputBuffer[this._inputPtr + 1] & 255) << 16) | ((this._inputBuffer[this._inputPtr + 2] & 255) << 8) | (this._inputBuffer[this._inputPtr + 3] & 255);
            if (handleBOM(i) || checkUTF32(i) || checkUTF16(i >>> 16)) {
                z = true;
            }
        } else if (ensureLoaded(2) && checkUTF16(((this._inputBuffer[this._inputPtr] & 255) << 8) | (this._inputBuffer[this._inputPtr + 1] & 255))) {
            z = true;
        }
        if (!z) {
            jsonEncoding = JsonEncoding.UTF8;
        } else {
            switch (this._bytesPerChar) {
                case 1:
                    jsonEncoding = JsonEncoding.UTF8;
                    break;
                case 2:
                    jsonEncoding = this._bigEndian ? JsonEncoding.UTF16_BE : JsonEncoding.UTF16_LE;
                    break;
                case 3:
                default:
                    throw new RuntimeException("Internal error");
                case 4:
                    jsonEncoding = this._bigEndian ? JsonEncoding.UTF32_BE : JsonEncoding.UTF32_LE;
                    break;
            }
        }
        this._context.setEncoding(jsonEncoding);
        return jsonEncoding;
    }

    public Reader constructReader() throws IOException {
        JsonEncoding encoding = this._context.getEncoding();
        switch (encoding.bits()) {
            case JsonTokenId.ID_NUMBER_FLOAT /* 8 */:
            case 16:
                InputStream inputStream = this._in;
                if (inputStream == null) {
                    inputStream = new ByteArrayInputStream(this._inputBuffer, this._inputPtr, this._inputEnd);
                } else if (this._inputPtr < this._inputEnd) {
                    inputStream = new MergedStream(this._context, inputStream, this._inputBuffer, this._inputPtr, this._inputEnd);
                }
                return new InputStreamReader(inputStream, encoding.getJavaName());
            case 32:
                return new UTF32Reader(this._context, this._in, this._inputBuffer, this._inputPtr, this._inputEnd, this._context.getEncoding().isBigEndian());
            default:
                throw new RuntimeException("Internal error");
        }
    }

    public JsonParser constructParser(int i, ObjectCodec objectCodec, BytesToNameCanonicalizer bytesToNameCanonicalizer, CharsToNameCanonicalizer charsToNameCanonicalizer, boolean z, boolean z2) throws IOException {
        if (detectEncoding() == JsonEncoding.UTF8 && z) {
            return new UTF8StreamJsonParser(this._context, i, this._in, objectCodec, bytesToNameCanonicalizer.makeChild(z, z2), this._inputBuffer, this._inputPtr, this._inputEnd, this._bufferRecyclable);
        }
        return new ReaderBasedJsonParser(this._context, i, constructReader(), objectCodec, charsToNameCanonicalizer.makeChild(z, z2));
    }

    public static MatchStrength hasJSONFormat(InputAccessor inputAccessor) throws IOException {
        if (!inputAccessor.hasMoreBytes()) {
            return MatchStrength.INCONCLUSIVE;
        }
        byte nextByte = inputAccessor.nextByte();
        if (nextByte == UTF8_BOM_1) {
            if (!inputAccessor.hasMoreBytes()) {
                return MatchStrength.INCONCLUSIVE;
            }
            if (inputAccessor.nextByte() != UTF8_BOM_2) {
                return MatchStrength.NO_MATCH;
            }
            if (!inputAccessor.hasMoreBytes()) {
                return MatchStrength.INCONCLUSIVE;
            }
            if (inputAccessor.nextByte() != UTF8_BOM_3) {
                return MatchStrength.NO_MATCH;
            }
            if (!inputAccessor.hasMoreBytes()) {
                return MatchStrength.INCONCLUSIVE;
            }
            nextByte = inputAccessor.nextByte();
        }
        int skipSpace = skipSpace(inputAccessor, nextByte);
        if (skipSpace < 0) {
            return MatchStrength.INCONCLUSIVE;
        }
        if (skipSpace == 123) {
            int skipSpace2 = skipSpace(inputAccessor);
            if (skipSpace2 < 0) {
                return MatchStrength.INCONCLUSIVE;
            }
            if (skipSpace2 == 34 || skipSpace2 == 125) {
                return MatchStrength.SOLID_MATCH;
            }
            return MatchStrength.NO_MATCH;
        }
        if (skipSpace == 91) {
            int skipSpace3 = skipSpace(inputAccessor);
            if (skipSpace3 < 0) {
                return MatchStrength.INCONCLUSIVE;
            }
            if (skipSpace3 == 93 || skipSpace3 == 91) {
                return MatchStrength.SOLID_MATCH;
            }
            return MatchStrength.SOLID_MATCH;
        }
        MatchStrength matchStrength = MatchStrength.WEAK_MATCH;
        if (skipSpace == 34) {
            return matchStrength;
        }
        if (skipSpace <= 57 && skipSpace >= 48) {
            return matchStrength;
        }
        if (skipSpace == 45) {
            int skipSpace4 = skipSpace(inputAccessor);
            if (skipSpace4 < 0) {
                return MatchStrength.INCONCLUSIVE;
            }
            return (skipSpace4 > 57 || skipSpace4 < 48) ? MatchStrength.NO_MATCH : matchStrength;
        }
        if (skipSpace == 110) {
            return tryMatch(inputAccessor, "ull", matchStrength);
        }
        if (skipSpace == 116) {
            return tryMatch(inputAccessor, "rue", matchStrength);
        }
        if (skipSpace == 102) {
            return tryMatch(inputAccessor, "alse", matchStrength);
        }
        return MatchStrength.NO_MATCH;
    }

    private static MatchStrength tryMatch(InputAccessor inputAccessor, String str, MatchStrength matchStrength) throws IOException {
        int length = str.length();
        for (int i = 0; i < length; i++) {
            if (!inputAccessor.hasMoreBytes()) {
                return MatchStrength.INCONCLUSIVE;
            }
            if (inputAccessor.nextByte() != str.charAt(i)) {
                return MatchStrength.NO_MATCH;
            }
        }
        return matchStrength;
    }

    private static int skipSpace(InputAccessor inputAccessor) throws IOException {
        if (!inputAccessor.hasMoreBytes()) {
            return -1;
        }
        return skipSpace(inputAccessor, inputAccessor.nextByte());
    }

    private static int skipSpace(InputAccessor inputAccessor, byte b) throws IOException {
        while (true) {
            int i = b & 255;
            if (i != 32 && i != 13 && i != 10 && i != 9) {
                return i;
            }
            if (!inputAccessor.hasMoreBytes()) {
                return -1;
            }
            b = inputAccessor.nextByte();
            int i2 = b & 255;
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:12:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0085  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private boolean handleBOM(int r5) throws java.io.IOException {
        /*
            r4 = this;
            r0 = r5
            switch(r0) {
                case -16842752: goto L5e;
                case -131072: goto L42;
                case 65279: goto L2c;
                case 65534: goto L58;
                default: goto L64;
            }
        L2c:
            r0 = r4
            r1 = 1
            r0._bigEndian = r1
            r0 = r4
            r1 = r0
            int r1 = r1._inputPtr
            r2 = 4
            int r1 = r1 + r2
            r0._inputPtr = r1
            r0 = r4
            r1 = 4
            r0._bytesPerChar = r1
            r0 = 1
            return r0
        L42:
            r0 = r4
            r1 = r0
            int r1 = r1._inputPtr
            r2 = 4
            int r1 = r1 + r2
            r0._inputPtr = r1
            r0 = r4
            r1 = 4
            r0._bytesPerChar = r1
            r0 = r4
            r1 = 0
            r0._bigEndian = r1
            r0 = 1
            return r0
        L58:
            r0 = r4
            java.lang.String r1 = "2143"
            r0.reportWeirdUCS4(r1)
        L5e:
            r0 = r4
            java.lang.String r1 = "3412"
            r0.reportWeirdUCS4(r1)
        L64:
            r0 = r5
            r1 = 16
            int r0 = r0 >>> r1
            r6 = r0
            r0 = r6
            r1 = 65279(0xfeff, float:9.1475E-41)
            if (r0 != r1) goto L85
            r0 = r4
            r1 = r0
            int r1 = r1._inputPtr
            r2 = 2
            int r1 = r1 + r2
            r0._inputPtr = r1
            r0 = r4
            r1 = 2
            r0._bytesPerChar = r1
            r0 = r4
            r1 = 1
            r0._bigEndian = r1
            r0 = 1
            return r0
        L85:
            r0 = r6
            r1 = 65534(0xfffe, float:9.1833E-41)
            if (r0 != r1) goto La1
            r0 = r4
            r1 = r0
            int r1 = r1._inputPtr
            r2 = 2
            int r1 = r1 + r2
            r0._inputPtr = r1
            r0 = r4
            r1 = 2
            r0._bytesPerChar = r1
            r0 = r4
            r1 = 0
            r0._bigEndian = r1
            r0 = 1
            return r0
        La1:
            r0 = r5
            r1 = 8
            int r0 = r0 >>> r1
            r1 = 15711167(0xefbbbf, float:2.2016034E-38)
            if (r0 != r1) goto Lc0
            r0 = r4
            r1 = r0
            int r1 = r1._inputPtr
            r2 = 3
            int r1 = r1 + r2
            r0._inputPtr = r1
            r0 = r4
            r1 = 1
            r0._bytesPerChar = r1
            r0 = r4
            r1 = 1
            r0._bigEndian = r1
            r0 = 1
            return r0
        Lc0:
            r0 = 0
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.ByteSourceJsonBootstrapper.handleBOM(int):boolean");
    }

    private boolean checkUTF32(int i) throws IOException {
        if ((i >> 8) == 0) {
            this._bigEndian = true;
        } else if ((i & 16777215) == 0) {
            this._bigEndian = false;
        } else if ((i & (-16711681)) == 0) {
            reportWeirdUCS4("3412");
        } else if ((i & (-65281)) == 0) {
            reportWeirdUCS4("2143");
        } else {
            return false;
        }
        this._bytesPerChar = 4;
        return true;
    }

    private boolean checkUTF16(int i) {
        if ((i & 65280) == 0) {
            this._bigEndian = true;
        } else if ((i & 255) == 0) {
            this._bigEndian = false;
        } else {
            return false;
        }
        this._bytesPerChar = 2;
        return true;
    }

    private void reportWeirdUCS4(String str) throws IOException {
        throw new CharConversionException("Unsupported UCS-4 endianness (" + str + ") detected");
    }

    protected boolean ensureLoaded(int i) throws IOException {
        int read;
        int i2 = this._inputEnd - this._inputPtr;
        while (true) {
            int i3 = i2;
            if (i3 < i) {
                if (this._in == null) {
                    read = -1;
                } else {
                    read = this._in.read(this._inputBuffer, this._inputEnd, this._inputBuffer.length - this._inputEnd);
                }
                if (read < 1) {
                    return false;
                }
                this._inputEnd += read;
                i2 = i3 + read;
            } else {
                return true;
            }
        }
    }
}
