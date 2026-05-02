package com.fasterxml.jackson.core.base;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonStreamContext;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.core.JsonTokenId;
import com.fasterxml.jackson.core.Version;
import com.fasterxml.jackson.core.io.NumberInput;
import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import com.fasterxml.jackson.core.util.VersionUtil;
import java.io.IOException;

/* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/base/ParserMinimalBase.class */
public abstract class ParserMinimalBase extends JsonParser {
    protected static final int INT_TAB = 9;
    protected static final int INT_LF = 10;
    protected static final int INT_CR = 13;
    protected static final int INT_SPACE = 32;
    protected static final int INT_LBRACKET = 91;
    protected static final int INT_RBRACKET = 93;
    protected static final int INT_LCURLY = 123;
    protected static final int INT_RCURLY = 125;
    protected static final int INT_QUOTE = 34;
    protected static final int INT_BACKSLASH = 92;
    protected static final int INT_SLASH = 47;
    protected static final int INT_COLON = 58;
    protected static final int INT_COMMA = 44;
    protected JsonToken _currToken;
    protected JsonToken _lastClearedToken;

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract JsonToken nextToken() throws IOException, JsonParseException;

    protected abstract void _handleEOF() throws JsonParseException;

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract String getCurrentName() throws IOException, JsonParseException;

    @Override // com.fasterxml.jackson.core.JsonParser, java.io.Closeable, java.lang.AutoCloseable
    public abstract void close() throws IOException;

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract boolean isClosed();

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract JsonStreamContext getParsingContext();

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract void overrideCurrentName(String str);

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract String getText() throws IOException, JsonParseException;

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract char[] getTextCharacters() throws IOException, JsonParseException;

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract boolean hasTextCharacters();

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract int getTextLength() throws IOException, JsonParseException;

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract int getTextOffset() throws IOException, JsonParseException;

    @Override // com.fasterxml.jackson.core.JsonParser
    public abstract byte[] getBinaryValue(Base64Variant base64Variant) throws IOException, JsonParseException;

    protected ParserMinimalBase() {
    }

    protected ParserMinimalBase(int i) {
        super(i);
    }

    @Override // com.fasterxml.jackson.core.JsonParser, com.fasterxml.jackson.core.Versioned
    public Version version() {
        return VersionUtil.versionFor(getClass());
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonToken getCurrentToken() {
        return this._currToken;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public final int getCurrentTokenId() {
        JsonToken jsonToken = this._currToken;
        if (jsonToken == null) {
            return 0;
        }
        return jsonToken.id();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean hasCurrentToken() {
        return this._currToken != null;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonToken nextValue() throws IOException, JsonParseException {
        JsonToken nextToken = nextToken();
        if (nextToken == JsonToken.FIELD_NAME) {
            nextToken = nextToken();
        }
        return nextToken;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonParser skipChildren() throws IOException, JsonParseException {
        if (this._currToken != JsonToken.START_OBJECT && this._currToken != JsonToken.START_ARRAY) {
            return this;
        }
        int i = 1;
        while (true) {
            JsonToken nextToken = nextToken();
            if (nextToken == null) {
                _handleEOF();
                return this;
            }
            if (nextToken.isStructStart()) {
                i++;
            } else if (nextToken.isStructEnd()) {
                i--;
                if (i == 0) {
                    return this;
                }
            } else {
                continue;
            }
        }
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public void clearCurrentToken() {
        if (this._currToken != null) {
            this._lastClearedToken = this._currToken;
            this._currToken = null;
        }
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonToken getLastClearedToken() {
        return this._lastClearedToken;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean getValueAsBoolean(boolean z) throws IOException, JsonParseException {
        JsonToken jsonToken = this._currToken;
        if (jsonToken != null) {
            switch (jsonToken.id()) {
                case JsonTokenId.ID_STRING /* 6 */:
                    String trim = getText().trim();
                    if ("true".equals(trim)) {
                        return true;
                    }
                    if ("false".equals(trim) || _hasTextualNull(trim)) {
                        return false;
                    }
                    break;
                case JsonTokenId.ID_NUMBER_INT /* 7 */:
                    return getIntValue() != 0;
                case 9:
                    return true;
                case 10:
                case JsonTokenId.ID_NULL /* 11 */:
                    return false;
                case JsonTokenId.ID_EMBEDDED_OBJECT /* 12 */:
                    Object embeddedObject = getEmbeddedObject();
                    if (embeddedObject instanceof Boolean) {
                        return ((Boolean) embeddedObject).booleanValue();
                    }
                    break;
            }
        }
        return z;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int getValueAsInt(int i) throws IOException, JsonParseException {
        JsonToken jsonToken = this._currToken;
        if (jsonToken != null) {
            switch (jsonToken.id()) {
                case JsonTokenId.ID_STRING /* 6 */:
                    String text = getText();
                    if (_hasTextualNull(text)) {
                        return 0;
                    }
                    return NumberInput.parseAsInt(text, i);
                case JsonTokenId.ID_NUMBER_INT /* 7 */:
                case JsonTokenId.ID_NUMBER_FLOAT /* 8 */:
                    return getIntValue();
                case 9:
                    return 1;
                case 10:
                    return 0;
                case JsonTokenId.ID_NULL /* 11 */:
                    return 0;
                case JsonTokenId.ID_EMBEDDED_OBJECT /* 12 */:
                    Object embeddedObject = getEmbeddedObject();
                    if (embeddedObject instanceof Number) {
                        return ((Number) embeddedObject).intValue();
                    }
                    break;
            }
        }
        return i;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public long getValueAsLong(long j) throws IOException, JsonParseException {
        JsonToken jsonToken = this._currToken;
        if (jsonToken != null) {
            switch (jsonToken.id()) {
                case JsonTokenId.ID_STRING /* 6 */:
                    String text = getText();
                    if (_hasTextualNull(text)) {
                        return 0L;
                    }
                    return NumberInput.parseAsLong(text, j);
                case JsonTokenId.ID_NUMBER_INT /* 7 */:
                case JsonTokenId.ID_NUMBER_FLOAT /* 8 */:
                    return getLongValue();
                case 9:
                    return 1L;
                case 10:
                case JsonTokenId.ID_NULL /* 11 */:
                    return 0L;
                case JsonTokenId.ID_EMBEDDED_OBJECT /* 12 */:
                    Object embeddedObject = getEmbeddedObject();
                    if (embeddedObject instanceof Number) {
                        return ((Number) embeddedObject).longValue();
                    }
                    break;
            }
        }
        return j;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public double getValueAsDouble(double d) throws IOException, JsonParseException {
        JsonToken jsonToken = this._currToken;
        if (jsonToken != null) {
            switch (jsonToken.id()) {
                case JsonTokenId.ID_STRING /* 6 */:
                    String text = getText();
                    if (_hasTextualNull(text)) {
                        return 0.0d;
                    }
                    return NumberInput.parseAsDouble(text, d);
                case JsonTokenId.ID_NUMBER_INT /* 7 */:
                case JsonTokenId.ID_NUMBER_FLOAT /* 8 */:
                    return getDoubleValue();
                case 9:
                    return 1.0d;
                case 10:
                case JsonTokenId.ID_NULL /* 11 */:
                    return 0.0d;
                case JsonTokenId.ID_EMBEDDED_OBJECT /* 12 */:
                    Object embeddedObject = getEmbeddedObject();
                    if (embeddedObject instanceof Number) {
                        return ((Number) embeddedObject).doubleValue();
                    }
                    break;
            }
        }
        return d;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public String getValueAsString(String str) throws IOException, JsonParseException {
        if (this._currToken != JsonToken.VALUE_STRING && (this._currToken == null || this._currToken == JsonToken.VALUE_NULL || !this._currToken.isScalarValue())) {
            return str;
        }
        return getText();
    }

    protected void _decodeBase64(String str, ByteArrayBuilder byteArrayBuilder, Base64Variant base64Variant) throws IOException, JsonParseException {
        try {
            base64Variant.decode(str, byteArrayBuilder);
        } catch (IllegalArgumentException e) {
            _reportError(e.getMessage());
        }
    }

    @Deprecated
    protected void _reportInvalidBase64(Base64Variant base64Variant, char c, int i, String str) throws JsonParseException {
        String str2;
        if (c <= INT_SPACE) {
            str2 = "Illegal white space character (code 0x" + Integer.toHexString(c) + ") as character #" + (i + 1) + " of 4-char base64 unit: can only used between units";
        } else if (base64Variant.usesPaddingChar(c)) {
            str2 = "Unexpected padding character ('" + base64Variant.getPaddingChar() + "') as character #" + (i + 1) + " of 4-char base64 unit: padding only legal as 3rd or 4th character";
        } else if (!Character.isDefined(c) || Character.isISOControl(c)) {
            str2 = "Illegal character (code 0x" + Integer.toHexString(c) + ") in base64 content";
        } else {
            str2 = "Illegal character '" + c + "' (code 0x" + Integer.toHexString(c) + ") in base64 content";
        }
        if (str != null) {
            str2 = str2 + ": " + str;
        }
        throw _constructError(str2);
    }

    @Deprecated
    protected void _reportBase64EOF() throws JsonParseException {
        throw _constructError("Unexpected end-of-String in base64 content");
    }

    protected boolean _hasTextualNull(String str) {
        return "null".equals(str);
    }

    protected void _reportUnexpectedChar(int i, String str) throws JsonParseException {
        if (i < 0) {
            _reportInvalidEOF();
        }
        String str2 = "Unexpected character (" + _getCharDesc(i) + ")";
        if (str != null) {
            str2 = str2 + ": " + str;
        }
        _reportError(str2);
    }

    protected void _reportInvalidEOF() throws JsonParseException {
        _reportInvalidEOF(" in " + this._currToken);
    }

    protected void _reportInvalidEOF(String str) throws JsonParseException {
        _reportError("Unexpected end-of-input" + str);
    }

    protected void _reportInvalidEOFInValue() throws JsonParseException {
        _reportInvalidEOF(" in a value");
    }

    protected void _reportMissingRootWS(int i) throws JsonParseException {
        _reportUnexpectedChar(i, "Expected space separating root-level values");
    }

    protected void _throwInvalidSpace(int i) throws JsonParseException {
        _reportError("Illegal character (" + _getCharDesc((char) i) + "): only regular white space (\\r, \\n, \\t) is allowed between tokens");
    }

    protected void _throwUnquotedSpace(int i, String str) throws JsonParseException {
        if (!isEnabled(JsonParser.Feature.ALLOW_UNQUOTED_CONTROL_CHARS) || i >= INT_SPACE) {
            _reportError("Illegal unquoted character (" + _getCharDesc((char) i) + "): has to be escaped using backslash to be included in " + str);
        }
    }

    protected char _handleUnrecognizedCharacterEscape(char c) throws JsonProcessingException {
        if (isEnabled(JsonParser.Feature.ALLOW_BACKSLASH_ESCAPING_ANY_CHARACTER)) {
            return c;
        }
        if (c == '\'' && isEnabled(JsonParser.Feature.ALLOW_SINGLE_QUOTES)) {
            return c;
        }
        _reportError("Unrecognized character escape " + _getCharDesc(c));
        return c;
    }

    protected static final String _getCharDesc(int i) {
        char c = (char) i;
        if (Character.isISOControl(c)) {
            return "(CTRL-CHAR, code " + i + ")";
        }
        if (i > 255) {
            return "'" + c + "' (code " + i + " / 0x" + Integer.toHexString(i) + ")";
        }
        return "'" + c + "' (code " + i + ")";
    }

    protected final void _reportError(String str) throws JsonParseException {
        throw _constructError(str);
    }

    protected final void _wrapError(String str, Throwable th) throws JsonParseException {
        throw _constructError(str, th);
    }

    protected final void _throwInternal() {
        VersionUtil.throwInternal();
    }

    protected final JsonParseException _constructError(String str, Throwable th) {
        return new JsonParseException(str, getCurrentLocation(), th);
    }
}
