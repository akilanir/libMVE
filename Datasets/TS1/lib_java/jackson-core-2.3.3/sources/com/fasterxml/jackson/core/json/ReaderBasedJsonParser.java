package com.fasterxml.jackson.core.json;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.core.JsonTokenId;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.base.ParserBase;
import com.fasterxml.jackson.core.io.CharTypes;
import com.fasterxml.jackson.core.io.IOContext;
import com.fasterxml.jackson.core.sym.CharsToNameCanonicalizer;
import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import com.fasterxml.jackson.core.util.TextBuffer;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;

/* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/json/ReaderBasedJsonParser.class */
public final class ReaderBasedJsonParser extends ParserBase {
    protected static final int[] _icLatin1 = CharTypes.getInputCodeLatin1();
    private static final int[] _icWS = CharTypes.getInputCodeWS();
    protected Reader _reader;
    protected char[] _inputBuffer;
    protected ObjectCodec _objectCodec;
    protected final CharsToNameCanonicalizer _symbols;
    protected final int _hashSeed;
    protected boolean _tokenIncomplete;

    public ReaderBasedJsonParser(IOContext iOContext, int i, Reader reader, ObjectCodec objectCodec, CharsToNameCanonicalizer charsToNameCanonicalizer) {
        super(iOContext, i);
        this._tokenIncomplete = false;
        this._reader = reader;
        this._inputBuffer = iOContext.allocTokenBuffer();
        this._objectCodec = objectCodec;
        this._symbols = charsToNameCanonicalizer;
        this._hashSeed = charsToNameCanonicalizer.hashSeed();
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
    public int releaseBuffered(Writer writer) throws IOException {
        int i = this._inputEnd - this._inputPtr;
        if (i < 1) {
            return 0;
        }
        writer.write(this._inputBuffer, this._inputPtr, i);
        return i;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public Object getInputSource() {
        return this._reader;
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected boolean loadMore() throws IOException {
        this._currInputProcessed += this._inputEnd;
        this._currInputRowStart -= this._inputEnd;
        if (this._reader != null) {
            int read = this._reader.read(this._inputBuffer, 0, this._inputBuffer.length);
            if (read > 0) {
                this._inputPtr = 0;
                this._inputEnd = read;
                return true;
            }
            _closeInput();
            if (read == 0) {
                throw new IOException("Reader returned 0 characters when trying to read " + this._inputEnd);
            }
            return false;
        }
        return false;
    }

    protected char getNextChar(String str) throws IOException, JsonParseException {
        if (this._inputPtr >= this._inputEnd && !loadMore()) {
            _reportInvalidEOF(str);
        }
        char[] cArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        return cArr[i];
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected void _closeInput() throws IOException {
        if (this._reader != null) {
            if (this._ioContext.isResourceManaged() || isEnabled(JsonParser.Feature.AUTO_CLOSE_SOURCE)) {
                this._reader.close();
            }
            this._reader = null;
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected void _releaseBuffers() throws IOException {
        super._releaseBuffers();
        this._symbols.release();
        char[] cArr = this._inputBuffer;
        if (cArr != null) {
            this._inputBuffer = null;
            this._ioContext.releaseTokenBuffer(cArr);
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public String getText() throws IOException, JsonParseException {
        JsonToken jsonToken = this._currToken;
        if (jsonToken == JsonToken.VALUE_STRING) {
            if (this._tokenIncomplete) {
                this._tokenIncomplete = false;
                _finishString();
            }
            return this._textBuffer.contentsAsString();
        }
        return _getText2(jsonToken);
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

    protected String _getText2(JsonToken jsonToken) {
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
            char[] cArr = this._inputBuffer;
            int i3 = this._inputPtr;
            this._inputPtr = i3 + 1;
            char c = cArr[i3];
            if (c > ' ') {
                int decodeBase64Char = base64Variant.decodeBase64Char(c);
                if (decodeBase64Char < 0) {
                    if (c == '\"') {
                        break;
                    }
                    decodeBase64Char = _decodeBase64Escape(base64Variant, c, 0);
                    if (decodeBase64Char < 0) {
                        continue;
                    }
                }
                if (i > length) {
                    i2 += i;
                    outputStream.write(bArr, 0, i);
                    i = 0;
                }
                int i4 = decodeBase64Char;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                char[] cArr2 = this._inputBuffer;
                int i5 = this._inputPtr;
                this._inputPtr = i5 + 1;
                char c2 = cArr2[i5];
                int decodeBase64Char2 = base64Variant.decodeBase64Char(c2);
                if (decodeBase64Char2 < 0) {
                    decodeBase64Char2 = _decodeBase64Escape(base64Variant, c2, 1);
                }
                int i6 = (i4 << 6) | decodeBase64Char2;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                char[] cArr3 = this._inputBuffer;
                int i7 = this._inputPtr;
                this._inputPtr = i7 + 1;
                char c3 = cArr3[i7];
                int decodeBase64Char3 = base64Variant.decodeBase64Char(c3);
                if (decodeBase64Char3 < 0) {
                    if (decodeBase64Char3 != -2) {
                        if (c3 == '\"' && !base64Variant.usesPadding()) {
                            int i8 = i;
                            i++;
                            bArr[i8] = (byte) (i6 >> 4);
                            break;
                        }
                        decodeBase64Char3 = _decodeBase64Escape(base64Variant, c3, 2);
                    }
                    if (decodeBase64Char3 == -2) {
                        if (this._inputPtr >= this._inputEnd) {
                            loadMoreGuaranteed();
                        }
                        char[] cArr4 = this._inputBuffer;
                        int i9 = this._inputPtr;
                        this._inputPtr = i9 + 1;
                        char c4 = cArr4[i9];
                        if (!base64Variant.usesPaddingChar(c4)) {
                            throw reportInvalidBase64Char(base64Variant, c4, 3, "expected padding character '" + base64Variant.getPaddingChar() + "'");
                        }
                        int i10 = i;
                        i++;
                        bArr[i10] = (byte) (i6 >> 4);
                    }
                }
                int i11 = (i6 << 6) | decodeBase64Char3;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                char[] cArr5 = this._inputBuffer;
                int i12 = this._inputPtr;
                this._inputPtr = i12 + 1;
                char c5 = cArr5[i12];
                int decodeBase64Char4 = base64Variant.decodeBase64Char(c5);
                if (decodeBase64Char4 < 0) {
                    if (decodeBase64Char4 != -2) {
                        if (c5 == '\"' && !base64Variant.usesPadding()) {
                            int i13 = i11 >> 2;
                            int i14 = i;
                            int i15 = i + 1;
                            bArr[i14] = (byte) (i13 >> 8);
                            i = i15 + 1;
                            bArr[i15] = (byte) i13;
                            break;
                        }
                        decodeBase64Char4 = _decodeBase64Escape(base64Variant, c5, 3);
                    }
                    if (decodeBase64Char4 == -2) {
                        int i16 = i11 >> 2;
                        int i17 = i;
                        int i18 = i + 1;
                        bArr[i17] = (byte) (i16 >> 8);
                        i = i18 + 1;
                        bArr[i18] = (byte) i16;
                    }
                }
                int i19 = (i11 << 6) | decodeBase64Char4;
                int i20 = i;
                int i21 = i + 1;
                bArr[i20] = (byte) (i19 >> 16);
                int i22 = i21 + 1;
                bArr[i21] = (byte) (i19 >> 8);
                i = i22 + 1;
                bArr[i22] = (byte) i19;
            }
        }
        this._tokenIncomplete = false;
        if (i > 0) {
            i2 += i;
            outputStream.write(bArr, 0, i);
        }
        return i2;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public JsonToken nextToken() throws IOException, JsonParseException {
        JsonToken _handleOddValue;
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
        boolean inObject = this._parsingContext.inObject();
        if (inObject) {
            this._parsingContext.setCurrentName(_parseName(_skipWSOrEnd));
            this._currToken = JsonToken.FIELD_NAME;
            int _skipWS = _skipWS();
            if (_skipWS != 58) {
                _reportUnexpectedChar(_skipWS, "was expecting a colon to separate field name and value");
            }
            _skipWSOrEnd = _skipWS();
        }
        switch (_skipWSOrEnd) {
            case 34:
                this._tokenIncomplete = true;
                _handleOddValue = JsonToken.VALUE_STRING;
                break;
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
                _handleOddValue = _parseNumber(_skipWSOrEnd);
                break;
            case 91:
                if (!inObject) {
                    this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
                }
                _handleOddValue = JsonToken.START_ARRAY;
                break;
            case 93:
            case 125:
                _reportUnexpectedChar(_skipWSOrEnd, "expected a value");
                _matchToken("true", 1);
                _handleOddValue = JsonToken.VALUE_TRUE;
                break;
            case 102:
                _matchToken("false", 1);
                _handleOddValue = JsonToken.VALUE_FALSE;
                break;
            case 110:
                _matchToken("null", 1);
                _handleOddValue = JsonToken.VALUE_NULL;
                break;
            case 116:
                _matchToken("true", 1);
                _handleOddValue = JsonToken.VALUE_TRUE;
                break;
            case 123:
                if (!inObject) {
                    this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
                }
                _handleOddValue = JsonToken.START_OBJECT;
                break;
            default:
                _handleOddValue = _handleOddValue(_skipWSOrEnd);
                break;
        }
        if (inObject) {
            this._nextToken = _handleOddValue;
            return this._currToken;
        }
        this._currToken = _handleOddValue;
        return _handleOddValue;
    }

    private JsonToken _nextAfterName() {
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
        JsonToken nextToken = nextToken();
        if (nextToken != null) {
            int id = nextToken.id();
            if (id == 9) {
                return Boolean.TRUE;
            }
            if (id == 10) {
                return Boolean.FALSE;
            }
            return null;
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00d8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected com.fasterxml.jackson.core.JsonToken _parseNumber(int r7) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 385
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.ReaderBasedJsonParser._parseNumber(int):com.fasterxml.jackson.core.JsonToken");
    }

    private JsonToken _parseNumber2(boolean z) throws IOException {
        char nextChar;
        char nextChar2;
        char nextChar3;
        char[] emptyAndGetCurrentSegment = this._textBuffer.emptyAndGetCurrentSegment();
        int i = 0;
        if (z) {
            i = 0 + 1;
            emptyAndGetCurrentSegment[0] = '-';
        }
        int i2 = 0;
        if (this._inputPtr < this._inputEnd) {
            char[] cArr = this._inputBuffer;
            int i3 = this._inputPtr;
            this._inputPtr = i3 + 1;
            nextChar = cArr[i3];
        } else {
            nextChar = getNextChar("No digit following minus sign");
        }
        char c = nextChar;
        if (c == '0') {
            c = _verifyNoLeadingZeroes();
        }
        boolean z2 = false;
        while (true) {
            if (c >= '0' && c <= '9') {
                i2++;
                if (i >= emptyAndGetCurrentSegment.length) {
                    emptyAndGetCurrentSegment = this._textBuffer.finishCurrentSegment();
                    i = 0;
                }
                int i4 = i;
                i++;
                emptyAndGetCurrentSegment[i4] = c;
                if (this._inputPtr >= this._inputEnd && !loadMore()) {
                    c = 0;
                    z2 = true;
                    break;
                }
                char[] cArr2 = this._inputBuffer;
                int i5 = this._inputPtr;
                this._inputPtr = i5 + 1;
                c = cArr2[i5];
            } else {
                break;
            }
        }
        if (i2 == 0) {
            reportInvalidNumber("Missing integer part (next char " + _getCharDesc(c) + ")");
        }
        int i6 = 0;
        if (c == '.') {
            int i7 = i;
            i++;
            emptyAndGetCurrentSegment[i7] = c;
            while (true) {
                if (this._inputPtr >= this._inputEnd && !loadMore()) {
                    z2 = true;
                    break;
                }
                char[] cArr3 = this._inputBuffer;
                int i8 = this._inputPtr;
                this._inputPtr = i8 + 1;
                c = cArr3[i8];
                if (c < '0' || c > '9') {
                    break;
                }
                i6++;
                if (i >= emptyAndGetCurrentSegment.length) {
                    emptyAndGetCurrentSegment = this._textBuffer.finishCurrentSegment();
                    i = 0;
                }
                int i9 = i;
                i++;
                emptyAndGetCurrentSegment[i9] = c;
            }
            if (i6 == 0) {
                reportUnexpectedNumberChar(c, "Decimal point not followed by a digit");
            }
        }
        int i10 = 0;
        if (c == 'e' || c == 'E') {
            if (i >= emptyAndGetCurrentSegment.length) {
                emptyAndGetCurrentSegment = this._textBuffer.finishCurrentSegment();
                i = 0;
            }
            int i11 = i;
            i++;
            emptyAndGetCurrentSegment[i11] = c;
            if (this._inputPtr < this._inputEnd) {
                char[] cArr4 = this._inputBuffer;
                int i12 = this._inputPtr;
                this._inputPtr = i12 + 1;
                nextChar2 = cArr4[i12];
            } else {
                nextChar2 = getNextChar("expected a digit for number exponent");
            }
            c = nextChar2;
            if (c == '-' || c == '+') {
                if (i >= emptyAndGetCurrentSegment.length) {
                    emptyAndGetCurrentSegment = this._textBuffer.finishCurrentSegment();
                    i = 0;
                }
                int i13 = i;
                i++;
                emptyAndGetCurrentSegment[i13] = c;
                if (this._inputPtr < this._inputEnd) {
                    char[] cArr5 = this._inputBuffer;
                    int i14 = this._inputPtr;
                    this._inputPtr = i14 + 1;
                    nextChar3 = cArr5[i14];
                } else {
                    nextChar3 = getNextChar("expected a digit for number exponent");
                }
                c = nextChar3;
            }
            while (true) {
                if (c <= '9' && c >= '0') {
                    i10++;
                    if (i >= emptyAndGetCurrentSegment.length) {
                        emptyAndGetCurrentSegment = this._textBuffer.finishCurrentSegment();
                        i = 0;
                    }
                    int i15 = i;
                    i++;
                    emptyAndGetCurrentSegment[i15] = c;
                    if (this._inputPtr >= this._inputEnd && !loadMore()) {
                        z2 = true;
                        break;
                    }
                    char[] cArr6 = this._inputBuffer;
                    int i16 = this._inputPtr;
                    this._inputPtr = i16 + 1;
                    c = cArr6[i16];
                } else {
                    break;
                }
            }
            if (i10 == 0) {
                reportUnexpectedNumberChar(c, "Exponent indicator not followed by a digit");
            }
        }
        if (!z2) {
            this._inputPtr--;
            if (this._parsingContext.inRoot()) {
                _verifyRootSpace(c);
            }
        }
        this._textBuffer.setCurrentLength(i);
        return reset(z, i2, i6, i10);
    }

    private char _verifyNoLeadingZeroes() throws IOException {
        if (this._inputPtr >= this._inputEnd && !loadMore()) {
            return '0';
        }
        char c = this._inputBuffer[this._inputPtr];
        if (c < '0' || c > '9') {
            return '0';
        }
        if (!isEnabled(JsonParser.Feature.ALLOW_NUMERIC_LEADING_ZEROS)) {
            reportInvalidNumber("Leading zeroes not allowed");
        }
        this._inputPtr++;
        if (c == '0') {
            do {
                if (this._inputPtr >= this._inputEnd && !loadMore()) {
                    break;
                }
                c = this._inputBuffer[this._inputPtr];
                if (c < '0' || c > '9') {
                    return '0';
                }
                this._inputPtr++;
            } while (c == '0');
        }
        return c;
    }

    protected JsonToken _handleInvalidNumberStart(int i, boolean z) throws IOException {
        if (i == 73) {
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                _reportInvalidEOFInValue();
            }
            char[] cArr = this._inputBuffer;
            int i2 = this._inputPtr;
            this._inputPtr = i2 + 1;
            i = cArr[i2];
            if (i == 78) {
                String str = z ? "-INF" : "+INF";
                _matchToken(str, 3);
                if (isEnabled(JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS)) {
                    return resetAsNaN(str, z ? Double.NEGATIVE_INFINITY : Double.POSITIVE_INFINITY);
                }
                _reportError("Non-standard token '" + str + "': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow");
            } else if (i == 110) {
                String str2 = z ? "-Infinity" : "+Infinity";
                _matchToken(str2, 3);
                if (isEnabled(JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS)) {
                    return resetAsNaN(str2, z ? Double.NEGATIVE_INFINITY : Double.POSITIVE_INFINITY);
                }
                _reportError("Non-standard token '" + str2 + "': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow");
            }
        }
        reportUnexpectedNumberChar(i, "expected digit (0-9) to follow minus sign, for valid numeric value");
        return null;
    }

    private final void _verifyRootSpace(int i) throws IOException {
        this._inputPtr++;
        switch (i) {
            case JsonTokenId.ID_TRUE /* 9 */:
            case 32:
                break;
            case JsonTokenId.ID_FALSE /* 10 */:
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

    protected String _parseName(int i) throws IOException {
        if (i != 34) {
            return _handleOddName(i);
        }
        int i2 = this._inputPtr;
        int i3 = this._hashSeed;
        int i4 = this._inputEnd;
        if (i2 < i4) {
            int[] iArr = _icLatin1;
            int length = iArr.length;
            while (true) {
                char c = this._inputBuffer[i2];
                if (c < length && iArr[c] != 0) {
                    if (c == '\"') {
                        int i5 = this._inputPtr;
                        this._inputPtr = i2 + 1;
                        return this._symbols.findSymbol(this._inputBuffer, i5, i2 - i5, i3);
                    }
                } else {
                    i3 = (i3 * 33) + c;
                    i2++;
                    if (i2 >= i4) {
                        break;
                    }
                }
            }
        }
        int i6 = this._inputPtr;
        this._inputPtr = i2;
        return _parseName2(i6, i3, 34);
    }

    private String _parseName2(int i, int i2, int i3) throws IOException {
        this._textBuffer.resetWithShared(this._inputBuffer, i, this._inputPtr - i);
        char[] currentSegment = this._textBuffer.getCurrentSegment();
        int currentSegmentSize = this._textBuffer.getCurrentSegmentSize();
        while (true) {
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                _reportInvalidEOF(": was expecting closing '" + ((char) i3) + "' for name");
            }
            char[] cArr = this._inputBuffer;
            int i4 = this._inputPtr;
            this._inputPtr = i4 + 1;
            char c = cArr[i4];
            if (c <= '\\') {
                if (c == '\\') {
                    c = _decodeEscaped();
                } else if (c <= i3) {
                    if (c != i3) {
                        if (c < ' ') {
                            _throwUnquotedSpace(c, "name");
                        }
                    } else {
                        this._textBuffer.setCurrentLength(currentSegmentSize);
                        TextBuffer textBuffer = this._textBuffer;
                        return this._symbols.findSymbol(textBuffer.getTextBuffer(), textBuffer.getTextOffset(), textBuffer.size(), i2);
                    }
                }
            }
            i2 = (i2 * 33) + c;
            int i5 = currentSegmentSize;
            currentSegmentSize++;
            currentSegment[i5] = c;
            if (currentSegmentSize >= currentSegment.length) {
                currentSegment = this._textBuffer.finishCurrentSegment();
                currentSegmentSize = 0;
            }
        }
    }

    protected String _handleOddName(int i) throws IOException {
        boolean isJavaIdentifierPart;
        if (i == 39 && isEnabled(JsonParser.Feature.ALLOW_SINGLE_QUOTES)) {
            return _parseAposName();
        }
        if (!isEnabled(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES)) {
            _reportUnexpectedChar(i, "was expecting double-quote to start field name");
        }
        int[] inputCodeLatin1JsNames = CharTypes.getInputCodeLatin1JsNames();
        int length = inputCodeLatin1JsNames.length;
        if (i < length) {
            isJavaIdentifierPart = inputCodeLatin1JsNames[i] == 0;
        } else {
            isJavaIdentifierPart = Character.isJavaIdentifierPart((char) i);
        }
        if (!isJavaIdentifierPart) {
            _reportUnexpectedChar(i, "was expecting either valid name character (for unquoted name) or double-quote (for quoted) to start field name");
        }
        int i2 = this._inputPtr;
        int i3 = this._hashSeed;
        int i4 = this._inputEnd;
        if (i2 < i4) {
            do {
                char c = this._inputBuffer[i2];
                if (c < length) {
                    if (inputCodeLatin1JsNames[c] != 0) {
                        int i5 = this._inputPtr - 1;
                        this._inputPtr = i2;
                        return this._symbols.findSymbol(this._inputBuffer, i5, i2 - i5, i3);
                    }
                } else if (!Character.isJavaIdentifierPart(c)) {
                    int i6 = this._inputPtr - 1;
                    this._inputPtr = i2;
                    return this._symbols.findSymbol(this._inputBuffer, i6, i2 - i6, i3);
                }
                i3 = (i3 * 33) + c;
                i2++;
            } while (i2 < i4);
        }
        int i7 = this._inputPtr - 1;
        this._inputPtr = i2;
        return _handleOddName2(i7, i3, inputCodeLatin1JsNames);
    }

    protected String _parseAposName() throws IOException {
        int i = this._inputPtr;
        int i2 = this._hashSeed;
        int i3 = this._inputEnd;
        if (i < i3) {
            int[] iArr = _icLatin1;
            int length = iArr.length;
            do {
                char c = this._inputBuffer[i];
                if (c == '\'') {
                    int i4 = this._inputPtr;
                    this._inputPtr = i + 1;
                    return this._symbols.findSymbol(this._inputBuffer, i4, i - i4, i2);
                }
                if (c < length && iArr[c] != 0) {
                    break;
                }
                i2 = (i2 * 33) + c;
                i++;
            } while (i < i3);
        }
        int i5 = this._inputPtr;
        this._inputPtr = i;
        return _parseName2(i5, i2, 39);
    }

    protected JsonToken _handleOddValue(int i) throws IOException {
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
                char[] cArr = this._inputBuffer;
                int i2 = this._inputPtr;
                this._inputPtr = i2 + 1;
                return _handleInvalidNumberStart(cArr[i2], false);
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

    protected JsonToken _handleApos() throws IOException {
        char[] emptyAndGetCurrentSegment = this._textBuffer.emptyAndGetCurrentSegment();
        int currentSegmentSize = this._textBuffer.getCurrentSegmentSize();
        while (true) {
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                _reportInvalidEOF(": was expecting closing quote for a string value");
            }
            char[] cArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            char c = cArr[i];
            if (c <= '\\') {
                if (c == '\\') {
                    c = _decodeEscaped();
                } else if (c <= '\'') {
                    if (c != '\'') {
                        if (c < ' ') {
                            _throwUnquotedSpace(c, "string value");
                        }
                    } else {
                        this._textBuffer.setCurrentLength(currentSegmentSize);
                        return JsonToken.VALUE_STRING;
                    }
                }
            }
            if (currentSegmentSize >= emptyAndGetCurrentSegment.length) {
                emptyAndGetCurrentSegment = this._textBuffer.finishCurrentSegment();
                currentSegmentSize = 0;
            }
            int i2 = currentSegmentSize;
            currentSegmentSize++;
            emptyAndGetCurrentSegment[i2] = c;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x008c A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0028 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.lang.String _handleOddName2(int r7, int r8, int[] r9) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 206
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.ReaderBasedJsonParser._handleOddName2(int, int, int[]):java.lang.String");
    }

    @Override // com.fasterxml.jackson.core.base.ParserBase
    protected void _finishString() throws IOException {
        int i = this._inputPtr;
        int i2 = this._inputEnd;
        if (i < i2) {
            int[] iArr = _icLatin1;
            int length = iArr.length;
            while (true) {
                char c = this._inputBuffer[i];
                if (c < length && iArr[c] != 0) {
                    if (c == '\"') {
                        this._textBuffer.resetWithShared(this._inputBuffer, this._inputPtr, i - this._inputPtr);
                        this._inputPtr = i + 1;
                        return;
                    }
                } else {
                    i++;
                    if (i >= i2) {
                        break;
                    }
                }
            }
        }
        this._textBuffer.resetWithCopy(this._inputBuffer, this._inputPtr, i - this._inputPtr);
        this._inputPtr = i;
        _finishString2();
    }

    protected void _finishString2() throws IOException {
        char[] currentSegment = this._textBuffer.getCurrentSegment();
        int currentSegmentSize = this._textBuffer.getCurrentSegmentSize();
        while (true) {
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                _reportInvalidEOF(": was expecting closing quote for a string value");
            }
            char[] cArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            char c = cArr[i];
            if (c <= '\\') {
                if (c == '\\') {
                    c = _decodeEscaped();
                } else if (c <= '\"') {
                    if (c != '\"') {
                        if (c < ' ') {
                            _throwUnquotedSpace(c, "string value");
                        }
                    } else {
                        this._textBuffer.setCurrentLength(currentSegmentSize);
                        return;
                    }
                }
            }
            if (currentSegmentSize >= currentSegment.length) {
                currentSegment = this._textBuffer.finishCurrentSegment();
                currentSegmentSize = 0;
            }
            int i2 = currentSegmentSize;
            currentSegmentSize++;
            currentSegment[i2] = c;
        }
    }

    protected void _skipString() throws IOException {
        this._tokenIncomplete = false;
        int i = this._inputPtr;
        int i2 = this._inputEnd;
        char[] cArr = this._inputBuffer;
        while (true) {
            if (i >= i2) {
                this._inputPtr = i;
                if (!loadMore()) {
                    _reportInvalidEOF(": was expecting closing quote for a string value");
                }
                i = this._inputPtr;
                i2 = this._inputEnd;
            }
            int i3 = i;
            i++;
            char c = cArr[i3];
            if (c <= '\\') {
                if (c == '\\') {
                    this._inputPtr = i;
                    _decodeEscaped();
                    i = this._inputPtr;
                    i2 = this._inputEnd;
                } else if (c > '\"') {
                    continue;
                } else if (c == '\"') {
                    this._inputPtr = i;
                    return;
                } else if (c < ' ') {
                    this._inputPtr = i;
                    _throwUnquotedSpace(c, "string value");
                }
            }
        }
    }

    protected void _skipCR() throws IOException {
        if ((this._inputPtr < this._inputEnd || loadMore()) && this._inputBuffer[this._inputPtr] == '\n') {
            this._inputPtr++;
        }
        this._currInputRow++;
        this._currInputRowStart = this._inputPtr;
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x007a, code lost:
    
        return r0;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private int _skipWS() throws java.io.IOException {
        /*
            r6 = this;
            int[] r0 = com.fasterxml.jackson.core.json.ReaderBasedJsonParser._icWS
            r7 = r0
        L4:
            r0 = r6
            int r0 = r0._inputPtr
            r1 = r6
            int r1 = r1._inputEnd
            if (r0 < r1) goto L16
            r0 = r6
            boolean r0 = r0.loadMore()
            if (r0 == 0) goto Lad
        L16:
            r0 = r6
            char[] r0 = r0._inputBuffer
            r1 = r6
            r2 = r1
            int r2 = r2._inputPtr
            r3 = r2; r2 = r1; r1 = r3; 
            r4 = 1
            int r3 = r3 + r4
            r2._inputPtr = r3
            char r0 = r0[r1]
            r8 = r0
            r0 = r8
            r1 = 64
            if (r0 < r1) goto L2f
            r0 = r8
            return r0
        L2f:
            r0 = r7
            r1 = r8
            r0 = r0[r1]
            switch(r0) {
                case -1: goto L74;
                case 0: goto L79;
                case 1: goto L7b;
                case 10: goto L7e;
                case 13: goto L93;
                case 35: goto La1;
                case 47: goto L9a;
                default: goto Laa;
            }
        L74:
            r0 = r6
            r1 = r8
            r0._throwInvalidSpace(r1)
        L79:
            r0 = r8
            return r0
        L7b:
            goto L4
        L7e:
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
            goto Laa
        L93:
            r0 = r6
            r0._skipCR()
            goto Laa
        L9a:
            r0 = r6
            r0._skipComment()
            goto Laa
        La1:
            r0 = r6
            boolean r0 = r0._skipYAMLComment()
            if (r0 != 0) goto Laa
            r0 = r8
            return r0
        Laa:
            goto L4
        Lad:
            r0 = r6
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r2 = r1
            r2.<init>()
            java.lang.String r2 = "Unexpected end-of-input within/between "
            java.lang.StringBuilder r1 = r1.append(r2)
            r2 = r6
            com.fasterxml.jackson.core.json.JsonReadContext r2 = r2._parsingContext
            java.lang.String r2 = r2.getTypeDesc()
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.String r2 = " entries"
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.String r1 = r1.toString()
            com.fasterxml.jackson.core.JsonParseException r0 = r0._constructError(r1)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.ReaderBasedJsonParser._skipWS():int");
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x007a, code lost:
    
        return r0;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private int _skipWSOrEnd() throws java.io.IOException {
        /*
            r6 = this;
            int[] r0 = com.fasterxml.jackson.core.json.ReaderBasedJsonParser._icWS
            r7 = r0
        L4:
            r0 = r6
            int r0 = r0._inputPtr
            r1 = r6
            int r1 = r1._inputEnd
            if (r0 < r1) goto L16
            r0 = r6
            boolean r0 = r0.loadMore()
            if (r0 == 0) goto Lad
        L16:
            r0 = r6
            char[] r0 = r0._inputBuffer
            r1 = r6
            r2 = r1
            int r2 = r2._inputPtr
            r3 = r2; r2 = r1; r1 = r3; 
            r4 = 1
            int r3 = r3 + r4
            r2._inputPtr = r3
            char r0 = r0[r1]
            r8 = r0
            r0 = r8
            r1 = 64
            if (r0 < r1) goto L2f
            r0 = r8
            return r0
        L2f:
            r0 = r7
            r1 = r8
            r0 = r0[r1]
            switch(r0) {
                case -1: goto L74;
                case 0: goto L79;
                case 1: goto L7b;
                case 10: goto L7e;
                case 13: goto L93;
                case 35: goto La1;
                case 47: goto L9a;
                default: goto Laa;
            }
        L74:
            r0 = r6
            r1 = r8
            r0._throwInvalidSpace(r1)
        L79:
            r0 = r8
            return r0
        L7b:
            goto L4
        L7e:
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
            goto Laa
        L93:
            r0 = r6
            r0._skipCR()
            goto Laa
        L9a:
            r0 = r6
            r0._skipComment()
            goto Laa
        La1:
            r0 = r6
            boolean r0 = r0._skipYAMLComment()
            if (r0 != 0) goto Laa
            r0 = r8
            return r0
        Laa:
            goto L4
        Lad:
            r0 = r6
            r0._handleEOF()
            r0 = -1
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.ReaderBasedJsonParser._skipWSOrEnd():int");
    }

    private void _skipComment() throws IOException {
        if (!isEnabled(JsonParser.Feature.ALLOW_COMMENTS)) {
            _reportUnexpectedChar(47, "maybe a (non-standard) comment? (not recognized as one since Feature 'ALLOW_COMMENTS' not enabled for parser)");
        }
        if (this._inputPtr >= this._inputEnd && !loadMore()) {
            _reportInvalidEOF(" in a comment");
        }
        char[] cArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        char c = cArr[i];
        if (c == '/') {
            _skipLine();
        } else if (c == '*') {
            _skipCComment();
        } else {
            _reportUnexpectedChar(c, "was expecting either '*' or '/' for a comment");
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x0099, code lost:
    
        _reportInvalidEOF(" in a comment");
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x009f, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void _skipCComment() throws java.io.IOException {
        /*
            r6 = this;
        L0:
            r0 = r6
            int r0 = r0._inputPtr
            r1 = r6
            int r1 = r1._inputEnd
            if (r0 < r1) goto L12
            r0 = r6
            boolean r0 = r0.loadMore()
            if (r0 == 0) goto L99
        L12:
            r0 = r6
            char[] r0 = r0._inputBuffer
            r1 = r6
            r2 = r1
            int r2 = r2._inputPtr
            r3 = r2; r2 = r1; r1 = r3; 
            r4 = 1
            int r3 = r3 + r4
            r2._inputPtr = r3
            char r0 = r0[r1]
            r7 = r0
            r0 = r7
            r1 = 42
            if (r0 > r1) goto L96
            r0 = r7
            r1 = 42
            if (r0 != r1) goto L5d
            r0 = r6
            int r0 = r0._inputPtr
            r1 = r6
            int r1 = r1._inputEnd
            if (r0 < r1) goto L44
            r0 = r6
            boolean r0 = r0.loadMore()
            if (r0 != 0) goto L44
            goto L99
        L44:
            r0 = r6
            char[] r0 = r0._inputBuffer
            r1 = r6
            int r1 = r1._inputPtr
            char r0 = r0[r1]
            r1 = 47
            if (r0 != r1) goto L0
            r0 = r6
            r1 = r0
            int r1 = r1._inputPtr
            r2 = 1
            int r1 = r1 + r2
            r0._inputPtr = r1
            return
        L5d:
            r0 = r7
            r1 = 32
            if (r0 >= r1) goto L96
            r0 = r7
            r1 = 10
            if (r0 != r1) goto L7e
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
            goto L96
        L7e:
            r0 = r7
            r1 = 13
            if (r0 != r1) goto L8b
            r0 = r6
            r0._skipCR()
            goto L96
        L8b:
            r0 = r7
            r1 = 9
            if (r0 == r1) goto L96
            r0 = r6
            r1 = r7
            r0._throwInvalidSpace(r1)
        L96:
            goto L0
        L99:
            r0 = r6
            java.lang.String r1 = " in a comment"
            r0._reportInvalidEOF(r1)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.json.ReaderBasedJsonParser._skipCComment():void");
    }

    private boolean _skipYAMLComment() throws IOException {
        if (!isEnabled(JsonParser.Feature.ALLOW_YAML_COMMENTS)) {
            return false;
        }
        _skipLine();
        return true;
    }

    private void _skipLine() throws IOException {
        while (true) {
            if (this._inputPtr < this._inputEnd || loadMore()) {
                char[] cArr = this._inputBuffer;
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                char c = cArr[i];
                if (c < ' ') {
                    if (c == '\n') {
                        this._currInputRow++;
                        this._currInputRowStart = this._inputPtr;
                        return;
                    } else if (c == '\r') {
                        _skipCR();
                        return;
                    } else if (c != '\t') {
                        _throwInvalidSpace(c);
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
        char[] cArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        char c = cArr[i];
        switch (c) {
            case '\"':
            case '/':
            case '\\':
                return c;
            case 'b':
                return '\b';
            case 'f':
                return '\f';
            case 'n':
                return '\n';
            case 'r':
                return '\r';
            case 't':
                return '\t';
            case 'u':
                int i2 = 0;
                for (int i3 = 0; i3 < 4; i3++) {
                    if (this._inputPtr >= this._inputEnd && !loadMore()) {
                        _reportInvalidEOF(" in character escape sequence");
                    }
                    char[] cArr2 = this._inputBuffer;
                    int i4 = this._inputPtr;
                    this._inputPtr = i4 + 1;
                    char c2 = cArr2[i4];
                    int charToHex = CharTypes.charToHex(c2);
                    if (charToHex < 0) {
                        _reportUnexpectedChar(c2, "expected a hex-digit for character escape sequence");
                    }
                    i2 = (i2 << 4) | charToHex;
                }
                return (char) i2;
            default:
                return _handleUnrecognizedCharacterEscape(c);
        }
    }

    protected void _matchToken(String str, int i) throws IOException {
        char c;
        int length = str.length();
        do {
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                _reportInvalidToken(str.substring(0, i));
            }
            if (this._inputBuffer[this._inputPtr] != str.charAt(i)) {
                _reportInvalidToken(str.substring(0, i));
            }
            this._inputPtr++;
            i++;
        } while (i < length);
        if ((this._inputPtr < this._inputEnd || loadMore()) && (c = this._inputBuffer[this._inputPtr]) >= '0' && c != ']' && c != '}' && Character.isJavaIdentifierPart(c)) {
            _reportInvalidToken(str.substring(0, i));
        }
    }

    protected byte[] _decodeBase64(Base64Variant base64Variant) throws IOException {
        ByteArrayBuilder _getByteArrayBuilder = _getByteArrayBuilder();
        while (true) {
            if (this._inputPtr >= this._inputEnd) {
                loadMoreGuaranteed();
            }
            char[] cArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            char c = cArr[i];
            if (c > ' ') {
                int decodeBase64Char = base64Variant.decodeBase64Char(c);
                if (decodeBase64Char < 0) {
                    if (c == '\"') {
                        return _getByteArrayBuilder.toByteArray();
                    }
                    decodeBase64Char = _decodeBase64Escape(base64Variant, c, 0);
                    if (decodeBase64Char < 0) {
                        continue;
                    }
                }
                int i2 = decodeBase64Char;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                char[] cArr2 = this._inputBuffer;
                int i3 = this._inputPtr;
                this._inputPtr = i3 + 1;
                char c2 = cArr2[i3];
                int decodeBase64Char2 = base64Variant.decodeBase64Char(c2);
                if (decodeBase64Char2 < 0) {
                    decodeBase64Char2 = _decodeBase64Escape(base64Variant, c2, 1);
                }
                int i4 = (i2 << 6) | decodeBase64Char2;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                char[] cArr3 = this._inputBuffer;
                int i5 = this._inputPtr;
                this._inputPtr = i5 + 1;
                char c3 = cArr3[i5];
                int decodeBase64Char3 = base64Variant.decodeBase64Char(c3);
                if (decodeBase64Char3 < 0) {
                    if (decodeBase64Char3 != -2) {
                        if (c3 == '\"' && !base64Variant.usesPadding()) {
                            _getByteArrayBuilder.append(i4 >> 4);
                            return _getByteArrayBuilder.toByteArray();
                        }
                        decodeBase64Char3 = _decodeBase64Escape(base64Variant, c3, 2);
                    }
                    if (decodeBase64Char3 == -2) {
                        if (this._inputPtr >= this._inputEnd) {
                            loadMoreGuaranteed();
                        }
                        char[] cArr4 = this._inputBuffer;
                        int i6 = this._inputPtr;
                        this._inputPtr = i6 + 1;
                        char c4 = cArr4[i6];
                        if (!base64Variant.usesPaddingChar(c4)) {
                            throw reportInvalidBase64Char(base64Variant, c4, 3, "expected padding character '" + base64Variant.getPaddingChar() + "'");
                        }
                        _getByteArrayBuilder.append(i4 >> 4);
                    }
                }
                int i7 = (i4 << 6) | decodeBase64Char3;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                char[] cArr5 = this._inputBuffer;
                int i8 = this._inputPtr;
                this._inputPtr = i8 + 1;
                char c5 = cArr5[i8];
                int decodeBase64Char4 = base64Variant.decodeBase64Char(c5);
                if (decodeBase64Char4 < 0) {
                    if (decodeBase64Char4 != -2) {
                        if (c5 == '\"' && !base64Variant.usesPadding()) {
                            _getByteArrayBuilder.appendTwoBytes(i7 >> 2);
                            return _getByteArrayBuilder.toByteArray();
                        }
                        decodeBase64Char4 = _decodeBase64Escape(base64Variant, c5, 3);
                    }
                    if (decodeBase64Char4 == -2) {
                        _getByteArrayBuilder.appendTwoBytes(i7 >> 2);
                    }
                }
                _getByteArrayBuilder.appendThreeBytes((i7 << 6) | decodeBase64Char4);
            }
        }
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
            char c = this._inputBuffer[this._inputPtr];
            if (!Character.isJavaIdentifierPart(c)) {
                break;
            }
            this._inputPtr++;
            sb.append(c);
        }
        _reportError("Unrecognized token '" + sb.toString() + "': was expecting " + str2);
    }
}
