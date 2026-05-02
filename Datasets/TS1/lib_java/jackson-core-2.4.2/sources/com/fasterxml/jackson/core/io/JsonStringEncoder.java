package com.fasterxml.jackson.core.io;

import com.fasterxml.jackson.core.util.BufferRecycler;
import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import com.fasterxml.jackson.core.util.TextBuffer;
import java.lang.ref.SoftReference;

/* loaded from: jackson-core-2.4.2.jar:com/fasterxml/jackson/core/io/JsonStringEncoder.class */
public final class JsonStringEncoder {
    private static final int SURR1_FIRST = 55296;
    private static final int SURR1_LAST = 56319;
    private static final int SURR2_FIRST = 56320;
    private static final int SURR2_LAST = 57343;
    protected TextBuffer _text;
    protected ByteArrayBuilder _bytes;
    protected final char[] _qbuf = new char[6];
    private static final char[] HC = CharTypes.copyHexChars();
    private static final byte[] HB = CharTypes.copyHexBytes();
    protected static final ThreadLocal<SoftReference<JsonStringEncoder>> _threadEncoder = new ThreadLocal<>();

    public JsonStringEncoder() {
        this._qbuf[0] = '\\';
        this._qbuf[2] = '0';
        this._qbuf[3] = '0';
    }

    public static JsonStringEncoder getInstance() {
        SoftReference<JsonStringEncoder> ref = _threadEncoder.get();
        JsonStringEncoder enc = ref == null ? null : ref.get();
        if (enc == null) {
            enc = new JsonStringEncoder();
            _threadEncoder.set(new SoftReference<>(enc));
        }
        return enc;
    }

    public char[] quoteAsString(String input) {
        int outPtr;
        TextBuffer textBuffer = this._text;
        if (textBuffer == null) {
            TextBuffer textBuffer2 = new TextBuffer(null);
            textBuffer = textBuffer2;
            this._text = textBuffer2;
        }
        char[] outputBuffer = textBuffer.emptyAndGetCurrentSegment();
        int[] escCodes = CharTypes.get7BitOutputEscapes();
        int escCodeCount = escCodes.length;
        int inPtr = 0;
        int inputLen = input.length();
        int i = 0;
        loop0: while (true) {
            outPtr = i;
            if (inPtr >= inputLen) {
                break;
            }
            do {
                char c = input.charAt(inPtr);
                if (c >= escCodeCount || escCodes[c] == 0) {
                    if (outPtr >= outputBuffer.length) {
                        outputBuffer = textBuffer.finishCurrentSegment();
                        outPtr = 0;
                    }
                    int i2 = outPtr;
                    outPtr++;
                    outputBuffer[i2] = c;
                    inPtr++;
                } else {
                    int i3 = inPtr;
                    inPtr++;
                    char d = input.charAt(i3);
                    int escCode = escCodes[d];
                    int length = escCode < 0 ? _appendNumeric(d, this._qbuf) : _appendNamed(escCode, this._qbuf);
                    if (outPtr + length > outputBuffer.length) {
                        int first = outputBuffer.length - outPtr;
                        if (first > 0) {
                            System.arraycopy(this._qbuf, 0, outputBuffer, outPtr, first);
                        }
                        outputBuffer = textBuffer.finishCurrentSegment();
                        int second = length - first;
                        System.arraycopy(this._qbuf, first, outputBuffer, 0, second);
                        i = second;
                    } else {
                        System.arraycopy(this._qbuf, 0, outputBuffer, outPtr, length);
                        i = outPtr + length;
                    }
                }
            } while (inPtr < inputLen);
        }
        textBuffer.setCurrentLength(outPtr);
        return textBuffer.contentsAsArray();
    }

    public byte[] quoteAsUTF8(String text) {
        int outputPtr;
        int ch;
        ByteArrayBuilder bb = this._bytes;
        if (bb == null) {
            ByteArrayBuilder byteArrayBuilder = new ByteArrayBuilder((BufferRecycler) null);
            bb = byteArrayBuilder;
            this._bytes = byteArrayBuilder;
        }
        int inputPtr = 0;
        int inputEnd = text.length();
        int outputPtr2 = 0;
        byte[] outputBuffer = bb.resetAndGetFirstSegment();
        loop0: while (inputPtr < inputEnd) {
            int[] escCodes = CharTypes.get7BitOutputEscapes();
            do {
                int ch2 = text.charAt(inputPtr);
                if (ch2 <= 127 && escCodes[ch2] == 0) {
                    if (outputPtr2 >= outputBuffer.length) {
                        outputBuffer = bb.finishCurrentSegment();
                        outputPtr2 = 0;
                    }
                    int i = outputPtr2;
                    outputPtr2++;
                    outputBuffer[i] = (byte) ch2;
                    inputPtr++;
                } else {
                    if (outputPtr2 >= outputBuffer.length) {
                        outputBuffer = bb.finishCurrentSegment();
                        outputPtr2 = 0;
                    }
                    int i2 = inputPtr;
                    inputPtr++;
                    int ch3 = text.charAt(i2);
                    if (ch3 <= 127) {
                        int escape = escCodes[ch3];
                        outputPtr2 = _appendByte(ch3, escape, bb, outputPtr2);
                        outputBuffer = bb.getCurrentSegment();
                    } else {
                        if (ch3 <= 2047) {
                            int i3 = outputPtr2;
                            outputPtr = outputPtr2 + 1;
                            outputBuffer[i3] = (byte) (192 | (ch3 >> 6));
                            ch = 128 | (ch3 & 63);
                        } else if (ch3 < SURR1_FIRST || ch3 > SURR2_LAST) {
                            int i4 = outputPtr2;
                            int outputPtr3 = outputPtr2 + 1;
                            outputBuffer[i4] = (byte) (224 | (ch3 >> 12));
                            if (outputPtr3 >= outputBuffer.length) {
                                outputBuffer = bb.finishCurrentSegment();
                                outputPtr3 = 0;
                            }
                            int i5 = outputPtr3;
                            outputPtr = outputPtr3 + 1;
                            outputBuffer[i5] = (byte) (128 | ((ch3 >> 6) & 63));
                            ch = 128 | (ch3 & 63);
                        } else {
                            if (ch3 > SURR1_LAST) {
                                _illegal(ch3);
                            }
                            if (inputPtr >= inputEnd) {
                                _illegal(ch3);
                            }
                            inputPtr++;
                            int ch4 = _convert(ch3, text.charAt(inputPtr));
                            if (ch4 > 1114111) {
                                _illegal(ch4);
                            }
                            int i6 = outputPtr2;
                            int outputPtr4 = outputPtr2 + 1;
                            outputBuffer[i6] = (byte) (240 | (ch4 >> 18));
                            if (outputPtr4 >= outputBuffer.length) {
                                outputBuffer = bb.finishCurrentSegment();
                                outputPtr4 = 0;
                            }
                            int i7 = outputPtr4;
                            int outputPtr5 = outputPtr4 + 1;
                            outputBuffer[i7] = (byte) (128 | ((ch4 >> 12) & 63));
                            if (outputPtr5 >= outputBuffer.length) {
                                outputBuffer = bb.finishCurrentSegment();
                                outputPtr5 = 0;
                            }
                            int i8 = outputPtr5;
                            outputPtr = outputPtr5 + 1;
                            outputBuffer[i8] = (byte) (128 | ((ch4 >> 6) & 63));
                            ch = 128 | (ch4 & 63);
                        }
                        if (outputPtr >= outputBuffer.length) {
                            outputBuffer = bb.finishCurrentSegment();
                            outputPtr = 0;
                        }
                        int i9 = outputPtr;
                        outputPtr2 = outputPtr + 1;
                        outputBuffer[i9] = (byte) ch;
                    }
                }
            } while (inputPtr < inputEnd);
        }
        return this._bytes.completeAndCoalesce(outputPtr2);
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
        r12[r1] = (byte) (224 | (r14 >> 12));
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
    
        _illegal(r14);
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x0108, code lost:
    
        if (r9 < r0) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x010b, code lost:
    
        _illegal(r14);
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0110, code lost:
    
        r2 = r9;
        r9 = r9 + 1;
        r14 = _convert(r14, r7.charAt(r2));
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x0123, code lost:
    
        if (r14 <= 1114111) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0126, code lost:
    
        _illegal(r14);
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
        r12[r1] = (byte) (128 | ((r14 >> 12) & 63));
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
        r12[r1] = (byte) (128 | (r14 & 63));
     */
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

    private int _appendNumeric(int value, char[] qbuf) {
        qbuf[1] = 'u';
        qbuf[4] = HC[value >> 4];
        qbuf[5] = HC[value & 15];
        return 6;
    }

    private int _appendNamed(int esc, char[] qbuf) {
        qbuf[1] = (char) esc;
        return 2;
    }

    private int _appendByte(int ch, int esc, ByteArrayBuilder bb, int ptr) {
        bb.setCurrentSegmentLength(ptr);
        bb.append(92);
        if (esc < 0) {
            bb.append(117);
            if (ch > 255) {
                int hi = ch >> 8;
                bb.append(HB[hi >> 4]);
                bb.append(HB[hi & 15]);
                ch &= 255;
            } else {
                bb.append(48);
                bb.append(48);
            }
            bb.append(HB[ch >> 4]);
            bb.append(HB[ch & 15]);
        } else {
            bb.append((byte) esc);
        }
        return bb.getCurrentSegmentLength();
    }

    private static int _convert(int p1, int p2) {
        if (p2 < SURR2_FIRST || p2 > SURR2_LAST) {
            throw new IllegalArgumentException("Broken surrogate pair: first char 0x" + Integer.toHexString(p1) + ", second 0x" + Integer.toHexString(p2) + "; illegal combination");
        }
        return 65536 + ((p1 - SURR1_FIRST) << 10) + (p2 - SURR2_FIRST);
    }

    private static void _illegal(int c) {
        throw new IllegalArgumentException(UTF8Writer.illegalSurrogateDesc(c));
    }
}
