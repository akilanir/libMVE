package com.fasterxml.jackson.core;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.io.CharacterEscapes;
import com.fasterxml.jackson.core.util.VersionUtil;
import java.io.Closeable;
import java.io.Flushable;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/JsonGenerator.class */
public abstract class JsonGenerator implements Closeable, Flushable, Versioned {
    protected PrettyPrinter _cfgPrettyPrinter;

    public abstract JsonGenerator setCodec(ObjectCodec objectCodec);

    public abstract ObjectCodec getCodec();

    @Override // com.fasterxml.jackson.core.Versioned
    public abstract Version version();

    public abstract JsonGenerator enable(Feature feature);

    public abstract JsonGenerator disable(Feature feature);

    public abstract boolean isEnabled(Feature feature);

    public abstract int getFeatureMask();

    public abstract JsonGenerator setFeatureMask(int i);

    public abstract JsonGenerator useDefaultPrettyPrinter();

    public abstract void writeStartArray() throws IOException, JsonGenerationException;

    public abstract void writeEndArray() throws IOException, JsonGenerationException;

    public abstract void writeStartObject() throws IOException, JsonGenerationException;

    public abstract void writeEndObject() throws IOException, JsonGenerationException;

    public abstract void writeFieldName(String str) throws IOException, JsonGenerationException;

    public abstract void writeFieldName(SerializableString serializableString) throws IOException, JsonGenerationException;

    public abstract void writeString(String str) throws IOException, JsonGenerationException;

    public abstract void writeString(char[] cArr, int i, int i2) throws IOException, JsonGenerationException;

    public abstract void writeString(SerializableString serializableString) throws IOException, JsonGenerationException;

    public abstract void writeRawUTF8String(byte[] bArr, int i, int i2) throws IOException, JsonGenerationException;

    public abstract void writeUTF8String(byte[] bArr, int i, int i2) throws IOException, JsonGenerationException;

    public abstract void writeRaw(String str) throws IOException, JsonGenerationException;

    public abstract void writeRaw(String str, int i, int i2) throws IOException, JsonGenerationException;

    public abstract void writeRaw(char[] cArr, int i, int i2) throws IOException, JsonGenerationException;

    public abstract void writeRaw(char c) throws IOException, JsonGenerationException;

    public abstract void writeRawValue(String str) throws IOException, JsonGenerationException;

    public abstract void writeRawValue(String str, int i, int i2) throws IOException, JsonGenerationException;

    public abstract void writeRawValue(char[] cArr, int i, int i2) throws IOException, JsonGenerationException;

    public abstract void writeBinary(Base64Variant base64Variant, byte[] bArr, int i, int i2) throws IOException, JsonGenerationException;

    public abstract int writeBinary(Base64Variant base64Variant, InputStream inputStream, int i) throws IOException, JsonGenerationException;

    public abstract void writeNumber(int i) throws IOException, JsonGenerationException;

    public abstract void writeNumber(long j) throws IOException, JsonGenerationException;

    public abstract void writeNumber(BigInteger bigInteger) throws IOException, JsonGenerationException;

    public abstract void writeNumber(double d) throws IOException, JsonGenerationException;

    public abstract void writeNumber(float f) throws IOException, JsonGenerationException;

    public abstract void writeNumber(BigDecimal bigDecimal) throws IOException, JsonGenerationException;

    public abstract void writeNumber(String str) throws IOException, JsonGenerationException, UnsupportedOperationException;

    public abstract void writeBoolean(boolean z) throws IOException, JsonGenerationException;

    public abstract void writeNull() throws IOException, JsonGenerationException;

    public abstract void writeObject(Object obj) throws IOException, JsonProcessingException;

    public abstract void writeTree(TreeNode treeNode) throws IOException, JsonProcessingException;

    public abstract JsonStreamContext getOutputContext();

    @Override // java.io.Flushable
    public abstract void flush() throws IOException;

    public abstract boolean isClosed();

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public abstract void close() throws IOException;

    /* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/JsonGenerator$Feature.class */
    public enum Feature {
        AUTO_CLOSE_TARGET(true),
        AUTO_CLOSE_JSON_CONTENT(true),
        QUOTE_FIELD_NAMES(true),
        QUOTE_NON_NUMERIC_NUMBERS(true),
        WRITE_NUMBERS_AS_STRINGS(false),
        WRITE_BIGDECIMAL_AS_PLAIN(false),
        FLUSH_PASSED_TO_STREAM(true),
        ESCAPE_NON_ASCII(false),
        STRICT_DUPLICATE_DETECTION(false);

        private final boolean _defaultState;
        private final int _mask = 1 << ordinal();

        public static int collectDefaults() {
            int i = 0;
            for (Feature feature : values()) {
                if (feature.enabledByDefault()) {
                    i |= feature.getMask();
                }
            }
            return i;
        }

        Feature(boolean z) {
            this._defaultState = z;
        }

        public boolean enabledByDefault() {
            return this._defaultState;
        }

        public boolean enabledIn(int i) {
            return (i & this._mask) != 0;
        }

        public int getMask() {
            return this._mask;
        }
    }

    protected JsonGenerator() {
    }

    public Object getOutputTarget() {
        return null;
    }

    public final JsonGenerator configure(Feature feature, boolean z) {
        if (z) {
            enable(feature);
        } else {
            disable(feature);
        }
        return this;
    }

    public void setSchema(FormatSchema formatSchema) {
        throw new UnsupportedOperationException("Generator of type " + getClass().getName() + " does not support schema of type '" + formatSchema.getSchemaType() + "'");
    }

    public FormatSchema getSchema() {
        return null;
    }

    public JsonGenerator setPrettyPrinter(PrettyPrinter prettyPrinter) {
        this._cfgPrettyPrinter = prettyPrinter;
        return this;
    }

    public PrettyPrinter getPrettyPrinter() {
        return this._cfgPrettyPrinter;
    }

    public JsonGenerator setHighestNonEscapedChar(int i) {
        return this;
    }

    public int getHighestEscapedChar() {
        return 0;
    }

    public CharacterEscapes getCharacterEscapes() {
        return null;
    }

    public JsonGenerator setCharacterEscapes(CharacterEscapes characterEscapes) {
        return this;
    }

    public JsonGenerator setRootValueSeparator(SerializableString serializableString) {
        throw new UnsupportedOperationException();
    }

    public boolean canUseSchema(FormatSchema formatSchema) {
        return false;
    }

    public boolean canWriteObjectId() {
        return false;
    }

    public boolean canWriteTypeId() {
        return false;
    }

    public boolean canWriteBinaryNatively() {
        return false;
    }

    public boolean canOmitFields() {
        return true;
    }

    public void writeRaw(SerializableString serializableString) throws IOException, JsonGenerationException {
        writeRaw(serializableString.getValue());
    }

    public void writeBinary(byte[] bArr, int i, int i2) throws IOException, JsonGenerationException {
        writeBinary(Base64Variants.getDefaultVariant(), bArr, i, i2);
    }

    public void writeBinary(byte[] bArr) throws IOException, JsonGenerationException {
        writeBinary(Base64Variants.getDefaultVariant(), bArr, 0, bArr.length);
    }

    public int writeBinary(InputStream inputStream, int i) throws IOException, JsonGenerationException {
        return writeBinary(Base64Variants.getDefaultVariant(), inputStream, i);
    }

    public void writeNumber(short s) throws IOException, JsonGenerationException {
        writeNumber((int) s);
    }

    public void writeObjectId(Object obj) throws IOException, JsonGenerationException {
        throw new JsonGenerationException("No native support for writing Object Ids");
    }

    public void writeObjectRef(Object obj) throws IOException, JsonGenerationException {
        throw new JsonGenerationException("No native support for writing Object Ids");
    }

    public void writeTypeId(Object obj) throws IOException, JsonGenerationException {
        throw new JsonGenerationException("No native support for writing Type Ids");
    }

    public void writeStringField(String str, String str2) throws IOException, JsonGenerationException {
        writeFieldName(str);
        writeString(str2);
    }

    public final void writeBooleanField(String str, boolean z) throws IOException, JsonGenerationException {
        writeFieldName(str);
        writeBoolean(z);
    }

    public final void writeNullField(String str) throws IOException, JsonGenerationException {
        writeFieldName(str);
        writeNull();
    }

    public final void writeNumberField(String str, int i) throws IOException, JsonGenerationException {
        writeFieldName(str);
        writeNumber(i);
    }

    public final void writeNumberField(String str, long j) throws IOException, JsonGenerationException {
        writeFieldName(str);
        writeNumber(j);
    }

    public final void writeNumberField(String str, double d) throws IOException, JsonGenerationException {
        writeFieldName(str);
        writeNumber(d);
    }

    public final void writeNumberField(String str, float f) throws IOException, JsonGenerationException {
        writeFieldName(str);
        writeNumber(f);
    }

    public final void writeNumberField(String str, BigDecimal bigDecimal) throws IOException, JsonGenerationException {
        writeFieldName(str);
        writeNumber(bigDecimal);
    }

    public final void writeBinaryField(String str, byte[] bArr) throws IOException, JsonGenerationException {
        writeFieldName(str);
        writeBinary(bArr);
    }

    public final void writeArrayFieldStart(String str) throws IOException, JsonGenerationException {
        writeFieldName(str);
        writeStartArray();
    }

    public final void writeObjectFieldStart(String str) throws IOException, JsonGenerationException {
        writeFieldName(str);
        writeStartObject();
    }

    public final void writeObjectField(String str, Object obj) throws IOException, JsonProcessingException {
        writeFieldName(str);
        writeObject(obj);
    }

    public void writeOmittedField(String str) throws IOException, JsonGenerationException {
    }

    public void copyCurrentEvent(JsonParser jsonParser) throws IOException, JsonProcessingException {
        JsonToken currentToken = jsonParser.getCurrentToken();
        if (currentToken == null) {
            _reportError("No current event to copy");
        }
        switch (currentToken.id()) {
            case -1:
                _reportError("No current event to copy");
                break;
            case 0:
            default:
                _throwInternal();
                return;
            case 1:
                break;
            case 2:
                writeEndObject();
                return;
            case 3:
                writeStartArray();
                return;
            case 4:
                writeEndArray();
                return;
            case 5:
                writeFieldName(jsonParser.getCurrentName());
                return;
            case JsonTokenId.ID_STRING /* 6 */:
                if (jsonParser.hasTextCharacters()) {
                    writeString(jsonParser.getTextCharacters(), jsonParser.getTextOffset(), jsonParser.getTextLength());
                    return;
                } else {
                    writeString(jsonParser.getText());
                    return;
                }
            case JsonTokenId.ID_NUMBER_INT /* 7 */:
                JsonParser.NumberType numberType = jsonParser.getNumberType();
                if (numberType == JsonParser.NumberType.INT) {
                    writeNumber(jsonParser.getIntValue());
                    return;
                } else if (numberType == JsonParser.NumberType.BIG_INTEGER) {
                    writeNumber(jsonParser.getBigIntegerValue());
                    return;
                } else {
                    writeNumber(jsonParser.getLongValue());
                    return;
                }
            case JsonTokenId.ID_NUMBER_FLOAT /* 8 */:
                JsonParser.NumberType numberType2 = jsonParser.getNumberType();
                if (numberType2 == JsonParser.NumberType.BIG_DECIMAL) {
                    writeNumber(jsonParser.getDecimalValue());
                    return;
                } else if (numberType2 == JsonParser.NumberType.FLOAT) {
                    writeNumber(jsonParser.getFloatValue());
                    return;
                } else {
                    writeNumber(jsonParser.getDoubleValue());
                    return;
                }
            case JsonTokenId.ID_TRUE /* 9 */:
                writeBoolean(true);
                return;
            case JsonTokenId.ID_FALSE /* 10 */:
                writeBoolean(false);
                return;
            case JsonTokenId.ID_NULL /* 11 */:
                writeNull();
                return;
            case JsonTokenId.ID_EMBEDDED_OBJECT /* 12 */:
                writeObject(jsonParser.getEmbeddedObject());
                return;
        }
        writeStartObject();
    }

    public void copyCurrentStructure(JsonParser jsonParser) throws IOException, JsonProcessingException {
        JsonToken currentToken = jsonParser.getCurrentToken();
        if (currentToken == null) {
            _reportError("No current event to copy");
        }
        int id = currentToken.id();
        if (id == 5) {
            writeFieldName(jsonParser.getCurrentName());
            id = jsonParser.nextToken().id();
        }
        switch (id) {
            case 1:
                writeStartObject();
                while (jsonParser.nextToken() != JsonToken.END_OBJECT) {
                    copyCurrentStructure(jsonParser);
                }
                writeEndObject();
                break;
            case 3:
                writeStartArray();
                while (jsonParser.nextToken() != JsonToken.END_ARRAY) {
                    copyCurrentStructure(jsonParser);
                }
                writeEndArray();
                break;
            default:
                copyCurrentEvent(jsonParser);
                break;
        }
    }

    protected void _reportError(String str) throws JsonGenerationException {
        throw new JsonGenerationException(str);
    }

    protected final void _throwInternal() {
        VersionUtil.throwInternal();
    }

    protected void _reportUnsupportedOperation() {
        throw new UnsupportedOperationException("Operation not supported by generator of type " + getClass().getName());
    }

    protected void _writeSimpleObject(Object obj) throws IOException, JsonGenerationException {
        if (obj == null) {
            writeNull();
            return;
        }
        if (obj instanceof String) {
            writeString((String) obj);
            return;
        }
        if (obj instanceof Number) {
            Number number = (Number) obj;
            if (number instanceof Integer) {
                writeNumber(number.intValue());
                return;
            }
            if (number instanceof Long) {
                writeNumber(number.longValue());
                return;
            }
            if (number instanceof Double) {
                writeNumber(number.doubleValue());
                return;
            }
            if (number instanceof Float) {
                writeNumber(number.floatValue());
                return;
            }
            if (number instanceof Short) {
                writeNumber(number.shortValue());
                return;
            }
            if (number instanceof Byte) {
                writeNumber(number.byteValue());
                return;
            }
            if (number instanceof BigInteger) {
                writeNumber((BigInteger) number);
                return;
            }
            if (number instanceof BigDecimal) {
                writeNumber((BigDecimal) number);
                return;
            } else if (number instanceof AtomicInteger) {
                writeNumber(((AtomicInteger) number).get());
                return;
            } else if (number instanceof AtomicLong) {
                writeNumber(((AtomicLong) number).get());
                return;
            }
        } else if (obj instanceof byte[]) {
            writeBinary((byte[]) obj);
            return;
        } else if (obj instanceof Boolean) {
            writeBoolean(((Boolean) obj).booleanValue());
            return;
        } else if (obj instanceof AtomicBoolean) {
            writeBoolean(((AtomicBoolean) obj).get());
            return;
        }
        throw new IllegalStateException("No ObjectCodec defined for the generator, can only serialize simple wrapper types (type passed " + obj.getClass().getName() + ")");
    }
}
