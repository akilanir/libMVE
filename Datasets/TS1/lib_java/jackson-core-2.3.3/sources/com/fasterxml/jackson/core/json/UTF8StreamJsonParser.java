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
import com.fasterxml.jackson.core.util.ArraysCompat;
import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/json/UTF8StreamJsonParser.class */
public class UTF8StreamJsonParser extends ParserBase {
    static final byte BYTE_LF = 10;
    private static final int[] _icUTF8 = CharTypes.getInputCodeUtf8();
    protected static final int[] _icLatin1 = CharTypes.getInputCodeLatin1();
    private static final int[] _icWS = CharTypes.getInputCodeWS();
    protected ObjectCodec _objectCodec;
    protected final BytesToNameCanonicalizer _symbols;
    protected int[] _quadBuffer;
    protected boolean _tokenIncomplete;
    private int _quad1;
    protected InputStream _inputStream;
    protected byte[] _inputBuffer;
    protected boolean _bufferRecyclable;

    public UTF8StreamJsonParser(IOContext iOContext, int i, InputStream inputStream, ObjectCodec objectCodec, BytesToNameCanonicalizer bytesToNameCanonicalizer, byte[] bArr, int i2, int i3, boolean z) {
        super(iOContext, i);
        this._quadBuffer = new int[16];
        this._tokenIncomplete = false;
        this._inputStream = inputStream;
        this._objectCodec = objectCodec;
        this._symbols = bytesToNameCanonicalizer;
        this._inputBuffer = bArr;
        this._inputPtr = i2;
        this._inputEnd = i3;
        this._currInputRowStart = i2;
        this._currInputProcessed = -i2;
        this._bufferRecyclable = z;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public ObjectCodec getCodec() {
        return this._objectCodec;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public void setCodec(ObjectCodec objectCodec) {
        this._objectCodec = objectCodec;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int releaseBuffered(OutputStream outputStream) throws IOException {
        int i = this._inputEnd - this._inputPtr;
        if (i < 1) {
            return 0;
        }
        outputStream.write(this._inputBuffer, this._inputPtr, i);
        return i;
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
            int read = this._inputStream.read(this._inputBuffer, 0, this._inputBuffer.length);
            if (read > 0) {
                this._inputPtr = 0;
                this._inputEnd = read;
                return true;
            }
            _closeInput();
            if (read == 0) {
                throw new IOException("InputStream.read() returned 0 characters when trying to read " + this._inputBuffer.length + " bytes");
            }
            return false;
        }
        return false;
    }

    protected final boolean _loadToHaveAtLeast(int i) throws IOException {
        if (this._inputStream == null) {
            return false;
        }
        int i2 = this._inputEnd - this._inputPtr;
        if (i2 > 0 && this._inputPtr > 0) {
            this._currInputProcessed += this._inputPtr;
            this._currInputRowStart -= this._inputPtr;
            System.arraycopy(this._inputBuffer, this._inputPtr, this._inputBuffer, 0, i2);
            this._inputEnd = i2;
        } else {
            this._inputEnd = 0;
        }
        this._inputPtr = 0;
        while (this._inputEnd < i) {
            int read = this._inputStream.read(this._inputBuffer, this._inputEnd, this._inputBuffer.length - this._inputEnd);
            if (read < 1) {
                _closeInput();
                if (read == 0) {
                    throw new IOException("InputStream.read() returned 0 characters when trying to read " + i2 + " bytes");
                }
                return false;
            }
            this._inputEnd += read;
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
        byte[] bArr;
        super._releaseBuffers();
        this._symbols.release();
        if (this._bufferRecyclable && (bArr = this._inputBuffer) != null) {
            this._inputBuffer = null;
            this._ioContext.releaseReadIOBuffer(bArr);
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
    public String getValueAsString(String str) throws IOException, JsonParseException {
        if (this._currToken == JsonToken.VALUE_STRING) {
            if (this._tokenIncomplete) {
                this._tokenIncomplete = false;
                _finishString();
            }
            return this._textBuffer.contentsAsString();
        }
        return super.getValueAsString(str);
    }

    protected final String _getText2(JsonToken jsonToken) {
        if (jsonToken == null) {
            return null;
        }
        switch (jsonToken.id()) {
            case 5:
                return this._parsingContext.getCurrentName();
            case JsonTokenId.ID_STRING /* 6 */:
            case JsonTokenId.ID_NUMBER_INT /* 7 */:
            case JsonTokenId.ID_NUMBER_FLOAT /* 8 */:
                return this._textBuffer.contentsAsString();
            default:
                return jsonToken.asString();
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public char[] getTextCharacters() throws IOException, JsonParseException {
        if (this._currToken != null) {
            switch (this._currToken.id()) {
                case 5:
                    if (!this._nameCopied) {
                        String currentName = this._parsingContext.getCurrentName();
                        int length = currentName.length();
                        if (this._nameCopyBuffer == null) {
                            this._nameCopyBuffer = this._ioContext.allocNameCopyBuffer(length);
                        } else if (this._nameCopyBuffer.length < length) {
                            this._nameCopyBuffer = new char[length];
                        }
                        currentName.getChars(0, length, this._nameCopyBuffer, 0);
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
    public byte[] getBinaryValue(Base64Variant base64Variant) throws IOException, JsonParseException {
        if (this._currToken != JsonToken.VALUE_STRING && (this._currToken != JsonToken.VALUE_EMBEDDED_OBJECT || this._binaryValue == null)) {
            _reportError("Current token (" + this._currToken + ") not VALUE_STRING or VALUE_EMBEDDED_OBJECT, can not access as binary");
        }
        if (this._tokenIncomplete) {
            try {
                this._binaryValue = _decodeBase64(base64Variant);
                this._tokenIncomplete = false;
            } catch (IllegalArgumentException e) {
                throw _constructError("Failed to decode VALUE_STRING as base64 (" + base64Variant + "): " + e.getMessage());
            }
        } else if (this._binaryValue == null) {
            ByteArrayBuilder _getByteArrayBuilder = _getByteArrayBuilder();
            _decodeBase64(getText(), _getByteArrayBuilder, base64Variant);
            this._binaryValue = _getByteArrayBuilder.toByteArray();
        }
        return this._binaryValue;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int readBinaryValue(Base64Variant base64Variant, OutputStream outputStream) throws IOException, JsonParseException {
        if (!this._tokenIncomplete || this._currToken != JsonToken.VALUE_STRING) {
            byte[] binaryValue = getBinaryValue(base64Variant);
            outputStream.write(binaryValue);
            return binaryValue.length;
        }
        byte[] allocBase64Buffer = this._ioContext.allocBase64Buffer();
        try {
            int _readBinary = _readBinary(base64Variant, outputStream, allocBase64Buffer);
            this._ioContext.releaseBase64Buffer(allocBase64Buffer);
            return _readBinary;
        } catch (Throwable th) {
            this._ioContext.releaseBase64Buffer(allocBase64Buffer);
            throw th;
        }
    }

    protected int _readBinary(Base64Variant base64Variant, OutputStream outputStream, byte[] bArr) throws IOException, JsonParseException {
        int i = 0;
        int length = bArr.length - 3;
        int i2 = 0;
        while (true) {
            if (this._inputPtr >= this._inputEnd) {
                loadMoreGuaranteed();
            }
            byte[] bArr2 = this._inputBuffer;
            int i3 = this._inputPtr;
            this._inputPtr = i3 + 1;
            int i4 = bArr2[i3] & 255;
            if (i4 > 32) {
                int decodeBase64Char = base64Variant.decodeBase64Char(i4);
                if (decodeBase64Char < 0) {
                    if (i4 == 34) {
                        break;
                    }
                    decodeBase64Char = _decodeBase64Escape(base64Variant, i4, 0);
                    if (decodeBase64Char < 0) {
                        continue;
                    }
                }
                if (i > length) {
                    i2 += i;
                    outputStream.write(bArr, 0, i);
                    i = 0;
                }
                int i5 = decodeBase64Char;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                byte[] bArr3 = this._inputBuffer;
                int i6 = this._inputPtr;
                this._inputPtr = i6 + 1;
                int i7 = bArr3[i6] & 255;
                int decodeBase64Char2 = base64Variant.decodeBase64Char(i7);
                if (decodeBase64Char2 < 0) {
                    decodeBase64Char2 = _decodeBase64Escape(base64Variant, i7, 1);
                }
                int i8 = (i5 << 6) | decodeBase64Char2;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                byte[] bArr4 = this._inputBuffer;
                int i9 = this._inputPtr;
                this._inputPtr = i9 + 1;
                int i10 = bArr4[i9] & 255;
                int decodeBase64Char3 = base64Variant.decodeBase64Char(i10);
                if (decodeBase64Char3 < 0) {
                    if (decodeBase64Char3 != -2) {
                        if (i10 == 34 && !base64Variant.usesPadding()) {
                            int i11 = i;
                            i++;
                            bArr[i11] = (byte) (i8 >> 4);
                            break;
                        }
                        decodeBase64Char3 = _decodeBase64Escape(base64Variant, i10, 2);
                    }
                    if (decodeBase64Char3 == -2) {
                        if (this._inputPtr >= this._inputEnd) {
                            loadMoreGuaranteed();
                        }
                        byte[] bArr5 = this._inputBuffer;
                        int i12 = this._inputPtr;
                        this._inputPtr = i12 + 1;
                        int i13 = bArr5[i12] & 255;
                        if (!base64Variant.usesPaddingChar(i13)) {
                            throw reportInvalidBase64Char(base64Variant, i13, 3, "expected padding character '" + base64Variant.getPaddingChar() + "'");
                        }
                        int i14 = i;
                        i++;
                        bArr[i14] = (byte) (i8 >> 4);
                    }
                }
                int i15 = (i8 << 6) | decodeBase64Char3;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                byte[] bArr6 = this._inputBuffer;
                int i16 = this._inputPtr;
                this._inputPtr = i16 + 1;
                int i17 = bArr6[i16] & 255;
                int decodeBase64Char4 = base64Variant.decodeBase64Char(i17);
                if (decodeBase64Char4 < 0) {
                    if (decodeBase64Char4 != -2) {
                        if (i17 == 34 && !base64Variant.usesPadding()) {
                            int i18 = i15 >> 2;
                            int i19 = i;
                            int i20 = i + 1;
                            bArr[i19] = (byte) (i18 >> 8);
                            i = i20 + 1;
                            bArr[i20] = (byte) i18;
                            break;
                        }
                        decodeBase64Char4 = _decodeBase64Escape(base64Variant, i17, 3);
                    }
                    if (decodeBase64Char4 == -2) {
                        int i21 = i15 >> 2;
                        int i22 = i;
                        int i23 = i + 1;
                        bArr[i22] = (byte) (i21 >> 8);
                        i = i23 + 1;
                        bArr[i23] = (byte) i21;
                    }
                }
                int i24 = (i15 << 6) | decodeBase64Char4;
                int i25 = i;
                int i26 = i + 1;
                bArr[i25] = (byte) (i24 >> 16);
                int i27 = i26 + 1;
                bArr[i26] = (byte) (i24 >> 8);
                i = i27 + 1;
                bArr[i27] = (byte) i24;
            }
        }
        this._tokenIncomplete = false;
        if (i > 0) {
            i2 += i;
            outputStream.write(bArr, 0, i);
        }
        return i2;
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase, com.fasterxml.jackson.core.JsonParser
    public JsonLocation getTokenLocation() {
        return new JsonLocation(this._ioContext.getSourceReference(), getTokenCharacterOffset(), -1L, getTokenLineNr(), getTokenColumnNr());
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase, com.fasterxml.jackson.core.JsonParser
    public JsonLocation getCurrentLocation() {
        return new JsonLocation(this._ioContext.getSourceReference(), this._currInputProcessed + this._inputPtr, -1L, this._currInputRow, (this._inputPtr - this._currInputRowStart) + 1);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public JsonToken nextToken() throws IOException, JsonParseException {
        JsonToken _handleUnexpectedValue;
        this._numTypesValid = 0;
        if (this._currToken == JsonToken.FIELD_NAME) {
            return _nextAfterName();
        }
        if (this._tokenIncomplete) {
            _skipString();
        }
        int _skipWSOrEnd = _skipWSOrEnd();
        if (_skipWSOrEnd < 0) {
            close();
            this._currToken = null;
            return null;
        }
        this._tokenInputTotal = (this._currInputProcessed + this._inputPtr) - 1;
        this._tokenInputRow = this._currInputRow;
        this._tokenInputCol = (this._inputPtr - this._currInputRowStart) - 1;
        this._binaryValue = null;
        if (_skipWSOrEnd == 93) {
            if (!this._parsingContext.inArray()) {
                _reportMismatchedEndMarker(_skipWSOrEnd, '}');
            }
            this._parsingContext = this._parsingContext.getParent();
            JsonToken jsonToken = JsonToken.END_ARRAY;
            this._currToken = jsonToken;
            return jsonToken;
        }
        if (_skipWSOrEnd == 125) {
            if (!this._parsingContext.inObject()) {
                _reportMismatchedEndMarker(_skipWSOrEnd, ']');
            }
            this._parsingContext = this._parsingContext.getParent();
            JsonToken jsonToken2 = JsonToken.END_OBJECT;
            this._currToken = jsonToken2;
            return jsonToken2;
        }
        if (this._parsingContext.expectComma()) {
            if (_skipWSOrEnd != 44) {
                _reportUnexpectedChar(_skipWSOrEnd, "was expecting comma to separate " + this._parsingContext.getTypeDesc() + " entries");
            }
            _skipWSOrEnd = _skipWS();
        }
        if (!this._parsingContext.inObject()) {
            return _nextTokenNotInObject(_skipWSOrEnd);
        }
        this._parsingContext.setCurrentName(_parseName(_skipWSOrEnd).getName());
        this._currToken = JsonToken.FIELD_NAME;
        if (this._inputPtr < this._inputEnd && this._inputBuffer[this._inputPtr] == 58) {
            this._inputPtr++;
        } else {
            int _skipWS = _skipWS();
            if (_skipWS != 58) {
                _reportUnexpectedChar(_skipWS, "was expecting a colon to separate field name and value");
            }
        }
        int _skipWS2 = _skipWS();
        if (_skipWS2 == 34) {
            this._tokenIncomplete = true;
            this._nextToken = JsonToken.VALUE_STRING;
            return this._currToken;
        }
        switch (_skipWS2) {
            case 45:
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
                _handleUnexpectedValue = _parseNumber(_skipWS2);
                break;
            case 91:
                _handleUnexpectedValue = JsonToken.START_ARRAY;
                break;
            case 93:
            case 125:
                _reportUnexpectedChar(_skipWS2, "expected a value");
                _matchToken("true", 1);
                _handleUnexpectedValue = JsonToken.VALUE_TRUE;
                break;
            case 102:
                _matchToken("false", 1);
                _handleUnexpectedValue = JsonToken.VALUE_FALSE;
                break;
            case 110:
                _matchToken("null", 1);
                _handleUnexpectedValue = JsonToken.VALUE_NULL;
                break;
            case 116:
                _matchToken("true", 1);
                _handleUnexpectedValue = JsonToken.VALUE_TRUE;
                break;
            case 123:
                _handleUnexpectedValue = JsonToken.START_OBJECT;
                break;
            default:
                _handleUnexpectedValue = _handleUnexpectedValue(_skipWS2);
                break;
        }
        this._nextToken = _handleUnexpectedValue;
        return this._currToken;
    }

    private final JsonToken _nextTokenNotInObject(int i) throws IOException, JsonParseException {
        if (i == 34) {
            this._tokenIncomplete = true;
            JsonToken jsonToken = JsonToken.VALUE_STRING;
            this._currToken = jsonToken;
            return jsonToken;
        }
        switch (i) {
            case 45:
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
                JsonToken _parseNumber = _parseNumber(i);
                this._currToken = _parseNumber;
                return _parseNumber;
            case 91:
                this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
                JsonToken jsonToken2 = JsonToken.START_ARRAY;
                this._currToken = jsonToken2;
                return jsonToken2;
            case 93:
            case 125:
                _reportUnexpectedChar(i, "expected a value");
                break;
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
                break;
            case 123:
                this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
                JsonToken jsonToken5 = JsonToken.START_OBJECT;
                this._currToken = jsonToken5;
                return jsonToken5;
            default:
                JsonToken _handleUnexpectedValue = _handleUnexpectedValue(i);
                this._currToken = _handleUnexpectedValue;
                return _handleUnexpectedValue;
        }
        _matchToken("true", 1);
        JsonToken jsonToken6 = JsonToken.VALUE_TRUE;
        this._currToken = jsonToken6;
        return jsonToken6;
    }

    private final JsonToken _nextAfterName() {
        this._nameCopied = false;
        JsonToken jsonToken = this._nextToken;
        this._nextToken = null;
        if (jsonToken == JsonToken.START_ARRAY) {
            this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
        } else if (jsonToken == JsonToken.START_OBJECT) {
            this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
        }
        this._currToken = jsonToken;
        return jsonToken;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean nextFieldName(SerializableString serializableString) throws IOException, JsonParseException {
        this._numTypesValid = 0;
        if (this._currToken == JsonToken.FIELD_NAME) {
            _nextAfterName();
            return false;
        }
        if (this._tokenIncomplete) {
            _skipString();
        }
        int _skipWSOrEnd = _skipWSOrEnd();
        if (_skipWSOrEnd < 0) {
            close();
            this._currToken = null;
            return false;
        }
        this._tokenInputTotal = (this._currInputProcessed + this._inputPtr) - 1;
        this._tokenInputRow = this._currInputRow;
        this._tokenInputCol = (this._inputPtr - this._currInputRowStart) - 1;
        this._binaryValue = null;
        if (_skipWSOrEnd == 93) {
            if (!this._parsingContext.inArray()) {
                _reportMismatchedEndMarker(_skipWSOrEnd, '}');
            }
            this._parsingContext = this._parsingContext.getParent();
            this._currToken = JsonToken.END_ARRAY;
            return false;
        }
        if (_skipWSOrEnd == 125) {
            if (!this._parsingContext.inObject()) {
                _reportMismatchedEndMarker(_skipWSOrEnd, ']');
            }
            this._parsingContext = this._parsingContext.getParent();
            this._currToken = JsonToken.END_OBJECT;
            return false;
        }
        if (this._parsingContext.expectComma()) {
            if (_skipWSOrEnd != 44) {
                _reportUnexpectedChar(_skipWSOrEnd, "was expecting comma to separate " + this._parsingContext.getTypeDesc() + " entries");
            }
            _skipWSOrEnd = _skipWS();
        }
        if (!this._parsingContext.inObject()) {
            _nextTokenNotInObject(_skipWSOrEnd);
            return false;
        }
        if (_skipWSOrEnd == 34) {
            byte[] asQuotedUTF8 = serializableString.asQuotedUTF8();
            int length = asQuotedUTF8.length;
            if (this._inputPtr + length < this._inputEnd) {
                int i = this._inputPtr + length;
                if (this._inputBuffer[i] == 34) {
                    int i2 = this._inputPtr;
                    for (int i3 = 0; i3 != length; i3++) {
                        if (asQuotedUTF8[i3] == this._inputBuffer[i2 + i3]) {
                        }
                    }
                    this._inputPtr = i + 1;
                    this._parsingContext.setCurrentName(serializableString.getValue());
                    this._currToken = JsonToken.FIELD_NAME;
                    _isNextTokenNameYes();
                    return true;
                }
            }
        }
        return _isNextTokenNameMaybe(_skipWSOrEnd, serializableString);
    }

    private final void _isNextTokenNameYes() throws IOException, JsonParseException {
        int _skipColon;
        if (this._inputPtr < this._inputEnd - 1 && this._inputBuffer[this._inputPtr] == 58) {
            byte[] bArr = this._inputBuffer;
            int i = this._inputPtr + 1;
            this._inputPtr = i;
            byte b = bArr[i];
            this._inputPtr++;
            if (b == 34) {
                this._tokenIncomplete = true;
                this._nextToken = JsonToken.VALUE_STRING;
                return;
            } else {
                if (b == 123) {
                    this._nextToken = JsonToken.START_OBJECT;
                    return;
                }
                if (b == 91) {
                    this._nextToken = JsonToken.START_ARRAY;
                    return;
                }
                _skipColon = b & 255;
                if (_skipColon <= 32 || _skipColon == 47) {
                    this._inputPtr--;
                    _skipColon = _skipWS();
                }
            }
        } else {
            _skipColon = _skipColon();
        }
        switch (_skipColon) {
            case 34:
                this._tokenIncomplete = true;
                this._nextToken = JsonToken.VALUE_STRING;
                return;
            case 45:
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
                this._nextToken = _parseNumber(_skipColon);
                return;
            case 91:
                this._nextToken = JsonToken.START_ARRAY;
                return;
            case 93:
            case 125:
                _reportUnexpectedChar(_skipColon, "expected a value");
                break;
            case 102:
                _matchToken("false", 1);
                this._nextToken = JsonToken.VALUE_FALSE;
                return;
            case 110:
                _matchToken("null", 1);
                this._nextToken = JsonToken.VALUE_NULL;
                return;
            case 116:
                break;
            case 123:
                this._nextToken = JsonToken.START_OBJECT;
                return;
            default:
                this._nextToken = _handleUnexpectedValue(_skipColon);
                return;
        }
        _matchToken("true", 1);
        this._nextToken = JsonToken.VALUE_TRUE;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    private final boolean _isNextTokenNameMaybe(int i, SerializableString serializableString) throws IOException, JsonParseException {
        JsonToken _handleUnexpectedValue;
        String name = _parseName(i).getName();
        this._parsingContext.setCurrentName(name);
        boolean equals = name.equals(serializableString.getValue());
        this._currToken = JsonToken.FIELD_NAME;
        int _skipWS = _skipWS();
        if (_skipWS != 58) {
            _reportUnexpectedChar(_skipWS, "was expecting a colon to separate field name and value");
        }
        int _skipWS2 = _skipWS();
        if (_skipWS2 == 34) {
            this._tokenIncomplete = true;
            this._nextToken = JsonToken.VALUE_STRING;
            return equals;
        }
        switch (_skipWS2) {
            case 45:
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
                _handleUnexpectedValue = _parseNumber(_skipWS2);
                break;
            case 91:
                _handleUnexpectedValue = JsonToken.START_ARRAY;
                break;
            case 93:
            case 125:
                _reportUnexpectedChar(_skipWS2, "expected a value");
                _matchToken("true", 1);
                _handleUnexpectedValue = JsonToken.VALUE_TRUE;
                break;
            case 102:
                _matchToken("false", 1);
                _handleUnexpectedValue = JsonToken.VALUE_FALSE;
                break;
            case 110:
                _matchToken("null", 1);
                _handleUnexpectedValue = JsonToken.VALUE_NULL;
                break;
            case 116:
                _matchToken("true", 1);
                _handleUnexpectedValue = JsonToken.VALUE_TRUE;
                break;
            case 123:
                _handleUnexpectedValue = JsonToken.START_OBJECT;
                break;
            default:
                _handleUnexpectedValue = _handleUnexpectedValue(_skipWS2);
                break;
        }
        this._nextToken = _handleUnexpectedValue;
        return equals;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public String nextTextValue() throws IOException, JsonParseException {
        if (this._currToken == JsonToken.FIELD_NAME) {
            this._nameCopied = false;
            JsonToken jsonToken = this._nextToken;
            this._nextToken = null;
            this._currToken = jsonToken;
            if (jsonToken == JsonToken.VALUE_STRING) {
                if (this._tokenIncomplete) {
                    this._tokenIncomplete = false;
                    _finishString();
                }
                return this._textBuffer.contentsAsString();
            }
            if (jsonToken == JsonToken.START_ARRAY) {
                this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
                return null;
            }
            if (jsonToken == JsonToken.START_OBJECT) {
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
    public int nextIntValue(int i) throws IOException, JsonParseException {
        if (this._currToken != JsonToken.FIELD_NAME) {
            return nextToken() == JsonToken.VALUE_NUMBER_INT ? getIntValue() : i;
        }
        this._nameCopied = false;
        JsonToken jsonToken = this._nextToken;
        this._nextToken = null;
        this._currToken = jsonToken;
        if (jsonToken == JsonToken.VALUE_NUMBER_INT) {
            return getIntValue();
        }
        if (jsonToken == JsonToken.START_ARRAY) {
            this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
        } else if (jsonToken == JsonToken.START_OBJECT) {
            this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
        }
        return i;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public long nextLongValue(long j) throws IOException, JsonParseException {
        if (this._currToken != JsonToken.FIELD_NAME) {
            return nextToken() == JsonToken.VALUE_NUMBER_INT ? getLongValue() : j;
        }
        this._nameCopied = false;
        JsonToken jsonToken = this._nextToken;
        this._nextToken = null;
        this._currToken = jsonToken;
        if (jsonToken == JsonToken.VALUE_NUMBER_INT) {
            return getLongValue();
        }
        if (jsonToken == JsonToken.START_ARRAY) {
            this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
        } else if (jsonToken == JsonToken.START_OBJECT) {
            this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
        }
        return j;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public Boolean nextBooleanValue() throws IOException, JsonParseException {
        if (this._currToken == JsonToken.FIELD_NAME) {
            this._nameCopied = false;
            JsonToken jsonToken = this._nextToken;
            this._nextToken = null;
            this._currToken = jsonToken;
            if (jsonToken == JsonToken.VALUE_TRUE) {
                return Boolean.TRUE;
            }
            if (jsonToken == JsonToken.VALUE_FALSE) {
                return Boolean.FALSE;
            }
            if (jsonToken == JsonToken.START_ARRAY) {
                this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
                return null;
            }
            if (jsonToken == JsonToken.START_OBJECT) {
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

    protected JsonToken _parseNumber(int i) throws IOException, JsonParseException {
        char[] emptyAndGetCurrentSegment = this._textBuffer.emptyAndGetCurrentSegment();
        int i2 = 0;
        boolean z = i == 45;
        if (z) {
            i2 = 0 + 1;
            emptyAndGetCurrentSegment[0] = '-';
            if (this._inputPtr >= this._inputEnd) {
                loadMoreGuaranteed();
            }
            byte[] bArr = this._inputBuffer;
            int i3 = this._inputPtr;
            this._inputPtr = i3 + 1;
            i = bArr[i3] & 255;
            if (i < 48 || i > 57) {
                return _handleInvalidNumberStart(i, true);
            }
        }
        if (i == 48) {
            i = _verifyNoLeadingZeroes();
        }
        int i4 = i2;
        int i5 = i2 + 1;
        emptyAndGetCurrentSegment[i4] = (char) i;
        int i6 = 1;
        int length = this._inputPtr + emptyAndGetCurrentSegment.length;
        if (length > this._inputEnd) {
            length = this._inputEnd;
        }
        while (this._inputPtr < length) {
            byte[] bArr2 = this._inputBuffer;
            int i7 = this._inputPtr;
            this._inputPtr = i7 + 1;
            int i8 = bArr2[i7] & 255;
            if (i8 >= 48 && i8 <= 57) {
                i6++;
                if (i5 >= emptyAndGetCurrentSegment.length) {
                    emptyAndGetCurrentSegment = this._textBuffer.finishCurrentSegment();
                    i5 = 0;
                }
                int i9 = i5;
                i5++;
                emptyAndGetCurrentSegment[i9] = (char) i8;
            } else {
                if (i8 == 46 || i8 == 101 || i8 == 69) {
                    return _parseFloat(emptyAndGetCurrentSegment, i5, i8, z, i6);
                }
                this._inputPtr--;
                this._textBuffer.setCurrentLength(i5);
                if (this._parsingContext.inRoot()) {
                    _verifyRootSpace(i8);
                }
                return resetInt(z, i6);
            }
        }
        return _parserNumber2(emptyAndGetCurrentSegment, i5, z, i6);
    }

    private final JsonToken _parserNumber2(char[] cArr, int i, boolean z, int i2) throws IOException, JsonParseException {
        int i3;
        while (true) {
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                this._textBuffer.setCurrentLength(i);
                return resetInt(z, i2);
            }
            byte[] bArr = this._inputBuffer;
            int i4 = this._inputPtr;
            this._inputPtr = i4 + 1;
            i3 = bArr[i4] & 255;
            if (i3 > 57 || i3 < 48) {
                break;
            }
            if (i >= cArr.length) {
                cArr = this._textBuffer.finishCurrentSegment();
                i = 0;
            }
            int i5 = i;
            i++;
            cArr[i5] = (char) i3;
            i2++;
        }
        if (i3 == 46 || i3 == 101 || i3 == 69) {
            return _parseFloat(cArr, i, i3, z, i2);
        }
        this._inputPtr--;
        this._textBuffer.setCurrentLength(i);
        if (this._parsingContext.inRoot()) {
            byte[] bArr2 = this._inputBuffer;
            int i6 = this._inputPtr;
            this._inputPtr = i6 + 1;
            _verifyRootSpace(bArr2[i6] & 255);
        }
        return resetInt(z, i2);
    }

    private final int _verifyNoLeadingZeroes() throws IOException, JsonParseException {
        if (this._inputPtr >= this._inputEnd && !loadMore()) {
            return 48;
        }
        int i = this._inputBuffer[this._inputPtr] & 255;
        if (i < 48 || i > 57) {
            return 48;
        }
        if (!isEnabled(JsonParser.Feature.ALLOW_NUMERIC_LEADING_ZEROS)) {
            reportInvalidNumber("Leading zeroes not allowed");
        }
        this._inputPtr++;
        if (i == 48) {
            do {
                if (this._inputPtr >= this._inputEnd && !loadMore()) {
                    break;
                }
                i = this._inputBuffer[this._inputPtr] & 255;
                if (i < 48 || i > 57) {
                    return 48;
                }
                this._inputPtr++;
            } while (i == 48);
        }
        return i;
    }

    private final JsonToken _parseFloat(char[] cArr, int i, int i2, boolean z, int i3) throws IOException, JsonParseException {
        int i4 = 0;
        boolean z2 = false;
        if (i2 == 46) {
            i++;
            cArr[i] = (char) i2;
            while (true) {
                if (this._inputPtr >= this._inputEnd && !loadMore()) {
                    z2 = true;
                    break;
                }
                byte[] bArr = this._inputBuffer;
                int i5 = this._inputPtr;
                this._inputPtr = i5 + 1;
                i2 = bArr[i5] & 255;
                if (i2 < 48 || i2 > 57) {
                    break;
                }
                i4++;
                if (i >= cArr.length) {
                    cArr = this._textBuffer.finishCurrentSegment();
                    i = 0;
                }
                int i6 = i;
                i++;
                cArr[i6] = (char) i2;
            }
            if (i4 == 0) {
                reportUnexpectedNumberChar(i2, "Decimal point not followed by a digit");
            }
        }
        int i7 = 0;
        if (i2 == 101 || i2 == 69) {
            if (i >= cArr.length) {
                cArr = this._textBuffer.finishCurrentSegment();
                i = 0;
            }
            int i8 = i;
            i++;
            cArr[i8] = (char) i2;
            if (this._inputPtr >= this._inputEnd) {
                loadMoreGuaranteed();
            }
            byte[] bArr2 = this._inputBuffer;
            int i9 = this._inputPtr;
            this._inputPtr = i9 + 1;
            i2 = bArr2[i9] & 255;
            if (i2 == 45 || i2 == 43) {
                if (i >= cArr.length) {
                    cArr = this._textBuffer.finishCurrentSegment();
                    i = 0;
                }
                int i10 = i;
                i++;
                cArr[i10] = (char) i2;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                byte[] bArr3 = this._inputBuffer;
                int i11 = this._inputPtr;
                this._inputPtr = i11 + 1;
                i2 = bArr3[i11] & 255;
            }
            while (true) {
                if (i2 <= 57 && i2 >= 48) {
                    i7++;
                    if (i >= cArr.length) {
                        cArr = this._textBuffer.finishCurrentSegment();
                        i = 0;
                    }
                    int i12 = i;
                    i++;
                    cArr[i12] = (char) i2;
                    if (this._inputPtr >= this._inputEnd && !loadMore()) {
                        z2 = true;
                        break;
                    }
                    byte[] bArr4 = this._inputBuffer;
                    int i13 = this._inputPtr;
                    this._inputPtr = i13 + 1;
                    i2 = bArr4[i13] & 255;
                } else {
                    break;
                }
            }
            if (i7 == 0) {
                reportUnexpectedNumberChar(i2, "Exponent indicator not followed by a digit");
            }
        }
        if (!z2) {
            this._inputPtr--;
            if (this._parsingContext.inRoot()) {
                _verifyRootSpace(i2);
            }
        }
        this._textBuffer.setCurrentLength(i);
        return resetFloat(z, i3, i4, i7);
    }

    private final void _verifyRootSpace(int i) throws IOException {
        this._inputPtr++;
        switch (i) {
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
                _reportMissingRootWS(i);
                break;
        }
    }

    protected Name _parseName(int i) throws IOException {
        if (i != 34) {
            return _handleOddName(i);
        }
        if (this._inputPtr + 9 > this._inputEnd) {
            return slowParseName();
        }
        byte[] bArr = this._inputBuffer;
        int[] iArr = _icLatin1;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        int i3 = bArr[i2] & 255;
        if (iArr[i3] == 0) {
            int i4 = this._inputPtr;
            this._inputPtr = i4 + 1;
            int i5 = bArr[i4] & 255;
            if (iArr[i5] == 0) {
                int i6 = (i3 << 8) | i5;
                int i7 = this._inputPtr;
                this._inputPtr = i7 + 1;
                int i8 = bArr[i7] & 255;
                if (iArr[i8] == 0) {
                    int i9 = (i6 << 8) | i8;
                    int i10 = this._inputPtr;
                    this._inputPtr = i10 + 1;
                    int i11 = bArr[i10] & 255;
                    if (iArr[i11] == 0) {
                        int i12 = (i9 << 8) | i11;
                        int i13 = this._inputPtr;
                        this._inputPtr = i13 + 1;
                        int i14 = bArr[i13] & 255;
                        if (iArr[i14] == 0) {
                            this._quad1 = i12;
                            return parseMediumName(i14, iArr);
                        }
                        if (i14 == 34) {
                            return findName(i12, 4);
                        }
                        return parseName(i12, i14, 4);
                    }
                    if (i11 == 34) {
                        return findName(i9, 3);
                    }
                    return parseName(i9, i11, 3);
                }
                if (i8 == 34) {
                    return findName(i6, 2);
                }
                return parseName(i6, i8, 2);
            }
            if (i5 == 34) {
                return findName(i3, 1);
            }
            return parseName(i3, i5, 1);
        }
        if (i3 == 34) {
            return BytesToNameCanonicalizer.getEmptyName();
        }
        return parseName(0, i3, 0);
    }

    protected Name parseMediumName(int i, int[] iArr) throws IOException {
        byte[] bArr = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        int i3 = bArr[i2] & 255;
        if (iArr[i3] != 0) {
            if (i3 == 34) {
                return findName(this._quad1, i, 1);
            }
            return parseName(this._quad1, i, i3, 1);
        }
        int i4 = (i << 8) | i3;
        byte[] bArr2 = this._inputBuffer;
        int i5 = this._inputPtr;
        this._inputPtr = i5 + 1;
        int i6 = bArr2[i5] & 255;
        if (iArr[i6] != 0) {
            if (i6 == 34) {
                return findName(this._quad1, i4, 2);
            }
            return parseName(this._quad1, i4, i6, 2);
        }
        int i7 = (i4 << 8) | i6;
        byte[] bArr3 = this._inputBuffer;
        int i8 = this._inputPtr;
        this._inputPtr = i8 + 1;
        int i9 = bArr3[i8] & 255;
        if (iArr[i9] != 0) {
            if (i9 == 34) {
                return findName(this._quad1, i7, 3);
            }
            return parseName(this._quad1, i7, i9, 3);
        }
        int i10 = (i7 << 8) | i9;
        byte[] bArr4 = this._inputBuffer;
        int i11 = this._inputPtr;
        this._inputPtr = i11 + 1;
        int i12 = bArr4[i11] & 255;
        if (iArr[i12] != 0) {
            if (i12 == 34) {
                return findName(this._quad1, i10, 4);
            }
            return parseName(this._quad1, i10, i12, 4);
        }
        this._quadBuffer[0] = this._quad1;
        this._quadBuffer[1] = i10;
        return parseLongName(i12);
    }

    protected Name parseLongName(int i) throws IOException {
        int[] iArr = _icLatin1;
        int i2 = 2;
        while (this._inputEnd - this._inputPtr >= 4) {
            byte[] bArr = this._inputBuffer;
            int i3 = this._inputPtr;
            this._inputPtr = i3 + 1;
            int i4 = bArr[i3] & 255;
            if (iArr[i4] != 0) {
                if (i4 == 34) {
                    return findName(this._quadBuffer, i2, i, 1);
                }
                return parseEscapedName(this._quadBuffer, i2, i, i4, 1);
            }
            int i5 = (i << 8) | i4;
            byte[] bArr2 = this._inputBuffer;
            int i6 = this._inputPtr;
            this._inputPtr = i6 + 1;
            int i7 = bArr2[i6] & 255;
            if (iArr[i7] != 0) {
                if (i7 == 34) {
                    return findName(this._quadBuffer, i2, i5, 2);
                }
                return parseEscapedName(this._quadBuffer, i2, i5, i7, 2);
            }
            int i8 = (i5 << 8) | i7;
            byte[] bArr3 = this._inputBuffer;
            int i9 = this._inputPtr;
            this._inputPtr = i9 + 1;
            int i10 = bArr3[i9] & 255;
            if (iArr[i10] != 0) {
                if (i10 == 34) {
                    return findName(this._quadBuffer, i2, i8, 3);
                }
                return parseEscapedName(this._quadBuffer, i2, i8, i10, 3);
            }
            int i11 = (i8 << 8) | i10;
            byte[] bArr4 = this._inputBuffer;
            int i12 = this._inputPtr;
            this._inputPtr = i12 + 1;
            int i13 = bArr4[i12] & 255;
            if (iArr[i13] != 0) {
                if (i13 == 34) {
                    return findName(this._quadBuffer, i2, i11, 4);
                }
                return parseEscapedName(this._quadBuffer, i2, i11, i13, 4);
            }
            if (i2 >= this._quadBuffer.length) {
                this._quadBuffer = growArrayBy(this._quadBuffer, i2);
            }
            int i14 = i2;
            i2++;
            this._quadBuffer[i14] = i11;
            i = i13;
        }
        return parseEscapedName(this._quadBuffer, i2, 0, i, 0);
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

    private final Name parseName(int i, int i2, int i3) throws IOException {
        return parseEscapedName(this._quadBuffer, 0, i, i2, i3);
    }

    private final Name parseName(int i, int i2, int i3, int i4) throws IOException {
        this._quadBuffer[0] = i;
        return parseEscapedName(this._quadBuffer, 1, i2, i3, i4);
    }

    protected Name parseEscapedName(int[] iArr, int i, int i2, int i3, int i4) throws IOException {
        int[] iArr2 = _icLatin1;
        while (true) {
            if (iArr2[i3] != 0) {
                if (i3 == 34) {
                    break;
                }
                if (i3 != 92) {
                    _throwUnquotedSpace(i3, "name");
                } else {
                    i3 = _decodeEscaped();
                }
                if (i3 > 127) {
                    if (i4 >= 4) {
                        if (i >= iArr.length) {
                            int[] growArrayBy = growArrayBy(iArr, iArr.length);
                            iArr = growArrayBy;
                            this._quadBuffer = growArrayBy;
                        }
                        int i5 = i;
                        i++;
                        iArr[i5] = i2;
                        i2 = 0;
                        i4 = 0;
                    }
                    if (i3 < 2048) {
                        i2 = (i2 << 8) | 192 | (i3 >> 6);
                        i4++;
                    } else {
                        int i6 = (i2 << 8) | 224 | (i3 >> 12);
                        int i7 = i4 + 1;
                        if (i7 >= 4) {
                            if (i >= iArr.length) {
                                int[] growArrayBy2 = growArrayBy(iArr, iArr.length);
                                iArr = growArrayBy2;
                                this._quadBuffer = growArrayBy2;
                            }
                            int i8 = i;
                            i++;
                            iArr[i8] = i6;
                            i6 = 0;
                            i7 = 0;
                        }
                        i2 = (i6 << 8) | 128 | ((i3 >> 6) & 63);
                        i4 = i7 + 1;
                    }
                    i3 = 128 | (i3 & 63);
                }
            }
            if (i4 < 4) {
                i4++;
                i2 = (i2 << 8) | i3;
            } else {
                if (i >= iArr.length) {
                    int[] growArrayBy3 = growArrayBy(iArr, iArr.length);
                    iArr = growArrayBy3;
                    this._quadBuffer = growArrayBy3;
                }
                int i9 = i;
                i++;
                iArr[i9] = i2;
                i2 = i3;
                i4 = 1;
            }
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                _reportInvalidEOF(" in field name");
            }
            byte[] bArr = this._inputBuffer;
            int i10 = this._inputPtr;
            this._inputPtr = i10 + 1;
            i3 = bArr[i10] & 255;
        }
        if (i4 > 0) {
            if (i >= iArr.length) {
                int[] growArrayBy4 = growArrayBy(iArr, iArr.length);
                iArr = growArrayBy4;
                this._quadBuffer = growArrayBy4;
            }
            int i11 = i;
            i++;
            iArr[i11] = i2;
        }
        Name findName = this._symbols.findName(iArr, i);
        if (findName == null) {
            findName = addName(iArr, i, i4);
        }
        return findName;
    }

    protected Name _handleOddName(int i) throws IOException {
        if (i == 39 && isEnabled(JsonParser.Feature.ALLOW_SINGLE_QUOTES)) {
            return _parseAposName();
        }
        if (!isEnabled(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES)) {
            _reportUnexpectedChar(i, "was expecting double-quote to start field name");
        }
        int[] inputCodeUtf8JsNames = CharTypes.getInputCodeUtf8JsNames();
        if (inputCodeUtf8JsNames[i] != 0) {
            _reportUnexpectedChar(i, "was expecting either valid name character (for unquoted name) or double-quote (for quoted) to start field name");
        }
        int[] iArr = this._quadBuffer;
        int i2 = 0;
        int i3 = 0;
        int i4 = 0;
        while (true) {
            if (i4 < 4) {
                i4++;
                i3 = (i3 << 8) | i;
            } else {
                if (i2 >= iArr.length) {
                    int[] growArrayBy = growArrayBy(iArr, iArr.length);
                    iArr = growArrayBy;
                    this._quadBuffer = growArrayBy;
                }
                int i5 = i2;
                i2++;
                iArr[i5] = i3;
                i3 = i;
                i4 = 1;
            }
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                _reportInvalidEOF(" in field name");
            }
            i = this._inputBuffer[this._inputPtr] & 255;
            if (inputCodeUtf8JsNames[i] != 0) {
                break;
            }
            this._inputPtr++;
        }
        if (i4 > 0) {
            if (i2 >= iArr.length) {
                int[] growArrayBy2 = growArrayBy(iArr, iArr.length);
                iArr = growArrayBy2;
                this._quadBuffer = growArrayBy2;
            }
            int i6 = i2;
            i2++;
            iArr[i6] = i3;
        }
        Name findName = this._symbols.findName(iArr, i2);
        if (findName == null) {
            findName = addName(iArr, i2, i4);
        }
        return findName;
    }

    protected Name _parseAposName() throws IOException {
        if (this._inputPtr >= this._inputEnd && !loadMore()) {
            _reportInvalidEOF(": was expecting closing ''' for name");
        }
        byte[] bArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        int i2 = bArr[i] & 255;
        if (i2 == 39) {
            return BytesToNameCanonicalizer.getEmptyName();
        }
        int[] iArr = this._quadBuffer;
        int i3 = 0;
        int i4 = 0;
        int i5 = 0;
        int[] iArr2 = _icLatin1;
        while (i2 != 39) {
            if (i2 != 34 && iArr2[i2] != 0) {
                if (i2 != 92) {
                    _throwUnquotedSpace(i2, "name");
                } else {
                    i2 = _decodeEscaped();
                }
                if (i2 > 127) {
                    if (i5 >= 4) {
                        if (i3 >= iArr.length) {
                            int[] growArrayBy = growArrayBy(iArr, iArr.length);
                            iArr = growArrayBy;
                            this._quadBuffer = growArrayBy;
                        }
                        int i6 = i3;
                        i3++;
                        iArr[i6] = i4;
                        i4 = 0;
                        i5 = 0;
                    }
                    if (i2 < 2048) {
                        i4 = (i4 << 8) | 192 | (i2 >> 6);
                        i5++;
                    } else {
                        int i7 = (i4 << 8) | 224 | (i2 >> 12);
                        int i8 = i5 + 1;
                        if (i8 >= 4) {
                            if (i3 >= iArr.length) {
                                int[] growArrayBy2 = growArrayBy(iArr, iArr.length);
                                iArr = growArrayBy2;
                                this._quadBuffer = growArrayBy2;
                            }
                            int i9 = i3;
                            i3++;
                            iArr[i9] = i7;
                            i7 = 0;
                            i8 = 0;
                        }
                        i4 = (i7 << 8) | 128 | ((i2 >> 6) & 63);
                        i5 = i8 + 1;
                    }
                    i2 = 128 | (i2 & 63);
                }
            }
            if (i5 < 4) {
                i5++;
                i4 = (i4 << 8) | i2;
            } else {
                if (i3 >= iArr.length) {
                    int[] growArrayBy3 = growArrayBy(iArr, iArr.length);
                    iArr = growArrayBy3;
                    this._quadBuffer = growArrayBy3;
                }
                int i10 = i3;
                i3++;
                iArr[i10] = i4;
                i4 = i2;
                i5 = 1;
            }
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                _reportInvalidEOF(" in field name");
            }
            byte[] bArr2 = this._inputBuffer;
            int i11 = this._inputPtr;
            this._inputPtr = i11 + 1;
            i2 = bArr2[i11] & 255;
        }
        if (i5 > 0) {
            if (i3 >= iArr.length) {
                int[] growArrayBy4 = growArrayBy(iArr, iArr.length);
                iArr = growArrayBy4;
                this._quadBuffer = growArrayBy4;
            }
            int i12 = i3;
            i3++;
            iArr[i12] = i4;
        }
        Name findName = this._symbols.findName(iArr, i3);
        if (findName == null) {
            findName = addName(iArr, i3, i5);
        }
        return findName;
    }

    private final Name findName(int i, int i2) throws JsonParseException {
        Name findName = this._symbols.findName(i);
        if (findName != null) {
            return findName;
        }
        this._quadBuffer[0] = i;
        return addName(this._quadBuffer, 1, i2);
    }

    private final Name findName(int i, int i2, int i3) throws JsonParseException {
        Name findName = this._symbols.findName(i, i2);
        if (findName != null) {
            return findName;
        }
        this._quadBuffer[0] = i;
        this._quadBuffer[1] = i2;
        return addName(this._quadBuffer, 2, i3);
    }

    private final Name findName(int[] iArr, int i, int i2, int i3) throws JsonParseException {
        if (i >= iArr.length) {
            int[] growArrayBy = growArrayBy(iArr, iArr.length);
            iArr = growArrayBy;
            this._quadBuffer = growArrayBy;
        }
        int i4 = i + 1;
        iArr[i] = i2;
        Name findName = this._symbols.findName(iArr, i4);
        if (findName == null) {
            return addName(iArr, i4, i3);
        }
        return findName;
    }

    private final Name addName(int[] iArr, int i, int i2) throws JsonParseException {
        int i3;
        int i4;
        int i5;
        int i6 = ((i << 2) - 4) + i2;
        if (i2 < 4) {
            i3 = iArr[i - 1];
            iArr[i - 1] = i3 << ((4 - i2) << 3);
        } else {
            i3 = 0;
        }
        char[] emptyAndGetCurrentSegment = this._textBuffer.emptyAndGetCurrentSegment();
        int i7 = 0;
        int i8 = 0;
        while (i8 < i6) {
            int i9 = (iArr[i8 >> 2] >> ((3 - (i8 & 3)) << 3)) & 255;
            i8++;
            if (i9 > 127) {
                if ((i9 & 224) == 192) {
                    i4 = i9 & 31;
                    i5 = 1;
                } else if ((i9 & 240) == 224) {
                    i4 = i9 & 15;
                    i5 = 2;
                } else if ((i9 & 248) == 240) {
                    i4 = i9 & 7;
                    i5 = 3;
                } else {
                    _reportInvalidInitial(i9);
                    i4 = 1;
                    i5 = 1;
                }
                if (i8 + i5 > i6) {
                    _reportInvalidEOF(" in field name");
                }
                int i10 = iArr[i8 >> 2] >> ((3 - (i8 & 3)) << 3);
                i8++;
                if ((i10 & 192) != 128) {
                    _reportInvalidOther(i10);
                }
                i9 = (i4 << 6) | (i10 & 63);
                if (i5 > 1) {
                    int i11 = iArr[i8 >> 2] >> ((3 - (i8 & 3)) << 3);
                    i8++;
                    if ((i11 & 192) != 128) {
                        _reportInvalidOther(i11);
                    }
                    i9 = (i9 << 6) | (i11 & 63);
                    if (i5 > 2) {
                        int i12 = iArr[i8 >> 2] >> ((3 - (i8 & 3)) << 3);
                        i8++;
                        if ((i12 & 192) != 128) {
                            _reportInvalidOther(i12 & 255);
                        }
                        i9 = (i9 << 6) | (i12 & 63);
                    }
                }
                if (i5 > 2) {
                    int i13 = i9 - 65536;
                    if (i7 >= emptyAndGetCurrentSegment.length) {
                        emptyAndGetCurrentSegment = this._textBuffer.expandCurrentSegment();
                    }
                    int i14 = i7;
                    i7++;
                    emptyAndGetCurrentSegment[i14] = (char) (55296 + (i13 >> 10));
                    i9 = 56320 | (i13 & 1023);
                }
            }
            if (i7 >= emptyAndGetCurrentSegment.length) {
                emptyAndGetCurrentSegment = this._textBuffer.expandCurrentSegment();
            }
            int i15 = i7;
            i7++;
            emptyAndGetCurrentSegment[i15] = (char) i9;
        }
        String str = new String(emptyAndGetCurrentSegment, 0, i7);
        if (i2 < 4) {
            iArr[i - 1] = i3;
        }
        return this._symbols.addName(str, iArr, i);
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected void _finishString() throws IOException {
        int i = this._inputPtr;
        if (i >= this._inputEnd) {
            loadMoreGuaranteed();
            i = this._inputPtr;
        }
        int i2 = 0;
        char[] emptyAndGetCurrentSegment = this._textBuffer.emptyAndGetCurrentSegment();
        int[] iArr = _icUTF8;
        int min = Math.min(this._inputEnd, i + emptyAndGetCurrentSegment.length);
        byte[] bArr = this._inputBuffer;
        while (true) {
            if (i >= min) {
                break;
            }
            int i3 = bArr[i] & 255;
            if (iArr[i3] != 0) {
                if (i3 == 34) {
                    this._inputPtr = i + 1;
                    this._textBuffer.setCurrentLength(i2);
                    return;
                }
            } else {
                i++;
                int i4 = i2;
                i2++;
                emptyAndGetCurrentSegment[i4] = (char) i3;
            }
        }
        this._inputPtr = i;
        _finishString2(emptyAndGetCurrentSegment, i2);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private final void _finishString2(char[] cArr, int i) throws IOException {
        int[] iArr = _icUTF8;
        byte[] bArr = this._inputBuffer;
        while (true) {
            int i2 = this._inputPtr;
            if (i2 >= this._inputEnd) {
                loadMoreGuaranteed();
                i2 = this._inputPtr;
            }
            if (i >= cArr.length) {
                cArr = this._textBuffer.finishCurrentSegment();
                i = 0;
            }
            int min = Math.min(this._inputEnd, i2 + (cArr.length - i));
            while (true) {
                if (i2 < min) {
                    int i3 = i2;
                    i2++;
                    char c = bArr[i3] & 255 ? 1 : 0;
                    if (iArr[c] != 0) {
                        this._inputPtr = i2;
                        if (c != '\"') {
                            switch (iArr[c]) {
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
                                    int _decodeUtf8_4 = _decodeUtf8_4(c);
                                    int i4 = i;
                                    i++;
                                    cArr[i4] = (char) (55296 | (_decodeUtf8_4 >> 10));
                                    if (i >= cArr.length) {
                                        cArr = this._textBuffer.finishCurrentSegment();
                                        i = 0;
                                    }
                                    c = 56320 | (_decodeUtf8_4 & 1023);
                                    break;
                                default:
                                    if (c < ' ') {
                                        _throwUnquotedSpace(c, "string value");
                                        break;
                                    } else {
                                        _reportInvalidChar(c);
                                        break;
                                    }
                            }
                            if (i >= cArr.length) {
                                cArr = this._textBuffer.finishCurrentSegment();
                                i = 0;
                            }
                            int i5 = i;
                            i++;
                            cArr[i5] = c;
                        } else {
                            this._textBuffer.setCurrentLength(i);
                            return;
                        }
                    } else {
                        int i6 = i;
                        i++;
                        cArr[i6] = c;
                    }
                } else {
                    this._inputPtr = i2;
                }
            }
        }
    }

    protected void _skipString() throws IOException {
        this._tokenIncomplete = false;
        int[] iArr = _icUTF8;
        byte[] bArr = this._inputBuffer;
        while (true) {
            int i = this._inputPtr;
            int i2 = this._inputEnd;
            if (i >= i2) {
                loadMoreGuaranteed();
                i = this._inputPtr;
                i2 = this._inputEnd;
            }
            while (true) {
                if (i < i2) {
                    int i3 = i;
                    i++;
                    int i4 = bArr[i3] & 255;
                    if (iArr[i4] != 0) {
                        this._inputPtr = i;
                        if (i4 != 34) {
                            switch (iArr[i4]) {
                                case 1:
                                    _decodeEscaped();
                                    break;
                                case 2:
                                    _skipUtf8_2(i4);
                                    break;
                                case 3:
                                    _skipUtf8_3(i4);
                                    break;
                                case 4:
                                    _skipUtf8_4(i4);
                                    break;
                                default:
                                    if (i4 < 32) {
                                        _throwUnquotedSpace(i4, "string value");
                                        break;
                                    } else {
                                        _reportInvalidChar(i4);
                                        break;
                                    }
                            }
                        } else {
                            return;
                        }
                    }
                } else {
                    this._inputPtr = i;
                }
            }
        }
    }

    protected JsonToken _handleUnexpectedValue(int i) throws IOException {
        switch (i) {
            case 39:
                if (isEnabled(JsonParser.Feature.ALLOW_SINGLE_QUOTES)) {
                    return _handleApos();
                }
                break;
            case 43:
                if (this._inputPtr >= this._inputEnd && !loadMore()) {
                    _reportInvalidEOFInValue();
                }
                byte[] bArr = this._inputBuffer;
                int i2 = this._inputPtr;
                this._inputPtr = i2 + 1;
                return _handleInvalidNumberStart(bArr[i2] & 255, false);
            case 73:
                _matchToken("Infinity", 1);
                if (isEnabled(JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS)) {
                    return resetAsNaN("Infinity", Double.POSITIVE_INFINITY);
                }
                _reportError("Non-standard token 'Infinity': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow");
                break;
            case 78:
                _matchToken("NaN", 1);
                if (isEnabled(JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS)) {
                    return resetAsNaN("NaN", Double.NaN);
                }
                _reportError("Non-standard token 'NaN': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow");
                break;
        }
        if (Character.isJavaIdentifierStart(i)) {
            _reportInvalidToken("" + ((char) i), "('true', 'false' or 'null')");
        }
        _reportUnexpectedChar(i, "expected a valid value (number, String, array, object, 'true', 'false' or 'null')");
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected JsonToken _handleApos() throws IOException {
        int i = 0;
        char[] emptyAndGetCurrentSegment = this._textBuffer.emptyAndGetCurrentSegment();
        int[] iArr = _icUTF8;
        byte[] bArr = this._inputBuffer;
        while (true) {
            if (this._inputPtr >= this._inputEnd) {
                loadMoreGuaranteed();
            }
            if (i >= emptyAndGetCurrentSegment.length) {
                emptyAndGetCurrentSegment = this._textBuffer.finishCurrentSegment();
                i = 0;
            }
            int i2 = this._inputEnd;
            int length = this._inputPtr + (emptyAndGetCurrentSegment.length - i);
            if (length < i2) {
                i2 = length;
            }
            while (this._inputPtr < i2) {
                int i3 = this._inputPtr;
                this._inputPtr = i3 + 1;
                char c = bArr[i3] & 255 ? 1 : 0;
                if (c != '\'' && iArr[c] == 0) {
                    int i4 = i;
                    i++;
                    emptyAndGetCurrentSegment[i4] = c;
                } else if (c != '\'') {
                    switch (iArr[c]) {
                        case 1:
                            if (c != '\'') {
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
                            int _decodeUtf8_4 = _decodeUtf8_4(c);
                            int i5 = i;
                            i++;
                            emptyAndGetCurrentSegment[i5] = (char) (55296 | (_decodeUtf8_4 >> 10));
                            if (i >= emptyAndGetCurrentSegment.length) {
                                emptyAndGetCurrentSegment = this._textBuffer.finishCurrentSegment();
                                i = 0;
                            }
                            c = 56320 | (_decodeUtf8_4 & 1023);
                            break;
                        default:
                            if (c < ' ') {
                                _throwUnquotedSpace(c, "string value");
                            }
                            _reportInvalidChar(c);
                            break;
                    }
                    if (i >= emptyAndGetCurrentSegment.length) {
                        emptyAndGetCurrentSegment = this._textBuffer.finishCurrentSegment();
                        i = 0;
                    }
                    int i6 = i;
                    i++;
                    emptyAndGetCurrentSegment[i6] = c;
                } else {
                    this._textBuffer.setCurrentLength(i);
                    return JsonToken.VALUE_STRING;
                }
            }
        }
    }

    protected JsonToken _handleInvalidNumberStart(int i, boolean z) throws IOException {
        String str;
        while (i == 73) {
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                _reportInvalidEOFInValue();
            }
            byte[] bArr = this._inputBuffer;
            int i2 = this._inputPtr;
            this._inputPtr = i2 + 1;
            i = bArr[i2];
            if (i == 78) {
                str = z ? "-INF" : "+INF";
            } else {
                if (i != 110) {
                    break;
                }
                str = z ? "-Infinity" : "+Infinity";
            }
            _matchToken(str, 3);
            if (isEnabled(JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS)) {
                return resetAsNaN(str, z ? Double.NEGATIVE_INFINITY : Double.POSITIVE_INFINITY);
            }
            _reportError("Non-standard token '" + str + "': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow");
        }
        reportUnexpectedNumberChar(i, "expected digit (0-9) to follow minus sign, for valid numeric value");
        return null;
    }

    protected void _matchToken(String str, int i) throws IOException {
        int i2;
        int length = str.length();
        do {
            if ((this._inputPtr >= this._inputEnd && !loadMore()) || this._inputBuffer[this._inputPtr] != str.charAt(i)) {
                _reportInvalidToken(str.substring(0, i));
            }
            this._inputPtr++;
            i++;
        } while (i < length);
        if ((this._inputPtr < this._inputEnd || loadMore()) && (i2 = this._inputBuffer[this._inputPtr] & 255) >= 48 && i2 != 93 && i2 != 125 && Character.isJavaIdentifierPart((char) _decodeCharForError(i2))) {
            _reportInvalidToken(str.substring(0, i));
        }
    }

    private final int _skipWS() throws IOException {
        int[] iArr = _icWS;
        while (true) {
            if (this._inputPtr < this._inputEnd || loadMore()) {
                byte[] bArr = this._inputBuffer;
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                int i2 = bArr[i] & 255;
                switch (iArr[i2]) {
                    case 0:
                        return i2;
                    case 1:
                        break;
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
                        break;
                    case 13:
                        _skipCR();
                        break;
                    case 35:
                        if (!_skipYAMLComment()) {
                            return i2;
                        }
                        break;
                    case 47:
                        _skipComment();
                        break;
                    default:
                        if (i2 < 32) {
                            _throwInvalidSpace(i2);
                        }
                        _reportInvalidChar(i2);
                        break;
                }
            } else {
                throw _constructError("Unexpected end-of-input within/between " + this._parsingContext.getTypeDesc() + " entries");
            }
        }
    }

    private final int _skipWSOrEnd() throws IOException {
        int[] iArr = _icWS;
        while (true) {
            if (this._inputPtr < this._inputEnd || loadMore()) {
                byte[] bArr = this._inputBuffer;
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                int i2 = bArr[i] & 255;
                switch (iArr[i2]) {
                    case 0:
                        return i2;
                    case 1:
                        break;
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
                        break;
                    case 13:
                        _skipCR();
                        break;
                    case 35:
                        if (!_skipYAMLComment()) {
                            return i2;
                        }
                        break;
                    case 47:
                        _skipComment();
                        break;
                    default:
                        _reportInvalidChar(i2);
                        break;
                }
            } else {
                _handleEOF();
                return -1;
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to find 'out' block for switch in B:17:0x005e. Please report as an issue. */
    /* JADX WARN: Removed duplicated region for block: B:27:0x00cf  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00d3 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final int _skipColon() throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 403
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.UTF8StreamJsonParser._skipColon():int");
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
        int i2 = bArr[i] & 255;
        if (i2 == 47) {
            _skipLine();
        } else if (i2 == 42) {
            _skipCComment();
        } else {
            _reportUnexpectedChar(i2, "was expecting either '*' or '/' for a comment");
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
        int[] inputCodeComment = CharTypes.getInputCodeComment();
        while (true) {
            if (this._inputPtr < this._inputEnd || loadMore()) {
                byte[] bArr = this._inputBuffer;
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                int i2 = bArr[i] & 255;
                int i3 = inputCodeComment[i2];
                if (i3 != 0) {
                    switch (i3) {
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
                            if (i3 >= 0) {
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
                int i2 = 0;
                for (int i3 = 0; i3 < 4; i3++) {
                    if (this._inputPtr >= this._inputEnd && !loadMore()) {
                        _reportInvalidEOF(" in character escape sequence");
                    }
                    byte[] bArr2 = this._inputBuffer;
                    int i4 = this._inputPtr;
                    this._inputPtr = i4 + 1;
                    byte b2 = bArr2[i4];
                    int charToHex = CharTypes.charToHex(b2);
                    if (charToHex < 0) {
                        _reportUnexpectedChar(b2, "expected a hex-digit for character escape sequence");
                    }
                    i2 = (i2 << 4) | charToHex;
                }
                return (char) i2;
            default:
                return _handleUnrecognizedCharacterEscape((char) _decodeCharForError(b));
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v24 */
    /* JADX WARN: Type inference failed for: r0v32 */
    protected int _decodeCharForError(int i) throws IOException {
        boolean z;
        int i2 = i;
        if (i2 < 0) {
            if ((i2 & 224) == 192) {
                i2 &= 31;
                z = true;
            } else if ((i2 & 240) == 224) {
                i2 &= 15;
                z = 2;
            } else if ((i2 & 248) == 240) {
                i2 &= 7;
                z = 3;
            } else {
                _reportInvalidInitial(i2 & 255);
                z = true;
            }
            int nextByte = nextByte();
            if ((nextByte & 192) != 128) {
                _reportInvalidOther(nextByte & 255);
            }
            i2 = (i2 << 6) | (nextByte & 63);
            if (z > 1) {
                int nextByte2 = nextByte();
                if ((nextByte2 & 192) != 128) {
                    _reportInvalidOther(nextByte2 & 255);
                }
                i2 = (i2 << 6) | (nextByte2 & 63);
                if (z > 2) {
                    int nextByte3 = nextByte();
                    if ((nextByte3 & 192) != 128) {
                        _reportInvalidOther(nextByte3 & 255);
                    }
                    i2 = (i2 << 6) | (nextByte3 & 63);
                }
            }
        }
        return i2;
    }

    private final int _decodeUtf8_2(int i) throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        byte b = bArr[i2];
        if ((b & 192) != 128) {
            _reportInvalidOther(b & 255, this._inputPtr);
        }
        return ((i & 31) << 6) | (b & 63);
    }

    private final int _decodeUtf8_3(int i) throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        int i2 = i & 15;
        byte[] bArr = this._inputBuffer;
        int i3 = this._inputPtr;
        this._inputPtr = i3 + 1;
        byte b = bArr[i3];
        if ((b & 192) != 128) {
            _reportInvalidOther(b & 255, this._inputPtr);
        }
        int i4 = (i2 << 6) | (b & 63);
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr2 = this._inputBuffer;
        int i5 = this._inputPtr;
        this._inputPtr = i5 + 1;
        byte b2 = bArr2[i5];
        if ((b2 & 192) != 128) {
            _reportInvalidOther(b2 & 255, this._inputPtr);
        }
        return (i4 << 6) | (b2 & 63);
    }

    private final int _decodeUtf8_3fast(int i) throws IOException {
        int i2 = i & 15;
        byte[] bArr = this._inputBuffer;
        int i3 = this._inputPtr;
        this._inputPtr = i3 + 1;
        byte b = bArr[i3];
        if ((b & 192) != 128) {
            _reportInvalidOther(b & 255, this._inputPtr);
        }
        int i4 = (i2 << 6) | (b & 63);
        byte[] bArr2 = this._inputBuffer;
        int i5 = this._inputPtr;
        this._inputPtr = i5 + 1;
        byte b2 = bArr2[i5];
        if ((b2 & 192) != 128) {
            _reportInvalidOther(b2 & 255, this._inputPtr);
        }
        return (i4 << 6) | (b2 & 63);
    }

    private final int _decodeUtf8_4(int i) throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        byte b = bArr[i2];
        if ((b & 192) != 128) {
            _reportInvalidOther(b & 255, this._inputPtr);
        }
        int i3 = ((i & 7) << 6) | (b & 63);
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr2 = this._inputBuffer;
        int i4 = this._inputPtr;
        this._inputPtr = i4 + 1;
        byte b2 = bArr2[i4];
        if ((b2 & 192) != 128) {
            _reportInvalidOther(b2 & 255, this._inputPtr);
        }
        int i5 = (i3 << 6) | (b2 & 63);
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr3 = this._inputBuffer;
        int i6 = this._inputPtr;
        this._inputPtr = i6 + 1;
        byte b3 = bArr3[i6];
        if ((b3 & 192) != 128) {
            _reportInvalidOther(b3 & 255, this._inputPtr);
        }
        return ((i5 << 6) | (b3 & 63)) - 65536;
    }

    private final void _skipUtf8_2(int i) throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        byte b = bArr[i2];
        if ((b & 192) != 128) {
            _reportInvalidOther(b & 255, this._inputPtr);
        }
    }

    private final void _skipUtf8_3(int i) throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        byte b = bArr[i2];
        if ((b & 192) != 128) {
            _reportInvalidOther(b & 255, this._inputPtr);
        }
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr2 = this._inputBuffer;
        int i3 = this._inputPtr;
        this._inputPtr = i3 + 1;
        byte b2 = bArr2[i3];
        if ((b2 & 192) != 128) {
            _reportInvalidOther(b2 & 255, this._inputPtr);
        }
    }

    private final void _skipUtf8_4(int i) throws IOException {
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr = this._inputBuffer;
        int i2 = this._inputPtr;
        this._inputPtr = i2 + 1;
        byte b = bArr[i2];
        if ((b & 192) != 128) {
            _reportInvalidOther(b & 255, this._inputPtr);
        }
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr2 = this._inputBuffer;
        int i3 = this._inputPtr;
        this._inputPtr = i3 + 1;
        byte b2 = bArr2[i3];
        if ((b2 & 192) != 128) {
            _reportInvalidOther(b2 & 255, this._inputPtr);
        }
        if (this._inputPtr >= this._inputEnd) {
            loadMoreGuaranteed();
        }
        byte[] bArr3 = this._inputBuffer;
        int i4 = this._inputPtr;
        this._inputPtr = i4 + 1;
        byte b3 = bArr3[i4];
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

    protected void _reportInvalidToken(String str) throws IOException {
        _reportInvalidToken(str, "'null', 'true', 'false' or NaN");
    }

    protected void _reportInvalidToken(String str, String str2) throws IOException {
        StringBuilder sb = new StringBuilder(str);
        while (true) {
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                break;
            }
            byte[] bArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            char _decodeCharForError = (char) _decodeCharForError(bArr[i]);
            if (!Character.isJavaIdentifierPart(_decodeCharForError)) {
                break;
            } else {
                sb.append(_decodeCharForError);
            }
        }
        _reportError("Unrecognized token '" + sb.toString() + "': was expecting " + str2);
    }

    protected void _reportInvalidChar(int i) throws JsonParseException {
        if (i < 32) {
            _throwInvalidSpace(i);
        }
        _reportInvalidInitial(i);
    }

    protected void _reportInvalidInitial(int i) throws JsonParseException {
        _reportError("Invalid UTF-8 start byte 0x" + Integer.toHexString(i));
    }

    protected void _reportInvalidOther(int i) throws JsonParseException {
        _reportError("Invalid UTF-8 middle byte 0x" + Integer.toHexString(i));
    }

    protected void _reportInvalidOther(int i, int i2) throws JsonParseException {
        this._inputPtr = i2;
        _reportInvalidOther(i);
    }

    public static int[] growArrayBy(int[] iArr, int i) {
        if (iArr == null) {
            return new int[i];
        }
        return ArraysCompat.copyOf(iArr, iArr.length + i);
    }

    protected final byte[] _decodeBase64(Base64Variant base64Variant) throws IOException {
        ByteArrayBuilder _getByteArrayBuilder = _getByteArrayBuilder();
        while (true) {
            if (this._inputPtr >= this._inputEnd) {
                loadMoreGuaranteed();
            }
            byte[] bArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            int i2 = bArr[i] & 255;
            if (i2 > 32) {
                int decodeBase64Char = base64Variant.decodeBase64Char(i2);
                if (decodeBase64Char < 0) {
                    if (i2 == 34) {
                        return _getByteArrayBuilder.toByteArray();
                    }
                    decodeBase64Char = _decodeBase64Escape(base64Variant, i2, 0);
                    if (decodeBase64Char < 0) {
                        continue;
                    }
                }
                int i3 = decodeBase64Char;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                byte[] bArr2 = this._inputBuffer;
                int i4 = this._inputPtr;
                this._inputPtr = i4 + 1;
                int i5 = bArr2[i4] & 255;
                int decodeBase64Char2 = base64Variant.decodeBase64Char(i5);
                if (decodeBase64Char2 < 0) {
                    decodeBase64Char2 = _decodeBase64Escape(base64Variant, i5, 1);
                }
                int i6 = (i3 << 6) | decodeBase64Char2;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                byte[] bArr3 = this._inputBuffer;
                int i7 = this._inputPtr;
                this._inputPtr = i7 + 1;
                int i8 = bArr3[i7] & 255;
                int decodeBase64Char3 = base64Variant.decodeBase64Char(i8);
                if (decodeBase64Char3 < 0) {
                    if (decodeBase64Char3 != -2) {
                        if (i8 == 34 && !base64Variant.usesPadding()) {
                            _getByteArrayBuilder.append(i6 >> 4);
                            return _getByteArrayBuilder.toByteArray();
                        }
                        decodeBase64Char3 = _decodeBase64Escape(base64Variant, i8, 2);
                    }
                    if (decodeBase64Char3 == -2) {
                        if (this._inputPtr >= this._inputEnd) {
                            loadMoreGuaranteed();
                        }
                        byte[] bArr4 = this._inputBuffer;
                        int i9 = this._inputPtr;
                        this._inputPtr = i9 + 1;
                        int i10 = bArr4[i9] & 255;
                        if (!base64Variant.usesPaddingChar(i10)) {
                            throw reportInvalidBase64Char(base64Variant, i10, 3, "expected padding character '" + base64Variant.getPaddingChar() + "'");
                        }
                        _getByteArrayBuilder.append(i6 >> 4);
                    }
                }
                int i11 = (i6 << 6) | decodeBase64Char3;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                byte[] bArr5 = this._inputBuffer;
                int i12 = this._inputPtr;
                this._inputPtr = i12 + 1;
                int i13 = bArr5[i12] & 255;
                int decodeBase64Char4 = base64Variant.decodeBase64Char(i13);
                if (decodeBase64Char4 < 0) {
                    if (decodeBase64Char4 != -2) {
                        if (i13 == 34 && !base64Variant.usesPadding()) {
                            _getByteArrayBuilder.appendTwoBytes(i11 >> 2);
                            return _getByteArrayBuilder.toByteArray();
                        }
                        decodeBase64Char4 = _decodeBase64Escape(base64Variant, i13, 3);
                    }
                    if (decodeBase64Char4 == -2) {
                        _getByteArrayBuilder.appendTwoBytes(i11 >> 2);
                    }
                }
                _getByteArrayBuilder.appendThreeBytes((i11 << 6) | decodeBase64Char4);
            }
        }
    }
}
