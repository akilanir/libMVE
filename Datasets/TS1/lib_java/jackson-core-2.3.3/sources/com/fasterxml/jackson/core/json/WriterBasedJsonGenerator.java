package com.fasterxml.jackson.core.json;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.core.io.CharTypes;
import com.fasterxml.jackson.core.io.IOContext;
import com.fasterxml.jackson.core.io.NumberOutput;
import java.io.IOException;
import java.io.InputStream;
import java.io.Writer;
import java.math.BigDecimal;
import java.math.BigInteger;

/* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/json/WriterBasedJsonGenerator.class */
public final class WriterBasedJsonGenerator extends JsonGeneratorImpl {
    protected static final int SHORT_WRITE = 32;
    protected static final char[] HEX_CHARS = CharTypes.copyHexChars();
    protected final Writer _writer;
    protected char[] _outputBuffer;
    protected int _outputHead;
    protected int _outputTail;
    protected int _outputEnd;
    protected char[] _entityBuffer;
    protected SerializableString _currentEscape;

    public WriterBasedJsonGenerator(IOContext iOContext, int i, ObjectCodec objectCodec, Writer writer) {
        super(iOContext, i, objectCodec);
        this._outputHead = 0;
        this._outputTail = 0;
        this._writer = writer;
        this._outputBuffer = iOContext.allocConcatBuffer();
        this._outputEnd = this._outputBuffer.length;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public Object getOutputTarget() {
        return this._writer;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeFieldName(String str) throws IOException, JsonGenerationException {
        int writeFieldName = this._writeContext.writeFieldName(str);
        if (writeFieldName == 4) {
            _reportError("Can not write a field name, expecting a value");
        }
        _writeFieldName(str, writeFieldName == 1);
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase, com.fasterxml.jackson.core.JsonGenerator
    public void writeFieldName(SerializableString serializableString) throws IOException, JsonGenerationException {
        int writeFieldName = this._writeContext.writeFieldName(serializableString.getValue());
        if (writeFieldName == 4) {
            _reportError("Can not write a field name, expecting a value");
        }
        _writeFieldName(serializableString, writeFieldName == 1);
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeStartArray() throws IOException, JsonGenerationException {
        _verifyValueWrite("start an array");
        this._writeContext = this._writeContext.createChildArrayContext();
        if (this._cfgPrettyPrinter != null) {
            this._cfgPrettyPrinter.writeStartArray(this);
            return;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = '[';
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeEndArray() throws IOException, JsonGenerationException {
        if (!this._writeContext.inArray()) {
            _reportError("Current context not an ARRAY but " + this._writeContext.getTypeDesc());
        }
        if (this._cfgPrettyPrinter != null) {
            this._cfgPrettyPrinter.writeEndArray(this, this._writeContext.getEntryCount());
        } else {
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            char[] cArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            cArr[i] = ']';
        }
        this._writeContext = this._writeContext.getParent();
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeStartObject() throws IOException, JsonGenerationException {
        _verifyValueWrite("start an object");
        this._writeContext = this._writeContext.createChildObjectContext();
        if (this._cfgPrettyPrinter != null) {
            this._cfgPrettyPrinter.writeStartObject(this);
            return;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = '{';
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeEndObject() throws IOException, JsonGenerationException {
        if (!this._writeContext.inObject()) {
            _reportError("Current context not an object but " + this._writeContext.getTypeDesc());
        }
        if (this._cfgPrettyPrinter != null) {
            this._cfgPrettyPrinter.writeEndObject(this, this._writeContext.getEntryCount());
        } else {
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            char[] cArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            cArr[i] = '}';
        }
        this._writeContext = this._writeContext.getParent();
    }

    protected void _writeFieldName(String str, boolean z) throws IOException, JsonGenerationException {
        if (this._cfgPrettyPrinter != null) {
            _writePPFieldName(str, z);
            return;
        }
        if (this._outputTail + 1 >= this._outputEnd) {
            _flushBuffer();
        }
        if (z) {
            char[] cArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            cArr[i] = ',';
        }
        if (!isEnabled(JsonGenerator.Feature.QUOTE_FIELD_NAMES)) {
            _writeString(str);
            return;
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = '\"';
        _writeString(str);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr3 = this._outputBuffer;
        int i3 = this._outputTail;
        this._outputTail = i3 + 1;
        cArr3[i3] = '\"';
    }

    public void _writeFieldName(SerializableString serializableString, boolean z) throws IOException, JsonGenerationException {
        if (this._cfgPrettyPrinter != null) {
            _writePPFieldName(serializableString, z);
            return;
        }
        if (this._outputTail + 1 >= this._outputEnd) {
            _flushBuffer();
        }
        if (z) {
            char[] cArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            cArr[i] = ',';
        }
        char[] asQuotedChars = serializableString.asQuotedChars();
        if (!isEnabled(JsonGenerator.Feature.QUOTE_FIELD_NAMES)) {
            writeRaw(asQuotedChars, 0, asQuotedChars.length);
            return;
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = '\"';
        int length = asQuotedChars.length;
        if (this._outputTail + length + 1 >= this._outputEnd) {
            writeRaw(asQuotedChars, 0, length);
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            char[] cArr3 = this._outputBuffer;
            int i3 = this._outputTail;
            this._outputTail = i3 + 1;
            cArr3[i3] = '\"';
            return;
        }
        System.arraycopy(asQuotedChars, 0, this._outputBuffer, this._outputTail, length);
        this._outputTail += length;
        char[] cArr4 = this._outputBuffer;
        int i4 = this._outputTail;
        this._outputTail = i4 + 1;
        cArr4[i4] = '\"';
    }

    protected void _writePPFieldName(String str, boolean z) throws IOException, JsonGenerationException {
        if (z) {
            this._cfgPrettyPrinter.writeObjectEntrySeparator(this);
        } else {
            this._cfgPrettyPrinter.beforeObjectEntries(this);
        }
        if (isEnabled(JsonGenerator.Feature.QUOTE_FIELD_NAMES)) {
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            char[] cArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            cArr[i] = '\"';
            _writeString(str);
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            char[] cArr2 = this._outputBuffer;
            int i2 = this._outputTail;
            this._outputTail = i2 + 1;
            cArr2[i2] = '\"';
            return;
        }
        _writeString(str);
    }

    protected void _writePPFieldName(SerializableString serializableString, boolean z) throws IOException, JsonGenerationException {
        if (z) {
            this._cfgPrettyPrinter.writeObjectEntrySeparator(this);
        } else {
            this._cfgPrettyPrinter.beforeObjectEntries(this);
        }
        char[] asQuotedChars = serializableString.asQuotedChars();
        if (isEnabled(JsonGenerator.Feature.QUOTE_FIELD_NAMES)) {
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            char[] cArr = this._outputBuffer;
            int i = this._outputTail;
            this._outputTail = i + 1;
            cArr[i] = '\"';
            writeRaw(asQuotedChars, 0, asQuotedChars.length);
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            char[] cArr2 = this._outputBuffer;
            int i2 = this._outputTail;
            this._outputTail = i2 + 1;
            cArr2[i2] = '\"';
            return;
        }
        writeRaw(asQuotedChars, 0, asQuotedChars.length);
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeString(String str) throws IOException, JsonGenerationException {
        _verifyValueWrite("write text value");
        if (str == null) {
            _writeNull();
            return;
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = '\"';
        _writeString(str);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = '\"';
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeString(char[] cArr, int i, int i2) throws IOException, JsonGenerationException {
        _verifyValueWrite("write text value");
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr2 = this._outputBuffer;
        int i3 = this._outputTail;
        this._outputTail = i3 + 1;
        cArr2[i3] = '\"';
        _writeString(cArr, i, i2);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr3 = this._outputBuffer;
        int i4 = this._outputTail;
        this._outputTail = i4 + 1;
        cArr3[i4] = '\"';
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase, com.fasterxml.jackson.core.JsonGenerator
    public void writeString(SerializableString serializableString) throws IOException, JsonGenerationException {
        _verifyValueWrite("write text value");
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = '\"';
        char[] asQuotedChars = serializableString.asQuotedChars();
        int length = asQuotedChars.length;
        if (length < SHORT_WRITE) {
            if (length > this._outputEnd - this._outputTail) {
                _flushBuffer();
            }
            System.arraycopy(asQuotedChars, 0, this._outputBuffer, this._outputTail, length);
            this._outputTail += length;
        } else {
            _flushBuffer();
            this._writer.write(asQuotedChars, 0, length);
        }
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = '\"';
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRawUTF8String(byte[] bArr, int i, int i2) throws IOException, JsonGenerationException {
        _reportUnsupportedOperation();
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeUTF8String(byte[] bArr, int i, int i2) throws IOException, JsonGenerationException {
        _reportUnsupportedOperation();
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRaw(String str) throws IOException, JsonGenerationException {
        int length = str.length();
        int i = this._outputEnd - this._outputTail;
        if (i == 0) {
            _flushBuffer();
            i = this._outputEnd - this._outputTail;
        }
        if (i >= length) {
            str.getChars(0, length, this._outputBuffer, this._outputTail);
            this._outputTail += length;
        } else {
            writeRawLong(str);
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRaw(String str, int i, int i2) throws IOException, JsonGenerationException {
        int i3 = this._outputEnd - this._outputTail;
        if (i3 < i2) {
            _flushBuffer();
            i3 = this._outputEnd - this._outputTail;
        }
        if (i3 >= i2) {
            str.getChars(i, i + i2, this._outputBuffer, this._outputTail);
            this._outputTail += i2;
        } else {
            writeRawLong(str.substring(i, i + i2));
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRaw(SerializableString serializableString) throws IOException, JsonGenerationException {
        writeRaw(serializableString.getValue());
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRaw(char[] cArr, int i, int i2) throws IOException, JsonGenerationException {
        if (i2 < SHORT_WRITE) {
            if (i2 > this._outputEnd - this._outputTail) {
                _flushBuffer();
            }
            System.arraycopy(cArr, i, this._outputBuffer, this._outputTail, i2);
            this._outputTail += i2;
            return;
        }
        _flushBuffer();
        this._writer.write(cArr, i, i2);
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRaw(char c) throws IOException, JsonGenerationException {
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = c;
    }

    private void writeRawLong(String str) throws IOException, JsonGenerationException {
        int i = this._outputEnd - this._outputTail;
        str.getChars(0, i, this._outputBuffer, this._outputTail);
        this._outputTail += i;
        _flushBuffer();
        int i2 = i;
        int length = str.length();
        int i3 = i;
        while (true) {
            int i4 = length - i3;
            if (i4 > this._outputEnd) {
                int i5 = this._outputEnd;
                str.getChars(i2, i2 + i5, this._outputBuffer, 0);
                this._outputHead = 0;
                this._outputTail = i5;
                _flushBuffer();
                i2 += i5;
                length = i4;
                i3 = i5;
            } else {
                str.getChars(i2, i2 + i4, this._outputBuffer, 0);
                this._outputHead = 0;
                this._outputTail = i4;
                return;
            }
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeBinary(Base64Variant base64Variant, byte[] bArr, int i, int i2) throws IOException, JsonGenerationException {
        _verifyValueWrite("write binary value");
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i3 = this._outputTail;
        this._outputTail = i3 + 1;
        cArr[i3] = '\"';
        _writeBinary(base64Variant, bArr, i, i + i2);
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr2 = this._outputBuffer;
        int i4 = this._outputTail;
        this._outputTail = i4 + 1;
        cArr2[i4] = '\"';
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase, com.fasterxml.jackson.core.JsonGenerator
    public int writeBinary(Base64Variant base64Variant, InputStream inputStream, int i) throws IOException, JsonGenerationException {
        int i2;
        _verifyValueWrite("write binary value");
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i3 = this._outputTail;
        this._outputTail = i3 + 1;
        cArr[i3] = '\"';
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
            char[] cArr2 = this._outputBuffer;
            int i4 = this._outputTail;
            this._outputTail = i4 + 1;
            cArr2[i4] = '\"';
            return i2;
        } finally {
            this._ioContext.releaseBase64Buffer(allocBase64Buffer);
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(short s) throws IOException, JsonGenerationException {
        _verifyValueWrite("write number");
        if (this._cfgNumbersAsStrings) {
            _writeQuotedShort(s);
            return;
        }
        if (this._outputTail + 6 >= this._outputEnd) {
            _flushBuffer();
        }
        this._outputTail = NumberOutput.outputInt(s, this._outputBuffer, this._outputTail);
    }

    private void _writeQuotedShort(short s) throws IOException {
        if (this._outputTail + 8 >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = '\"';
        this._outputTail = NumberOutput.outputInt(s, this._outputBuffer, this._outputTail);
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = '\"';
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNumber(int i) throws IOException, JsonGenerationException {
        _verifyValueWrite("write number");
        if (this._cfgNumbersAsStrings) {
            _writeQuotedInt(i);
            return;
        }
        if (this._outputTail + 11 >= this._outputEnd) {
            _flushBuffer();
        }
        this._outputTail = NumberOutput.outputInt(i, this._outputBuffer, this._outputTail);
    }

    private void _writeQuotedInt(int i) throws IOException {
        if (this._outputTail + 13 >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr[i2] = '\"';
        this._outputTail = NumberOutput.outputInt(i, this._outputBuffer, this._outputTail);
        char[] cArr2 = this._outputBuffer;
        int i3 = this._outputTail;
        this._outputTail = i3 + 1;
        cArr2[i3] = '\"';
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

    private void _writeQuotedLong(long j) throws IOException {
        if (this._outputTail + 23 >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = '\"';
        this._outputTail = NumberOutput.outputLong(j, this._outputBuffer, this._outputTail);
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = '\"';
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

    private void _writeQuotedRaw(Object obj) throws IOException {
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = i + 1;
        cArr[i] = '\"';
        writeRaw(obj.toString());
        if (this._outputTail >= this._outputEnd) {
            _flushBuffer();
        }
        char[] cArr2 = this._outputBuffer;
        int i2 = this._outputTail;
        this._outputTail = i2 + 1;
        cArr2[i2] = '\"';
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeBoolean(boolean z) throws IOException, JsonGenerationException {
        int i;
        _verifyValueWrite("write boolean value");
        if (this._outputTail + 5 >= this._outputEnd) {
            _flushBuffer();
        }
        int i2 = this._outputTail;
        char[] cArr = this._outputBuffer;
        if (z) {
            cArr[i2] = 't';
            int i3 = i2 + 1;
            cArr[i3] = 'r';
            int i4 = i3 + 1;
            cArr[i4] = 'u';
            i = i4 + 1;
            cArr[i] = 'e';
        } else {
            cArr[i2] = 'f';
            int i5 = i2 + 1;
            cArr[i5] = 'a';
            int i6 = i5 + 1;
            cArr[i6] = 'l';
            int i7 = i6 + 1;
            cArr[i7] = 's';
            i = i7 + 1;
            cArr[i] = 'e';
        }
        this._outputTail = i + 1;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeNull() throws IOException, JsonGenerationException {
        _verifyValueWrite("write null value");
        _writeNull();
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase
    protected void _verifyValueWrite(String str) throws IOException, JsonGenerationException {
        char c;
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
                    c = ',';
                    break;
                case 2:
                    c = ':';
                    break;
                case 3:
                    if (this._rootValueSeparator != null) {
                        writeRaw(this._rootValueSeparator.getValue());
                        return;
                    }
                    return;
            }
            if (this._outputTail >= this._outputEnd) {
                _flushBuffer();
            }
            this._outputBuffer[this._outputTail] = c;
            this._outputTail++;
            return;
        }
        _verifyPrettyValueWrite(str, writeValue);
    }

    protected void _verifyPrettyValueWrite(String str, int i) throws IOException, JsonGenerationException {
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
        if (this._writer != null && isEnabled(JsonGenerator.Feature.FLUSH_PASSED_TO_STREAM)) {
            this._writer.flush();
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
        if (this._writer != null) {
            if (this._ioContext.isResourceManaged() || isEnabled(JsonGenerator.Feature.AUTO_CLOSE_TARGET)) {
                this._writer.close();
            } else if (isEnabled(JsonGenerator.Feature.FLUSH_PASSED_TO_STREAM)) {
                this._writer.flush();
            }
        }
        _releaseBuffers();
    }

    @Override // com.fasterxml.jackson.core.base.GeneratorBase
    protected void _releaseBuffers() {
        char[] cArr = this._outputBuffer;
        if (cArr != null) {
            this._outputBuffer = null;
            this._ioContext.releaseConcatBuffer(cArr);
        }
    }

    private void _writeString(String str) throws IOException, JsonGenerationException {
        int length = str.length();
        if (length > this._outputEnd) {
            _writeLongString(str);
            return;
        }
        if (this._outputTail + length > this._outputEnd) {
            _flushBuffer();
        }
        str.getChars(0, length, this._outputBuffer, this._outputTail);
        if (this._characterEscapes != null) {
            _writeStringCustom(length);
        } else if (this._maximumNonEscapedChar != 0) {
            _writeStringASCII(length, this._maximumNonEscapedChar);
        } else {
            _writeString2(length);
        }
    }

    private void _writeString2(int i) throws IOException, JsonGenerationException {
        int i2;
        int i3 = this._outputTail + i;
        int[] iArr = this._outputEscapes;
        int length = iArr.length;
        while (this._outputTail < i3) {
            do {
                char c = this._outputBuffer[this._outputTail];
                if (c >= length || iArr[c] == 0) {
                    i2 = this._outputTail + 1;
                    this._outputTail = i2;
                } else {
                    int i4 = this._outputTail - this._outputHead;
                    if (i4 > 0) {
                        this._writer.write(this._outputBuffer, this._outputHead, i4);
                    }
                    char[] cArr = this._outputBuffer;
                    int i5 = this._outputTail;
                    this._outputTail = i5 + 1;
                    char c2 = cArr[i5];
                    _prependOrWriteCharacterEscape(c2, iArr[c2]);
                }
            } while (i2 < i3);
            return;
        }
    }

    private void _writeLongString(String str) throws IOException, JsonGenerationException {
        _flushBuffer();
        int length = str.length();
        int i = 0;
        do {
            int i2 = this._outputEnd;
            int i3 = i + i2 > length ? length - i : i2;
            str.getChars(i, i + i3, this._outputBuffer, 0);
            if (this._characterEscapes != null) {
                _writeSegmentCustom(i3);
            } else if (this._maximumNonEscapedChar != 0) {
                _writeSegmentASCII(i3, this._maximumNonEscapedChar);
            } else {
                _writeSegment(i3);
            }
            i += i3;
        } while (i < length);
    }

    private void _writeSegment(int i) throws IOException, JsonGenerationException {
        char c;
        int[] iArr = this._outputEscapes;
        int length = iArr.length;
        int i2 = 0;
        int i3 = 0;
        while (true) {
            int i4 = i3;
            if (i2 < i) {
                do {
                    c = this._outputBuffer[i2];
                    if (c < length && iArr[c] != 0) {
                        break;
                    } else {
                        i2++;
                    }
                } while (i2 < i);
                int i5 = i2 - i4;
                if (i5 > 0) {
                    this._writer.write(this._outputBuffer, i4, i5);
                    if (i2 >= i) {
                        return;
                    }
                }
                i2++;
                i3 = _prependOrWriteCharacterEscape(this._outputBuffer, i2, i, c, iArr[c]);
            } else {
                return;
            }
        }
    }

    private void _writeString(char[] cArr, int i, int i2) throws IOException, JsonGenerationException {
        if (this._characterEscapes != null) {
            _writeStringCustom(cArr, i, i2);
            return;
        }
        if (this._maximumNonEscapedChar != 0) {
            _writeStringASCII(cArr, i, i2, this._maximumNonEscapedChar);
            return;
        }
        int i3 = i2 + i;
        int[] iArr = this._outputEscapes;
        int length = iArr.length;
        while (i < i3) {
            int i4 = i;
            do {
                char c = cArr[i];
                if (c < length && iArr[c] != 0) {
                    break;
                } else {
                    i++;
                }
            } while (i < i3);
            int i5 = i - i4;
            if (i5 < SHORT_WRITE) {
                if (this._outputTail + i5 > this._outputEnd) {
                    _flushBuffer();
                }
                if (i5 > 0) {
                    System.arraycopy(cArr, i4, this._outputBuffer, this._outputTail, i5);
                    this._outputTail += i5;
                }
            } else {
                _flushBuffer();
                this._writer.write(cArr, i4, i5);
            }
            if (i < i3) {
                int i6 = i;
                i++;
                char c2 = cArr[i6];
                _appendCharacterEscape(c2, iArr[c2]);
            } else {
                return;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0083 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _writeStringASCII(int r6, int r7) throws java.io.IOException, com.fasterxml.jackson.core.JsonGenerationException {
        /*
            r5 = this;
            r0 = r5
            int r0 = r0._outputTail
            r1 = r6
            int r0 = r0 + r1
            r8 = r0
            r0 = r5
            int[] r0 = r0._outputEscapes
            r9 = r0
            r0 = r9
            int r0 = r0.length
            r1 = r7
            r2 = 1
            int r1 = r1 + r2
            int r0 = java.lang.Math.min(r0, r1)
            r10 = r0
            r0 = 0
            r11 = r0
        L1b:
            r0 = r5
            int r0 = r0._outputTail
            r1 = r8
            if (r0 >= r1) goto L98
        L23:
            r0 = r5
            char[] r0 = r0._outputBuffer
            r1 = r5
            int r1 = r1._outputTail
            char r0 = r0[r1]
            r12 = r0
            r0 = r12
            r1 = r10
            if (r0 >= r1) goto L44
            r0 = r9
            r1 = r12
            r0 = r0[r1]
            r11 = r0
            r0 = r11
            if (r0 == 0) goto L50
            goto L62
        L44:
            r0 = r12
            r1 = r7
            if (r0 <= r1) goto L50
            r0 = -1
            r11 = r0
            goto L62
        L50:
            r0 = r5
            r1 = r0
            int r1 = r1._outputTail
            r2 = 1
            int r1 = r1 + r2
            r2 = r1; r1 = r0; r0 = r2; 
            r1._outputTail = r2
            r1 = r8
            if (r0 < r1) goto L23
            goto L98
        L62:
            r0 = r5
            int r0 = r0._outputTail
            r1 = r5
            int r1 = r1._outputHead
            int r0 = r0 - r1
            r13 = r0
            r0 = r13
            if (r0 <= 0) goto L83
            r0 = r5
            java.io.Writer r0 = r0._writer
            r1 = r5
            char[] r1 = r1._outputBuffer
            r2 = r5
            int r2 = r2._outputHead
            r3 = r13
            r0.write(r1, r2, r3)
        L83:
            r0 = r5
            r1 = r0
            int r1 = r1._outputTail
            r2 = 1
            int r1 = r1 + r2
            r0._outputTail = r1
            r0 = r5
            r1 = r12
            r2 = r11
            r0._prependOrWriteCharacterEscape(r1, r2)
            goto L1b
        L98:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.WriterBasedJsonGenerator._writeStringASCII(int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0049 A[PHI: r13
      0x0049: PHI (r13v5 int) = (r13v2 int), (r13v6 int) binds: [B:11:0x0040, B:8:0x0037] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _writeSegmentASCII(int r8, int r9) throws java.io.IOException, com.fasterxml.jackson.core.JsonGenerationException {
        /*
            r7 = this;
            r0 = r7
            int[] r0 = r0._outputEscapes
            r10 = r0
            r0 = r10
            int r0 = r0.length
            r1 = r9
            r2 = 1
            int r1 = r1 + r2
            int r0 = java.lang.Math.min(r0, r1)
            r11 = r0
            r0 = 0
            r12 = r0
            r0 = 0
            r13 = r0
            r0 = r12
            r14 = r0
        L19:
            r0 = r12
            r1 = r8
            if (r0 >= r1) goto L90
        L1f:
            r0 = r7
            char[] r0 = r0._outputBuffer
            r1 = r12
            char r0 = r0[r1]
            r15 = r0
            r0 = r15
            r1 = r11
            if (r0 >= r1) goto L3d
            r0 = r10
            r1 = r15
            r0 = r0[r1]
            r13 = r0
            r0 = r13
            if (r0 == 0) goto L49
            goto L55
        L3d:
            r0 = r15
            r1 = r9
            if (r0 <= r1) goto L49
            r0 = -1
            r13 = r0
            goto L55
        L49:
            int r12 = r12 + 1
            r0 = r12
            r1 = r8
            if (r0 < r1) goto L1f
            goto L55
        L55:
            r0 = r12
            r1 = r14
            int r0 = r0 - r1
            r16 = r0
            r0 = r16
            if (r0 <= 0) goto L79
            r0 = r7
            java.io.Writer r0 = r0._writer
            r1 = r7
            char[] r1 = r1._outputBuffer
            r2 = r14
            r3 = r16
            r0.write(r1, r2, r3)
            r0 = r12
            r1 = r8
            if (r0 < r1) goto L79
            goto L90
        L79:
            int r12 = r12 + 1
            r0 = r7
            r1 = r7
            char[] r1 = r1._outputBuffer
            r2 = r12
            r3 = r8
            r4 = r15
            r5 = r13
            int r0 = r0._prependOrWriteCharacterEscape(r1, r2, r3, r4, r5)
            r14 = r0
            goto L19
        L90:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.WriterBasedJsonGenerator._writeSegmentASCII(int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0049 A[PHI: r13
      0x0049: PHI (r13v5 int) = (r13v2 int), (r13v6 int) binds: [B:12:0x0040, B:9:0x0036] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _writeStringASCII(char[] r7, int r8, int r9, int r10) throws java.io.IOException, com.fasterxml.jackson.core.JsonGenerationException {
        /*
            r6 = this;
            r0 = r9
            r1 = r8
            int r0 = r0 + r1
            r9 = r0
            r0 = r6
            int[] r0 = r0._outputEscapes
            r11 = r0
            r0 = r11
            int r0 = r0.length
            r1 = r10
            r2 = 1
            int r1 = r1 + r2
            int r0 = java.lang.Math.min(r0, r1)
            r12 = r0
            r0 = 0
            r13 = r0
        L19:
            r0 = r8
            r1 = r9
            if (r0 >= r1) goto Lbc
            r0 = r8
            r14 = r0
        L21:
            r0 = r7
            r1 = r8
            char r0 = r0[r1]
            r15 = r0
            r0 = r15
            r1 = r12
            if (r0 >= r1) goto L3c
            r0 = r11
            r1 = r15
            r0 = r0[r1]
            r13 = r0
            r0 = r13
            if (r0 == 0) goto L49
            goto L54
        L3c:
            r0 = r15
            r1 = r10
            if (r0 <= r1) goto L49
            r0 = -1
            r13 = r0
            goto L54
        L49:
            int r8 = r8 + 1
            r0 = r8
            r1 = r9
            if (r0 < r1) goto L21
            goto L54
        L54:
            r0 = r8
            r1 = r14
            int r0 = r0 - r1
            r16 = r0
            r0 = r16
            r1 = 32
            if (r0 >= r1) goto L96
            r0 = r6
            int r0 = r0._outputTail
            r1 = r16
            int r0 = r0 + r1
            r1 = r6
            int r1 = r1._outputEnd
            if (r0 <= r1) goto L73
            r0 = r6
            r0._flushBuffer()
        L73:
            r0 = r16
            if (r0 <= 0) goto La6
            r0 = r7
            r1 = r14
            r2 = r6
            char[] r2 = r2._outputBuffer
            r3 = r6
            int r3 = r3._outputTail
            r4 = r16
            java.lang.System.arraycopy(r0, r1, r2, r3, r4)
            r0 = r6
            r1 = r0
            int r1 = r1._outputTail
            r2 = r16
            int r1 = r1 + r2
            r0._outputTail = r1
            goto La6
        L96:
            r0 = r6
            r0._flushBuffer()
            r0 = r6
            java.io.Writer r0 = r0._writer
            r1 = r7
            r2 = r14
            r3 = r16
            r0.write(r1, r2, r3)
        La6:
            r0 = r8
            r1 = r9
            if (r0 < r1) goto Lae
            goto Lbc
        Lae:
            int r8 = r8 + 1
            r0 = r6
            r1 = r15
            r2 = r13
            r0._appendCharacterEscape(r1, r2)
            goto L19
        Lbc:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.WriterBasedJsonGenerator._writeStringASCII(char[], int, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00b1 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _writeStringCustom(int r6) throws java.io.IOException, com.fasterxml.jackson.core.JsonGenerationException {
        /*
            Method dump skipped, instructions count: 199
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.WriterBasedJsonGenerator._writeStringCustom(int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0077 A[PHI: r14
      0x0077: PHI (r14v6 int) = (r14v2 int), (r14v7 int) binds: [B:18:0x006d, B:12:0x004f] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _writeSegmentCustom(int r8) throws java.io.IOException, com.fasterxml.jackson.core.JsonGenerationException {
        /*
            r7 = this;
            r0 = r7
            int[] r0 = r0._outputEscapes
            r9 = r0
            r0 = r7
            int r0 = r0._maximumNonEscapedChar
            r1 = 1
            if (r0 >= r1) goto L12
            r0 = 65535(0xffff, float:9.1834E-41)
            goto L16
        L12:
            r0 = r7
            int r0 = r0._maximumNonEscapedChar
        L16:
            r10 = r0
            r0 = r9
            int r0 = r0.length
            r1 = r10
            r2 = 1
            int r1 = r1 + r2
            int r0 = java.lang.Math.min(r0, r1)
            r11 = r0
            r0 = r7
            com.fasterxml.jackson.core.io.CharacterEscapes r0 = r0._characterEscapes
            r12 = r0
            r0 = 0
            r13 = r0
            r0 = 0
            r14 = r0
            r0 = r13
            r15 = r0
        L31:
            r0 = r13
            r1 = r8
            if (r0 >= r1) goto Lbe
        L37:
            r0 = r7
            char[] r0 = r0._outputBuffer
            r1 = r13
            char r0 = r0[r1]
            r16 = r0
            r0 = r16
            r1 = r11
            if (r0 >= r1) goto L55
            r0 = r9
            r1 = r16
            r0 = r0[r1]
            r14 = r0
            r0 = r14
            if (r0 == 0) goto L77
            goto L83
        L55:
            r0 = r16
            r1 = r10
            if (r0 <= r1) goto L61
            r0 = -1
            r14 = r0
            goto L83
        L61:
            r0 = r7
            r1 = r12
            r2 = r16
            com.fasterxml.jackson.core.SerializableString r1 = r1.getEscapeSequence(r2)
            r2 = r1; r1 = r0; r0 = r2; 
            r1._currentEscape = r2
            if (r0 == 0) goto L77
            r0 = -2
            r14 = r0
            goto L83
        L77:
            int r13 = r13 + 1
            r0 = r13
            r1 = r8
            if (r0 < r1) goto L37
            goto L83
        L83:
            r0 = r13
            r1 = r15
            int r0 = r0 - r1
            r17 = r0
            r0 = r17
            if (r0 <= 0) goto La7
            r0 = r7
            java.io.Writer r0 = r0._writer
            r1 = r7
            char[] r1 = r1._outputBuffer
            r2 = r15
            r3 = r17
            r0.write(r1, r2, r3)
            r0 = r13
            r1 = r8
            if (r0 < r1) goto La7
            goto Lbe
        La7:
            int r13 = r13 + 1
            r0 = r7
            r1 = r7
            char[] r1 = r1._outputBuffer
            r2 = r13
            r3 = r8
            r4 = r16
            r5 = r14
            int r0 = r0._prependOrWriteCharacterEscape(r1, r2, r3, r4, r5)
            r15 = r0
            goto L31
        Lbe:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.WriterBasedJsonGenerator._writeSegmentCustom(int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0078 A[PHI: r14
      0x0078: PHI (r14v6 int) = (r14v2 int), (r14v7 int) binds: [B:19:0x006e, B:13:0x004f] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _writeStringCustom(char[] r7, int r8, int r9) throws java.io.IOException, com.fasterxml.jackson.core.JsonGenerationException {
        /*
            Method dump skipped, instructions count: 236
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.WriterBasedJsonGenerator._writeStringCustom(char[], int, int):void");
    }

    protected void _writeBinary(Base64Variant base64Variant, byte[] bArr, int i, int i2) throws IOException, JsonGenerationException {
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
                char[] cArr = this._outputBuffer;
                int i9 = this._outputTail;
                this._outputTail = i9 + 1;
                cArr[i9] = '\\';
                char[] cArr2 = this._outputBuffer;
                int i10 = this._outputTail;
                this._outputTail = i10 + 1;
                cArr2[i10] = 'n';
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

    protected int _writeBinary(Base64Variant base64Variant, InputStream inputStream, byte[] bArr, int i) throws IOException, JsonGenerationException {
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
                char[] cArr = this._outputBuffer;
                int i11 = this._outputTail;
                this._outputTail = i11 + 1;
                cArr[i11] = '\\';
                char[] cArr2 = this._outputBuffer;
                int i12 = this._outputTail;
                this._outputTail = i12 + 1;
                cArr2[i12] = 'n';
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

    protected int _writeBinary(Base64Variant base64Variant, InputStream inputStream, byte[] bArr) throws IOException, JsonGenerationException {
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
                char[] cArr = this._outputBuffer;
                int i10 = this._outputTail;
                this._outputTail = i10 + 1;
                cArr[i10] = '\\';
                char[] cArr2 = this._outputBuffer;
                int i11 = this._outputTail;
                this._outputTail = i11 + 1;
                cArr2[i11] = 'n';
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

    private int _readMore(InputStream inputStream, byte[] bArr, int i, int i2, int i3) throws IOException {
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

    private void _writeNull() throws IOException {
        if (this._outputTail + 4 >= this._outputEnd) {
            _flushBuffer();
        }
        int i = this._outputTail;
        char[] cArr = this._outputBuffer;
        cArr[i] = 'n';
        int i2 = i + 1;
        cArr[i2] = 'u';
        int i3 = i2 + 1;
        cArr[i3] = 'l';
        int i4 = i3 + 1;
        cArr[i4] = 'l';
        this._outputTail = i4 + 1;
    }

    private void _prependOrWriteCharacterEscape(char c, int i) throws IOException, JsonGenerationException {
        String value;
        int i2;
        if (i >= 0) {
            if (this._outputTail >= 2) {
                int i3 = this._outputTail - 2;
                this._outputHead = i3;
                this._outputBuffer[i3] = '\\';
                this._outputBuffer[i3 + 1] = (char) i;
                return;
            }
            char[] cArr = this._entityBuffer;
            if (cArr == null) {
                cArr = _allocateEntityBuffer();
            }
            this._outputHead = this._outputTail;
            cArr[1] = (char) i;
            this._writer.write(cArr, 0, 2);
            return;
        }
        if (i != -2) {
            if (this._outputTail >= 6) {
                char[] cArr2 = this._outputBuffer;
                int i4 = this._outputTail - 6;
                this._outputHead = i4;
                cArr2[i4] = '\\';
                int i5 = i4 + 1;
                cArr2[i5] = 'u';
                if (c > 255) {
                    int i6 = (c >> '\b') & 255;
                    int i7 = i5 + 1;
                    cArr2[i7] = HEX_CHARS[i6 >> 4];
                    i2 = i7 + 1;
                    cArr2[i2] = HEX_CHARS[i6 & 15];
                    c = (char) (c & 255);
                } else {
                    int i8 = i5 + 1;
                    cArr2[i8] = '0';
                    i2 = i8 + 1;
                    cArr2[i2] = '0';
                }
                int i9 = i2 + 1;
                cArr2[i9] = HEX_CHARS[c >> 4];
                cArr2[i9 + 1] = HEX_CHARS[c & 15];
                return;
            }
            char[] cArr3 = this._entityBuffer;
            if (cArr3 == null) {
                cArr3 = _allocateEntityBuffer();
            }
            this._outputHead = this._outputTail;
            if (c > 255) {
                int i10 = (c >> '\b') & 255;
                int i11 = c & 255;
                cArr3[10] = HEX_CHARS[i10 >> 4];
                cArr3[11] = HEX_CHARS[i10 & 15];
                cArr3[12] = HEX_CHARS[i11 >> 4];
                cArr3[13] = HEX_CHARS[i11 & 15];
                this._writer.write(cArr3, 8, 6);
                return;
            }
            cArr3[6] = HEX_CHARS[c >> 4];
            cArr3[7] = HEX_CHARS[c & 15];
            this._writer.write(cArr3, 2, 6);
            return;
        }
        if (this._currentEscape == null) {
            value = this._characterEscapes.getEscapeSequence(c).getValue();
        } else {
            value = this._currentEscape.getValue();
            this._currentEscape = null;
        }
        int length = value.length();
        if (this._outputTail >= length) {
            int i12 = this._outputTail - length;
            this._outputHead = i12;
            value.getChars(0, length, this._outputBuffer, i12);
        } else {
            this._outputHead = this._outputTail;
            this._writer.write(value);
        }
    }

    private int _prependOrWriteCharacterEscape(char[] cArr, int i, int i2, char c, int i3) throws IOException, JsonGenerationException {
        String value;
        int i4;
        if (i3 >= 0) {
            if (i > 1 && i < i2) {
                i -= 2;
                cArr[i] = '\\';
                cArr[i + 1] = (char) i3;
            } else {
                char[] cArr2 = this._entityBuffer;
                if (cArr2 == null) {
                    cArr2 = _allocateEntityBuffer();
                }
                cArr2[1] = (char) i3;
                this._writer.write(cArr2, 0, 2);
            }
            return i;
        }
        if (i3 != -2) {
            if (i > 5 && i < i2) {
                int i5 = i - 6;
                int i6 = i5 + 1;
                cArr[i5] = '\\';
                int i7 = i6 + 1;
                cArr[i6] = 'u';
                if (c > 255) {
                    int i8 = (c >> '\b') & 255;
                    int i9 = i7 + 1;
                    cArr[i7] = HEX_CHARS[i8 >> 4];
                    i4 = i9 + 1;
                    cArr[i9] = HEX_CHARS[i8 & 15];
                    c = (char) (c & 255);
                } else {
                    int i10 = i7 + 1;
                    cArr[i7] = '0';
                    i4 = i10 + 1;
                    cArr[i10] = '0';
                }
                int i11 = i4;
                int i12 = i4 + 1;
                cArr[i11] = HEX_CHARS[c >> 4];
                cArr[i12] = HEX_CHARS[c & 15];
                i = i12 - 5;
            } else {
                char[] cArr3 = this._entityBuffer;
                if (cArr3 == null) {
                    cArr3 = _allocateEntityBuffer();
                }
                this._outputHead = this._outputTail;
                if (c > 255) {
                    int i13 = (c >> '\b') & 255;
                    int i14 = c & 255;
                    cArr3[10] = HEX_CHARS[i13 >> 4];
                    cArr3[11] = HEX_CHARS[i13 & 15];
                    cArr3[12] = HEX_CHARS[i14 >> 4];
                    cArr3[13] = HEX_CHARS[i14 & 15];
                    this._writer.write(cArr3, 8, 6);
                } else {
                    cArr3[6] = HEX_CHARS[c >> 4];
                    cArr3[7] = HEX_CHARS[c & 15];
                    this._writer.write(cArr3, 2, 6);
                }
            }
            return i;
        }
        if (this._currentEscape == null) {
            value = this._characterEscapes.getEscapeSequence(c).getValue();
        } else {
            value = this._currentEscape.getValue();
            this._currentEscape = null;
        }
        int length = value.length();
        if (i >= length && i < i2) {
            i -= length;
            value.getChars(0, length, cArr, i);
        } else {
            this._writer.write(value);
        }
        return i;
    }

    private void _appendCharacterEscape(char c, int i) throws IOException, JsonGenerationException {
        String value;
        int i2;
        if (i >= 0) {
            if (this._outputTail + 2 > this._outputEnd) {
                _flushBuffer();
            }
            char[] cArr = this._outputBuffer;
            int i3 = this._outputTail;
            this._outputTail = i3 + 1;
            cArr[i3] = '\\';
            char[] cArr2 = this._outputBuffer;
            int i4 = this._outputTail;
            this._outputTail = i4 + 1;
            cArr2[i4] = (char) i;
            return;
        }
        if (i != -2) {
            if (this._outputTail + 2 > this._outputEnd) {
                _flushBuffer();
            }
            int i5 = this._outputTail;
            char[] cArr3 = this._outputBuffer;
            int i6 = i5 + 1;
            cArr3[i5] = '\\';
            int i7 = i6 + 1;
            cArr3[i6] = 'u';
            if (c > 255) {
                int i8 = (c >> '\b') & 255;
                int i9 = i7 + 1;
                cArr3[i7] = HEX_CHARS[i8 >> 4];
                i2 = i9 + 1;
                cArr3[i9] = HEX_CHARS[i8 & 15];
                c = (char) (c & 255);
            } else {
                int i10 = i7 + 1;
                cArr3[i7] = '0';
                i2 = i10 + 1;
                cArr3[i10] = '0';
            }
            int i11 = i2;
            int i12 = i2 + 1;
            cArr3[i11] = HEX_CHARS[c >> 4];
            cArr3[i12] = HEX_CHARS[c & 15];
            this._outputTail = i12 + 1;
            return;
        }
        if (this._currentEscape == null) {
            value = this._characterEscapes.getEscapeSequence(c).getValue();
        } else {
            value = this._currentEscape.getValue();
            this._currentEscape = null;
        }
        int length = value.length();
        if (this._outputTail + length > this._outputEnd) {
            _flushBuffer();
            if (length > this._outputEnd) {
                this._writer.write(value);
                return;
            }
        }
        value.getChars(0, length, this._outputBuffer, this._outputTail);
        this._outputTail += length;
    }

    private char[] _allocateEntityBuffer() {
        char[] cArr = {'\\', 0, '\\', 'u', '0', '0', 0, 0, '\\', 'u', 0, 0, 0, 0};
        this._entityBuffer = cArr;
        return cArr;
    }

    protected void _flushBuffer() throws IOException {
        int i = this._outputTail - this._outputHead;
        if (i > 0) {
            int i2 = this._outputHead;
            this._outputHead = 0;
            this._outputTail = 0;
            this._writer.write(this._outputBuffer, i2, i);
        }
    }
}
