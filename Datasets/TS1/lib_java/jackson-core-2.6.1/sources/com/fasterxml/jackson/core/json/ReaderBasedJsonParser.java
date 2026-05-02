package com.fasterxml.jackson.core.json;

import com.fasterxml.jackson.core.Base64Variant;
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

/* loaded from: jackson-core-2.6.1.jar:com/fasterxml/jackson/core/json/ReaderBasedJsonParser.class */
public class ReaderBasedJsonParser extends ParserBase {
    protected static final int[] _icLatin1 = CharTypes.getInputCodeLatin1();
    protected Reader _reader;
    protected char[] _inputBuffer;
    protected boolean _bufferRecyclable;
    protected ObjectCodec _objectCodec;
    protected final CharsToNameCanonicalizer _symbols;
    protected final int _hashSeed;
    protected boolean _tokenIncomplete;

    public ReaderBasedJsonParser(IOContext ctxt, int features, Reader r, ObjectCodec codec, CharsToNameCanonicalizer st, char[] inputBuffer, int start, int end, boolean bufferRecyclable) {
        super(ctxt, features);
        this._tokenIncomplete = false;
        this._reader = r;
        this._inputBuffer = inputBuffer;
        this._inputPtr = start;
        this._inputEnd = end;
        this._objectCodec = codec;
        this._symbols = st;
        this._hashSeed = st.hashSeed();
        this._bufferRecyclable = bufferRecyclable;
    }

    public ReaderBasedJsonParser(IOContext ctxt, int features, Reader r, ObjectCodec codec, CharsToNameCanonicalizer st) {
        super(ctxt, features);
        this._tokenIncomplete = false;
        this._reader = r;
        this._inputBuffer = ctxt.allocTokenBuffer();
        this._inputPtr = 0;
        this._inputEnd = 0;
        this._objectCodec = codec;
        this._symbols = st;
        this._hashSeed = st.hashSeed();
        this._bufferRecyclable = true;
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
    public int releaseBuffered(Writer w) throws IOException {
        int count = this._inputEnd - this._inputPtr;
        if (count < 1) {
            return 0;
        }
        int origPtr = this._inputPtr;
        w.write(this._inputBuffer, origPtr, count);
        return count;
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
            int count = this._reader.read(this._inputBuffer, 0, this._inputBuffer.length);
            if (count > 0) {
                this._inputPtr = 0;
                this._inputEnd = count;
                return true;
            }
            _closeInput();
            if (count == 0) {
                throw new IOException("Reader returned 0 characters when trying to read " + this._inputEnd);
            }
            return false;
        }
        return false;
    }

    protected char getNextChar(String eofMsg) throws IOException {
        if (this._inputPtr >= this._inputEnd && !loadMore()) {
            _reportInvalidEOF(eofMsg);
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
        char[] buf;
        super._releaseBuffers();
        this._symbols.release();
        if (this._bufferRecyclable && (buf = this._inputBuffer) != null) {
            this._inputBuffer = null;
            this._ioContext.releaseTokenBuffer(buf);
        }
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public final String getText() throws IOException {
        JsonToken t = this._currToken;
        if (t == JsonToken.VALUE_STRING) {
            if (this._tokenIncomplete) {
                this._tokenIncomplete = false;
                _finishString();
            }
            return this._textBuffer.contentsAsString();
        }
        return _getText2(t);
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public final String getValueAsString() throws IOException {
        if (this._currToken == JsonToken.VALUE_STRING) {
            if (this._tokenIncomplete) {
                this._tokenIncomplete = false;
                _finishString();
            }
            return this._textBuffer.contentsAsString();
        }
        if (this._currToken == JsonToken.FIELD_NAME) {
            return getCurrentName();
        }
        return super.getValueAsString(null);
    }

    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public final String getValueAsString(String defValue) throws IOException {
        if (this._currToken == JsonToken.VALUE_STRING) {
            if (this._tokenIncomplete) {
                this._tokenIncomplete = false;
                _finishString();
            }
            return this._textBuffer.contentsAsString();
        }
        if (this._currToken == JsonToken.FIELD_NAME) {
            return getCurrentName();
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
    public final char[] getTextCharacters() throws IOException {
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
    public final int getTextLength() throws IOException {
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
    public final int getTextOffset() throws IOException {
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
    public byte[] getBinaryValue(Base64Variant b64variant) throws IOException {
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
    public int readBinaryValue(Base64Variant b64variant, OutputStream out) throws IOException {
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

    protected int _readBinary(Base64Variant b64variant, OutputStream out, byte[] buffer) throws IOException {
        int outputPtr = 0;
        int outputEnd = buffer.length - 3;
        int outputCount = 0;
        while (true) {
            if (this._inputPtr >= this._inputEnd) {
                loadMoreGuaranteed();
            }
            char[] cArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            char ch = cArr[i];
            if (ch > ' ') {
                int bits = b64variant.decodeBase64Char(ch);
                if (bits < 0) {
                    if (ch == '\"') {
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
                char[] cArr2 = this._inputBuffer;
                int i2 = this._inputPtr;
                this._inputPtr = i2 + 1;
                char ch2 = cArr2[i2];
                int bits2 = b64variant.decodeBase64Char(ch2);
                if (bits2 < 0) {
                    bits2 = _decodeBase64Escape(b64variant, ch2, 1);
                }
                int decodedData2 = (decodedData << 6) | bits2;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                char[] cArr3 = this._inputBuffer;
                int i3 = this._inputPtr;
                this._inputPtr = i3 + 1;
                char ch3 = cArr3[i3];
                int bits3 = b64variant.decodeBase64Char(ch3);
                if (bits3 < 0) {
                    if (bits3 != -2) {
                        if (ch3 == '\"' && !b64variant.usesPadding()) {
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
                        char[] cArr4 = this._inputBuffer;
                        int i5 = this._inputPtr;
                        this._inputPtr = i5 + 1;
                        char ch4 = cArr4[i5];
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
                char[] cArr5 = this._inputBuffer;
                int i7 = this._inputPtr;
                this._inputPtr = i7 + 1;
                char ch5 = cArr5[i7];
                int bits4 = b64variant.decodeBase64Char(ch5);
                if (bits4 < 0) {
                    if (bits4 != -2) {
                        if (ch5 == '\"' && !b64variant.usesPadding()) {
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

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // com.fasterxml.jackson.core.base.ParserMinimalBase, com.fasterxml.jackson.core.JsonParser
    public final JsonToken nextToken() throws IOException {
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
            i = _skipComma(i);
        }
        boolean inObject = this._parsingContext.inObject();
        if (inObject) {
            String name = i == 34 ? _parseName() : _handleOddName(i);
            this._parsingContext.setCurrentName(name);
            this._currToken = JsonToken.FIELD_NAME;
            i = _skipColon();
        }
        switch (i) {
            case 34:
                this._tokenIncomplete = true;
                t = JsonToken.VALUE_STRING;
                break;
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
                t = _parsePosNumber(i);
                break;
            case 91:
                if (!inObject) {
                    this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
                }
                t = JsonToken.START_ARRAY;
                break;
            case 93:
            case 125:
                _reportUnexpectedChar(i, "expected a value");
                _matchTrue();
                t = JsonToken.VALUE_TRUE;
                break;
            case 102:
                _matchFalse();
                t = JsonToken.VALUE_FALSE;
                break;
            case 110:
                _matchNull();
                t = JsonToken.VALUE_NULL;
                break;
            case 116:
                _matchTrue();
                t = JsonToken.VALUE_TRUE;
                break;
            case 123:
                if (!inObject) {
                    this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
                }
                t = JsonToken.START_OBJECT;
                break;
            default:
                t = _handleOddValue(i);
                break;
        }
        if (inObject) {
            this._nextToken = t;
            return this._currToken;
        }
        this._currToken = t;
        return t;
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
    public String nextFieldName() throws IOException {
        JsonToken t;
        this._numTypesValid = 0;
        if (this._currToken == JsonToken.FIELD_NAME) {
            _nextAfterName();
            return null;
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
            this._currToken = JsonToken.END_ARRAY;
            return null;
        }
        if (i == 125) {
            if (!this._parsingContext.inObject()) {
                _reportMismatchedEndMarker(i, ']');
            }
            this._parsingContext = this._parsingContext.getParent();
            this._currToken = JsonToken.END_OBJECT;
            return null;
        }
        if (this._parsingContext.expectComma()) {
            i = _skipComma(i);
        }
        if (!this._parsingContext.inObject()) {
            _nextTokenNotInObject(i);
            return null;
        }
        String name = i == 34 ? _parseName() : _handleOddName(i);
        this._parsingContext.setCurrentName(name);
        this._currToken = JsonToken.FIELD_NAME;
        int i2 = _skipColon();
        if (i2 == 34) {
            this._tokenIncomplete = true;
            this._nextToken = JsonToken.VALUE_STRING;
            return name;
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
                _matchFalse();
                t = JsonToken.VALUE_FALSE;
                break;
            case 110:
                _matchNull();
                t = JsonToken.VALUE_NULL;
                break;
            case 116:
                _matchTrue();
                t = JsonToken.VALUE_TRUE;
                break;
            case 123:
                t = JsonToken.START_OBJECT;
                break;
            default:
                t = _handleOddValue(i2);
                break;
        }
        this._nextToken = t;
        return name;
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
                JsonToken _handleOddValue = _handleOddValue(i);
                this._currToken = _handleOddValue;
                return _handleOddValue;
        }
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public final String nextTextValue() throws IOException {
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
    public final int nextIntValue(int defaultValue) throws IOException {
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
    public final long nextLongValue(long defaultValue) throws IOException {
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
    public final Boolean nextBooleanValue() throws IOException {
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
        JsonToken t2 = nextToken();
        if (t2 != null) {
            int id = t2.id();
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

    protected final JsonToken _parsePosNumber(int ch) throws IOException {
        int ptr = this._inputPtr;
        int startPtr = ptr - 1;
        int inputLen = this._inputEnd;
        if (ch == 48) {
            return _parseNumber2(false, startPtr);
        }
        int intLen = 1;
        while (ptr < inputLen) {
            int i = ptr;
            ptr++;
            char c = this._inputBuffer[i];
            if (c >= '0' && c <= '9') {
                intLen++;
            } else {
                if (c == '.' || c == 'e' || c == 'E') {
                    this._inputPtr = ptr;
                    return _parseFloat(c, startPtr, ptr, false, intLen);
                }
                int ptr2 = ptr - 1;
                this._inputPtr = ptr2;
                if (this._parsingContext.inRoot()) {
                    _verifyRootSpace(c);
                }
                int len = ptr2 - startPtr;
                this._textBuffer.resetWithShared(this._inputBuffer, startPtr, len);
                return resetInt(false, intLen);
            }
        }
        this._inputPtr = startPtr;
        return _parseNumber2(false, startPtr);
    }

    private final JsonToken _parseFloat(int ch, int startPtr, int ptr, boolean neg, int intLen) throws IOException {
        int inputLen = this._inputEnd;
        int fractLen = 0;
        if (ch == 46) {
            while (ptr < inputLen) {
                int i = ptr;
                ptr++;
                ch = this._inputBuffer[i];
                if (ch >= 48 && ch <= 57) {
                    fractLen++;
                } else if (fractLen == 0) {
                    reportUnexpectedNumberChar(ch, "Decimal point not followed by a digit");
                }
            }
            return _parseNumber2(neg, startPtr);
        }
        int expLen = 0;
        if (ch == 101 || ch == 69) {
            if (ptr >= inputLen) {
                this._inputPtr = startPtr;
                return _parseNumber2(neg, startPtr);
            }
            int i2 = ptr;
            ptr++;
            ch = this._inputBuffer[i2];
            if (ch == 45 || ch == 43) {
                if (ptr >= inputLen) {
                    this._inputPtr = startPtr;
                    return _parseNumber2(neg, startPtr);
                }
                ptr++;
                ch = this._inputBuffer[ptr];
            }
            while (ch <= 57 && ch >= 48) {
                expLen++;
                if (ptr >= inputLen) {
                    this._inputPtr = startPtr;
                    return _parseNumber2(neg, startPtr);
                }
                int i3 = ptr;
                ptr++;
                ch = this._inputBuffer[i3];
            }
            if (expLen == 0) {
                reportUnexpectedNumberChar(ch, "Exponent indicator not followed by a digit");
            }
        }
        int ptr2 = ptr - 1;
        this._inputPtr = ptr2;
        if (this._parsingContext.inRoot()) {
            _verifyRootSpace(ch);
        }
        int len = ptr2 - startPtr;
        this._textBuffer.resetWithShared(this._inputBuffer, startPtr, len);
        return resetFloat(neg, intLen, fractLen, expLen);
    }

    protected final JsonToken _parseNegNumber() throws IOException {
        int ptr = this._inputPtr;
        int startPtr = ptr - 1;
        int inputLen = this._inputEnd;
        if (ptr >= inputLen) {
            return _parseNumber2(true, startPtr);
        }
        int ptr2 = ptr + 1;
        char c = this._inputBuffer[ptr];
        if (c > '9' || c < '0') {
            this._inputPtr = ptr2;
            return _handleInvalidNumberStart(c, true);
        }
        if (c == '0') {
            return _parseNumber2(true, startPtr);
        }
        int intLen = 1;
        while (ptr2 < inputLen) {
            int i = ptr2;
            ptr2++;
            char c2 = this._inputBuffer[i];
            if (c2 >= '0' && c2 <= '9') {
                intLen++;
            } else {
                if (c2 == '.' || c2 == 'e' || c2 == 'E') {
                    this._inputPtr = ptr2;
                    return _parseFloat(c2, startPtr, ptr2, true, intLen);
                }
                int ptr3 = ptr2 - 1;
                this._inputPtr = ptr3;
                if (this._parsingContext.inRoot()) {
                    _verifyRootSpace(c2);
                }
                int len = ptr3 - startPtr;
                this._textBuffer.resetWithShared(this._inputBuffer, startPtr, len);
                return resetInt(true, intLen);
            }
        }
        return _parseNumber2(true, startPtr);
    }

    private final JsonToken _parseNumber2(boolean neg, int startPtr) throws IOException {
        char nextChar;
        char nextChar2;
        char nextChar3;
        this._inputPtr = neg ? startPtr + 1 : startPtr;
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        int outPtr = 0;
        if (neg) {
            outPtr = 0 + 1;
            outBuf[0] = '-';
        }
        int intLen = 0;
        if (this._inputPtr < this._inputEnd) {
            char[] cArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            nextChar = cArr[i];
        } else {
            nextChar = getNextChar("No digit following minus sign");
        }
        char c = nextChar;
        if (c == '0') {
            c = _verifyNoLeadingZeroes();
        }
        boolean eof = false;
        while (true) {
            if (c >= '0' && c <= '9') {
                intLen++;
                if (outPtr >= outBuf.length) {
                    outBuf = this._textBuffer.finishCurrentSegment();
                    outPtr = 0;
                }
                int i2 = outPtr;
                outPtr++;
                outBuf[i2] = c;
                if (this._inputPtr >= this._inputEnd && !loadMore()) {
                    c = 0;
                    eof = true;
                    break;
                }
                char[] cArr2 = this._inputBuffer;
                int i3 = this._inputPtr;
                this._inputPtr = i3 + 1;
                c = cArr2[i3];
            } else {
                break;
            }
        }
        if (intLen == 0) {
            return _handleInvalidNumberStart(c, neg);
        }
        int fractLen = 0;
        if (c == '.') {
            int i4 = outPtr;
            outPtr++;
            outBuf[i4] = c;
            while (true) {
                if (this._inputPtr >= this._inputEnd && !loadMore()) {
                    eof = true;
                    break;
                }
                char[] cArr3 = this._inputBuffer;
                int i5 = this._inputPtr;
                this._inputPtr = i5 + 1;
                c = cArr3[i5];
                if (c < '0' || c > '9') {
                    break;
                }
                fractLen++;
                if (outPtr >= outBuf.length) {
                    outBuf = this._textBuffer.finishCurrentSegment();
                    outPtr = 0;
                }
                int i6 = outPtr;
                outPtr++;
                outBuf[i6] = c;
            }
            if (fractLen == 0) {
                reportUnexpectedNumberChar(c, "Decimal point not followed by a digit");
            }
        }
        int expLen = 0;
        if (c == 'e' || c == 'E') {
            if (outPtr >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr = 0;
            }
            int i7 = outPtr;
            outPtr++;
            outBuf[i7] = c;
            if (this._inputPtr < this._inputEnd) {
                char[] cArr4 = this._inputBuffer;
                int i8 = this._inputPtr;
                this._inputPtr = i8 + 1;
                nextChar2 = cArr4[i8];
            } else {
                nextChar2 = getNextChar("expected a digit for number exponent");
            }
            c = nextChar2;
            if (c == '-' || c == '+') {
                if (outPtr >= outBuf.length) {
                    outBuf = this._textBuffer.finishCurrentSegment();
                    outPtr = 0;
                }
                int i9 = outPtr;
                outPtr++;
                outBuf[i9] = c;
                if (this._inputPtr < this._inputEnd) {
                    char[] cArr5 = this._inputBuffer;
                    int i10 = this._inputPtr;
                    this._inputPtr = i10 + 1;
                    nextChar3 = cArr5[i10];
                } else {
                    nextChar3 = getNextChar("expected a digit for number exponent");
                }
                c = nextChar3;
            }
            while (true) {
                if (c <= '9' && c >= '0') {
                    expLen++;
                    if (outPtr >= outBuf.length) {
                        outBuf = this._textBuffer.finishCurrentSegment();
                        outPtr = 0;
                    }
                    int i11 = outPtr;
                    outPtr++;
                    outBuf[i11] = c;
                    if (this._inputPtr >= this._inputEnd && !loadMore()) {
                        eof = true;
                        break;
                    }
                    char[] cArr6 = this._inputBuffer;
                    int i12 = this._inputPtr;
                    this._inputPtr = i12 + 1;
                    c = cArr6[i12];
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
        return reset(neg, intLen, fractLen, expLen);
    }

    private final char _verifyNoLeadingZeroes() throws IOException {
        char ch;
        if (this._inputPtr < this._inputEnd && ((ch = this._inputBuffer[this._inputPtr]) < '0' || ch > '9')) {
            return '0';
        }
        return _verifyNLZ2();
    }

    private char _verifyNLZ2() throws IOException {
        if (this._inputPtr >= this._inputEnd && !loadMore()) {
            return '0';
        }
        char ch = this._inputBuffer[this._inputPtr];
        if (ch < '0' || ch > '9') {
            return '0';
        }
        if (!isEnabled(JsonParser.Feature.ALLOW_NUMERIC_LEADING_ZEROS)) {
            reportInvalidNumber("Leading zeroes not allowed");
        }
        this._inputPtr++;
        if (ch == '0') {
            do {
                if (this._inputPtr >= this._inputEnd && !loadMore()) {
                    break;
                }
                ch = this._inputBuffer[this._inputPtr];
                if (ch < '0' || ch > '9') {
                    return '0';
                }
                this._inputPtr++;
            } while (ch == '0');
        }
        return ch;
    }

    protected JsonToken _handleInvalidNumberStart(int ch, boolean negative) throws IOException {
        if (ch == 73) {
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                _reportInvalidEOFInValue();
            }
            char[] cArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            ch = cArr[i];
            if (ch == 78) {
                String match = negative ? "-INF" : "+INF";
                _matchToken(match, 3);
                if (isEnabled(JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS)) {
                    return resetAsNaN(match, negative ? Double.NEGATIVE_INFINITY : Double.POSITIVE_INFINITY);
                }
                _reportError("Non-standard token '" + match + "': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow");
            } else if (ch == 110) {
                String match2 = negative ? "-Infinity" : "+Infinity";
                _matchToken(match2, 3);
                if (isEnabled(JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS)) {
                    return resetAsNaN(match2, negative ? Double.NEGATIVE_INFINITY : Double.POSITIVE_INFINITY);
                }
                _reportError("Non-standard token '" + match2 + "': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow");
            }
        }
        reportUnexpectedNumberChar(ch, "expected digit (0-9) to follow minus sign, for valid numeric value");
        return null;
    }

    private final void _verifyRootSpace(int ch) throws IOException {
        this._inputPtr++;
        switch (ch) {
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
                _reportMissingRootWS(ch);
                break;
        }
    }

    protected final String _parseName() throws IOException {
        int ptr = this._inputPtr;
        int hash = this._hashSeed;
        int[] codes = _icLatin1;
        while (true) {
            if (ptr >= this._inputEnd) {
                break;
            }
            char c = this._inputBuffer[ptr];
            if (c < codes.length && codes[c] != 0) {
                if (c == '\"') {
                    int start = this._inputPtr;
                    this._inputPtr = ptr + 1;
                    return this._symbols.findSymbol(this._inputBuffer, start, ptr - start, hash);
                }
            } else {
                hash = (hash * 33) + c;
                ptr++;
            }
        }
        int start2 = this._inputPtr;
        this._inputPtr = ptr;
        return _parseName2(start2, hash, 34);
    }

    private String _parseName2(int startPtr, int hash, int endChar) throws IOException {
        this._textBuffer.resetWithShared(this._inputBuffer, startPtr, this._inputPtr - startPtr);
        char[] outBuf = this._textBuffer.getCurrentSegment();
        int outPtr = this._textBuffer.getCurrentSegmentSize();
        while (true) {
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                _reportInvalidEOF(": was expecting closing '" + ((char) endChar) + "' for name");
            }
            char[] cArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            char c = cArr[i];
            if (c <= '\\') {
                if (c == '\\') {
                    c = _decodeEscaped();
                } else if (c <= endChar) {
                    if (c != endChar) {
                        if (c < ' ') {
                            _throwUnquotedSpace(c, "name");
                        }
                    } else {
                        this._textBuffer.setCurrentLength(outPtr);
                        TextBuffer tb = this._textBuffer;
                        char[] buf = tb.getTextBuffer();
                        int start = tb.getTextOffset();
                        int len = tb.size();
                        return this._symbols.findSymbol(buf, start, len, hash);
                    }
                }
            }
            hash = (hash * 33) + c;
            int i2 = outPtr;
            outPtr++;
            outBuf[i2] = c;
            if (outPtr >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr = 0;
            }
        }
    }

    protected String _handleOddName(int i) throws IOException {
        boolean firstOk;
        if (i == 39 && isEnabled(JsonParser.Feature.ALLOW_SINGLE_QUOTES)) {
            return _parseAposName();
        }
        if (!isEnabled(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES)) {
            _reportUnexpectedChar(i, "was expecting double-quote to start field name");
        }
        int[] codes = CharTypes.getInputCodeLatin1JsNames();
        int maxCode = codes.length;
        if (i < maxCode) {
            firstOk = codes[i] == 0;
        } else {
            firstOk = Character.isJavaIdentifierPart((char) i);
        }
        if (!firstOk) {
            _reportUnexpectedChar(i, "was expecting either valid name character (for unquoted name) or double-quote (for quoted) to start field name");
        }
        int ptr = this._inputPtr;
        int hash = this._hashSeed;
        int inputLen = this._inputEnd;
        if (ptr < inputLen) {
            do {
                char c = this._inputBuffer[ptr];
                if (c < maxCode) {
                    if (codes[c] != 0) {
                        int start = this._inputPtr - 1;
                        this._inputPtr = ptr;
                        return this._symbols.findSymbol(this._inputBuffer, start, ptr - start, hash);
                    }
                } else if (!Character.isJavaIdentifierPart(c)) {
                    int start2 = this._inputPtr - 1;
                    this._inputPtr = ptr;
                    return this._symbols.findSymbol(this._inputBuffer, start2, ptr - start2, hash);
                }
                hash = (hash * 33) + c;
                ptr++;
            } while (ptr < inputLen);
        }
        int start3 = this._inputPtr - 1;
        this._inputPtr = ptr;
        return _handleOddName2(start3, hash, codes);
    }

    protected String _parseAposName() throws IOException {
        int ptr = this._inputPtr;
        int hash = this._hashSeed;
        int inputLen = this._inputEnd;
        if (ptr < inputLen) {
            int[] codes = _icLatin1;
            int maxCode = codes.length;
            do {
                char c = this._inputBuffer[ptr];
                if (c == '\'') {
                    int start = this._inputPtr;
                    this._inputPtr = ptr + 1;
                    return this._symbols.findSymbol(this._inputBuffer, start, ptr - start, hash);
                }
                if (c < maxCode && codes[c] != 0) {
                    break;
                }
                hash = (hash * 33) + c;
                ptr++;
            } while (ptr < inputLen);
        }
        int start2 = this._inputPtr;
        this._inputPtr = ptr;
        return _parseName2(start2, hash, 39);
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
        char[] outBuf = this._textBuffer.emptyAndGetCurrentSegment();
        int outPtr = this._textBuffer.getCurrentSegmentSize();
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
                        this._textBuffer.setCurrentLength(outPtr);
                        return JsonToken.VALUE_STRING;
                    }
                }
            }
            if (outPtr >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr = 0;
            }
            int i2 = outPtr;
            outPtr++;
            outBuf[i2] = c;
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
    protected final void _finishString() throws IOException {
        int ptr = this._inputPtr;
        int inputLen = this._inputEnd;
        if (ptr < inputLen) {
            int[] codes = _icLatin1;
            int maxCode = codes.length;
            while (true) {
                char c = this._inputBuffer[ptr];
                if (c < maxCode && codes[c] != 0) {
                    if (c == '\"') {
                        this._textBuffer.resetWithShared(this._inputBuffer, this._inputPtr, ptr - this._inputPtr);
                        this._inputPtr = ptr + 1;
                        return;
                    }
                } else {
                    ptr++;
                    if (ptr >= inputLen) {
                        break;
                    }
                }
            }
        }
        this._textBuffer.resetWithCopy(this._inputBuffer, this._inputPtr, ptr - this._inputPtr);
        this._inputPtr = ptr;
        _finishString2();
    }

    protected void _finishString2() throws IOException {
        char[] outBuf = this._textBuffer.getCurrentSegment();
        int outPtr = this._textBuffer.getCurrentSegmentSize();
        int[] codes = _icLatin1;
        int maxCode = codes.length;
        while (true) {
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                _reportInvalidEOF(": was expecting closing quote for a string value");
            }
            char[] cArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            char c = cArr[i];
            if (c < maxCode && codes[c] != 0) {
                if (c != '\"') {
                    if (c == '\\') {
                        c = _decodeEscaped();
                    } else if (c < ' ') {
                        _throwUnquotedSpace(c, "string value");
                    }
                } else {
                    this._textBuffer.setCurrentLength(outPtr);
                    return;
                }
            }
            if (outPtr >= outBuf.length) {
                outBuf = this._textBuffer.finishCurrentSegment();
                outPtr = 0;
            }
            int i2 = outPtr;
            outPtr++;
            outBuf[i2] = c;
        }
    }

    protected final void _skipString() throws IOException {
        this._tokenIncomplete = false;
        int inPtr = this._inputPtr;
        int inLen = this._inputEnd;
        char[] inBuf = this._inputBuffer;
        while (true) {
            if (inPtr >= inLen) {
                this._inputPtr = inPtr;
                if (!loadMore()) {
                    _reportInvalidEOF(": was expecting closing quote for a string value");
                }
                inPtr = this._inputPtr;
                inLen = this._inputEnd;
            }
            int i = inPtr;
            inPtr++;
            char c = inBuf[i];
            if (c <= '\\') {
                if (c == '\\') {
                    this._inputPtr = inPtr;
                    _decodeEscaped();
                    inPtr = this._inputPtr;
                    inLen = this._inputEnd;
                } else if (c > '\"') {
                    continue;
                } else if (c == '\"') {
                    this._inputPtr = inPtr;
                    return;
                } else if (c < ' ') {
                    this._inputPtr = inPtr;
                    _throwUnquotedSpace(c, "string value");
                }
            }
        }
    }

    protected final void _skipCR() throws IOException {
        if ((this._inputPtr < this._inputEnd || loadMore()) && this._inputBuffer[this._inputPtr] == '\n') {
            this._inputPtr++;
        }
        this._currInputRow++;
        this._currInputRowStart = this._inputPtr;
    }

    private final int _skipColon() throws IOException {
        if (this._inputPtr + 4 >= this._inputEnd) {
            return _skipColon2(false);
        }
        char c = this._inputBuffer[this._inputPtr];
        if (c == ':') {
            char[] cArr = this._inputBuffer;
            int i = this._inputPtr + 1;
            this._inputPtr = i;
            char c2 = cArr[i];
            if (c2 > ' ') {
                if (c2 == '/' || c2 == '#') {
                    return _skipColon2(true);
                }
                this._inputPtr++;
                return c2;
            }
            if (c2 == ' ' || c2 == '\t') {
                char[] cArr2 = this._inputBuffer;
                int i2 = this._inputPtr + 1;
                this._inputPtr = i2;
                char c3 = cArr2[i2];
                if (c3 > ' ') {
                    if (c3 == '/' || c3 == '#') {
                        return _skipColon2(true);
                    }
                    this._inputPtr++;
                    return c3;
                }
            }
            return _skipColon2(true);
        }
        if (c == ' ' || c == '\t') {
            char[] cArr3 = this._inputBuffer;
            int i3 = this._inputPtr + 1;
            this._inputPtr = i3;
            c = cArr3[i3];
        }
        if (c == ':') {
            char[] cArr4 = this._inputBuffer;
            int i4 = this._inputPtr + 1;
            this._inputPtr = i4;
            char c4 = cArr4[i4];
            if (c4 > ' ') {
                if (c4 == '/' || c4 == '#') {
                    return _skipColon2(true);
                }
                this._inputPtr++;
                return c4;
            }
            if (c4 == ' ' || c4 == '\t') {
                char[] cArr5 = this._inputBuffer;
                int i5 = this._inputPtr + 1;
                this._inputPtr = i5;
                char c5 = cArr5[i5];
                if (c5 > ' ') {
                    if (c5 == '/' || c5 == '#') {
                        return _skipColon2(true);
                    }
                    this._inputPtr++;
                    return c5;
                }
            }
            return _skipColon2(true);
        }
        return _skipColon2(false);
    }

    private final int _skipColon2(boolean gotColon) throws IOException {
        while (true) {
            if (this._inputPtr >= this._inputEnd) {
                loadMoreGuaranteed();
            }
            char[] cArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            char c = cArr[i];
            if (c > ' ') {
                if (c == '/') {
                    _skipComment();
                } else if (c != '#' || !_skipYAMLComment()) {
                    if (gotColon) {
                        return c;
                    }
                    if (c != ':') {
                        if (c < ' ') {
                            _throwInvalidSpace(c);
                        }
                        _reportUnexpectedChar(c, "was expecting a colon to separate field name and value");
                    }
                    gotColon = true;
                }
            } else if (c < ' ') {
                if (c == '\n') {
                    this._currInputRow++;
                    this._currInputRowStart = this._inputPtr;
                } else if (c == '\r') {
                    _skipCR();
                } else if (c != '\t') {
                    _throwInvalidSpace(c);
                }
            }
        }
    }

    private final int _skipComma(int i) throws IOException {
        if (i != 44) {
            _reportUnexpectedChar(i, "was expecting comma to separate " + this._parsingContext.getTypeDesc() + " entries");
        }
        while (this._inputPtr < this._inputEnd) {
            char[] cArr = this._inputBuffer;
            int i2 = this._inputPtr;
            this._inputPtr = i2 + 1;
            char c = cArr[i2];
            if (c > ' ') {
                if (c == '/' || c == '#') {
                    this._inputPtr--;
                    return _skipAfterComma2();
                }
                return c;
            }
            if (c < ' ') {
                if (c == '\n') {
                    this._currInputRow++;
                    this._currInputRowStart = this._inputPtr;
                } else if (c == '\r') {
                    _skipCR();
                } else if (c != '\t') {
                    _throwInvalidSpace(c);
                }
            }
        }
        return _skipAfterComma2();
    }

    private final int _skipAfterComma2() throws IOException {
        char c;
        while (true) {
            if (this._inputPtr < this._inputEnd || loadMore()) {
                char[] cArr = this._inputBuffer;
                int i = this._inputPtr;
                this._inputPtr = i + 1;
                c = cArr[i];
                if (c > ' ') {
                    if (c == '/') {
                        _skipComment();
                    } else if (c != '#' || !_skipYAMLComment()) {
                        break;
                    }
                } else if (c < ' ') {
                    if (c == '\n') {
                        this._currInputRow++;
                        this._currInputRowStart = this._inputPtr;
                    } else if (c == '\r') {
                        _skipCR();
                    } else if (c != '\t') {
                        _throwInvalidSpace(c);
                    }
                }
            } else {
                throw _constructError("Unexpected end-of-input within/between " + this._parsingContext.getTypeDesc() + " entries");
            }
        }
        return c;
    }

    private final int _skipWSOrEnd() throws IOException {
        if (this._inputPtr >= this._inputEnd && !loadMore()) {
            return _eofAsNextChar();
        }
        char[] cArr = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = i + 1;
        char c = cArr[i];
        if (c > ' ') {
            if (c == '/' || c == '#') {
                this._inputPtr--;
                return _skipWSOrEnd2();
            }
            return c;
        }
        if (c != ' ') {
            if (c == '\n') {
                this._currInputRow++;
                this._currInputRowStart = this._inputPtr;
            } else if (c == '\r') {
                _skipCR();
            } else if (c != '\t') {
                _throwInvalidSpace(c);
            }
        }
        while (this._inputPtr < this._inputEnd) {
            char[] cArr2 = this._inputBuffer;
            int i2 = this._inputPtr;
            this._inputPtr = i2 + 1;
            char c2 = cArr2[i2];
            if (c2 > ' ') {
                if (c2 == '/' || c2 == '#') {
                    this._inputPtr--;
                    return _skipWSOrEnd2();
                }
                return c2;
            }
            if (c2 != ' ') {
                if (c2 == '\n') {
                    this._currInputRow++;
                    this._currInputRowStart = this._inputPtr;
                } else if (c2 == '\r') {
                    _skipCR();
                } else if (c2 != '\t') {
                    _throwInvalidSpace(c2);
                }
            }
        }
        return _skipWSOrEnd2();
    }

    private int _skipWSOrEnd2() throws IOException {
        char c;
        while (true) {
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                return _eofAsNextChar();
            }
            char[] cArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            c = cArr[i];
            if (c > ' ') {
                if (c == '/') {
                    _skipComment();
                } else if (c != '#' || !_skipYAMLComment()) {
                    break;
                }
            } else if (c != ' ') {
                if (c == '\n') {
                    this._currInputRow++;
                    this._currInputRowStart = this._inputPtr;
                } else if (c == '\r') {
                    _skipCR();
                } else if (c != '\t') {
                    _throwInvalidSpace(c);
                }
            }
        }
        return c;
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
                int value = 0;
                for (int i2 = 0; i2 < 4; i2++) {
                    if (this._inputPtr >= this._inputEnd && !loadMore()) {
                        _reportInvalidEOF(" in character escape sequence");
                    }
                    char[] cArr2 = this._inputBuffer;
                    int i3 = this._inputPtr;
                    this._inputPtr = i3 + 1;
                    char c2 = cArr2[i3];
                    int digit = CharTypes.charToHex(c2);
                    if (digit < 0) {
                        _reportUnexpectedChar(c2, "expected a hex-digit for character escape sequence");
                    }
                    value = (value << 4) | digit;
                }
                return (char) value;
            default:
                return _handleUnrecognizedCharacterEscape(c);
        }
    }

    private final void _matchTrue() throws IOException {
        int ptr;
        char c;
        int ptr2 = this._inputPtr;
        if (ptr2 + 3 < this._inputEnd) {
            char[] b = this._inputBuffer;
            if (b[ptr2] == 'r') {
                int ptr3 = ptr2 + 1;
                if (b[ptr3] == 'u') {
                    int ptr4 = ptr3 + 1;
                    if (b[ptr4] == 'e' && ((c = b[(ptr = ptr4 + 1)]) < '0' || c == ']' || c == '}')) {
                        this._inputPtr = ptr;
                        return;
                    }
                }
            }
        }
        _matchToken("true", 1);
    }

    private final void _matchFalse() throws IOException {
        int ptr;
        char c;
        int ptr2 = this._inputPtr;
        if (ptr2 + 4 < this._inputEnd) {
            char[] b = this._inputBuffer;
            if (b[ptr2] == 'a') {
                int ptr3 = ptr2 + 1;
                if (b[ptr3] == 'l') {
                    int ptr4 = ptr3 + 1;
                    if (b[ptr4] == 's') {
                        int ptr5 = ptr4 + 1;
                        if (b[ptr5] == 'e' && ((c = b[(ptr = ptr5 + 1)]) < '0' || c == ']' || c == '}')) {
                            this._inputPtr = ptr;
                            return;
                        }
                    }
                }
            }
        }
        _matchToken("false", 1);
    }

    private final void _matchNull() throws IOException {
        int ptr;
        char c;
        int ptr2 = this._inputPtr;
        if (ptr2 + 3 < this._inputEnd) {
            char[] b = this._inputBuffer;
            if (b[ptr2] == 'u') {
                int ptr3 = ptr2 + 1;
                if (b[ptr3] == 'l') {
                    int ptr4 = ptr3 + 1;
                    if (b[ptr4] == 'l' && ((c = b[(ptr = ptr4 + 1)]) < '0' || c == ']' || c == '}')) {
                        this._inputPtr = ptr;
                        return;
                    }
                }
            }
        }
        _matchToken("null", 1);
    }

    protected final void _matchToken(String matchStr, int i) throws IOException {
        char c;
        int len = matchStr.length();
        do {
            if (this._inputPtr >= this._inputEnd && !loadMore()) {
                _reportInvalidToken(matchStr.substring(0, i));
            }
            if (this._inputBuffer[this._inputPtr] != matchStr.charAt(i)) {
                _reportInvalidToken(matchStr.substring(0, i));
            }
            this._inputPtr++;
            i++;
        } while (i < len);
        if ((this._inputPtr < this._inputEnd || loadMore()) && (c = this._inputBuffer[this._inputPtr]) >= '0' && c != ']' && c != '}' && Character.isJavaIdentifierPart(c)) {
            _reportInvalidToken(matchStr.substring(0, i));
        }
    }

    protected byte[] _decodeBase64(Base64Variant b64variant) throws IOException {
        ByteArrayBuilder builder = _getByteArrayBuilder();
        while (true) {
            if (this._inputPtr >= this._inputEnd) {
                loadMoreGuaranteed();
            }
            char[] cArr = this._inputBuffer;
            int i = this._inputPtr;
            this._inputPtr = i + 1;
            char ch = cArr[i];
            if (ch > ' ') {
                int bits = b64variant.decodeBase64Char(ch);
                if (bits < 0) {
                    if (ch == '\"') {
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
                char[] cArr2 = this._inputBuffer;
                int i2 = this._inputPtr;
                this._inputPtr = i2 + 1;
                char ch2 = cArr2[i2];
                int bits2 = b64variant.decodeBase64Char(ch2);
                if (bits2 < 0) {
                    bits2 = _decodeBase64Escape(b64variant, ch2, 1);
                }
                int decodedData2 = (decodedData << 6) | bits2;
                if (this._inputPtr >= this._inputEnd) {
                    loadMoreGuaranteed();
                }
                char[] cArr3 = this._inputBuffer;
                int i3 = this._inputPtr;
                this._inputPtr = i3 + 1;
                char ch3 = cArr3[i3];
                int bits3 = b64variant.decodeBase64Char(ch3);
                if (bits3 < 0) {
                    if (bits3 != -2) {
                        if (ch3 == '\"' && !b64variant.usesPadding()) {
                            builder.append(decodedData2 >> 4);
                            return builder.toByteArray();
                        }
                        bits3 = _decodeBase64Escape(b64variant, ch3, 2);
                    }
                    if (bits3 == -2) {
                        if (this._inputPtr >= this._inputEnd) {
                            loadMoreGuaranteed();
                        }
                        char[] cArr4 = this._inputBuffer;
                        int i4 = this._inputPtr;
                        this._inputPtr = i4 + 1;
                        char ch4 = cArr4[i4];
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
                char[] cArr5 = this._inputBuffer;
                int i5 = this._inputPtr;
                this._inputPtr = i5 + 1;
                char ch5 = cArr5[i5];
                int bits4 = b64variant.decodeBase64Char(ch5);
                if (bits4 < 0) {
                    if (bits4 != -2) {
                        if (ch5 == '\"' && !b64variant.usesPadding()) {
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

    protected void _reportInvalidToken(String matchedPart) throws IOException {
        _reportInvalidToken(matchedPart, "'null', 'true', 'false' or NaN");
    }

    protected void _reportInvalidToken(String matchedPart, String msg) throws IOException {
        StringBuilder sb = new StringBuilder(matchedPart);
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
        _reportError("Unrecognized token '" + sb.toString() + "': was expecting " + msg);
    }
}
