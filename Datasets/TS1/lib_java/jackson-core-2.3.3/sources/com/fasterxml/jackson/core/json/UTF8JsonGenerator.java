package com.fasterxml.jackson.core.json;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.core.io.CharTypes;
import com.fasterxml.jackson.core.io.CharacterEscapes;
import com.fasterxml.jackson.core.io.IOContext;
import com.fasterxml.jackson.core.io.NumberOutput;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.math.BigInteger;

/* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/json/UTF8JsonGenerator.class */
public class UTF8JsonGenerator extends JsonGeneratorImpl {
    private static final byte BYTE_0 = 48;
    private static final byte BYTE_LBRACKET = 91;
    private static final byte BYTE_RBRACKET = 93;
    private static final byte BYTE_LCURLY = 123;
    private static final byte BYTE_RCURLY = 125;
    private static final byte BYTE_BACKSLASH = 92;
    private static final byte BYTE_COMMA = 44;
    private static final byte BYTE_COLON = 58;
    private static final byte BYTE_QUOTE = 34;
    protected static final int SURR1_FIRST = 55296;
    protected static final int SURR1_LAST = 56319;
    protected static final int SURR2_FIRST = 56320;
    protected static final int SURR2_LAST = 57343;
    private static final int MAX_BYTES_TO_BUFFER = 512;
    protected final OutputStream _outputStream;
    protected byte[] _outputBuffer;
    protected int _outputTail;
    protected final int _outputEnd;
    protected final int _outputMaxContiguous;
    protected char[] _charBuffer;
    protected final int _charBufferLength;
    protected byte[] _entityBuffer;
    protected boolean _bufferRecyclable;
    protected final boolean _cfgQuoteNames;
    static final byte[] HEX_CHARS = CharTypes.copyHexBytes();
    private static final byte BYTE_u = 117;
    private static final byte[] NULL_BYTES = {110, BYTE_u, 108, 108};
    private static final byte[] TRUE_BYTES = {116, 114, BYTE_u, 101};
    private static final byte[] FALSE_BYTES = {102, 97, 108, 115, 101};

    public UTF8JsonGenerator(IOContext iOContext, int i, ObjectCodec objectCodec, OutputStream outputStream) {
        super(iOContext, i, objectCodec);
        this._outputTail = 0;
        this._outputStream = outputStream;
        this._bufferRecyclable = true;
        this._outputBuffer = iOContext.allocWriteEncodingBuffer();
        this._outputEnd = this._outputBuffer.length;
        this._outputMaxContiguous = this._outputEnd >> 3;
        this._charBuffer = iOContext.allocConcatBuffer();
        this._charBufferLength = this._charBuffer.length;
        if (isEnabled(JsonGenerator.Feature.ESCAPE_NON_ASCII)) {
            setHighestNonEscapedChar(127);
        }
        this._cfgQuoteNames = JsonGenerator.Feature.QUOTE_FIELD_NAMES.enabledIn(i);
    }

    public UTF8JsonGenerator(IOContext iOContext, int i, ObjectCodec objectCodec, OutputStream outputStream, byte[] bArr, int i2, boolean z) {
        super(iOContext, i, objectCodec);
        this._outputTail = 0;
        this._outputStream = outputStream;
        this._bufferRecyclable = z;
        this._outputTail = i2;
        this._outputBuffer = bArr;
        this._outputEnd = this._outputBuffer.length;
        this._outputMaxContiguous = this._outputEnd >> 3;
        this._charBuffer = iOContext.allocConcatBuffer();
        this._charBufferLength = this._charBuffer.length;
        this._cfgQuoteNames = JsonGenerator.Feature.QUOTE_FIELD_NAMES.enabledIn(i);
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public Object getOutputTarget() {
        return this._outputStream;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeFieldName(String str) throws IOException, JsonGenerationException {
        int writeFieldName = this._writeContext.writeFieldName(str);
        if (writeFieldName == 4) {
            _reportError("Can not write a field name, expecting a value");
        }
        if (this._cfgPrettyPrinter != null) {
            _writePPFieldName(str, writeFieldName == 1);
            return;
        }
        if (writeFieldName == 1) {
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            byte[] bArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            bArr[i] = BYTE_COMMA;
        }
        _writeFieldName(str);
    }

    protected final void _writeFieldName(String str) throws IOException, JsonGenerationException {
        if (!this._cfgQuoteNames) {
            _writeStringSegments(str);
            return;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        bArr[i] = BYTE_QUOTE;
        int length = str.length();
        if (length <= this._charBufferLength) {
            str.getChars(0, length, this._charBuffer, 0);
            if (length <= this._outputMaxContiguous) {
                if (this._outputTail + length > this._outputEnd) {
                    _flushBuffer();
                }
                _writeStringSegment(this._charBuffer, 0, length);
            } else {
                _writeStringSegments(this._charBuffer, 0, length);
            }
        } else {
            _writeStringSegments(str);
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        bArr2[i2] = BYTE_QUOTE;
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase, com.fasterxml.jackson.core.JsonGenerator
    public void writeFieldName(SerializableString serializableString) throws IOException, JsonGenerationException {
        int writeFieldName = this._writeContext.writeFieldName(serializableString.getValue());
        if (writeFieldName == 4) {
            _reportError("Can not write a field name, expecting a value");
        }
        if (this._cfgPrettyPrinter != null) {
            _writePPFieldName(serializableString, writeFieldName == 1);
            return;
        }
        if (writeFieldName == 1) {
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            byte[] bArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            bArr[i] = BYTE_COMMA;
        }
        _writeFieldName(serializableString);
    }

    protected final void _writeFieldName(SerializableString serializableString) throws IOException, JsonGenerationException {
        if (!this._cfgQuoteNames) {
            int appendQuotedUTF8 = serializableString.appendQuotedUTF8(this._outputBuffer, this._outputTail);
            if (appendQuotedUTF8 < 0) {
                _writeBytes(serializableString.asQuotedUTF8());
                return;
            } else {
                this._outputTail += appendQuotedUTF8;
                return;
            }
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        bArr[i] = BYTE_QUOTE;
        int appendQuotedUTF82 = serializableString.appendQuotedUTF8(this._outputBuffer, this._outputTail);
        if (appendQuotedUTF82 < 0) {
            _writeBytes(serializableString.asQuotedUTF8());
        } else {
            this._outputTail += appendQuotedUTF82;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        bArr2[i2] = BYTE_QUOTE;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public final void writeStartArray() throws IOException, JsonGenerationException {
        _verifyValueWrite("start an array");
        this._writeContext = this._writeContext.createChildArrayContext();
        if (this._cfgPrettyPrinter != null) {
            this._cfgPrettyPrinter.writeStartArray(this);
            return;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        bArr[i] = BYTE_LBRACKET;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public final void writeEndArray() throws IOException, JsonGenerationException {
        if (!this._writeContext.inArray()) {
            _reportError("Current context not an ARRAY but " + this._writeContext.getTypeDesc());
        }
        if (this._cfgPrettyPrinter != null) {
            this._cfgPrettyPrinter.writeEndArray(this, this._writeContext.getEntryCount());
        } else {
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            byte[] bArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            bArr[i] = BYTE_RBRACKET;
        }
        this._writeContext = this._writeContext.getParent();
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public final void writeStartObject() throws IOException, JsonGenerationException {
        _verifyValueWrite("start an object");
        this._writeContext = this._writeContext.createChildObjectContext();
        if (this._cfgPrettyPrinter != null) {
            this._cfgPrettyPrinter.writeStartObject(this);
            return;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        bArr[i] = BYTE_LCURLY;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public final void writeEndObject() throws IOException, JsonGenerationException {
        if (!this._writeContext.inObject()) {
            _reportError("Current context not an object but " + this._writeContext.getTypeDesc());
        }
        if (this._cfgPrettyPrinter != null) {
            this._cfgPrettyPrinter.writeEndObject(this, this._writeContext.getEntryCount());
        } else {
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            byte[] bArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            bArr[i] = BYTE_RCURLY;
        }
        this._writeContext = this._writeContext.getParent();
    }

    protected final void _writePPFieldName(String str, boolean z) throws IOException, JsonGenerationException {
        if (z) {
            this._cfgPrettyPrinter.writeObjectEntrySeparator(this);
        } else {
            this._cfgPrettyPrinter.beforeObjectEntries(this);
        }
        if (this._cfgQuoteNames) {
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            byte[] bArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            bArr[i] = BYTE_QUOTE;
            int length = str.length();
            if (length <= this._charBufferLength) {
                str.getChars(0, length, this._charBuffer, 0);
                if (length <= this._outputMaxContiguous) {
                    if (this._outputTail + length > this._outputEnd) {
                        _flushBuffer();
                    }
                    _writeStringSegment(this._charBuffer, 0, length);
                } else {
                    _writeStringSegments(this._charBuffer, 0, length);
                }
            } else {
                _writeStringSegments(str);
            }
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            byte[] bArr2 = this._outputBuffer;
            int i2 = this._outputTail;
            this._outputTail = i2 + 1;
            bArr2[i2] = BYTE_QUOTE;
            return;
        }
        _writeStringSegments(str);
    }

    protected final void _writePPFieldName(SerializableString serializableString, boolean z) throws IOException, JsonGenerationException {
        if (z) {
            this._cfgPrettyPrinter.writeObjectEntrySeparator(this);
        } else {
            this._cfgPrettyPrinter.beforeObjectEntries(this);
        }
        boolean z2 = this._cfgQuoteNames;
        if (z2) {
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            byte[] bArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            bArr[i] = BYTE_QUOTE;
        }
        _writeBytes(serializableString.asQuotedUTF8());
        if (z2) {
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            byte[] bArr2 = this._outputBuffer;
            int i2 = this._outputTail;
            this._outputTail = i2 + 1;
            bArr2[i2] = BYTE_QUOTE;
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeString(String str) throws IOException, JsonGenerationException {
        _verifyValueWrite("write text value");
        if (str == null) {
            _writeNull();
            return;
        }
        int length = str.length();
        if (length > this._charBufferLength) {
            _writeLongString(str);
            return;
        }
        str.getChars(0, length, this._charBuffer, 0);
        if (length > this._outputMaxContiguous) {
            _writeLongString(this._charBuffer, 0, length);
            return;
        }
        if (this._outputTail + length >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        bArr[i] = BYTE_QUOTE;
        _writeStringSegment(this._charBuffer, 0, length);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        bArr2[i2] = BYTE_QUOTE;
    }

    private void _writeLongString(String str) throws IOException, JsonGenerationException {
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        bArr[i] = BYTE_QUOTE;
        _writeStringSegments(str);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        bArr2[i2] = BYTE_QUOTE;
    }

    private void _writeLongString(char[] cArr, int i, int i2) throws IOException, JsonGenerationException {
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr = this._outputBuffer;
        int i3 = this._outputTail;
        this._outputTail = i3 + 1;
        bArr[i3] = BYTE_QUOTE;
        _writeStringSegments(this._charBuffer, 0, i2);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr2 = this._outputBuffer;
        int i4 = this._outputTail;
        this._outputTail = i4 + 1;
        bArr2[i4] = BYTE_QUOTE;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeString(char[] cArr, int i, int i2) throws IOException, JsonGenerationException {
        _verifyValueWrite("write text value");
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr = this._outputBuffer;
        int i3 = this._outputTail;
        this._outputTail = i3 + 1;
        bArr[i3] = BYTE_QUOTE;
        if (i2 <= this._outputMaxContiguous) {
            if (this._outputTail + i2 > this._outputEnd) {
                _flushBuffer();
            }
            _writeStringSegment(cArr, i, i2);
        } else {
            _writeStringSegments(cArr, i, i2);
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr2 = this._outputBuffer;
        int i4 = this._outputTail;
        this._outputTail = i4 + 1;
        bArr2[i4] = BYTE_QUOTE;
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase, com.fasterxml.jackson.core.JsonGenerator
    public final void writeString(SerializableString serializableString) throws IOException, JsonGenerationException {
        _verifyValueWrite("write text value");
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        bArr[i] = BYTE_QUOTE;
        int appendQuotedUTF8 = serializableString.appendQuotedUTF8(this._outputBuffer, this._outputTail);
        if (appendQuotedUTF8 < 0) {
            _writeBytes(serializableString.asQuotedUTF8());
        } else {
            this._outputTail += appendQuotedUTF8;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        bArr2[i2] = BYTE_QUOTE;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRawUTF8String(byte[] bArr, int i, int i2) throws IOException, JsonGenerationException {
        _verifyValueWrite("write text value");
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr2 = this._outputBuffer;
        int i3 = this._outputTail;
        this._outputTail = i3 + 1;
        bArr2[i3] = BYTE_QUOTE;
        _writeBytes(bArr, i, i2);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr3 = this._outputBuffer;
        int i4 = this._outputTail;
        this._outputTail = i4 + 1;
        bArr3[i4] = BYTE_QUOTE;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeUTF8String(byte[] bArr, int i, int i2) throws IOException, JsonGenerationException {
        _verifyValueWrite("write text value");
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr2 = this._outputBuffer;
        int i3 = this._outputTail;
        this._outputTail = i3 + 1;
        bArr2[i3] = BYTE_QUOTE;
        if (i2 <= this._outputMaxContiguous) {
            _writeUTF8Segment(bArr, i, i2);
        } else {
            _writeUTF8Segments(bArr, i, i2);
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr3 = this._outputBuffer;
        int i4 = this._outputTail;
        this._outputTail = i4 + 1;
        bArr3[i4] = BYTE_QUOTE;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRaw(String str) throws IOException, JsonGenerationException {
        int i = 0;
        int length = str.length();
        while (true) {
            int i2 = length;
            if (i2 > 0) {
                char[] cArr = this._charBuffer;
                int length2 = cArr.length;
                int i3 = i2 < length2 ? i2 : length2;
                str.getChars(i, i + i3, cArr, 0);
                writeRaw(cArr, 0, i3);
                i += i3;
                length = i2 - i3;
            } else {
                return;
            }
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRaw(String str, int i, int i2) throws IOException, JsonGenerationException {
        while (i2 > 0) {
            char[] cArr = this._charBuffer;
            int length = cArr.length;
            int i3 = i2 < length ? i2 : length;
            str.getChars(i, i + i3, cArr, 0);
            writeRaw(cArr, 0, i3);
            i += i3;
            i2 -= i3;
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRaw(SerializableString serializableString) throws IOException, JsonGenerationException {
        byte[] asUnquotedUTF8 = serializableString.asUnquotedUTF8();
        if (asUnquotedUTF8.length > 0) {
            _writeBytes(asUnquotedUTF8);
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public final void writeRaw(char[] cArr, int i, int i2) throws IOException, JsonGenerationException {
        int i3 = i2 + i2 + i2;
        if (this._outputTail + i3 > this._outputEnd) {
            if (this._outputEnd < i3) {
                _writeSegmentedRaw(cArr, i, i2);
                return;
            }
            _flushBuffer();
        }
        int i4 = i2 + i;
        while (i < i4) {
            do {
                char c = cArr[i];
                if (c <= 127) {
                    byte[] bArr = this._outputBuffer;
                    int i5 = this._outputTail;
                    this._outputTail = i5 + 1;
                    bArr[i5] = (byte) c;
                    i++;
                } else {
                    int i6 = i;
                    i++;
                    char c2 = cArr[i6];
                    if (c2 < 2048) {
                        byte[] bArr2 = this._outputBuffer;
                        int i7 = this._outputTail;
                        this._outputTail = i7 + 1;
                        bArr2[i7] = (byte) (192 | (c2 >> 6));
                        byte[] bArr3 = this._outputBuffer;
                        int i8 = this._outputTail;
                        this._outputTail = i8 + 1;
                        bArr3[i8] = (byte) (128 | (c2 & '?'));
                    } else {
                        i = _outputRawMultiByteChar(c2, cArr, i, i4);
                    }
                }
            } while (i < i4);
            return;
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRaw(char c) throws IOException, JsonGenerationException {
        if (this._outputTail + 3 >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr = this._outputBuffer;
        if (c <= 127) {
            int i = this._outputTail;
            this._outputTail = i + 1;
            bArr[i] = (byte) c;
        } else {
            if (c < 2048) {
                int i2 = this._outputTail;
                this._outputTail = i2 + 1;
                bArr[i2] = (byte) (192 | (c >> 6));
                int i3 = this._outputTail;
                this._outputTail = i3 + 1;
                bArr[i3] = (byte) (128 | (c & '?'));
                return;
            }
            _outputRawMultiByteChar(c, null, 0, 0);
        }
    }

    private final void _writeSegmentedRaw(char[] cArr, int i, int i2) throws IOException, JsonGenerationException {
        int i3 = this._outputEnd;
        byte[] bArr = this._outputBuffer;
        while (i < i2) {
            do {
                char c = cArr[i];
                if (c < 128) {
                    if (this._outputTail >= i3) {
                        _flushBuffer();
                    }
                    int i4 = this._outputTail;
                    this._outputTail = i4 + 1;
                    bArr[i4] = (byte) c;
                    i++;
                } else {
                    if (this._outputTail + 3 >= this._outputEnd) {
                        _flushBuffer();
                    }
                    int i5 = i;
                    i++;
                    char c2 = cArr[i5];
                    if (c2 < 2048) {
                        int i6 = this._outputTail;
                        this._outputTail = i6 + 1;
                        bArr[i6] = (byte) (192 | (c2 >> 6));
                        int i7 = this._outputTail;
                        this._outputTail = i7 + 1;
                        bArr[i7] = (byte) (128 | (c2 & '?'));
                    } else {
                        i = _outputRawMultiByteChar(c2, cArr, i, i2);
                    }
                }
            } while (i < i2);
            return;
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeBinary(Base64Variant base64Variant, byte[] bArr, int i, int i2) throws IOException, JsonGenerationException {
        _verifyValueWrite("write binary value");
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr2 = this._outputBuffer;
        int i3 = this._outputTail;
        this._outputTail = i3 + 1;
        bArr2[i3] = BYTE_QUOTE;
        _writeBinary(base64Variant, bArr, i, i + i2);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr3 = this._outputBuffer;
        int i4 = this._outputTail;
        this._outputTail = i4 + 1;
        bArr3[i4] = BYTE_QUOTE;
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase, com.fasterxml.jackson.core.JsonGenerator
    public int writeBinary(Base64Variant base64Variant, InputStream inputStream, int i) throws IOException, JsonGenerationException {
        int i2;
        _verifyValueWrite("write binary value");
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr = this._outputBuffer;
        int i3 = this._outputTail;
        this._outputTail = i3 + 1;
        bArr[i3] = BYTE_QUOTE;
        byte[] allocBase64Buffer = this._ioContext.allocBase64Buffer();
        try {
            if (i < 0) {
                i2 = _writeBinary(base64Variant, inputStream, allocBase64Buffer);
            } else {
                int _writeBinary = _writeBinary(base64Variant, inputStream, allocBase64Buffer, i);
                if (_writeBinary > 0) {
                    _reportError("Too few bytes available: missing " + _writeBinary + " bytes (out of " + i + ")");
                }
                i2 = i;
            }
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            byte[] bArr2 = this._outputBuffer;
            int i4 = this._outputTail;
            this._outputTail = i4 + 1;
            bArr2[i4] = BYTE_QUOTE;
            return i2;
        } finally {
            this._ioContext.releaseBase64Buffer(allocBase64Buffer);
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(short s) throws IOException, JsonGenerationException {
        _verifyValueWrite("write number");
        if (this._outputTail + 6 >= this._outputEnd) {
            _flushBuffer();
        }
        if (this._cfgNumbersAsStrings) {
            _writeQuotedShort(s);
        } else {
            this._outputTail = NumberOutput.outputInt(s, this._outputBuffer, this._outputTail);
        }
    }

    private final void _writeQuotedShort(short s) throws IOException {
        if (this._outputTail + 8 >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        bArr[i] = BYTE_QUOTE;
        this._outputTail = NumberOutput.outputInt(s, this._outputBuffer, this._outputTail);
        byte[] bArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        bArr2[i2] = BYTE_QUOTE;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(int i) throws IOException, JsonGenerationException {
        _verifyValueWrite("write number");
        if (this._outputTail + 11 >= this._outputEnd) {
            _flushBuffer();
        }
        if (this._cfgNumbersAsStrings) {
            _writeQuotedInt(i);
        } else {
            this._outputTail = NumberOutput.outputInt(i, this._outputBuffer, this._outputTail);
        }
    }

    private final void _writeQuotedInt(int i) throws IOException {
        if (this._outputTail + 13 >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        bArr[i2] = BYTE_QUOTE;
        this._outputTail = NumberOutput.outputInt(i, this._outputBuffer, this._outputTail);
        byte[] bArr2 = this._outputBuffer;
        int i3 = this._outputTail;
        this._outputTail = i3 + 1;
        bArr2[i3] = BYTE_QUOTE;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(long j) throws IOException, JsonGenerationException {
        _verifyValueWrite("write number");
        if (this._cfgNumbersAsStrings) {
            _writeQuotedLong(j);
            return;
        }
        if (this._outputTail + 21 >= this._outputEnd) {
            _flushBuffer();
        }
        this._outputTail = NumberOutput.outputLong(j, this._outputBuffer, this._outputTail);
    }

    private final void _writeQuotedLong(long j) throws IOException {
        if (this._outputTail + 23 >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        bArr[i] = BYTE_QUOTE;
        this._outputTail = NumberOutput.outputLong(j, this._outputBuffer, this._outputTail);
        byte[] bArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        bArr2[i2] = BYTE_QUOTE;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(BigInteger bigInteger) throws IOException, JsonGenerationException {
        _verifyValueWrite("write number");
        if (bigInteger == null) {
            _writeNull();
        } else if (this._cfgNumbersAsStrings) {
            _writeQuotedRaw(bigInteger);
        } else {
            writeRaw(bigInteger.toString());
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(double d) throws IOException, JsonGenerationException {
        if (this._cfgNumbersAsStrings || ((Double.isNaN(d) || Double.isInfinite(d)) && isEnabled(JsonGenerator.Feature.QUOTE_NON_NUMERIC_NUMBERS))) {
            writeString(String.valueOf(d));
        } else {
            _verifyValueWrite("write number");
            writeRaw(String.valueOf(d));
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(float f) throws IOException, JsonGenerationException {
        if (this._cfgNumbersAsStrings || ((Float.isNaN(f) || Float.isInfinite(f)) && isEnabled(JsonGenerator.Feature.QUOTE_NON_NUMERIC_NUMBERS))) {
            writeString(String.valueOf(f));
        } else {
            _verifyValueWrite("write number");
            writeRaw(String.valueOf(f));
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(BigDecimal bigDecimal) throws IOException, JsonGenerationException {
        _verifyValueWrite("write number");
        if (bigDecimal == null) {
            _writeNull();
            return;
        }
        if (this._cfgNumbersAsStrings) {
            _writeQuotedRaw(bigDecimal);
        } else if (isEnabled(JsonGenerator.Feature.WRITE_BIGDECIMAL_AS_PLAIN)) {
            writeRaw(bigDecimal.toPlainString());
        } else {
            writeRaw(bigDecimal.toString());
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(String str) throws IOException, JsonGenerationException {
        _verifyValueWrite("write number");
        if (this._cfgNumbersAsStrings) {
            _writeQuotedRaw(str);
        } else {
            writeRaw(str);
        }
    }

    private final void _writeQuotedRaw(Object obj) throws IOException {
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        bArr[i] = BYTE_QUOTE;
        writeRaw(obj.toString());
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        bArr2[i2] = BYTE_QUOTE;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeBoolean(boolean z) throws IOException, JsonGenerationException {
        _verifyValueWrite("write boolean value");
        if (this._outputTail + 5 >= this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr = z ? TRUE_BYTES : FALSE_BYTES;
        int length = bArr.length;
        System.arraycopy(bArr, 0, this._outputBuffer, this._outputTail, length);
        this._outputTail += length;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNull() throws IOException, JsonGenerationException {
        _verifyValueWrite("write null value");
        _writeNull();
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase
    protected final void _verifyValueWrite(String str) throws IOException, JsonGenerationException {
        byte b;
        int writeValue = this._writeContext.writeValue();
        if (writeValue == 5) {
            _reportError("Can not " + str + ", expecting field name");
        }
        if (this._cfgPrettyPrinter == null) {
            switch (writeValue) {
                case 0:
                default:
                    return;
                case 1:
                    b = BYTE_COMMA;
                    break;
                case 2:
                    b = BYTE_COLON;
                    break;
                case 3:
                    if (this._rootValueSeparator != null) {
                        byte[] asUnquotedUTF8 = this._rootValueSeparator.asUnquotedUTF8();
                        if (asUnquotedUTF8.length > 0) {
                            _writeBytes(asUnquotedUTF8);
                            return;
                        }
                        return;
                    }
                    return;
            }
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            this._outputBuffer[this._outputTail] = b;
            this._outputTail++;
            return;
        }
        _verifyPrettyValueWrite(str, writeValue);
    }

    protected final void _verifyPrettyValueWrite(String str, int i) throws IOException, JsonGenerationException {
        switch (i) {
            case 0:
                if (this._writeContext.inArray()) {
                    this._cfgPrettyPrinter.beforeArrayValues(this);
                    break;
                } else if (this._writeContext.inObject()) {
                    this._cfgPrettyPrinter.beforeObjectEntries(this);
                    break;
                }
                break;
            case 1:
                this._cfgPrettyPrinter.writeArrayValueSeparator(this);
                break;
            case 2:
                this._cfgPrettyPrinter.writeObjectFieldValueSeparator(this);
                break;
            case 3:
                this._cfgPrettyPrinter.writeRootValueSeparator(this);
                break;
            default:
                _throwInternal();
                break;
        }
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase, com.fasterxml.jackson.core.JsonGenerator, java.io.Flushable
    public void flush() throws IOException {
        _flushBuffer();
        if (this._outputStream != null && isEnabled(JsonGenerator.Feature.FLUSH_PASSED_TO_STREAM)) {
            this._outputStream.flush();
        }
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase, com.fasterxml.jackson.core.JsonGenerator, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        super.close();
        if (this._outputBuffer != null && isEnabled(JsonGenerator.Feature.AUTO_CLOSE_JSON_CONTENT)) {
            while (true) {
                JsonWriteContext outputContext = getOutputContext();
                if (outputContext.inArray()) {
                    writeEndArray();
                } else if (!outputContext.inObject()) {
                    break;
                } else {
                    writeEndObject();
                }
            }
        }
        _flushBuffer();
        if (this._outputStream != null) {
            if (this._ioContext.isResourceManaged() || isEnabled(JsonGenerator.Feature.AUTO_CLOSE_TARGET)) {
                this._outputStream.close();
            } else if (isEnabled(JsonGenerator.Feature.FLUSH_PASSED_TO_STREAM)) {
                this._outputStream.flush();
            }
        }
        _releaseBuffers();
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase
    protected void _releaseBuffers() {
        byte[] bArr = this._outputBuffer;
        if (bArr != null && this._bufferRecyclable) {
            this._outputBuffer = null;
            this._ioContext.releaseWriteEncodingBuffer(bArr);
        }
        char[] cArr = this._charBuffer;
        if (cArr != null) {
            this._charBuffer = null;
            this._ioContext.releaseConcatBuffer(cArr);
        }
    }

    private final void _writeBytes(byte[] bArr) throws IOException {
        int length = bArr.length;
        if (this._outputTail + length > this._outputEnd) {
            _flushBuffer();
            if (length > MAX_BYTES_TO_BUFFER) {
                this._outputStream.write(bArr, 0, length);
                return;
            }
        }
        System.arraycopy(bArr, 0, this._outputBuffer, this._outputTail, length);
        this._outputTail += length;
    }

    private final void _writeBytes(byte[] bArr, int i, int i2) throws IOException {
        if (this._outputTail + i2 > this._outputEnd) {
            _flushBuffer();
            if (i2 > MAX_BYTES_TO_BUFFER) {
                this._outputStream.write(bArr, i, i2);
                return;
            }
        }
        System.arraycopy(bArr, i, this._outputBuffer, this._outputTail, i2);
        this._outputTail += i2;
    }

    private final void _writeStringSegments(String str) throws IOException, JsonGenerationException {
        int length = str.length();
        int i = 0;
        char[] cArr = this._charBuffer;
        while (length > 0) {
            int min = Math.min(this._outputMaxContiguous, length);
            str.getChars(i, i + min, cArr, 0);
            if (this._outputTail + min > this._outputEnd) {
                _flushBuffer();
            }
            _writeStringSegment(cArr, 0, min);
            i += min;
            length -= min;
        }
    }

    private final void _writeStringSegments(char[] cArr, int i, int i2) throws IOException, JsonGenerationException {
        do {
            int min = Math.min(this._outputMaxContiguous, i2);
            if (this._outputTail + min > this._outputEnd) {
                _flushBuffer();
            }
            _writeStringSegment(cArr, i, min);
            i += min;
            i2 -= min;
        } while (i2 > 0);
    }

    private final void _writeStringSegment(char[] cArr, int i, int i2) throws IOException, JsonGenerationException {
        char c;
        int i3 = i2 + i;
        int i4 = this._outputTail;
        byte[] bArr = this._outputBuffer;
        int[] iArr = this._outputEscapes;
        while (i < i3 && (c = cArr[i]) <= 127 && iArr[c] == 0) {
            int i5 = i4;
            i4++;
            bArr[i5] = (byte) c;
            i++;
        }
        this._outputTail = i4;
        if (i < i3) {
            if (this._characterEscapes != null) {
                _writeCustomStringSegment2(cArr, i, i3);
            } else if (this._maximumNonEscapedChar == 0) {
                _writeStringSegment2(cArr, i, i3);
            } else {
                _writeStringSegmentASCII2(cArr, i, i3);
            }
        }
    }

    private final void _writeStringSegment2(char[] cArr, int i, int i2) throws IOException, JsonGenerationException {
        if (this._outputTail + (6 * (i2 - i)) > this._outputEnd) {
            _flushBuffer();
        }
        int i3 = this._outputTail;
        byte[] bArr = this._outputBuffer;
        int[] iArr = this._outputEscapes;
        while (i < i2) {
            int i4 = i;
            i++;
            char c = cArr[i4];
            if (c <= 127) {
                if (iArr[c] == 0) {
                    int i5 = i3;
                    i3++;
                    bArr[i5] = (byte) c;
                } else {
                    int i6 = iArr[c];
                    if (i6 > 0) {
                        int i7 = i3;
                        int i8 = i3 + 1;
                        bArr[i7] = BYTE_BACKSLASH;
                        i3 = i8 + 1;
                        bArr[i8] = (byte) i6;
                    } else {
                        i3 = _writeGenericEscape(c, i3);
                    }
                }
            } else if (c <= 2047) {
                int i9 = i3;
                int i10 = i3 + 1;
                bArr[i9] = (byte) (192 | (c >> 6));
                i3 = i10 + 1;
                bArr[i10] = (byte) (128 | (c & '?'));
            } else {
                i3 = _outputMultiByteChar(c, i3);
            }
        }
        this._outputTail = i3;
    }

    private final void _writeStringSegmentASCII2(char[] cArr, int i, int i2) throws IOException, JsonGenerationException {
        if (this._outputTail + (6 * (i2 - i)) > this._outputEnd) {
            _flushBuffer();
        }
        int i3 = this._outputTail;
        byte[] bArr = this._outputBuffer;
        int[] iArr = this._outputEscapes;
        int i4 = this._maximumNonEscapedChar;
        while (i < i2) {
            int i5 = i;
            i++;
            char c = cArr[i5];
            if (c <= 127) {
                if (iArr[c] == 0) {
                    int i6 = i3;
                    i3++;
                    bArr[i6] = (byte) c;
                } else {
                    int i7 = iArr[c];
                    if (i7 > 0) {
                        int i8 = i3;
                        int i9 = i3 + 1;
                        bArr[i8] = BYTE_BACKSLASH;
                        i3 = i9 + 1;
                        bArr[i9] = (byte) i7;
                    } else {
                        i3 = _writeGenericEscape(c, i3);
                    }
                }
            } else if (c > i4) {
                i3 = _writeGenericEscape(c, i3);
            } else if (c <= 2047) {
                int i10 = i3;
                int i11 = i3 + 1;
                bArr[i10] = (byte) (192 | (c >> 6));
                i3 = i11 + 1;
                bArr[i11] = (byte) (128 | (c & '?'));
            } else {
                i3 = _outputMultiByteChar(c, i3);
            }
        }
        this._outputTail = i3;
    }

    private final void _writeCustomStringSegment2(char[] cArr, int i, int i2) throws IOException, JsonGenerationException {
        if (this._outputTail + (6 * (i2 - i)) > this._outputEnd) {
            _flushBuffer();
        }
        int i3 = this._outputTail;
        byte[] bArr = this._outputBuffer;
        int[] iArr = this._outputEscapes;
        int i4 = this._maximumNonEscapedChar <= 0 ? 65535 : this._maximumNonEscapedChar;
        CharacterEscapes characterEscapes = this._characterEscapes;
        while (i < i2) {
            int i5 = i;
            i++;
            char c = cArr[i5];
            if (c <= 127) {
                if (iArr[c] == 0) {
                    int i6 = i3;
                    i3++;
                    bArr[i6] = (byte) c;
                } else {
                    int i7 = iArr[c];
                    if (i7 > 0) {
                        int i8 = i3;
                        int i9 = i3 + 1;
                        bArr[i8] = BYTE_BACKSLASH;
                        i3 = i9 + 1;
                        bArr[i9] = (byte) i7;
                    } else if (i7 == -2) {
                        SerializableString escapeSequence = characterEscapes.getEscapeSequence(c);
                        if (escapeSequence == null) {
                            _reportError("Invalid custom escape definitions; custom escape not found for character code 0x" + Integer.toHexString(c) + ", although was supposed to have one");
                        }
                        i3 = _writeCustomEscape(bArr, i3, escapeSequence, i2 - i);
                    } else {
                        i3 = _writeGenericEscape(c, i3);
                    }
                }
            } else if (c > i4) {
                i3 = _writeGenericEscape(c, i3);
            } else {
                SerializableString escapeSequence2 = characterEscapes.getEscapeSequence(c);
                if (escapeSequence2 != null) {
                    i3 = _writeCustomEscape(bArr, i3, escapeSequence2, i2 - i);
                } else if (c <= 2047) {
                    int i10 = i3;
                    int i11 = i3 + 1;
                    bArr[i10] = (byte) (192 | (c >> 6));
                    i3 = i11 + 1;
                    bArr[i11] = (byte) (128 | (c & '?'));
                } else {
                    i3 = _outputMultiByteChar(c, i3);
                }
            }
        }
        this._outputTail = i3;
    }

    private final int _writeCustomEscape(byte[] bArr, int i, SerializableString serializableString, int i2) throws IOException, JsonGenerationException {
        byte[] asUnquotedUTF8 = serializableString.asUnquotedUTF8();
        int length = asUnquotedUTF8.length;
        if (length > 6) {
            return _handleLongCustomEscape(bArr, i, this._outputEnd, asUnquotedUTF8, i2);
        }
        System.arraycopy(asUnquotedUTF8, 0, bArr, i, length);
        return i + length;
    }

    private final int _handleLongCustomEscape(byte[] bArr, int i, int i2, byte[] bArr2, int i3) throws IOException, JsonGenerationException {
        int length = bArr2.length;
        if (i + length > i2) {
            this._outputTail = i;
            _flushBuffer();
            int i4 = this._outputTail;
            if (length > bArr.length) {
                this._outputStream.write(bArr2, 0, length);
                return i4;
            }
            System.arraycopy(bArr2, 0, bArr, i4, length);
            i = i4 + length;
        }
        if (i + (6 * i3) > i2) {
            _flushBuffer();
            return this._outputTail;
        }
        return i;
    }

    private final void _writeUTF8Segments(byte[] bArr, int i, int i2) throws IOException, JsonGenerationException {
        do {
            int min = Math.min(this._outputMaxContiguous, i2);
            _writeUTF8Segment(bArr, i, min);
            i += min;
            i2 -= min;
        } while (i2 > 0);
    }

    private final void _writeUTF8Segment(byte[] bArr, int i, int i2) throws IOException, JsonGenerationException {
        int[] iArr = this._outputEscapes;
        int i3 = i;
        int i4 = i + i2;
        while (i3 < i4) {
            int i5 = i3;
            i3++;
            byte b = bArr[i5];
            if (b >= 0 && iArr[b] != 0) {
                _writeUTF8Segment2(bArr, i, i2);
                return;
            }
        }
        if (this._outputTail + i2 > this._outputEnd) {
            _flushBuffer();
        }
        System.arraycopy(bArr, i, this._outputBuffer, this._outputTail, i2);
        this._outputTail += i2;
    }

    private final void _writeUTF8Segment2(byte[] bArr, int i, int i2) throws IOException, JsonGenerationException {
        int i3 = this._outputTail;
        if (i3 + (i2 * 6) > this._outputEnd) {
            _flushBuffer();
            i3 = this._outputTail;
        }
        byte[] bArr2 = this._outputBuffer;
        int[] iArr = this._outputEscapes;
        int i4 = i2 + i;
        while (i < i4) {
            int i5 = i;
            i++;
            byte b = bArr[i5];
            if (b < 0 || iArr[b] == 0) {
                int i6 = i3;
                i3++;
                bArr2[i6] = b;
            } else {
                int i7 = iArr[b];
                if (i7 > 0) {
                    int i8 = i3;
                    int i9 = i3 + 1;
                    bArr2[i8] = BYTE_BACKSLASH;
                    i3 = i9 + 1;
                    bArr2[i9] = (byte) i7;
                } else {
                    i3 = _writeGenericEscape(b, i3);
                }
            }
        }
        this._outputTail = i3;
    }

    protected final void _writeBinary(Base64Variant base64Variant, byte[] bArr, int i, int i2) throws IOException, JsonGenerationException {
        int i3 = i2 - 3;
        int i4 = this._outputEnd - 6;
        int maxLineLength = base64Variant.getMaxLineLength() >> 2;
        while (i <= i3) {
            if (this._outputTail > i4) {
                _flushBuffer();
            }
            int i5 = i;
            int i6 = i + 1;
            int i7 = i6 + 1;
            int i8 = ((bArr[i5] << 8) | (bArr[i6] & 255)) << 8;
            i = i7 + 1;
            this._outputTail = base64Variant.encodeBase64Chunk(i8 | (bArr[i7] & 255), this._outputBuffer, this._outputTail);
            maxLineLength--;
            if (maxLineLength <= 0) {
                byte[] bArr2 = this._outputBuffer;
                int i9 = this._outputTail;
                this._outputTail = i9 + 1;
                bArr2[i9] = BYTE_BACKSLASH;
                byte[] bArr3 = this._outputBuffer;
                int i10 = this._outputTail;
                this._outputTail = i10 + 1;
                bArr3[i10] = 110;
                maxLineLength = base64Variant.getMaxLineLength() >> 2;
            }
        }
        int i11 = i2 - i;
        if (i11 > 0) {
            if (this._outputTail > i4) {
                _flushBuffer();
            }
            int i12 = i;
            int i13 = i + 1;
            int i14 = bArr[i12] << 16;
            if (i11 == 2) {
                int i15 = i13 + 1;
                i14 |= (bArr[i13] & 255) << 8;
            }
            this._outputTail = base64Variant.encodeBase64Partial(i14, i11, this._outputBuffer, this._outputTail);
        }
    }

    protected final int _writeBinary(Base64Variant base64Variant, InputStream inputStream, byte[] bArr, int i) throws IOException, JsonGenerationException {
        int _readMore;
        int i2;
        int i3 = 0;
        int i4 = 0;
        int i5 = -3;
        int i6 = this._outputEnd - 6;
        int maxLineLength = base64Variant.getMaxLineLength() >> 2;
        while (i > 2) {
            if (i3 > i5) {
                i4 = _readMore(inputStream, bArr, i3, i4, i);
                i3 = 0;
                if (i4 < 3) {
                    break;
                }
                i5 = i4 - 3;
            }
            if (this._outputTail > i6) {
                _flushBuffer();
            }
            int i7 = i3;
            int i8 = i3 + 1;
            int i9 = i8 + 1;
            int i10 = ((bArr[i7] << 8) | (bArr[i8] & 255)) << 8;
            i3 = i9 + 1;
            i -= 3;
            this._outputTail = base64Variant.encodeBase64Chunk(i10 | (bArr[i9] & 255), this._outputBuffer, this._outputTail);
            maxLineLength--;
            if (maxLineLength <= 0) {
                byte[] bArr2 = this._outputBuffer;
                int i11 = this._outputTail;
                this._outputTail = i11 + 1;
                bArr2[i11] = BYTE_BACKSLASH;
                byte[] bArr3 = this._outputBuffer;
                int i12 = this._outputTail;
                this._outputTail = i12 + 1;
                bArr3[i12] = 110;
                maxLineLength = base64Variant.getMaxLineLength() >> 2;
            }
        }
        if (i > 0 && (_readMore = _readMore(inputStream, bArr, i3, i4, i)) > 0) {
            if (this._outputTail > i6) {
                _flushBuffer();
            }
            int i13 = 0 + 1;
            int i14 = bArr[0] << 16;
            if (i13 < _readMore) {
                i14 |= (bArr[i13] & 255) << 8;
                i2 = 2;
            } else {
                i2 = 1;
            }
            this._outputTail = base64Variant.encodeBase64Partial(i14, i2, this._outputBuffer, this._outputTail);
            i -= i2;
        }
        return i;
    }

    protected final int _writeBinary(Base64Variant base64Variant, InputStream inputStream, byte[] bArr) throws IOException, JsonGenerationException {
        int i = 0;
        int i2 = 0;
        int i3 = -3;
        int i4 = 0;
        int i5 = this._outputEnd - 6;
        int maxLineLength = base64Variant.getMaxLineLength() >> 2;
        while (true) {
            if (i > i3) {
                i2 = _readMore(inputStream, bArr, i, i2, bArr.length);
                i = 0;
                if (i2 < 3) {
                    break;
                }
                i3 = i2 - 3;
            }
            if (this._outputTail > i5) {
                _flushBuffer();
            }
            int i6 = i;
            int i7 = i + 1;
            int i8 = i7 + 1;
            int i9 = ((bArr[i6] << 8) | (bArr[i7] & 255)) << 8;
            i = i8 + 1;
            i4 += 3;
            this._outputTail = base64Variant.encodeBase64Chunk(i9 | (bArr[i8] & 255), this._outputBuffer, this._outputTail);
            maxLineLength--;
            if (maxLineLength <= 0) {
                byte[] bArr2 = this._outputBuffer;
                int i10 = this._outputTail;
                this._outputTail = i10 + 1;
                bArr2[i10] = BYTE_BACKSLASH;
                byte[] bArr3 = this._outputBuffer;
                int i11 = this._outputTail;
                this._outputTail = i11 + 1;
                bArr3[i11] = 110;
                maxLineLength = base64Variant.getMaxLineLength() >> 2;
            }
        }
        if (0 < i2) {
            if (this._outputTail > i5) {
                _flushBuffer();
            }
            int i12 = 0 + 1;
            int i13 = bArr[0] << 16;
            int i14 = 1;
            if (i12 < i2) {
                i13 |= (bArr[i12] & 255) << 8;
                i14 = 2;
            }
            i4 += i14;
            this._outputTail = base64Variant.encodeBase64Partial(i13, i14, this._outputBuffer, this._outputTail);
        }
        return i4;
    }

    private final int _readMore(InputStream inputStream, byte[] bArr, int i, int i2, int i3) throws IOException {
        int i4 = 0;
        while (i < i2) {
            int i5 = i4;
            i4++;
            int i6 = i;
            i++;
            bArr[i5] = bArr[i6];
        }
        int i7 = i4;
        int min = Math.min(i3, bArr.length);
        do {
            int i8 = min - i7;
            if (i8 == 0) {
                break;
            }
            int read = inputStream.read(bArr, i7, i8);
            if (read < 0) {
                return i7;
            }
            i7 += read;
        } while (i7 < 3);
        return i7;
    }

    private final int _outputRawMultiByteChar(int i, char[] cArr, int i2, int i3) throws IOException {
        if (i >= SURR1_FIRST && i <= SURR2_LAST) {
            if (i2 >= i3 || cArr == null) {
                _reportError("Split surrogate on writeRaw() input (last character)");
            }
            _outputSurrogates(i, cArr[i2]);
            return i2 + 1;
        }
        byte[] bArr = this._outputBuffer;
        int i4 = this._outputTail;
        this._outputTail = i4 + 1;
        bArr[i4] = (byte) (224 | (i >> 12));
        int i5 = this._outputTail;
        this._outputTail = i5 + 1;
        bArr[i5] = (byte) (128 | ((i >> 6) & 63));
        int i6 = this._outputTail;
        this._outputTail = i6 + 1;
        bArr[i6] = (byte) (128 | (i & 63));
        return i2;
    }

    protected final void _outputSurrogates(int i, int i2) throws IOException {
        int _decodeSurrogate = _decodeSurrogate(i, i2);
        if (this._outputTail + 4 > this._outputEnd) {
            _flushBuffer();
        }
        byte[] bArr = this._outputBuffer;
        int i3 = this._outputTail;
        this._outputTail = i3 + 1;
        bArr[i3] = (byte) (240 | (_decodeSurrogate >> 18));
        int i4 = this._outputTail;
        this._outputTail = i4 + 1;
        bArr[i4] = (byte) (128 | ((_decodeSurrogate >> 12) & 63));
        int i5 = this._outputTail;
        this._outputTail = i5 + 1;
        bArr[i5] = (byte) (128 | ((_decodeSurrogate >> 6) & 63));
        int i6 = this._outputTail;
        this._outputTail = i6 + 1;
        bArr[i6] = (byte) (128 | (_decodeSurrogate & 63));
    }

    private final int _outputMultiByteChar(int i, int i2) throws IOException {
        int i3;
        byte[] bArr = this._outputBuffer;
        if (i >= SURR1_FIRST && i <= SURR2_LAST) {
            int i4 = i2 + 1;
            bArr[i2] = BYTE_BACKSLASH;
            int i5 = i4 + 1;
            bArr[i4] = BYTE_u;
            int i6 = i5 + 1;
            bArr[i5] = HEX_CHARS[(i >> 12) & 15];
            int i7 = i6 + 1;
            bArr[i6] = HEX_CHARS[(i >> 8) & 15];
            int i8 = i7 + 1;
            bArr[i7] = HEX_CHARS[(i >> 4) & 15];
            i3 = i8 + 1;
            bArr[i8] = HEX_CHARS[i & 15];
        } else {
            int i9 = i2 + 1;
            bArr[i2] = (byte) (224 | (i >> 12));
            int i10 = i9 + 1;
            bArr[i9] = (byte) (128 | ((i >> 6) & 63));
            i3 = i10 + 1;
            bArr[i10] = (byte) (128 | (i & 63));
        }
        return i3;
    }

    protected final int _decodeSurrogate(int i, int i2) throws IOException {
        if (i2 < SURR2_FIRST || i2 > SURR2_LAST) {
            _reportError("Incomplete surrogate pair: first char 0x" + Integer.toHexString(i) + ", second 0x" + Integer.toHexString(i2));
        }
        return 65536 + ((i - SURR1_FIRST) << 10) + (i2 - SURR2_FIRST);
    }

    private final void _writeNull() throws IOException {
        if (this._outputTail + 4 >= this._outputEnd) {
            _flushBuffer();
        }
        System.arraycopy(NULL_BYTES, 0, this._outputBuffer, this._outputTail, 4);
        this._outputTail += 4;
    }

    private int _writeGenericEscape(int i, int i2) throws IOException {
        int i3;
        byte[] bArr = this._outputBuffer;
        int i4 = i2 + 1;
        bArr[i2] = BYTE_BACKSLASH;
        int i5 = i4 + 1;
        bArr[i4] = BYTE_u;
        if (i > 255) {
            int i6 = (i >> 8) & 255;
            int i7 = i5 + 1;
            bArr[i5] = HEX_CHARS[i6 >> 4];
            i3 = i7 + 1;
            bArr[i7] = HEX_CHARS[i6 & 15];
            i &= 255;
        } else {
            int i8 = i5 + 1;
            bArr[i5] = BYTE_0;
            i3 = i8 + 1;
            bArr[i8] = BYTE_0;
        }
        int i9 = i3;
        int i10 = i3 + 1;
        bArr[i9] = HEX_CHARS[i >> 4];
        int i11 = i10 + 1;
        bArr[i10] = HEX_CHARS[i & 15];
        return i11;
    }

    protected final void _flushBuffer() throws IOException {
        int i = this._outputTail;
        if (i > 0) {
            this._outputTail = 0;
            this._outputStream.write(this._outputBuffer, 0, i);
        }
    }
}
