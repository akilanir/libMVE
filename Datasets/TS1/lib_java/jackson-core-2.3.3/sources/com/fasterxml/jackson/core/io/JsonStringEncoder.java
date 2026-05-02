package com.fasterxml.jackson.core.io;

import com.fasterxml.jackson.core.util.BufferRecycler;
import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import com.fasterxml.jackson.core.util.TextBuffer;
import java.lang.ref.SoftReference;

/* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/io/JsonStringEncoder.class */
public final class JsonStringEncoder {
    private static final int SURR1_FIRST = 55296;
    private static final int SURR1_LAST = 56319;
    private static final int SURR2_FIRST = 56320;
    private static final int SURR2_LAST = 57343;
    private static final int INT_BACKSLASH = 92;
    private static final int INT_U = 117;
    private static final int INT_0 = 48;
    protected TextBuffer _textBuffer;
    protected ByteArrayBuilder _byteBuilder;
    protected final char[] _quoteBuffer = new char[6];
    private static final char[] HEX_CHARS = CharTypes.copyHexChars();
    private static final byte[] HEX_BYTES = CharTypes.copyHexBytes();
    protected static final ThreadLocal<SoftReference<JsonStringEncoder>> _threadEncoder = new ThreadLocal<>();

    public JsonStringEncoder() {
        this._quoteBuffer[0] = '\\';
        this._quoteBuffer[2] = '0';
        this._quoteBuffer[3] = '0';
    }

    public static JsonStringEncoder getInstance() {
        SoftReference<JsonStringEncoder> softReference = _threadEncoder.get();
        JsonStringEncoder jsonStringEncoder = softReference == null ? null : softReference.get();
        if (jsonStringEncoder == null) {
            jsonStringEncoder = new JsonStringEncoder();
            _threadEncoder.set(new SoftReference<>(jsonStringEncoder));
        }
        return jsonStringEncoder;
    }

    public char[] quoteAsString(String str) {
        int i;
        TextBuffer textBuffer = this._textBuffer;
        if (textBuffer == null) {
            TextBuffer textBuffer2 = new TextBuffer(null);
            textBuffer = textBuffer2;
            this._textBuffer = textBuffer2;
        }
        char[] emptyAndGetCurrentSegment = textBuffer.emptyAndGetCurrentSegment();
        int[] iArr = CharTypes.get7BitOutputEscapes();
        int length = iArr.length;
        int i2 = 0;
        int length2 = str.length();
        int i3 = 0;
        loop0: while (true) {
            i = i3;
            if (i2 >= length2) {
                break;
            }
            do {
                char charAt = str.charAt(i2);
                if (charAt >= length || iArr[charAt] == 0) {
                    if (i >= emptyAndGetCurrentSegment.length) {
                        emptyAndGetCurrentSegment = textBuffer.finishCurrentSegment();
                        i = 0;
                    }
                    int i4 = i;
                    i++;
                    emptyAndGetCurrentSegment[i4] = charAt;
                    i2++;
                } else {
                    int i5 = i2;
                    i2++;
                    char charAt2 = str.charAt(i5);
                    int i6 = iArr[charAt2];
                    int _appendNumericEscape = i6 < 0 ? _appendNumericEscape(charAt2, this._quoteBuffer) : _appendNamedEscape(i6, this._quoteBuffer);
                    if (i + _appendNumericEscape > emptyAndGetCurrentSegment.length) {
                        int length3 = emptyAndGetCurrentSegment.length - i;
                        if (length3 > 0) {
                            System.arraycopy(this._quoteBuffer, 0, emptyAndGetCurrentSegment, i, length3);
                        }
                        emptyAndGetCurrentSegment = textBuffer.finishCurrentSegment();
                        int i7 = _appendNumericEscape - length3;
                        System.arraycopy(this._quoteBuffer, length3, emptyAndGetCurrentSegment, 0, i7);
                        i3 = i7;
                    } else {
                        System.arraycopy(this._quoteBuffer, 0, emptyAndGetCurrentSegment, i, _appendNumericEscape);
                        i3 = i + _appendNumericEscape;
                    }
                }
            } while (i2 < length2);
        }
        textBuffer.setCurrentLength(i);
        return textBuffer.contentsAsArray();
    }

    public byte[] quoteAsUTF8(String str) {
        int i;
        int i2;
        ByteArrayBuilder byteArrayBuilder = this._byteBuilder;
        if (byteArrayBuilder == null) {
            ByteArrayBuilder byteArrayBuilder2 = new ByteArrayBuilder((BufferRecycler) null);
            byteArrayBuilder = byteArrayBuilder2;
            this._byteBuilder = byteArrayBuilder2;
        }
        int i3 = 0;
        int length = str.length();
        int i4 = 0;
        byte[] resetAndGetFirstSegment = byteArrayBuilder.resetAndGetFirstSegment();
        loop0: while (i3 < length) {
            int[] iArr = CharTypes.get7BitOutputEscapes();
            do {
                char charAt = str.charAt(i3);
                if (charAt <= 127 && iArr[charAt] == 0) {
                    if (i4 >= resetAndGetFirstSegment.length) {
                        resetAndGetFirstSegment = byteArrayBuilder.finishCurrentSegment();
                        i4 = 0;
                    }
                    int i5 = i4;
                    i4++;
                    resetAndGetFirstSegment[i5] = (byte) charAt;
                    i3++;
                } else {
                    if (i4 >= resetAndGetFirstSegment.length) {
                        resetAndGetFirstSegment = byteArrayBuilder.finishCurrentSegment();
                        i4 = 0;
                    }
                    int i6 = i3;
                    i3++;
                    char charAt2 = str.charAt(i6);
                    if (charAt2 <= 127) {
                        i4 = _appendByteEscape(charAt2, iArr[charAt2], byteArrayBuilder, i4);
                        resetAndGetFirstSegment = byteArrayBuilder.getCurrentSegment();
                    } else {
                        if (charAt2 <= 2047) {
                            int i7 = i4;
                            i = i4 + 1;
                            resetAndGetFirstSegment[i7] = (byte) (192 | (charAt2 >> 6));
                            i2 = 128 | (charAt2 & '?');
                        } else if (charAt2 < SURR1_FIRST || charAt2 > SURR2_LAST) {
                            int i8 = i4;
                            int i9 = i4 + 1;
                            resetAndGetFirstSegment[i8] = (byte) (224 | (charAt2 >> '\f'));
                            if (i9 >= resetAndGetFirstSegment.length) {
                                resetAndGetFirstSegment = byteArrayBuilder.finishCurrentSegment();
                                i9 = 0;
                            }
                            int i10 = i9;
                            i = i9 + 1;
                            resetAndGetFirstSegment[i10] = (byte) (128 | ((charAt2 >> 6) & 63));
                            i2 = 128 | (charAt2 & '?');
                        } else {
                            if (charAt2 > SURR1_LAST) {
                                _illegalSurrogate(charAt2);
                            }
                            if (i3 >= length) {
                                _illegalSurrogate(charAt2);
                            }
                            i3++;
                            int _convertSurrogate = _convertSurrogate(charAt2, str.charAt(i3));
                            if (_convertSurrogate > 1114111) {
                                _illegalSurrogate(_convertSurrogate);
                            }
                            int i11 = i4;
                            int i12 = i4 + 1;
                            resetAndGetFirstSegment[i11] = (byte) (240 | (_convertSurrogate >> 18));
                            if (i12 >= resetAndGetFirstSegment.length) {
                                resetAndGetFirstSegment = byteArrayBuilder.finishCurrentSegment();
                                i12 = 0;
                            }
                            int i13 = i12;
                            int i14 = i12 + 1;
                            resetAndGetFirstSegment[i13] = (byte) (128 | ((_convertSurrogate >> 12) & 63));
                            if (i14 >= resetAndGetFirstSegment.length) {
                                resetAndGetFirstSegment = byteArrayBuilder.finishCurrentSegment();
                                i14 = 0;
                            }
                            int i15 = i14;
                            i = i14 + 1;
                            resetAndGetFirstSegment[i15] = (byte) (128 | ((_convertSurrogate >> 6) & 63));
                            i2 = 128 | (_convertSurrogate & 63);
                        }
                        if (i >= resetAndGetFirstSegment.length) {
                            resetAndGetFirstSegment = byteArrayBuilder.finishCurrentSegment();
                            i = 0;
                        }
                        int i16 = i;
                        i4 = i + 1;
                        resetAndGetFirstSegment[i16] = (byte) i2;
                    }
                }
            } while (i3 < length);
        }
        return this._byteBuilder.completeAndCoalesce(i4);
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x007e, code lost:
    
        if (r11 < r13) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0081, code lost:
    
        r12 = r8.finishCurrentSegment();
        r13 = r12.length;
        r11 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0094, code lost:
    
        if (r14 >= 2048) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0097, code lost:
    
        r1 = r11;
        r11 = r11 + 1;
        r12[r1] = (byte) (192 | (r14 >> 6));
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x00b0, code lost:
    
        if (r14 < com.fasterxml.jackson.core.io.JsonStringEncoder.SURR1_FIRST) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x00b7, code lost:
    
        if (r14 <= com.fasterxml.jackson.core.io.JsonStringEncoder.SURR2_LAST) goto L32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x00ba, code lost:
    
        r1 = r11;
        r11 = r11 + 1;
        r12[r1] = (byte) (224 | (r14 >> '\f'));
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x00d0, code lost:
    
        if (r11 < r13) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x00d3, code lost:
    
        r12 = r8.finishCurrentSegment();
        r13 = r12.length;
        r11 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x00e1, code lost:
    
        r1 = r11;
        r11 = r11 + 1;
        r12[r1] = (byte) (128 | ((r14 >> 6) & 63));
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x00fd, code lost:
    
        if (r14 <= com.fasterxml.jackson.core.io.JsonStringEncoder.SURR1_LAST) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x0100, code lost:
    
        _illegalSurrogate(r14);
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x0108, code lost:
    
        if (r9 < r0) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x010b, code lost:
    
        _illegalSurrogate(r14);
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0110, code lost:
    
        r2 = r9;
        r9 = r9 + 1;
        r14 = _convertSurrogate(r14, r7.charAt(r2));
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x0123, code lost:
    
        if (r14 <= 65535) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0126, code lost:
    
        _illegalSurrogate(r14);
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x012b, code lost:
    
        r1 = r11;
        r11 = r11 + 1;
        r12[r1] = (byte) (240 | (r14 >> 18));
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x0141, code lost:
    
        if (r11 < r13) goto L44;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x0144, code lost:
    
        r12 = r8.finishCurrentSegment();
        r13 = r12.length;
        r11 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0152, code lost:
    
        r1 = r11;
        r11 = r11 + 1;
        r12[r1] = (byte) (128 | ((r14 >> '\f') & 63));
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x016b, code lost:
    
        if (r11 < r13) goto L47;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x016e, code lost:
    
        r12 = r8.finishCurrentSegment();
        r13 = r12.length;
        r11 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x017c, code lost:
    
        r1 = r11;
        r11 = r11 + 1;
        r12[r1] = (byte) (128 | ((r14 >> 6) & 63));
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0195, code lost:
    
        if (r11 < r13) goto L57;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x0198, code lost:
    
        r12 = r8.finishCurrentSegment();
        r13 = r12.length;
        r11 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x01a6, code lost:
    
        r1 = r11;
        r11 = r11 + 1;
        r12[r1] = (byte) (128 | (r14 & '?'));
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v34, types: [int] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public byte[] encodeAsUTF8(java.lang.String r7) {
        /*
            Method dump skipped, instructions count: 453
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.io.JsonStringEncoder.encodeAsUTF8(java.lang.String):byte[]");
    }

    private int _appendNumericEscape(int i, char[] cArr) {
        cArr[1] = 'u';
        cArr[4] = HEX_CHARS[i >> 4];
        cArr[5] = HEX_CHARS[i & 15];
        return 6;
    }

    private int _appendNamedEscape(int i, char[] cArr) {
        cArr[1] = (char) i;
        return 2;
    }

    private int _appendByteEscape(int i, int i2, ByteArrayBuilder byteArrayBuilder, int i3) {
        byteArrayBuilder.setCurrentSegmentLength(i3);
        byteArrayBuilder.append(INT_BACKSLASH);
        if (i2 < 0) {
            byteArrayBuilder.append(INT_U);
            if (i > 255) {
                int i4 = i >> 8;
                byteArrayBuilder.append(HEX_BYTES[i4 >> 4]);
                byteArrayBuilder.append(HEX_BYTES[i4 & 15]);
                i &= 255;
            } else {
                byteArrayBuilder.append(INT_0);
                byteArrayBuilder.append(INT_0);
            }
            byteArrayBuilder.append(HEX_BYTES[i >> 4]);
            byteArrayBuilder.append(HEX_BYTES[i & 15]);
        } else {
            byteArrayBuilder.append((byte) i2);
        }
        return byteArrayBuilder.getCurrentSegmentLength();
    }

    protected static int _convertSurrogate(int i, int i2) {
        if (i2 < SURR2_FIRST || i2 > SURR2_LAST) {
            throw new IllegalArgumentException("Broken surrogate pair: first char 0x" + Integer.toHexString(i) + ", second 0x" + Integer.toHexString(i2) + "; illegal combination");
        }
        return 65536 + ((i - SURR1_FIRST) << 10) + (i2 - SURR2_FIRST);
    }

    protected static void _illegalSurrogate(int i) {
        throw new IllegalArgumentException(UTF8Writer.illegalSurrogateDesc(i));
    }
}
