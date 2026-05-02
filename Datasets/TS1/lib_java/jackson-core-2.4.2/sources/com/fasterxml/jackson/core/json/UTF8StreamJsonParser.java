package com.fasterxml.jackson.core.json;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonLocation;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.core.JsonTokenId;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.core.base.ParserBase;
import com.fasterxml.jackson.core.io.CharTypes;
import com.fasterxml.jackson.core.io.IOContext;
import com.fasterxml.jackson.core.sym.BytesToNameCanonicalizer;
import com.fasterxml.jackson.core.sym.Name;
import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;

/* loaded from: jackson-core-2.4.2.jar:com/fasterxml/jackson/core/json/UTF8StreamJsonParser.class */
public class UTF8StreamJsonParser extends ParserBase {
    static final byte BYTE_LF = 10;
    private static final int[] _icUTF8 = CharTypes.getInputCodeUtf8();
    protected static final int[] _icLatin1 = CharTypes.getInputCodeLatin1();
    protected ObjectCodec _objectCodec;
    protected final BytesToNameCanonicalizer _symbols;
    protected int[] _quadBuffer;
    protected boolean _tokenIncomplete;
    private int _quad1;
    protected InputStream _inputStream;
    protected byte[] _inputBuffer;
    protected boolean _bufferRecyclable;

    public UTF8StreamJsonParser(IOContext ctxt, int features, InputStream in, ObjectCodec codec, BytesToNameCanonicalizer sym, byte[] inputBuffer, int start, int end, boolean bufferRecyclable) {
        super(ctxt, features);
        this._quadBuffer = new int[16];
        this._tokenIncomplete = false;
        this._inputStream = in;
        this._objectCodec = codec;
        this._symbols = sym;
        this._inputBuffer = inputBuffer;
        this._inputPtr = start;
        this._inputEnd = end;
        this._currInputRowStart = start;
        this._currInputProcessed = -start;
        this._bufferRecyclable = bufferRecyclable;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public ObjectCodec getCodec() {
        return this._objectCodec;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public void setCodec(ObjectCodec c) {
        this._objectCodec = c;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int releaseBuffered(OutputStream out) throws IOException {
        int count = this._inputEnd - this._inputPtr;
        if (count < 1) {
            return 0;
        }
        int origPtr = this._inputPtr;
        out.write(this._inputBuffer, origPtr, count);
        return count;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public Object getInputSource() {
        return this._inputStream;
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected final boolean loadMore() throws IOException {
        this._currInputProcessed += this._inputEnd;
        this._currInputRowStart -= this._inputEnd;
        if (this._inputStream != null) {
            int count = this._inputStream.read(this._inputBuffer, 0, this._inputBuffer.length);
            if (count > 0) {
                this._inputPtr = 0;
                this._inputEnd = count;
                return true;
            }
            _closeInput();
            if (count == 0) {
                throw new IOException("InputStream.read() returned 0 characters when trying to read " + this._inputBuffer.length + " bytes");
            }
            return false;
        }
        return false;
    }

    protected final boolean _loadToHaveAtLeast(int minAvailable) throws IOException {
        if (this._inputStream == null) {
            return false;
        }
        int amount = this._inputEnd - this._inputPtr;
        if (amount > 0 && this._inputPtr > 0) {
            this._currInputProcessed += this._inputPtr;
            this._currInputRowStart -= this._inputPtr;
            System.arraycopy(this._inputBuffer, this._inputPtr, this._inputBuffer, 0, amount);
            this._inputEnd = amount;
        } else {
            this._inputEnd = 0;
        }
        this._inputPtr = 0;
        while (this._inputEnd < minAvailable) {
            int count = this._inputStream.read(this._inputBuffer, this._inputEnd, this._inputBuffer.length - this._inputEnd);
            if (count < 1) {
                _closeInput();
                if (count == 0) {
                    throw new IOException("InputStream.read() returned 0 characters when trying to read " + amount + " bytes");
                }
                return false;
            }
            this._inputEnd += count;
        }
        return true;
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected void _closeInput() throws IOException {
        if (this._inputStream != null) {
            if (this._ioContext.isResourceManaged() || isEnabled(JsonParser.Feature.AUTO_CLOSE_SOURCE)) {
                this._inputStream.close();
            }
            this._inputStream = null;
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected void _releaseBuffers() throws IOException {
        byte[] buf;
        super._releaseBuffers();
        this._symbols.release();
        if (this._bufferRecyclable && (buf = this._inputBuffer) != null) {
            this._inputBuffer = null;
            this._ioContext.releaseReadIOBuffer(buf);
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public String getText() throws IOException, JsonParseException {
        if (this._currToken == JsonToken.VALUE_STRING) {
            if (this._tokenIncomplete) {
                this._tokenIncomplete = false;
                _finishString();
            }
            return this._textBuffer.contentsAsString();
        }
        return _getText2(this._currToken);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public String getValueAsString() throws IOException, JsonParseException {
        if (this._currToken == JsonToken.VALUE_STRING) {
            if (this._tokenIncomplete) {
                this._tokenIncomplete = false;
                _finishString();
            }
            return this._textBuffer.contentsAsString();
        }
        return super.getValueAsString(null);
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public String getValueAsString(String defValue) throws IOException, JsonParseException {
        if (this._currToken == JsonToken.VALUE_STRING) {
            if (this._tokenIncomplete) {
                this._tokenIncomplete = false;
                _finishString();
            }
            return this._textBuffer.contentsAsString();
        }
        return super.getValueAsString(defValue);
    }

    protected final String _getText2(JsonToken t) {
        if (t == null) {
            return null;
        }
        switch (t.id()) {
            case 5:
                return this._parsingContext.getCurrentName();
            case JsonTokenId.ID_STRING /* 6 */:
            case JsonTokenId.ID_NUMBER_INT /* 7 */:
            case JsonTokenId.ID_NUMBER_FLOAT /* 8 */:
                return this._textBuffer.contentsAsString();
            default:
                return t.asString();
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public char[] getTextCharacters() throws IOException, JsonParseException {
        if (this._currToken != null) {
            switch (this._currToken.id()) {
                case 5:
                    if (!this._nameCopied) {
                        String name = this._parsingContext.getCurrentName();
                        int nameLen = name.length();
                        if (this._nameCopyBuffer == null) {
                            this._nameCopyBuffer = this._ioContext.allocNameCopyBuffer(nameLen);
                        } else if (this._nameCopyBuffer.length < nameLen) {
                            this._nameCopyBuffer = new char[nameLen];
                        }
                        name.getChars(0, nameLen, this._nameCopyBuffer, 0);
                        this._nameCopied = true;
                    }
                    return this._nameCopyBuffer;
                case JsonTokenId.ID_STRING /* 6 */:
                    if (this._tokenIncomplete) {
                        this._tokenIncomplete = false;
                        _finishString();
                        break;
                    }
                    break;
                case JsonTokenId.ID_NUMBER_INT /* 7 */:
                case JsonTokenId.ID_NUMBER_FLOAT /* 8 */:
                    break;
                default:
                    return this._currToken.asCharArray();
            }
            return this._textBuffer.getTextBuffer();
        }
        return null;
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public int getTextLength() throws IOException, JsonParseException {
        if (this._currToken != null) {
            switch (this._currToken.id()) {
                case 5:
                    return this._parsingContext.getCurrentName().length();
                case JsonTokenId.ID_STRING /* 6 */:
                    if (this._tokenIncomplete) {
                        this._tokenIncomplete = false;
                        _finishString();
                        break;
                    }
                    break;
                case JsonTokenId.ID_NUMBER_INT /* 7 */:
                case JsonTokenId.ID_NUMBER_FLOAT /* 8 */:
                    break;
                default:
                    return this._currToken.asCharArray().length;
            }
            return this._textBuffer.size();
        }
        return 0;
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public int getTextOffset() throws IOException, JsonParseException {
        if (this._currToken != null) {
            switch (this._currToken.id()) {
                case 5:
                    return 0;
                case JsonTokenId.ID_STRING /* 6 */:
                    if (this._tokenIncomplete) {
                        this._tokenIncomplete = false;
                        _finishString();
                        break;
                    }
                    break;
                case JsonTokenId.ID_NUMBER_INT /* 7 */:
                case JsonTokenId.ID_NUMBER_FLOAT /* 8 */:
                    break;
                default:
                    return 0;
            }
            return this._textBuffer.getTextOffset();
        }
        return 0;
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public byte[] getBinaryValue(Base64Variant b64variant) throws IOException, JsonParseException {
        if (this._currToken != JsonToken.VALUE_STRING && (this._currToken != JsonToken.VALUE_EMBEDDED_OBJECT || this._binaryValue == null)) {
            _reportError("Current token (" + this._currToken + ") not VALUE_STRING or VALUE_EMBEDDED_OBJECT, can not access as binary");
        }
        if (this._tokenIncomplete) {
            try {
                this._binaryValue = _decodeBase64(b64variant);
                this._tokenIncomplete = false;
            } catch (IllegalArgumentException iae) {
                throw _constructError("Failed to decode VALUE_STRING as base64 (" + b64variant + "): " + iae.getMessage());
            }
        } else if (this._binaryValue == null) {
            ByteArrayBuilder builder = _getByteArrayBuilder();
            _decodeBase64(getText(), builder, b64variant);
            this._binaryValue = builder.toByteArray();
        }
        return this._binaryValue;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int readBinaryValue(Base64Variant b64variant, OutputStream out) throws IOException, JsonParseException {
        if (!this._tokenIncomplete || this._currToken != JsonToken.VALUE_STRING) {
            byte[] b = getBinaryValue(b64variant);
            out.write(b);
            return b.length;
        }
        byte[] buf = this._ioContext.allocBase64Buffer();
        try {
            int _readBinary = _readBinary(b64variant, out, buf);
            this._ioContext.releaseBase64Buffer(buf);
            return _readBinary;
        } catch (Throwable th) {
            this._ioContext.releaseBase64Buffer(buf);
            throw th;
        }
    }

    protected int _readBinary(Base64Variant b64variant, OutputStream out, byte[] buffer) throws IOException, JsonParseException {
        int outputPtr = 0;
        int outputEnd = buffer.length - 3;
        int outputCount = 0;
        while (true) {
            if (this._inputPtr >= this._inputEnd) {
                loadMoreGuaranteed();
            }
            byte[] bArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            int ch = bArr[i] & 255;
            if (ch > 32) {
                int bits = b64variant.decodeBase64Char(ch);
                if (bits < 0) {
                    if (ch == 34) {
                        break;
                    }
                    bits = _decodeBase64Escape(b64variant, ch, 0);
                    if (bits < 0) {
                        continue;
                    }
                }
                if (outputPtr > outputEnd) {
                    outputCount += outputPtr;
                    out.write(buffer, 0, outputPtr);
                    outputPtr = 0;
                }
                int decodedData = bits;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                byte[] bArr2 = this._inputBuffer;
                int i2 = this._inputPtr;
                this._inputPtr = i2 + 1;
                int ch2 = bArr2[i2] & 255;
                int bits2 = b64variant.decodeBase64Char(ch2);
                if (bits2 < 0) {
                    bits2 = _decodeBase64Escape(b64variant, ch2, 1);
                }
                int decodedData2 = (decodedData << 6) | bits2;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                byte[] bArr3 = this._inputBuffer;
                int i3 = this._inputPtr;
                this._inputPtr = i3 + 1;
                int ch3 = bArr3[i3] & 255;
                int bits3 = b64variant.decodeBase64Char(ch3);
                if (bits3 < 0) {
                    if (bits3 != -2) {
                        if (ch3 == 34 && !b64variant.usesPadding()) {
                            int i4 = outputPtr;
                            outputPtr++;
                            buffer[i4] = (byte) (decodedData2 >> 4);
                            break;
                        }
                        bits3 = _decodeBase64Escape(b64variant, ch3, 2);
                    }
                    if (bits3 == -2) {
                        if (this._inputPtr >= this._inputEnd) {
                            loadMoreGuaranteed();
                        }
                        byte[] bArr4 = this._inputBuffer;
                        int i5 = this._inputPtr;
                        this._inputPtr = i5 + 1;
                        int ch4 = bArr4[i5] & 255;
                        if (!b64variant.usesPaddingChar(ch4)) {
                            throw reportInvalidBase64Char(b64variant, ch4, 3, "expected padding character '" + b64variant.getPaddingChar() + "'");
                        }
                        int i6 = outputPtr;
                        outputPtr++;
                        buffer[i6] = (byte) (decodedData2 >> 4);
                    }
                }
                int decodedData3 = (decodedData2 << 6) | bits3;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                byte[] bArr5 = this._inputBuffer;
                int i7 = this._inputPtr;
                this._inputPtr = i7 + 1;
                int ch5 = bArr5[i7] & 255;
                int bits4 = b64variant.decodeBase64Char(ch5);
                if (bits4 < 0) {
                    if (bits4 != -2) {
                        if (ch5 == 34 && !b64variant.usesPadding()) {
                            int decodedData4 = decodedData3 >> 2;
                            int i8 = outputPtr;
                            int outputPtr2 = outputPtr + 1;
                            buffer[i8] = (byte) (decodedData4 >> 8);
                            outputPtr = outputPtr2 + 1;
                            buffer[outputPtr2] = (byte) decodedData4;
                            break;
                        }
                        bits4 = _decodeBase64Escape(b64variant, ch5, 3);
                    }
                    if (bits4 == -2) {
                        int decodedData5 = decodedData3 >> 2;
                        int i9 = outputPtr;
                        int outputPtr3 = outputPtr + 1;
                        buffer[i9] = (byte) (decodedData5 >> 8);
                        outputPtr = outputPtr3 + 1;
                        buffer[outputPtr3] = (byte) decodedData5;
                    }
                }
                int decodedData6 = (decodedData3 << 6) | bits4;
                int i10 = outputPtr;
                int outputPtr4 = outputPtr + 1;
                buffer[i10] = (byte) (decodedData6 >> 16);
                int outputPtr5 = outputPtr4 + 1;
                buffer[outputPtr4] = (byte) (decodedData6 >> 8);
                outputPtr = outputPtr5 + 1;
                buffer[outputPtr5] = (byte) decodedData6;
            }
        }
        this._tokenIncomplete = false;
        if (outputPtr > 0) {
            outputCount += outputPtr;
            out.write(buffer, 0, outputPtr);
        }
        return outputCount;
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase, com.fasterxml.jackson.core.JsonParser
    public JsonLocation getTokenLocation() {
        return new JsonLocation(this._ioContext.getSourceReference(), getTokenCharacterOffset(), -1L, getTokenLineNr(), getTokenColumnNr());
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase, com.fasterxml.jackson.core.JsonParser
    public JsonLocation getCurrentLocation() {
        int col = (this._inputPtr - this._currInputRowStart) + 1;
        return new JsonLocation(this._ioContext.getSourceReference(), this._currInputProcessed + this._inputPtr, -1L, this._currInputRow, col);
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public JsonToken nextToken() throws IOException {
        JsonToken t;
        this._numTypesValid = 0;
        if (this._currToken == JsonToken.FIELD_NAME) {
            return _nextAfterName();
        }
        if (this._tokenIncomplete) {
            _skipString();
        }
        int i = _skipWSOrEnd();
        if (i < 0) {
            close();
            this._currToken = null;
            return null;
        }
        this._tokenInputTotal = (this._currInputProcessed + this._inputPtr) - 1;
        this._tokenInputRow = this._currInputRow;
        this._tokenInputCol = (this._inputPtr - this._currInputRowStart) - 1;
        this._binaryValue = null;
        if (i == 93) {
            if (!this._parsingContext.inArray()) {
                _reportMismatchedEndMarker(i, '}');
            }
            this._parsingContext = this._parsingContext.getParent();
            JsonToken jsonToken = JsonToken.END_ARRAY;
            this._currToken = jsonToken;
            return jsonToken;
        }
        if (i == 125) {
            if (!this._parsingContext.inObject()) {
                _reportMismatchedEndMarker(i, ']');
            }
            this._parsingContext = this._parsingContext.getParent();
            JsonToken jsonToken2 = JsonToken.END_OBJECT;
            this._currToken = jsonToken2;
            return jsonToken2;
        }
        if (this._parsingContext.expectComma()) {
            if (i != 44) {
                _reportUnexpectedChar(i, "was expecting comma to separate " + this._parsingContext.getTypeDesc() + " entries");
            }
            i = _skipWS();
        }
        if (!this._parsingContext.inObject()) {
            return _nextTokenNotInObject(i);
        }
        Name n = _parseName(i);
        this._parsingContext.setCurrentName(n.getName());
        this._currToken = JsonToken.FIELD_NAME;
        int i2 = _skipColon();
        if (i2 == 34) {
            this._tokenIncomplete = true;
            this._nextToken = JsonToken.VALUE_STRING;
            return this._currToken;
        }
        switch (i2) {
            case 45:
                t = _parseNegNumber();
                break;
            case 48:
            case 49:
            case 50:
            case 51:
            case 52:
            case 53:
            case 54:
            case 55:
            case 56:
            case 57:
                t = _parsePosNumber(i2);
                break;
            case 91:
                t = JsonToken.START_ARRAY;
                break;
            case 102:
                _matchToken("false", 1);
                t = JsonToken.VALUE_FALSE;
                break;
            case 110:
                _matchToken("null", 1);
                t = JsonToken.VALUE_NULL;
                break;
            case 116:
                _matchToken("true", 1);
                t = JsonToken.VALUE_TRUE;
                break;
            case 123:
                t = JsonToken.START_OBJECT;
                break;
            default:
                t = _handleUnexpectedValue(i2);
                break;
        }
        this._nextToken = t;
        return this._currToken;
    }

    private final JsonToken _nextTokenNotInObject(int i) throws IOException {
        if (i == 34) {
            this._tokenIncomplete = true;
            JsonToken jsonToken = JsonToken.VALUE_STRING;
            this._currToken = jsonToken;
            return jsonToken;
        }
        switch (i) {
            case 45:
                JsonToken _parseNegNumber = _parseNegNumber();
                this._currToken = _parseNegNumber;
                return _parseNegNumber;
            case 48:
            case 49:
            case 50:
            case 51:
            case 52:
            case 53:
            case 54:
            case 55:
            case 56:
            case 57:
                JsonToken _parsePosNumber = _parsePosNumber(i);
                this._currToken = _parsePosNumber;
                return _parsePosNumber;
            case 91:
                this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
                JsonToken jsonToken2 = JsonToken.START_ARRAY;
                this._currToken = jsonToken2;
                return jsonToken2;
            case 102:
                _matchToken("false", 1);
                JsonToken jsonToken3 = JsonToken.VALUE_FALSE;
                this._currToken = jsonToken3;
                return jsonToken3;
            case 110:
                _matchToken("null", 1);
                JsonToken jsonToken4 = JsonToken.VALUE_NULL;
                this._currToken = jsonToken4;
                return jsonToken4;
            case 116:
                _matchToken("true", 1);
                JsonToken jsonToken5 = JsonToken.VALUE_TRUE;
                this._currToken = jsonToken5;
                return jsonToken5;
            case 123:
                this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
                JsonToken jsonToken6 = JsonToken.START_OBJECT;
                this._currToken = jsonToken6;
                return jsonToken6;
            default:
                JsonToken _handleUnexpectedValue = _handleUnexpectedValue(i);
                this._currToken = _handleUnexpectedValue;
                return _handleUnexpectedValue;
        }
    }

    private final JsonToken _nextAfterName() {
        this._nameCopied = false;
        JsonToken t = this._nextToken;
        this._nextToken = null;
        if (t == JsonToken.START_ARRAY) {
            this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
        } else if (t == JsonToken.START_OBJECT) {
            this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
        }
        this._currToken = t;
        return t;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean nextFieldName(SerializableString str) throws IOException {
        this._numTypesValid = 0;
        if (this._currToken == JsonToken.FIELD_NAME) {
            _nextAfterName();
            return false;
        }
        if (this._tokenIncomplete) {
            _skipString();
        }
        int i = _skipWSOrEnd();
        if (i < 0) {
            close();
            this._currToken = null;
            return false;
        }
        this._tokenInputTotal = (this._currInputProcessed + this._inputPtr) - 1;
        this._tokenInputRow = this._currInputRow;
        this._tokenInputCol = (this._inputPtr - this._currInputRowStart) - 1;
        this._binaryValue = null;
        if (i == 93) {
            if (!this._parsingContext.inArray()) {
                _reportMismatchedEndMarker(i, '}');
            }
            this._parsingContext = this._parsingContext.getParent();
            this._currToken = JsonToken.END_ARRAY;
            return false;
        }
        if (i == 125) {
            if (!this._parsingContext.inObject()) {
                _reportMismatchedEndMarker(i, ']');
            }
            this._parsingContext = this._parsingContext.getParent();
            this._currToken = JsonToken.END_OBJECT;
            return false;
        }
        if (this._parsingContext.expectComma()) {
            if (i != 44) {
                _reportUnexpectedChar(i, "was expecting comma to separate " + this._parsingContext.getTypeDesc() + " entries");
            }
            i = _skipWS();
        }
        if (!this._parsingContext.inObject()) {
            _nextTokenNotInObject(i);
            return false;
        }
        if (i == 34) {
            byte[] nameBytes = str.asQuotedUTF8();
            int len = nameBytes.length;
            if (this._inputPtr + len + 4 < this._inputEnd) {
                int end = this._inputPtr + len;
                if (this._inputBuffer[end] == 34) {
                    int offset = 0;
                    int ptr = this._inputPtr;
                    while (ptr != end) {
                        if (nameBytes[offset] == this._inputBuffer[ptr]) {
                            offset++;
                            ptr++;
                        }
                    }
                    this._parsingContext.setCurrentName(str.getValue());
                    _isNextTokenNameYes(_skipColonFast(ptr + 1));
                    return true;
                }
            }
        }
        return _isNextTokenNameMaybe(i, str);
    }

    private final int _skipColonFast(int ptr) throws IOException {
        int ptr2 = ptr + 1;
        int i = this._inputBuffer[ptr];
        if (i == 58) {
            int ptr3 = ptr2 + 1;
            byte b = this._inputBuffer[ptr2];
            if (b > 32) {
                if (b != 47 && b != 35) {
                    this._inputPtr = ptr3;
                    return b;
                }
            } else if (b == 32 || b == 9) {
                ptr3++;
                byte b2 = this._inputBuffer[ptr3];
                if (b2 > 32 && b2 != 47 && b2 != 35) {
                    this._inputPtr = ptr3;
                    return b2;
                }
            }
            this._inputPtr = ptr3 - 1;
            return _skipColon2(true);
        }
        if (i == 32 || i == 9) {
            ptr2++;
            i = this._inputBuffer[ptr2];
        }
        if (i == 58) {
            int i2 = ptr2;
            ptr2++;
            byte b3 = this._inputBuffer[i2];
            if (b3 > 32) {
                if (b3 != 47 && b3 != 35) {
                    this._inputPtr = ptr2;
                    return b3;
                }
            } else if (b3 == 32 || b3 == 9) {
                ptr2++;
                byte b4 = this._inputBuffer[ptr2];
                if (b4 > 32 && b4 != 47 && b4 != 35) {
                    this._inputPtr = ptr2;
                    return b4;
                }
            }
        }
        this._inputPtr = ptr2 - 1;
        return _skipColon2(false);
    }

    private final void _isNextTokenNameYes(int i) throws IOException {
        this._currToken = JsonToken.FIELD_NAME;
        switch (i) {
            case 34:
                this._tokenIncomplete = true;
                this._nextToken = JsonToken.VALUE_STRING;
                break;
            case 45:
                this._nextToken = _parseNegNumber();
                break;
            case 48:
            case 49:
            case 50:
            case 51:
            case 52:
            case 53:
            case 54:
            case 55:
            case 56:
            case 57:
                this._nextToken = _parsePosNumber(i);
                break;
            case 91:
                this._nextToken = JsonToken.START_ARRAY;
                break;
            case 102:
                _matchToken("false", 1);
                this._nextToken = JsonToken.VALUE_FALSE;
                break;
            case 110:
                _matchToken("null", 1);
                this._nextToken = JsonToken.VALUE_NULL;
                break;
            case 116:
                _matchToken("true", 1);
                this._nextToken = JsonToken.VALUE_TRUE;
                break;
            case 123:
                this._nextToken = JsonToken.START_OBJECT;
                break;
            default:
                this._nextToken = _handleUnexpectedValue(i);
                break;
        }
    }

    private final boolean _isNextTokenNameMaybe(int i, SerializableString str) throws IOException {
        JsonToken t;
        Name n = _parseName(i);
        String nameStr = n.getName();
        this._parsingContext.setCurrentName(nameStr);
        boolean match = nameStr.equals(str.getValue());
        this._currToken = JsonToken.FIELD_NAME;
        int i2 = _skipColon();
        if (i2 == 34) {
            this._tokenIncomplete = true;
            this._nextToken = JsonToken.VALUE_STRING;
            return match;
        }
        switch (i2) {
            case 45:
                t = _parseNegNumber();
                break;
            case 48:
            case 49:
            case 50:
            case 51:
            case 52:
            case 53:
            case 54:
            case 55:
            case 56:
            case 57:
                t = _parsePosNumber(i2);
                break;
            case 91:
                t = JsonToken.START_ARRAY;
                break;
            case 102:
                _matchToken("false", 1);
                t = JsonToken.VALUE_FALSE;
                break;
            case 110:
                _matchToken("null", 1);
                t = JsonToken.VALUE_NULL;
                break;
            case 116:
                _matchToken("true", 1);
                t = JsonToken.VALUE_TRUE;
                break;
            case 123:
                t = JsonToken.START_OBJECT;
                break;
            default:
                t = _handleUnexpectedValue(i2);
                break;
        }
        this._nextToken = t;
        return match;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public String nextTextValue() throws IOException {
        if (this._currToken == JsonToken.FIELD_NAME) {
            this._nameCopied = false;
            JsonToken t = this._nextToken;
            this._nextToken = null;
            this._currToken = t;
            if (t == JsonToken.VALUE_STRING) {
                if (this._tokenIncomplete) {
                    this._tokenIncomplete = false;
                    _finishString();
                }
                return this._textBuffer.contentsAsString();
            }
            if (t == JsonToken.START_ARRAY) {
                this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
                return null;
            }
            if (t == JsonToken.START_OBJECT) {
                this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
                return null;
            }
            return null;
        }
        if (nextToken() == JsonToken.VALUE_STRING) {
            return getText();
        }
        return null;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int nextIntValue(int defaultValue) throws IOException {
        if (this._currToken != JsonToken.FIELD_NAME) {
            return nextToken() == JsonToken.VALUE_NUMBER_INT ? getIntValue() : defaultValue;
        }
        this._nameCopied = false;
        JsonToken t = this._nextToken;
        this._nextToken = null;
        this._currToken = t;
        if (t == JsonToken.VALUE_NUMBER_INT) {
            return getIntValue();
        }
        if (t == JsonToken.START_ARRAY) {
            this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
        } else if (t == JsonToken.START_OBJECT) {
            this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
        }
        return defaultValue;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public long nextLongValue(long defaultValue) throws IOException {
        if (this._currToken != JsonToken.FIELD_NAME) {
            return nextToken() == JsonToken.VALUE_NUMBER_INT ? getLongValue() : defaultValue;
        }
        this._nameCopied = false;
        JsonToken t = this._nextToken;
        this._nextToken = null;
        this._currToken = t;
        if (t == JsonToken.VALUE_NUMBER_INT) {
            return getLongValue();
        }
        if (t == JsonToken.START_ARRAY) {
            this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
        } else if (t == JsonToken.START_OBJECT) {
            this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
        }
        return defaultValue;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public Boolean nextBooleanValue() throws IOException {
        if (this._currToken == JsonToken.FIELD_NAME) {
            this._nameCopied = false;
            JsonToken t = this._nextToken;
            this._nextToken = null;
            this._currToken = t;
            if (t == JsonToken.VALUE_TRUE) {
                return Boolean.TRUE;
            }
            if (t == JsonToken.VALUE_FALSE) {
                return Boolean.FALSE;
            }
            if (t == JsonToken.START_ARRAY) {
                this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
                return null;
            }
            if (t == JsonToken.START_OBJECT) {
                this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
                return null;
            }
            return null;
        }
        switch (nextToken().id()) {
            case JsonTokenId.ID_TRUE /* 9 */:
                return Boolean.TRUE;
            case 10:
                return Boolean.FALSE;
            default:
                return null;
        }
    }

    protected JsonToken _parsePosNumber(int c) throws IOException {
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        if (c == 48) {
            c = _verifyNoLeadingZeroes();
        }
        int outPtr = 0 + 1;
        outBuf[0] = (char) c;
        int intLen = 1;
        int end = this._inputPtr + outBuf.length;
        if (end > this._inputEnd) {
            end = this._inputEnd;
        }
        while (this._inputPtr < end) {
            byte[] bArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            int c2 = bArr[i] & 255;
            if (c2 >= 48 && c2 <= 57) {
                intLen++;
                int i2 = outPtr;
                outPtr++;
                outBuf[i2] = (char) c2;
            } else {
                if (c2 == 46 || c2 == 101 || c2 == 69) {
                    return _parseFloat(outBuf, outPtr, c2, false, intLen);
                }
                this._inputPtr--;
                this._textBuffer.setCurrentLength(outPtr);
                if (this._parsingContext.inRoot()) {
                    _verifyRootSpace(c2);
                }
                return resetInt(false, intLen);
            }
        }
        return _parseNumber2(outBuf, outPtr, false, intLen);
    }

    protected JsonToken _parseNegNumber() throws IOException {
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        int outPtr = 0 + 1;
        outBuf[0] = '-';
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int c = bArr[i] & 255;
        if (c < 48 || c > 57) {
            return _handleInvalidNumberStart(c, true);
        }
        if (c == 48) {
            c = _verifyNoLeadingZeroes();
        }
        int outPtr2 = outPtr + 1;
        outBuf[outPtr] = (char) c;
        int intLen = 1;
        int end = this._inputPtr + outBuf.length;
        if (end > this._inputEnd) {
            end = this._inputEnd;
        }
        while (this._inputPtr < end) {
            byte[] bArr2 = this._inputBuffer;
            int i2 = this._inputPtr;
            this._inputPtr = i2 + 1;
            int c2 = bArr2[i2] & 255;
            if (c2 >= 48 && c2 <= 57) {
                intLen++;
                int i3 = outPtr2;
                outPtr2++;
                outBuf[i3] = (char) c2;
            } else {
                if (c2 == 46 || c2 == 101 || c2 == 69) {
                    return _parseFloat(outBuf, outPtr2, c2, true, intLen);
                }
                this._inputPtr--;
                this._textBuffer.setCurrentLength(outPtr2);
                if (this._parsingContext.inRoot()) {
                    _verifyRootSpace(c2);
                }
                return resetInt(true, intLen);
            }
        }
        return _parseNumber2(outBuf, outPtr2, true, intLen);
    }

    private final JsonToken _parseNumber2(char[] outBuf, int outPtr, boolean negative, int intPartLength) throws IOException {
        int c;
        while (true) {
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                this._textBuffer.setCurrentLength(outPtr);
                return resetInt(negative, intPartLength);
            }
            byte[] bArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            c = bArr[i] & 255;
            if (c > 57 || c < 48) {
                break;
            }
            if (outPtr >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr = 0;
            }
            int i2 = outPtr;
            outPtr++;
            outBuf[i2] = (char) c;
            intPartLength++;
        }
        if (c == 46 || c == 101 || c == 69) {
            return _parseFloat(outBuf, outPtr, c, negative, intPartLength);
        }
        this._inputPtr--;
        this._textBuffer.setCurrentLength(outPtr);
        if (this._parsingContext.inRoot()) {
            byte[] bArr2 = this._inputBuffer;
            int i3 = this._inputPtr;
            this._inputPtr = i3 + 1;
            _verifyRootSpace(bArr2[i3] & 255);
        }
        return resetInt(negative, intPartLength);
    }

    private final int _verifyNoLeadingZeroes() throws IOException {
        if (this._inputPtr >= this._inputEnd && !loadMore()) {
            return 48;
        }
        int ch = this._inputBuffer[this._inputPtr] & 255;
        if (ch < 48 || ch > 57) {
            return 48;
        }
        if (!isEnabled(JsonParser.Feature.ALLOW_NUMERIC_LEADING_ZEROS)) {
            reportInvalidNumber("Leading zeroes not allowed");
        }
        this._inputPtr++;
        if (ch == 48) {
            do {
                if (this._inputPtr >= this._inputEnd && !loadMore()) {
                    break;
                }
                ch = this._inputBuffer[this._inputPtr] & 255;
                if (ch < 48 || ch > 57) {
                    return 48;
                }
                this._inputPtr++;
            } while (ch == 48);
        }
        return ch;
    }

    private final JsonToken _parseFloat(char[] outBuf, int outPtr, int c, boolean negative, int integerPartLength) throws IOException {
        int fractLen = 0;
        boolean eof = false;
        if (c == 46) {
            outPtr++;
            outBuf[outPtr] = (char) c;
            while (true) {
                if (this._inputPtr >= this._inputEnd && !loadMore()) {
                    eof = true;
                    break;
                }
                byte[] bArr = this._inputBuffer;
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                c = bArr[i] & 255;
                if (c < 48 || c > 57) {
                    break;
                }
                fractLen++;
                if (outPtr >= outBuf.length) {
                    outBuf = this._textBuffer.finishCurrentSegment();
                    outPtr = 0;
                }
                int i2 = outPtr;
                outPtr++;
                outBuf[i2] = (char) c;
            }
            if (fractLen == 0) {
                reportUnexpectedNumberChar(c, "Decimal point not followed by a digit");
            }
        }
        int expLen = 0;
        if (c == 101 || c == 69) {
            if (outPtr >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr = 0;
            }
            int i3 = outPtr;
            outPtr++;
            outBuf[i3] = (char) c;
            if (this._inputPtr >= this._inputEnd) {
                loadMoreGuaranteed();
            }
            byte[] bArr2 = this._inputBuffer;
            int i4 = this._inputPtr;
            this._inputPtr = i4 + 1;
            c = bArr2[i4] & 255;
            if (c == 45 || c == 43) {
                if (outPtr >= outBuf.length) {
                    outBuf = this._textBuffer.finishCurrentSegment();
                    outPtr = 0;
                }
                int i5 = outPtr;
                outPtr++;
                outBuf[i5] = (char) c;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                byte[] bArr3 = this._inputBuffer;
                int i6 = this._inputPtr;
                this._inputPtr = i6 + 1;
                c = bArr3[i6] & 255;
            }
            while (true) {
                if (c <= 57 && c >= 48) {
                    expLen++;
                    if (outPtr >= outBuf.length) {
                        outBuf = this._textBuffer.finishCurrentSegment();
                        outPtr = 0;
                    }
                    int i7 = outPtr;
                    outPtr++;
                    outBuf[i7] = (char) c;
                    if (this._inputPtr >= this._inputEnd && !loadMore()) {
                        eof = true;
                        break;
                    }
                    byte[] bArr4 = this._inputBuffer;
                    int i8 = this._inputPtr;
                    this._inputPtr = i8 + 1;
                    c = bArr4[i8] & 255;
                } else {
                    break;
                }
            }
            if (expLen == 0) {
                reportUnexpectedNumberChar(c, "Exponent indicator not followed by a digit");
            }
        }
        if (!eof) {
            this._inputPtr--;
            if (this._parsingContext.inRoot()) {
                _verifyRootSpace(c);
            }
        }
        this._textBuffer.setCurrentLength(outPtr);
        return resetFloat(negative, integerPartLength, fractLen, expLen);
    }

    private final void _verifyRootSpace(int ch) throws IOException {
        this._inputPtr++;
        switch (ch) {
            case JsonTokenId.ID_TRUE /* 9 */:
            case 32:
                break;
            case 10:
                this._currInputRow++;
                this._currInputRowStart = this._inputPtr;
                break;
            case 13:
                _skipCR();
                break;
            default:
                _reportMissingRootWS(ch);
                break;
        }
    }

    protected final Name _parseName(int i) throws IOException {
        if (i != 34) {
            return _handleOddName(i);
        }
        if (this._inputPtr + 9 > this._inputEnd) {
            return slowParseName();
        }
        byte[] input = this._inputBuffer;
        int[] codes = _icLatin1;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        int q = input[i2] & 255;
        if (codes[q] == 0) {
            int i3 = this._inputPtr;
            this._inputPtr = i3 + 1;
            int i4 = input[i3] & 255;
            if (codes[i4] == 0) {
                int q2 = (q << 8) | i4;
                int i5 = this._inputPtr;
                this._inputPtr = i5 + 1;
                int i6 = input[i5] & 255;
                if (codes[i6] == 0) {
                    int q3 = (q2 << 8) | i6;
                    int i7 = this._inputPtr;
                    this._inputPtr = i7 + 1;
                    int i8 = input[i7] & 255;
                    if (codes[i8] == 0) {
                        int q4 = (q3 << 8) | i8;
                        int i9 = this._inputPtr;
                        this._inputPtr = i9 + 1;
                        int i10 = input[i9] & 255;
                        if (codes[i10] == 0) {
                            this._quad1 = q4;
                            return parseMediumName(i10);
                        }
                        if (i10 == 34) {
                            return findName(q4, 4);
                        }
                        return parseName(q4, i10, 4);
                    }
                    if (i8 == 34) {
                        return findName(q3, 3);
                    }
                    return parseName(q3, i8, 3);
                }
                if (i6 == 34) {
                    return findName(q2, 2);
                }
                return parseName(q2, i6, 2);
            }
            if (i4 == 34) {
                return findName(q, 1);
            }
            return parseName(q, i4, 1);
        }
        if (q == 34) {
            return BytesToNameCanonicalizer.getEmptyName();
        }
        return parseName(0, q, 0);
    }

    protected final Name parseMediumName(int q2) throws IOException {
        byte[] input = this._inputBuffer;
        int[] codes = _icLatin1;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int i2 = input[i] & 255;
        if (codes[i2] != 0) {
            if (i2 == 34) {
                return findName(this._quad1, q2, 1);
            }
            return parseName(this._quad1, q2, i2, 1);
        }
        int q22 = (q2 << 8) | i2;
        int i3 = this._inputPtr;
        this._inputPtr = i3 + 1;
        int i4 = input[i3] & 255;
        if (codes[i4] != 0) {
            if (i4 == 34) {
                return findName(this._quad1, q22, 2);
            }
            return parseName(this._quad1, q22, i4, 2);
        }
        int q23 = (q22 << 8) | i4;
        int i5 = this._inputPtr;
        this._inputPtr = i5 + 1;
        int i6 = input[i5] & 255;
        if (codes[i6] != 0) {
            if (i6 == 34) {
                return findName(this._quad1, q23, 3);
            }
            return parseName(this._quad1, q23, i6, 3);
        }
        int q24 = (q23 << 8) | i6;
        int i7 = this._inputPtr;
        this._inputPtr = i7 + 1;
        int i8 = input[i7] & 255;
        if (codes[i8] != 0) {
            if (i8 == 34) {
                return findName(this._quad1, q24, 4);
            }
            return parseName(this._quad1, q24, i8, 4);
        }
        return parseLongName(i8, q24);
    }

    protected final Name parseLongName(int q, int q2) throws IOException {
        this._quadBuffer[0] = this._quad1;
        this._quadBuffer[1] = q2;
        byte[] input = this._inputBuffer;
        int[] codes = _icLatin1;
        int qlen = 2;
        while (this._inputPtr + 4 <= this._inputEnd) {
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            int i2 = input[i] & 255;
            if (codes[i2] != 0) {
                if (i2 == 34) {
                    return findName(this._quadBuffer, qlen, q, 1);
                }
                return parseEscapedName(this._quadBuffer, qlen, q, i2, 1);
            }
            int q3 = (q << 8) | i2;
            int i3 = this._inputPtr;
            this._inputPtr = i3 + 1;
            int i4 = input[i3] & 255;
            if (codes[i4] != 0) {
                if (i4 == 34) {
                    return findName(this._quadBuffer, qlen, q3, 2);
                }
                return parseEscapedName(this._quadBuffer, qlen, q3, i4, 2);
            }
            int q4 = (q3 << 8) | i4;
            int i5 = this._inputPtr;
            this._inputPtr = i5 + 1;
            int i6 = input[i5] & 255;
            if (codes[i6] != 0) {
                if (i6 == 34) {
                    return findName(this._quadBuffer, qlen, q4, 3);
                }
                return parseEscapedName(this._quadBuffer, qlen, q4, i6, 3);
            }
            int q5 = (q4 << 8) | i6;
            int i7 = this._inputPtr;
            this._inputPtr = i7 + 1;
            int i8 = input[i7] & 255;
            if (codes[i8] != 0) {
                if (i8 == 34) {
                    return findName(this._quadBuffer, qlen, q5, 4);
                }
                return parseEscapedName(this._quadBuffer, qlen, q5, i8, 4);
            }
            if (qlen >= this._quadBuffer.length) {
                this._quadBuffer = growArrayBy(this._quadBuffer, qlen);
            }
            int i9 = qlen;
            qlen++;
            this._quadBuffer[i9] = q5;
            q = i8;
        }
        return parseEscapedName(this._quadBuffer, qlen, 0, q, 0);
    }

    protected Name slowParseName() throws IOException {
        if (this._inputPtr >= this._inputEnd && !loadMore()) {
            _reportInvalidEOF(": was expecting closing '\"' for name");
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int i2 = bArr[i] & 255;
        if (i2 == 34) {
            return BytesToNameCanonicalizer.getEmptyName();
        }
        return parseEscapedName(this._quadBuffer, 0, 0, i2, 0);
    }

    private final Name parseName(int q1, int ch, int lastQuadBytes) throws IOException {
        return parseEscapedName(this._quadBuffer, 0, q1, ch, lastQuadBytes);
    }

    private final Name parseName(int q1, int q2, int ch, int lastQuadBytes) throws IOException {
        this._quadBuffer[0] = q1;
        return parseEscapedName(this._quadBuffer, 1, q2, ch, lastQuadBytes);
    }

    protected final Name parseEscapedName(int[] quads, int qlen, int currQuad, int ch, int currQuadBytes) throws IOException {
        int[] codes = _icLatin1;
        while (true) {
            if (codes[ch] != 0) {
                if (ch == 34) {
                    break;
                }
                if (ch != 92) {
                    _throwUnquotedSpace(ch, "name");
                } else {
                    ch = _decodeEscaped();
                }
                if (ch > 127) {
                    if (currQuadBytes >= 4) {
                        if (qlen >= quads.length) {
                            int[] growArrayBy = growArrayBy(quads, quads.length);
                            quads = growArrayBy;
                            this._quadBuffer = growArrayBy;
                        }
                        int i = qlen;
                        qlen++;
                        quads[i] = currQuad;
                        currQuad = 0;
                        currQuadBytes = 0;
                    }
                    if (ch < 2048) {
                        currQuad = (currQuad << 8) | 192 | (ch >> 6);
                        currQuadBytes++;
                    } else {
                        int currQuad2 = (currQuad << 8) | 224 | (ch >> 12);
                        int currQuadBytes2 = currQuadBytes + 1;
                        if (currQuadBytes2 >= 4) {
                            if (qlen >= quads.length) {
                                int[] growArrayBy2 = growArrayBy(quads, quads.length);
                                quads = growArrayBy2;
                                this._quadBuffer = growArrayBy2;
                            }
                            int i2 = qlen;
                            qlen++;
                            quads[i2] = currQuad2;
                            currQuad2 = 0;
                            currQuadBytes2 = 0;
                        }
                        currQuad = (currQuad2 << 8) | 128 | ((ch >> 6) & 63);
                        currQuadBytes = currQuadBytes2 + 1;
                    }
                    ch = 128 | (ch & 63);
                }
            }
            if (currQuadBytes < 4) {
                currQuadBytes++;
                currQuad = (currQuad << 8) | ch;
            } else {
                if (qlen >= quads.length) {
                    int[] growArrayBy3 = growArrayBy(quads, quads.length);
                    quads = growArrayBy3;
                    this._quadBuffer = growArrayBy3;
                }
                int i3 = qlen;
                qlen++;
                quads[i3] = currQuad;
                currQuad = ch;
                currQuadBytes = 1;
            }
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                _reportInvalidEOF(" in field name");
            }
            byte[] bArr = this._inputBuffer;
            int i4 = this._inputPtr;
            this._inputPtr = i4 + 1;
            ch = bArr[i4] & 255;
        }
        if (currQuadBytes > 0) {
            if (qlen >= quads.length) {
                int[] growArrayBy4 = growArrayBy(quads, quads.length);
                quads = growArrayBy4;
                this._quadBuffer = growArrayBy4;
            }
            int i5 = qlen;
            qlen++;
            quads[i5] = currQuad;
        }
        Name name = this._symbols.findName(quads, qlen);
        if (name == null) {
            name = addName(quads, qlen, currQuadBytes);
        }
        return name;
    }

    protected Name _handleOddName(int ch) throws IOException {
        if (ch == 39 && isEnabled(JsonParser.Feature.ALLOW_SINGLE_QUOTES)) {
            return _parseAposName();
        }
        if (!isEnabled(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES)) {
            char c = (char) _decodeCharForError(ch);
            _reportUnexpectedChar(c, "was expecting double-quote to start field name");
        }
        int[] codes = CharTypes.getInputCodeUtf8JsNames();
        if (codes[ch] != 0) {
            _reportUnexpectedChar(ch, "was expecting either valid name character (for unquoted name) or double-quote (for quoted) to start field name");
        }
        int[] quads = this._quadBuffer;
        int qlen = 0;
        int currQuad = 0;
        int currQuadBytes = 0;
        while (true) {
            if (currQuadBytes < 4) {
                currQuadBytes++;
                currQuad = (currQuad << 8) | ch;
            } else {
                if (qlen >= quads.length) {
                    int[] growArrayBy = growArrayBy(quads, quads.length);
                    quads = growArrayBy;
                    this._quadBuffer = growArrayBy;
                }
                int i = qlen;
                qlen++;
                quads[i] = currQuad;
                currQuad = ch;
                currQuadBytes = 1;
            }
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                _reportInvalidEOF(" in field name");
            }
            ch = this._inputBuffer[this._inputPtr] & 255;
            if (codes[ch] != 0) {
                break;
            }
            this._inputPtr++;
        }
        if (currQuadBytes > 0) {
            if (qlen >= quads.length) {
                int[] growArrayBy2 = growArrayBy(quads, quads.length);
                quads = growArrayBy2;
                this._quadBuffer = growArrayBy2;
            }
            int i2 = qlen;
            qlen++;
            quads[i2] = currQuad;
        }
        Name name = this._symbols.findName(quads, qlen);
        if (name == null) {
            name = addName(quads, qlen, currQuadBytes);
        }
        return name;
    }

    protected Name _parseAposName() throws IOException {
        if (this._inputPtr >= this._inputEnd && !loadMore()) {
            _reportInvalidEOF(": was expecting closing ''' for name");
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int ch = bArr[i] & 255;
        if (ch == 39) {
            return BytesToNameCanonicalizer.getEmptyName();
        }
        int[] quads = this._quadBuffer;
        int qlen = 0;
        int currQuad = 0;
        int currQuadBytes = 0;
        int[] codes = _icLatin1;
        while (ch != 39) {
            if (ch != 34 && codes[ch] != 0) {
                if (ch != 92) {
                    _throwUnquotedSpace(ch, "name");
                } else {
                    ch = _decodeEscaped();
                }
                if (ch > 127) {
                    if (currQuadBytes >= 4) {
                        if (qlen >= quads.length) {
                            int[] growArrayBy = growArrayBy(quads, quads.length);
                            quads = growArrayBy;
                            this._quadBuffer = growArrayBy;
                        }
                        int i2 = qlen;
                        qlen++;
                        quads[i2] = currQuad;
                        currQuad = 0;
                        currQuadBytes = 0;
                    }
                    if (ch < 2048) {
                        currQuad = (currQuad << 8) | 192 | (ch >> 6);
                        currQuadBytes++;
                    } else {
                        int currQuad2 = (currQuad << 8) | 224 | (ch >> 12);
                        int currQuadBytes2 = currQuadBytes + 1;
                        if (currQuadBytes2 >= 4) {
                            if (qlen >= quads.length) {
                                int[] growArrayBy2 = growArrayBy(quads, quads.length);
                                quads = growArrayBy2;
                                this._quadBuffer = growArrayBy2;
                            }
                            int i3 = qlen;
                            qlen++;
                            quads[i3] = currQuad2;
                            currQuad2 = 0;
                            currQuadBytes2 = 0;
                        }
                        currQuad = (currQuad2 << 8) | 128 | ((ch >> 6) & 63);
                        currQuadBytes = currQuadBytes2 + 1;
                    }
                    ch = 128 | (ch & 63);
                }
            }
            if (currQuadBytes < 4) {
                currQuadBytes++;
                currQuad = (currQuad << 8) | ch;
            } else {
                if (qlen >= quads.length) {
                    int[] growArrayBy3 = growArrayBy(quads, quads.length);
                    quads = growArrayBy3;
                    this._quadBuffer = growArrayBy3;
                }
                int i4 = qlen;
                qlen++;
                quads[i4] = currQuad;
                currQuad = ch;
                currQuadBytes = 1;
            }
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                _reportInvalidEOF(" in field name");
            }
            byte[] bArr2 = this._inputBuffer;
            int i5 = this._inputPtr;
            this._inputPtr = i5 + 1;
            ch = bArr2[i5] & 255;
        }
        if (currQuadBytes > 0) {
            if (qlen >= quads.length) {
                int[] growArrayBy4 = growArrayBy(quads, quads.length);
                quads = growArrayBy4;
                this._quadBuffer = growArrayBy4;
            }
            int i6 = qlen;
            qlen++;
            quads[i6] = currQuad;
        }
        Name name = this._symbols.findName(quads, qlen);
        if (name == null) {
            name = addName(quads, qlen, currQuadBytes);
        }
        return name;
    }

    private final Name findName(int q1, int lastQuadBytes) throws JsonParseException {
        Name name = this._symbols.findName(q1);
        if (name != null) {
            return name;
        }
        this._quadBuffer[0] = q1;
        return addName(this._quadBuffer, 1, lastQuadBytes);
    }

    private final Name findName(int q1, int q2, int lastQuadBytes) throws JsonParseException {
        Name name = this._symbols.findName(q1, q2);
        if (name != null) {
            return name;
        }
        this._quadBuffer[0] = q1;
        this._quadBuffer[1] = q2;
        return addName(this._quadBuffer, 2, lastQuadBytes);
    }

    private final Name findName(int[] quads, int qlen, int lastQuad, int lastQuadBytes) throws JsonParseException {
        if (qlen >= quads.length) {
            int[] growArrayBy = growArrayBy(quads, quads.length);
            quads = growArrayBy;
            this._quadBuffer = growArrayBy;
        }
        int qlen2 = qlen + 1;
        quads[qlen] = lastQuad;
        Name name = this._symbols.findName(quads, qlen2);
        if (name == null) {
            return addName(quads, qlen2, lastQuadBytes);
        }
        return name;
    }

    private final Name addName(int[] quads, int qlen, int lastQuadBytes) throws JsonParseException {
        int lastQuad;
        int ch;
        int needed;
        int byteLen = ((qlen << 2) - 4) + lastQuadBytes;
        if (lastQuadBytes < 4) {
            lastQuad = quads[qlen - 1];
            quads[qlen - 1] = lastQuad << ((4 - lastQuadBytes) << 3);
        } else {
            lastQuad = 0;
        }
        char[] cbuf = this._textBuffer.emptyAndGetCurrentSegment();
        int cix = 0;
        int ix = 0;
        while (ix < byteLen) {
            int byteIx = ix & 3;
            int ch2 = (quads[ix >> 2] >> ((3 - byteIx) << 3)) & 255;
            ix++;
            if (ch2 > 127) {
                if ((ch2 & 224) == 192) {
                    ch = ch2 & 31;
                    needed = 1;
                } else if ((ch2 & 240) == 224) {
                    ch = ch2 & 15;
                    needed = 2;
                } else if ((ch2 & 248) == 240) {
                    ch = ch2 & 7;
                    needed = 3;
                } else {
                    _reportInvalidInitial(ch2);
                    ch = 1;
                    needed = 1;
                }
                if (ix + needed > byteLen) {
                    _reportInvalidEOF(" in field name");
                }
                int byteIx2 = ix & 3;
                int ch22 = quads[ix >> 2] >> ((3 - byteIx2) << 3);
                ix++;
                if ((ch22 & 192) != 128) {
                    _reportInvalidOther(ch22);
                }
                ch2 = (ch << 6) | (ch22 & 63);
                if (needed > 1) {
                    int byteIx3 = ix & 3;
                    int ch23 = quads[ix >> 2] >> ((3 - byteIx3) << 3);
                    ix++;
                    if ((ch23 & 192) != 128) {
                        _reportInvalidOther(ch23);
                    }
                    ch2 = (ch2 << 6) | (ch23 & 63);
                    if (needed > 2) {
                        int byteIx4 = ix & 3;
                        int ch24 = quads[ix >> 2] >> ((3 - byteIx4) << 3);
                        ix++;
                        if ((ch24 & 192) != 128) {
                            _reportInvalidOther(ch24 & 255);
                        }
                        ch2 = (ch2 << 6) | (ch24 & 63);
                    }
                }
                if (needed > 2) {
                    int ch3 = ch2 - 65536;
                    if (cix >= cbuf.length) {
                        cbuf = this._textBuffer.expandCurrentSegment();
                    }
                    int i = cix;
                    cix++;
                    cbuf[i] = (char) (55296 + (ch3 >> 10));
                    ch2 = 56320 | (ch3 & 1023);
                }
            }
            if (cix >= cbuf.length) {
                cbuf = this._textBuffer.expandCurrentSegment();
            }
            int i2 = cix;
            cix++;
            cbuf[i2] = (char) ch2;
        }
        String baseName = new String(cbuf, 0, cix);
        if (lastQuadBytes < 4) {
            quads[qlen - 1] = lastQuad;
        }
        return this._symbols.addName(baseName, quads, qlen);
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected void _finishString() throws IOException {
        int ptr = this._inputPtr;
        if (ptr >= this._inputEnd) {
            loadMoreGuaranteed();
            ptr = this._inputPtr;
        }
        int outPtr = 0;
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        int[] codes = _icUTF8;
        int max = Math.min(this._inputEnd, ptr + outBuf.length);
        byte[] inputBuffer = this._inputBuffer;
        while (true) {
            if (ptr >= max) {
                break;
            }
            int c = inputBuffer[ptr] & 255;
            if (codes[c] != 0) {
                if (c == 34) {
                    this._inputPtr = ptr + 1;
                    this._textBuffer.setCurrentLength(outPtr);
                    return;
                }
            } else {
                ptr++;
                int i = outPtr;
                outPtr++;
                outBuf[i] = (char) c;
            }
        }
        this._inputPtr = ptr;
        _finishString2(outBuf, outPtr);
    }

    private final void _finishString2(char[] outBuf, int outPtr) throws IOException {
        int[] codes = _icUTF8;
        byte[] inputBuffer = this._inputBuffer;
        while (true) {
            int ptr = this._inputPtr;
            if (ptr >= this._inputEnd) {
                loadMoreGuaranteed();
                ptr = this._inputPtr;
            }
            if (outPtr >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr = 0;
            }
            int max = Math.min(this._inputEnd, ptr + (outBuf.length - outPtr));
            while (true) {
                if (ptr < max) {
                    int i = ptr;
                    ptr++;
                    int c = inputBuffer[i] & 255;
                    if (codes[c] != 0) {
                        this._inputPtr = ptr;
                        if (c != 34) {
                            switch (codes[c]) {
                                case 1:
                                    c = _decodeEscaped();
                                    break;
                                case 2:
                                    c = _decodeUtf8_2(c);
                                    break;
                                case 3:
                                    if (this._inputEnd - this._inputPtr >= 2) {
                                        c = _decodeUtf8_3fast(c);
                                        break;
                                    } else {
                                        c = _decodeUtf8_3(c);
                                        break;
                                    }
                                case 4:
                                    int c2 = _decodeUtf8_4(c);
                                    int i2 = outPtr;
                                    outPtr++;
                                    outBuf[i2] = (char) (55296 | (c2 >> 10));
                                    if (outPtr >= outBuf.length) {
                                        outBuf = this._textBuffer.finishCurrentSegment();
                                        outPtr = 0;
                                    }
                                    c = 56320 | (c2 & 1023);
                                    break;
                                default:
                                    if (c < 32) {
                                        _throwUnquotedSpace(c, "string value");
                                        break;
                                    } else {
                                        _reportInvalidChar(c);
                                        break;
                                    }
                            }
                            if (outPtr >= outBuf.length) {
                                outBuf = this._textBuffer.finishCurrentSegment();
                                outPtr = 0;
                            }
                            int i3 = outPtr;
                            outPtr++;
                            outBuf[i3] = (char) c;
                        } else {
                            this._textBuffer.setCurrentLength(outPtr);
                            return;
                        }
                    } else {
                        int i4 = outPtr;
                        outPtr++;
                        outBuf[i4] = (char) c;
                    }
                } else {
                    this._inputPtr = ptr;
                }
            }
        }
    }

    protected void _skipString() throws IOException {
        this._tokenIncomplete = false;
        int[] codes = _icUTF8;
        byte[] inputBuffer = this._inputBuffer;
        while (true) {
            int ptr = this._inputPtr;
            int max = this._inputEnd;
            if (ptr >= max) {
                loadMoreGuaranteed();
                ptr = this._inputPtr;
                max = this._inputEnd;
            }
            while (true) {
                if (ptr < max) {
                    int i = ptr;
                    ptr++;
                    int c = inputBuffer[i] & 255;
                    if (codes[c] != 0) {
                        this._inputPtr = ptr;
                        if (c != 34) {
                            switch (codes[c]) {
                                case 1:
                                    _decodeEscaped();
                                    break;
                                case 2:
                                    _skipUtf8_2(c);
                                    break;
                                case 3:
                                    _skipUtf8_3(c);
                                    break;
                                case 4:
                                    _skipUtf8_4(c);
                                    break;
                                default:
                                    if (c < 32) {
                                        _throwUnquotedSpace(c, "string value");
                                        break;
                                    } else {
                                        _reportInvalidChar(c);
                                        break;
                                    }
                            }
                        } else {
                            return;
                        }
                    }
                } else {
                    this._inputPtr = ptr;
                }
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00d1  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x004d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected com.fasterxml.jackson.core.JsonToken _handleUnexpectedValue(int r8) throws java.io.IOException {
        /*
            r7 = this;
            r0 = r8
            switch(r0) {
                case 39: goto L43;
                case 43: goto L9a;
                case 73: goto L76;
                case 78: goto L52;
                case 93: goto L3c;
                case 125: goto L3c;
                default: goto Lca;
            }
        L3c:
            r0 = r7
            r1 = r8
            java.lang.String r2 = "expected a value"
            r0._reportUnexpectedChar(r1, r2)
        L43:
            r0 = r7
            com.fasterxml.jackson.core.JsonParser$Feature r1 = com.fasterxml.jackson.core.JsonParser.Feature.ALLOW_SINGLE_QUOTES
            boolean r0 = r0.isEnabled(r1)
            if (r0 == 0) goto Lca
            r0 = r7
            com.fasterxml.jackson.core.JsonToken r0 = r0._handleApos()
            return r0
        L52:
            r0 = r7
            java.lang.String r1 = "NaN"
            r2 = 1
            r0._matchToken(r1, r2)
            r0 = r7
            com.fasterxml.jackson.core.JsonParser$Feature r1 = com.fasterxml.jackson.core.JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS
            boolean r0 = r0.isEnabled(r1)
            if (r0 == 0) goto L6d
            r0 = r7
            java.lang.String r1 = "NaN"
            r2 = 9221120237041090560(0x7ff8000000000000, double:NaN)
            com.fasterxml.jackson.core.JsonToken r0 = r0.resetAsNaN(r1, r2)
            return r0
        L6d:
            r0 = r7
            java.lang.String r1 = "Non-standard token 'NaN': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"
            r0._reportError(r1)
            goto Lca
        L76:
            r0 = r7
            java.lang.String r1 = "Infinity"
            r2 = 1
            r0._matchToken(r1, r2)
            r0 = r7
            com.fasterxml.jackson.core.JsonParser$Feature r1 = com.fasterxml.jackson.core.JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS
            boolean r0 = r0.isEnabled(r1)
            if (r0 == 0) goto L91
            r0 = r7
            java.lang.String r1 = "Infinity"
            r2 = 9218868437227405312(0x7ff0000000000000, double:Infinity)
            com.fasterxml.jackson.core.JsonToken r0 = r0.resetAsNaN(r1, r2)
            return r0
        L91:
            r0 = r7
            java.lang.String r1 = "Non-standard token 'Infinity': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"
            r0._reportError(r1)
            goto Lca
        L9a:
            r0 = r7
            int r0 = r0._inputPtr
            r1 = r7
            int r1 = r1._inputEnd
            if (r0 < r1) goto Lb0
            r0 = r7
            boolean r0 = r0.loadMore()
            if (r0 != 0) goto Lb0
            r0 = r7
            r0._reportInvalidEOFInValue()
        Lb0:
            r0 = r7
            r1 = r7
            byte[] r1 = r1._inputBuffer
            r2 = r7
            r3 = r2
            int r3 = r3._inputPtr
            r4 = r3; r3 = r2; r2 = r4; 
            r5 = 1
            int r4 = r4 + r5
            r3._inputPtr = r4
            r1 = r1[r2]
            r2 = 255(0xff, float:3.57E-43)
            r1 = r1 & r2
            r2 = 0
            com.fasterxml.jackson.core.JsonToken r0 = r0._handleInvalidNumberStart(r1, r2)
            return r0
        Lca:
            r0 = r8
            boolean r0 = java.lang.Character.isJavaIdentifierStart(r0)
            if (r0 == 0) goto Leb
            r0 = r7
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r2 = r1
            r2.<init>()
            java.lang.String r2 = ""
            java.lang.StringBuilder r1 = r1.append(r2)
            r2 = r8
            char r2 = (char) r2
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.String r1 = r1.toString()
            java.lang.String r2 = "('true', 'false' or 'null')"
            r0._reportInvalidToken(r1, r2)
        Leb:
            r0 = r7
            r1 = r8
            java.lang.String r2 = "expected a valid value (number, String, array, object, 'true', 'false' or 'null')"
            r0._reportUnexpectedChar(r1, r2)
            r0 = 0
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.UTF8StreamJsonParser._handleUnexpectedValue(int):com.fasterxml.jackson.core.JsonToken");
    }

    protected JsonToken _handleApos() throws IOException {
        int outPtr = 0;
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        int[] codes = _icUTF8;
        byte[] inputBuffer = this._inputBuffer;
        while (true) {
            if (this._inputPtr >= this._inputEnd) {
                loadMoreGuaranteed();
            }
            if (outPtr >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr = 0;
            }
            int max = this._inputEnd;
            int max2 = this._inputPtr + (outBuf.length - outPtr);
            if (max2 < max) {
                max = max2;
            }
            while (this._inputPtr < max) {
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                int c = inputBuffer[i] & 255;
                if (c != 39 && codes[c] == 0) {
                    int i2 = outPtr;
                    outPtr++;
                    outBuf[i2] = (char) c;
                } else if (c != 39) {
                    switch (codes[c]) {
                        case 1:
                            if (c != 39) {
                                c = _decodeEscaped();
                                break;
                            }
                            break;
                        case 2:
                            c = _decodeUtf8_2(c);
                            break;
                        case 3:
                            if (this._inputEnd - this._inputPtr >= 2) {
                                c = _decodeUtf8_3fast(c);
                                break;
                            } else {
                                c = _decodeUtf8_3(c);
                                break;
                            }
                        case 4:
                            int c2 = _decodeUtf8_4(c);
                            int i3 = outPtr;
                            outPtr++;
                            outBuf[i3] = (char) (55296 | (c2 >> 10));
                            if (outPtr >= outBuf.length) {
                                outBuf = this._textBuffer.finishCurrentSegment();
                                outPtr = 0;
                            }
                            c = 56320 | (c2 & 1023);
                            break;
                        default:
                            if (c < 32) {
                                _throwUnquotedSpace(c, "string value");
                            }
                            _reportInvalidChar(c);
                            break;
                    }
                    if (outPtr >= outBuf.length) {
                        outBuf = this._textBuffer.finishCurrentSegment();
                        outPtr = 0;
                    }
                    int i4 = outPtr;
                    outPtr++;
                    outBuf[i4] = (char) c;
                } else {
                    this._textBuffer.setCurrentLength(outPtr);
                    return JsonToken.VALUE_STRING;
                }
            }
        }
    }

    protected JsonToken _handleInvalidNumberStart(int ch, boolean neg) throws IOException {
        String match;
        while (ch == 73) {
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                _reportInvalidEOFInValue();
            }
            byte[] bArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            ch = bArr[i];
            if (ch == 78) {
                match = neg ? "-INF" : "+INF";
            } else {
                if (ch != 110) {
                    break;
                }
                match = neg ? "-Infinity" : "+Infinity";
            }
            _matchToken(match, 3);
            if (isEnabled(JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS)) {
                return resetAsNaN(match, neg ? Double.NEGATIVE_INFINITY : Double.POSITIVE_INFINITY);
            }
            _reportError("Non-standard token '" + match + "': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow");
        }
        reportUnexpectedNumberChar(ch, "expected digit (0-9) to follow minus sign, for valid numeric value");
        return null;
    }

    protected final void _matchToken(String matchStr, int i) throws IOException {
        int len = matchStr.length();
        if (this._inputPtr + len >= this._inputEnd) {
            _matchToken2(matchStr, i);
            return;
        }
        do {
            if (this._inputBuffer[this._inputPtr] != matchStr.charAt(i)) {
                _reportInvalidToken(matchStr.substring(0, i));
            }
            this._inputPtr++;
            i++;
        } while (i < len);
        int ch = this._inputBuffer[this._inputPtr] & 255;
        if (ch >= 48 && ch != 93 && ch != 125) {
            _checkMatchEnd(matchStr, i, ch);
        }
    }

    private final void _matchToken2(String matchStr, int i) throws IOException {
        int ch;
        int len = matchStr.length();
        do {
            if ((this._inputPtr >= this._inputEnd && !loadMore()) || this._inputBuffer[this._inputPtr] != matchStr.charAt(i)) {
                _reportInvalidToken(matchStr.substring(0, i));
            }
            this._inputPtr++;
            i++;
        } while (i < len);
        if ((this._inputPtr < this._inputEnd || loadMore()) && (ch = this._inputBuffer[this._inputPtr] & 255) >= 48 && ch != 93 && ch != 125) {
            _checkMatchEnd(matchStr, i, ch);
        }
    }

    private final void _checkMatchEnd(String matchStr, int i, int ch) throws IOException {
        char c = (char) _decodeCharForError(ch);
        if (Character.isJavaIdentifierPart(c)) {
            _reportInvalidToken(matchStr.substring(0, i));
        }
    }

    private final int _skipWS() throws IOException {
        while (this._inputPtr < this._inputEnd) {
            byte[] bArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            int i2 = bArr[i] & 255;
            if (i2 > 32) {
                if (i2 == 47 || i2 == 35) {
                    this._inputPtr--;
                    return _skipWS2();
                }
                return i2;
            }
            if (i2 != 32) {
                if (i2 == 10) {
                    this._currInputRow++;
                    this._currInputRowStart = this._inputPtr;
                } else if (i2 == 13) {
                    _skipCR();
                } else if (i2 != 9) {
                    _throwInvalidSpace(i2);
                }
            }
        }
        return _skipWS2();
    }

    private final int _skipWS2() throws IOException {
        int i;
        while (true) {
            if (this._inputPtr < this._inputEnd || loadMore()) {
                byte[] bArr = this._inputBuffer;
                int i2 = this._inputPtr;
                this._inputPtr = i2 + 1;
                i = bArr[i2] & 255;
                if (i > 32) {
                    if (i == 47) {
                        _skipComment();
                    } else if (i != 35 || !_skipYAMLComment()) {
                        break;
                    }
                } else if (i != 32) {
                    if (i == 10) {
                        this._currInputRow++;
                        this._currInputRowStart = this._inputPtr;
                    } else if (i == 13) {
                        _skipCR();
                    } else if (i != 9) {
                        _throwInvalidSpace(i);
                    }
                }
            } else {
                throw _constructError("Unexpected end-of-input within/between " + this._parsingContext.getTypeDesc() + " entries");
            }
        }
        return i;
    }

    private final int _skipWSOrEnd() throws IOException {
        if (this._inputPtr >= this._inputEnd && !loadMore()) {
            return _eofAsNextChar();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int i2 = bArr[i] & 255;
        if (i2 > 32) {
            if (i2 == 47 || i2 == 35) {
                this._inputPtr--;
                return _skipWSOrEnd2();
            }
            return i2;
        }
        if (i2 != 32) {
            if (i2 == 10) {
                this._currInputRow++;
                this._currInputRowStart = this._inputPtr;
            } else if (i2 == 13) {
                _skipCR();
            } else if (i2 != 9) {
                _throwInvalidSpace(i2);
            }
        }
        while (this._inputPtr < this._inputEnd) {
            byte[] bArr2 = this._inputBuffer;
            int i3 = this._inputPtr;
            this._inputPtr = i3 + 1;
            int i4 = bArr2[i3] & 255;
            if (i4 > 32) {
                if (i4 == 47 || i4 == 35) {
                    this._inputPtr--;
                    return _skipWSOrEnd2();
                }
                return i4;
            }
            if (i4 != 32) {
                if (i4 == 10) {
                    this._currInputRow++;
                    this._currInputRowStart = this._inputPtr;
                } else if (i4 == 13) {
                    _skipCR();
                } else if (i4 != 9) {
                    _throwInvalidSpace(i4);
                }
            }
        }
        return _skipWSOrEnd2();
    }

    private final int _skipWSOrEnd2() throws IOException {
        int i;
        while (true) {
            if (this._inputPtr < this._inputEnd || loadMore()) {
                byte[] bArr = this._inputBuffer;
                int i2 = this._inputPtr;
                this._inputPtr = i2 + 1;
                i = bArr[i2] & 255;
                if (i > 32) {
                    if (i == 47) {
                        _skipComment();
                    } else if (i != 35 || !_skipYAMLComment()) {
                        break;
                    }
                } else if (i != 32) {
                    if (i == 10) {
                        this._currInputRow++;
                        this._currInputRowStart = this._inputPtr;
                    } else if (i == 13) {
                        _skipCR();
                    } else if (i != 9) {
                        _throwInvalidSpace(i);
                    }
                }
            } else {
                return _eofAsNextChar();
            }
        }
        return i;
    }

    private final int _skipColon() throws IOException {
        if (this._inputPtr + 4 >= this._inputEnd) {
            return _skipColon2(false);
        }
        int i = this._inputBuffer[this._inputPtr];
        if (i == 58) {
            byte[] bArr = this._inputBuffer;
            int i2 = this._inputPtr + 1;
            this._inputPtr = i2;
            byte b = bArr[i2];
            if (b > 32) {
                if (b == 47 || b == 35) {
                    return _skipColon2(true);
                }
                this._inputPtr++;
                return b;
            }
            if (b == 32 || b == 9) {
                byte[] bArr2 = this._inputBuffer;
                int i3 = this._inputPtr + 1;
                this._inputPtr = i3;
                byte b2 = bArr2[i3];
                if (b2 > 32) {
                    if (b2 == 47 || b2 == 35) {
                        return _skipColon2(true);
                    }
                    this._inputPtr++;
                    return b2;
                }
            }
            return _skipColon2(true);
        }
        if (i == 32 || i == 9) {
            byte[] bArr3 = this._inputBuffer;
            int i4 = this._inputPtr + 1;
            this._inputPtr = i4;
            i = bArr3[i4];
        }
        if (i == 58) {
            byte[] bArr4 = this._inputBuffer;
            int i5 = this._inputPtr + 1;
            this._inputPtr = i5;
            byte b3 = bArr4[i5];
            if (b3 > 32) {
                if (b3 == 47 || b3 == 35) {
                    return _skipColon2(true);
                }
                this._inputPtr++;
                return b3;
            }
            if (b3 == 32 || b3 == 9) {
                byte[] bArr5 = this._inputBuffer;
                int i6 = this._inputPtr + 1;
                this._inputPtr = i6;
                byte b4 = bArr5[i6];
                if (b4 > 32) {
                    if (b4 == 47 || b4 == 35) {
                        return _skipColon2(true);
                    }
                    this._inputPtr++;
                    return b4;
                }
            }
            return _skipColon2(true);
        }
        return _skipColon2(false);
    }

    private final int _skipColon2(boolean gotColon) throws IOException {
        while (true) {
            if (this._inputPtr < this._inputEnd || loadMore()) {
                byte[] bArr = this._inputBuffer;
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                int i2 = bArr[i] & 255;
                if (i2 > 32) {
                    if (i2 == 47) {
                        _skipComment();
                    } else if (i2 != 35 || !_skipYAMLComment()) {
                        if (gotColon) {
                            return i2;
                        }
                        if (i2 != 58) {
                            if (i2 < 32) {
                                _throwInvalidSpace(i2);
                            }
                            _reportUnexpectedChar(i2, "was expecting a colon to separate field name and value");
                        }
                        gotColon = true;
                    }
                } else if (i2 != 32) {
                    if (i2 == 10) {
                        this._currInputRow++;
                        this._currInputRowStart = this._inputPtr;
                    } else if (i2 == 13) {
                        _skipCR();
                    } else if (i2 != 9) {
                        _throwInvalidSpace(i2);
                    }
                }
            } else {
                throw _constructError("Unexpected end-of-input within/between " + this._parsingContext.getTypeDesc() + " entries");
            }
        }
    }

    private final void _skipComment() throws IOException {
        if (!isEnabled(JsonParser.Feature.ALLOW_COMMENTS)) {
            _reportUnexpectedChar(47, "maybe a (non-standard) comment? (not recognized as one since Feature 'ALLOW_COMMENTS' not enabled for parser)");
        }
        if (this._inputPtr >= this._inputEnd && !loadMore()) {
            _reportInvalidEOF(" in a comment");
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int c = bArr[i] & 255;
        if (c == 47) {
            _skipLine();
        } else if (c == 42) {
            _skipCComment();
        } else {
            _reportUnexpectedChar(c, "was expecting either '*' or '/' for a comment");
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x00da, code lost:
    
        _reportInvalidEOF(" in a comment");
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x00e1, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final void _skipCComment() throws java.io.IOException {
        /*
            r6 = this;
            int[] r0 = com.fasterxml.jackson.core.io.CharTypes.getInputCodeComment()
            r7 = r0
        L4:
            r0 = r6
            int r0 = r0._inputPtr
            r1 = r6
            int r1 = r1._inputEnd
            if (r0 < r1) goto L16
            r0 = r6
            boolean r0 = r0.loadMore()
            if (r0 == 0) goto Lda
        L16:
            r0 = r6
            byte[] r0 = r0._inputBuffer
            r1 = r6
            r2 = r1
            int r2 = r2._inputPtr
            r3 = r2; r2 = r1; r1 = r3; 
            r4 = 1
            int r3 = r3 + r4
            r2._inputPtr = r3
            r0 = r0[r1]
            r1 = 255(0xff, float:3.57E-43)
            r0 = r0 & r1
            r8 = r0
            r0 = r7
            r1 = r8
            r0 = r0[r1]
            r9 = r0
            r0 = r9
            if (r0 == 0) goto Ld7
            r0 = r9
            switch(r0) {
                case 2: goto Lba;
                case 3: goto Lc2;
                case 4: goto Lca;
                case 10: goto L9e;
                case 13: goto Lb3;
                case 42: goto L70;
                default: goto Ld2;
            }
        L70:
            r0 = r6
            int r0 = r0._inputPtr
            r1 = r6
            int r1 = r1._inputEnd
            if (r0 < r1) goto L85
            r0 = r6
            boolean r0 = r0.loadMore()
            if (r0 != 0) goto L85
            goto Lda
        L85:
            r0 = r6
            byte[] r0 = r0._inputBuffer
            r1 = r6
            int r1 = r1._inputPtr
            r0 = r0[r1]
            r1 = 47
            if (r0 != r1) goto Ld7
            r0 = r6
            r1 = r0
            int r1 = r1._inputPtr
            r2 = 1
            int r1 = r1 + r2
            r0._inputPtr = r1
            return
        L9e:
            r0 = r6
            r1 = r0
            int r1 = r1._currInputRow
            r2 = 1
            int r1 = r1 + r2
            r0._currInputRow = r1
            r0 = r6
            r1 = r6
            int r1 = r1._inputPtr
            r0._currInputRowStart = r1
            goto Ld7
        Lb3:
            r0 = r6
            r0._skipCR()
            goto Ld7
        Lba:
            r0 = r6
            r1 = r8
            r0._skipUtf8_2(r1)
            goto Ld7
        Lc2:
            r0 = r6
            r1 = r8
            r0._skipUtf8_3(r1)
            goto Ld7
        Lca:
            r0 = r6
            r1 = r8
            r0._skipUtf8_4(r1)
            goto Ld7
        Ld2:
            r0 = r6
            r1 = r8
            r0._reportInvalidChar(r1)
        Ld7:
            goto L4
        Lda:
            r0 = r6
            java.lang.String r1 = " in a comment"
            r0._reportInvalidEOF(r1)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.UTF8StreamJsonParser._skipCComment():void");
    }

    private final boolean _skipYAMLComment() throws IOException {
        if (!isEnabled(JsonParser.Feature.ALLOW_YAML_COMMENTS)) {
            return false;
        }
        _skipLine();
        return true;
    }

    private final void _skipLine() throws IOException {
        int[] codes = CharTypes.getInputCodeComment();
        while (true) {
            if (this._inputPtr < this._inputEnd || loadMore()) {
                byte[] bArr = this._inputBuffer;
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                int i2 = bArr[i] & 255;
                int code = codes[i2];
                if (code != 0) {
                    switch (code) {
                        case 2:
                            _skipUtf8_2(i2);
                            break;
                        case 3:
                            _skipUtf8_3(i2);
                            break;
                        case 4:
                            _skipUtf8_4(i2);
                            break;
                        case 10:
                            this._currInputRow++;
                            this._currInputRowStart = this._inputPtr;
                            return;
                        case 13:
                            _skipCR();
                            return;
                        case 42:
                            break;
                        default:
                            if (code >= 0) {
                                break;
                            } else {
                                _reportInvalidChar(i2);
                                break;
                            }
                    }
                }
            } else {
                return;
            }
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected char _decodeEscaped() throws IOException {
        if (this._inputPtr >= this._inputEnd && !loadMore()) {
            _reportInvalidEOF(" in character escape sequence");
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        byte b = bArr[i];
        switch (b) {
            case 34:
            case 47:
            case 92:
                return (char) b;
            case 98:
                return '\b';
            case 102:
                return '\f';
            case 110:
                return '\n';
            case 114:
                return '\r';
            case 116:
                return '\t';
            case 117:
                int value = 0;
                for (int i2 = 0; i2 < 4; i2++) {
                    if (this._inputPtr >= this._inputEnd && !loadMore()) {
                        _reportInvalidEOF(" in character escape sequence");
                    }
                    byte[] bArr2 = this._inputBuffer;
                    int i3 = this._inputPtr;
                    this._inputPtr = i3 + 1;
                    byte b2 = bArr2[i3];
                    int digit = CharTypes.charToHex(b2);
                    if (digit < 0) {
                        _reportUnexpectedChar(b2, "expected a hex-digit for character escape sequence");
                    }
                    value = (value << 4) | digit;
                }
                return (char) value;
            default:
                return _handleUnrecognizedCharacterEscape((char) _decodeCharForError(b));
        }
    }

    protected int _decodeCharForError(int firstByte) throws IOException {
        int needed;
        int c = firstByte & 255;
        if (c > 127) {
            if ((c & 224) == 192) {
                c &= 31;
                needed = 1;
            } else if ((c & 240) == 224) {
                c &= 15;
                needed = 2;
            } else if ((c & 248) == 240) {
                c &= 7;
                needed = 3;
            } else {
                _reportInvalidInitial(c & 255);
                needed = 1;
            }
            int d = nextByte();
            if ((d & 192) != 128) {
                _reportInvalidOther(d & 255);
            }
            c = (c << 6) | (d & 63);
            if (needed > 1) {
                int d2 = nextByte();
                if ((d2 & 192) != 128) {
                    _reportInvalidOther(d2 & 255);
                }
                c = (c << 6) | (d2 & 63);
                if (needed > 2) {
                    int d3 = nextByte();
                    if ((d3 & 192) != 128) {
                        _reportInvalidOther(d3 & 255);
                    }
                    c = (c << 6) | (d3 & 63);
                }
            }
        }
        return c;
    }

    private final int _decodeUtf8_2(int c) throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        byte b = bArr[i];
        if ((b & 192) != 128) {
            _reportInvalidOther(b & 255, this._inputPtr);
        }
        return ((c & 31) << 6) | (b & 63);
    }

    private final int _decodeUtf8_3(int c1) throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        int c12 = c1 & 15;
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        byte b = bArr[i];
        if ((b & 192) != 128) {
            _reportInvalidOther(b & 255, this._inputPtr);
        }
        int c = (c12 << 6) | (b & 63);
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr2 = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        byte b2 = bArr2[i2];
        if ((b2 & 192) != 128) {
            _reportInvalidOther(b2 & 255, this._inputPtr);
        }
        return (c << 6) | (b2 & 63);
    }

    private final int _decodeUtf8_3fast(int c1) throws IOException {
        int c12 = c1 & 15;
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        byte b = bArr[i];
        if ((b & 192) != 128) {
            _reportInvalidOther(b & 255, this._inputPtr);
        }
        int c = (c12 << 6) | (b & 63);
        byte[] bArr2 = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        byte b2 = bArr2[i2];
        if ((b2 & 192) != 128) {
            _reportInvalidOther(b2 & 255, this._inputPtr);
        }
        return (c << 6) | (b2 & 63);
    }

    private final int _decodeUtf8_4(int c) throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        byte b = bArr[i];
        if ((b & 192) != 128) {
            _reportInvalidOther(b & 255, this._inputPtr);
        }
        int c2 = ((c & 7) << 6) | (b & 63);
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr2 = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        byte b2 = bArr2[i2];
        if ((b2 & 192) != 128) {
            _reportInvalidOther(b2 & 255, this._inputPtr);
        }
        int c3 = (c2 << 6) | (b2 & 63);
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr3 = this._inputBuffer;
        int i3 = this._inputPtr;
        this._inputPtr = i3 + 1;
        byte b3 = bArr3[i3];
        if ((b3 & 192) != 128) {
            _reportInvalidOther(b3 & 255, this._inputPtr);
        }
        return ((c3 << 6) | (b3 & 63)) - 65536;
    }

    private final void _skipUtf8_2(int c) throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        byte b = bArr[i];
        if ((b & 192) != 128) {
            _reportInvalidOther(b & 255, this._inputPtr);
        }
    }

    private final void _skipUtf8_3(int c) throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        byte b = bArr[i];
        if ((b & 192) != 128) {
            _reportInvalidOther(b & 255, this._inputPtr);
        }
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr2 = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        byte b2 = bArr2[i2];
        if ((b2 & 192) != 128) {
            _reportInvalidOther(b2 & 255, this._inputPtr);
        }
    }

    private final void _skipUtf8_4(int c) throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        byte b = bArr[i];
        if ((b & 192) != 128) {
            _reportInvalidOther(b & 255, this._inputPtr);
        }
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr2 = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        byte b2 = bArr2[i2];
        if ((b2 & 192) != 128) {
            _reportInvalidOther(b2 & 255, this._inputPtr);
        }
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr3 = this._inputBuffer;
        int i3 = this._inputPtr;
        this._inputPtr = i3 + 1;
        byte b3 = bArr3[i3];
        if ((b3 & 192) != 128) {
            _reportInvalidOther(b3 & 255, this._inputPtr);
        }
    }

    protected final void _skipCR() throws IOException {
        if ((this._inputPtr < this._inputEnd || loadMore()) && this._inputBuffer[this._inputPtr] == 10) {
            this._inputPtr++;
        }
        this._currInputRow++;
        this._currInputRowStart = this._inputPtr;
    }

    private int nextByte() throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        return bArr[i] & 255;
    }

    protected void _reportInvalidToken(String matchedPart) throws IOException {
        _reportInvalidToken(matchedPart, "'null', 'true', 'false' or NaN");
    }

    protected void _reportInvalidToken(String matchedPart, String msg) throws IOException {
        StringBuilder sb = new StringBuilder(matchedPart);
        while (true) {
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                break;
            }
            byte[] bArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            char c = (char) _decodeCharForError(bArr[i]);
            if (!Character.isJavaIdentifierPart(c)) {
                break;
            } else {
                sb.append(c);
            }
        }
        _reportError("Unrecognized token '" + sb.toString() + "': was expecting " + msg);
    }

    protected void _reportInvalidChar(int c) throws JsonParseException {
        if (c < 32) {
            _throwInvalidSpace(c);
        }
        _reportInvalidInitial(c);
    }

    protected void _reportInvalidInitial(int mask) throws JsonParseException {
        _reportError("Invalid UTF-8 start byte 0x" + Integer.toHexString(mask));
    }

    protected void _reportInvalidOther(int mask) throws JsonParseException {
        _reportError("Invalid UTF-8 middle byte 0x" + Integer.toHexString(mask));
    }

    protected void _reportInvalidOther(int mask, int ptr) throws JsonParseException {
        this._inputPtr = ptr;
        _reportInvalidOther(mask);
    }

    public static int[] growArrayBy(int[] arr, int more) {
        if (arr == null) {
            return new int[more];
        }
        return Arrays.copyOf(arr, arr.length + more);
    }

    protected final byte[] _decodeBase64(Base64Variant b64variant) throws IOException {
        ByteArrayBuilder builder = _getByteArrayBuilder();
        while (true) {
            if (this._inputPtr >= this._inputEnd) {
                loadMoreGuaranteed();
            }
            byte[] bArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            int ch = bArr[i] & 255;
            if (ch > 32) {
                int bits = b64variant.decodeBase64Char(ch);
                if (bits < 0) {
                    if (ch == 34) {
                        return builder.toByteArray();
                    }
                    bits = _decodeBase64Escape(b64variant, ch, 0);
                    if (bits < 0) {
                        continue;
                    }
                }
                int decodedData = bits;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                byte[] bArr2 = this._inputBuffer;
                int i2 = this._inputPtr;
                this._inputPtr = i2 + 1;
                int ch2 = bArr2[i2] & 255;
                int bits2 = b64variant.decodeBase64Char(ch2);
                if (bits2 < 0) {
                    bits2 = _decodeBase64Escape(b64variant, ch2, 1);
                }
                int decodedData2 = (decodedData << 6) | bits2;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                byte[] bArr3 = this._inputBuffer;
                int i3 = this._inputPtr;
                this._inputPtr = i3 + 1;
                int ch3 = bArr3[i3] & 255;
                int bits3 = b64variant.decodeBase64Char(ch3);
                if (bits3 < 0) {
                    if (bits3 != -2) {
                        if (ch3 == 34 && !b64variant.usesPadding()) {
                            builder.append(decodedData2 >> 4);
                            return builder.toByteArray();
                        }
                        bits3 = _decodeBase64Escape(b64variant, ch3, 2);
                    }
                    if (bits3 == -2) {
                        if (this._inputPtr >= this._inputEnd) {
                            loadMoreGuaranteed();
                        }
                        byte[] bArr4 = this._inputBuffer;
                        int i4 = this._inputPtr;
                        this._inputPtr = i4 + 1;
                        int ch4 = bArr4[i4] & 255;
                        if (!b64variant.usesPaddingChar(ch4)) {
                            throw reportInvalidBase64Char(b64variant, ch4, 3, "expected padding character '" + b64variant.getPaddingChar() + "'");
                        }
                        builder.append(decodedData2 >> 4);
                    }
                }
                int decodedData3 = (decodedData2 << 6) | bits3;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                byte[] bArr5 = this._inputBuffer;
                int i5 = this._inputPtr;
                this._inputPtr = i5 + 1;
                int ch5 = bArr5[i5] & 255;
                int bits4 = b64variant.decodeBase64Char(ch5);
                if (bits4 < 0) {
                    if (bits4 != -2) {
                        if (ch5 == 34 && !b64variant.usesPadding()) {
                            builder.appendTwoBytes(decodedData3 >> 2);
                            return builder.toByteArray();
                        }
                        bits4 = _decodeBase64Escape(b64variant, ch5, 3);
                    }
                    if (bits4 == -2) {
                        builder.appendTwoBytes(decodedData3 >> 2);
                    }
                }
                builder.appendThreeBytes((decodedData3 << 6) | bits4);
            }
        }
    }
}
