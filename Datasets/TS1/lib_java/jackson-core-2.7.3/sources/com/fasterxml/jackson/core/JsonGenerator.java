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

/* loaded from: jackson-core-2.7.3.jar:com/fasterxml/jackson/core/JsonGenerator.class */
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

    @Deprecated
    public abstract JsonGenerator setFeatureMask(int i);

    public abstract JsonGenerator useDefaultPrettyPrinter();

    public abstract void writeStartArray() throws IOException;

    public abstract void writeEndArray() throws IOException;

    public abstract void writeStartObject() throws IOException;

    public abstract void writeEndObject() throws IOException;

    public abstract void writeFieldName(String str) throws IOException;

    public abstract void writeFieldName(SerializableString serializableString) throws IOException;

    public abstract void writeString(String str) throws IOException;

    public abstract void writeString(char[] cArr, int i, int i2) throws IOException;

    public abstract void writeString(SerializableString serializableString) throws IOException;

    public abstract void writeRawUTF8String(byte[] bArr, int i, int i2) throws IOException;

    public abstract void writeUTF8String(byte[] bArr, int i, int i2) throws IOException;

    public abstract void writeRaw(String str) throws IOException;

    public abstract void writeRaw(String str, int i, int i2) throws IOException;

    public abstract void writeRaw(char[] cArr, int i, int i2) throws IOException;

    public abstract void writeRaw(char c) throws IOException;

    public abstract void writeRawValue(String str) throws IOException;

    public abstract void writeRawValue(String str, int i, int i2) throws IOException;

    public abstract void writeRawValue(char[] cArr, int i, int i2) throws IOException;

    public abstract void writeBinary(Base64Variant base64Variant, byte[] bArr, int i, int i2) throws IOException;

    public abstract int writeBinary(Base64Variant base64Variant, InputStream inputStream, int i) throws IOException;

    public abstract void writeNumber(int i) throws IOException;

    public abstract void writeNumber(long j) throws IOException;

    public abstract void writeNumber(BigInteger bigInteger) throws IOException;

    public abstract void writeNumber(double d) throws IOException;

    public abstract void writeNumber(float f) throws IOException;

    public abstract void writeNumber(BigDecimal bigDecimal) throws IOException;

    public abstract void writeNumber(String str) throws IOException;

    public abstract void writeBoolean(boolean z) throws IOException;

    public abstract void writeNull() throws IOException;

    public abstract void writeObject(Object obj) throws IOException;

    public abstract void writeTree(TreeNode treeNode) throws IOException;

    public abstract JsonStreamContext getOutputContext();

    @Override // java.io.Flushable
    public abstract void flush() throws IOException;

    public abstract boolean isClosed();

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public abstract void close() throws IOException;

    /* loaded from: jackson-core-2.7.3.jar:com/fasterxml/jackson/core/JsonGenerator$Feature.class */
    public enum Feature {
        AUTO_CLOSE_TARGET(true),
        AUTO_CLOSE_JSON_CONTENT(true),
        FLUSH_PASSED_TO_STREAM(true),
        QUOTE_FIELD_NAMES(true),
        QUOTE_NON_NUMERIC_NUMBERS(true),
        WRITE_NUMBERS_AS_STRINGS(false),
        WRITE_BIGDECIMAL_AS_PLAIN(false),
        ESCAPE_NON_ASCII(false),
        STRICT_DUPLICATE_DETECTION(false),
        IGNORE_UNKNOWN(false);

        private final boolean _defaultState;
        private final int _mask = 1 << ordinal();

        public static int collectDefaults() {
            int flags = 0;
            Feature[] arr$ = values();
            for (Feature f : arr$) {
                if (f.enabledByDefault()) {
                    flags |= f.getMask();
                }
            }
            return flags;
        }

        Feature(boolean defaultState) {
            this._defaultState = defaultState;
        }

        public boolean enabledByDefault() {
            return this._defaultState;
        }

        public boolean enabledIn(int flags) {
            return (flags & this._mask) != 0;
        }

        public int getMask() {
            return this._mask;
        }
    }

    protected JsonGenerator() {
    }

    public final JsonGenerator configure(Feature f, boolean state) {
        if (state) {
            enable(f);
        } else {
            disable(f);
        }
        return this;
    }

    public JsonGenerator overrideStdFeatures(int values, int mask) {
        int oldState = getFeatureMask();
        int newState = (oldState & (mask ^ (-1))) | (values & mask);
        return setFeatureMask(newState);
    }

    public int getFormatFeatures() {
        return 0;
    }

    public JsonGenerator overrideFormatFeatures(int values, int mask) {
        throw new IllegalArgumentException("No FormatFeatures defined for generator of type " + getClass().getName());
    }

    public void setSchema(FormatSchema schema) {
        throw new UnsupportedOperationException("Generator of type " + getClass().getName() + " does not support schema of type '" + schema.getSchemaType() + "'");
    }

    public FormatSchema getSchema() {
        return null;
    }

    public JsonGenerator setPrettyPrinter(PrettyPrinter pp) {
        this._cfgPrettyPrinter = pp;
        return this;
    }

    public PrettyPrinter getPrettyPrinter() {
        return this._cfgPrettyPrinter;
    }

    public JsonGenerator setHighestNonEscapedChar(int charCode) {
        return this;
    }

    public int getHighestEscapedChar() {
        return 0;
    }

    public CharacterEscapes getCharacterEscapes() {
        return null;
    }

    public JsonGenerator setCharacterEscapes(CharacterEscapes esc) {
        return this;
    }

    public JsonGenerator setRootValueSeparator(SerializableString sep) {
        throw new UnsupportedOperationException();
    }

    public Object getOutputTarget() {
        return null;
    }

    public int getOutputBuffered() {
        return -1;
    }

    public Object getCurrentValue() {
        JsonStreamContext ctxt = getOutputContext();
        if (ctxt == null) {
            return null;
        }
        return ctxt.getCurrentValue();
    }

    public void setCurrentValue(Object v) {
        JsonStreamContext ctxt = getOutputContext();
        if (ctxt != null) {
            ctxt.setCurrentValue(v);
        }
    }

    public boolean canUseSchema(FormatSchema schema) {
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

    public void writeStartArray(int size) throws IOException {
        writeStartArray();
    }

    public void writeRaw(SerializableString raw) throws IOException {
        writeRaw(raw.getValue());
    }

    public void writeRawValue(SerializableString raw) throws IOException {
        writeRawValue(raw.getValue());
    }

    public void writeBinary(byte[] data, int offset, int len) throws IOException {
        writeBinary(Base64Variants.getDefaultVariant(), data, offset, len);
    }

    public void writeBinary(byte[] data) throws IOException {
        writeBinary(Base64Variants.getDefaultVariant(), data, 0, data.length);
    }

    public int writeBinary(InputStream data, int dataLength) throws IOException {
        return writeBinary(Base64Variants.getDefaultVariant(), data, dataLength);
    }

    public void writeNumber(short v) throws IOException {
        writeNumber((int) v);
    }

    public void writeObjectId(Object id) throws IOException {
        throw new JsonGenerationException("No native support for writing Object Ids", this);
    }

    public void writeObjectRef(Object id) throws IOException {
        throw new JsonGenerationException("No native support for writing Object Ids", this);
    }

    public void writeTypeId(Object id) throws IOException {
        throw new JsonGenerationException("No native support for writing Type Ids", this);
    }

    public void writeStringField(String fieldName, String value) throws IOException {
        writeFieldName(fieldName);
        writeString(value);
    }

    public final void writeBooleanField(String fieldName, boolean value) throws IOException {
        writeFieldName(fieldName);
        writeBoolean(value);
    }

    public final void writeNullField(String fieldName) throws IOException {
        writeFieldName(fieldName);
        writeNull();
    }

    public final void writeNumberField(String fieldName, int value) throws IOException {
        writeFieldName(fieldName);
        writeNumber(value);
    }

    public final void writeNumberField(String fieldName, long value) throws IOException {
        writeFieldName(fieldName);
        writeNumber(value);
    }

    public final void writeNumberField(String fieldName, double value) throws IOException {
        writeFieldName(fieldName);
        writeNumber(value);
    }

    public final void writeNumberField(String fieldName, float value) throws IOException {
        writeFieldName(fieldName);
        writeNumber(value);
    }

    public final void writeNumberField(String fieldName, BigDecimal value) throws IOException {
        writeFieldName(fieldName);
        writeNumber(value);
    }

    public final void writeBinaryField(String fieldName, byte[] data) throws IOException {
        writeFieldName(fieldName);
        writeBinary(data);
    }

    public final void writeArrayFieldStart(String fieldName) throws IOException {
        writeFieldName(fieldName);
        writeStartArray();
    }

    public final void writeObjectFieldStart(String fieldName) throws IOException {
        writeFieldName(fieldName);
        writeStartObject();
    }

    public final void writeObjectField(String fieldName, Object pojo) throws IOException {
        writeFieldName(fieldName);
        writeObject(pojo);
    }

    public void writeOmittedField(String fieldName) throws IOException {
    }

    public void copyCurrentEvent(JsonParser p) throws IOException {
        JsonToken t = p.getCurrentToken();
        if (t == null) {
            _reportError("No current event to copy");
        }
        switch (t.id()) {
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
                writeFieldName(p.getCurrentName());
                return;
            case JsonTokenId.ID_STRING /* 6 */:
                if (p.hasTextCharacters()) {
                    writeString(p.getTextCharacters(), p.getTextOffset(), p.getTextLength());
                    return;
                } else {
                    writeString(p.getText());
                    return;
                }
            case JsonTokenId.ID_NUMBER_INT /* 7 */:
                JsonParser.NumberType n = p.getNumberType();
                if (n == JsonParser.NumberType.INT) {
                    writeNumber(p.getIntValue());
                    return;
                } else if (n == JsonParser.NumberType.BIG_INTEGER) {
                    writeNumber(p.getBigIntegerValue());
                    return;
                } else {
                    writeNumber(p.getLongValue());
                    return;
                }
            case JsonTokenId.ID_NUMBER_FLOAT /* 8 */:
                JsonParser.NumberType n2 = p.getNumberType();
                if (n2 == JsonParser.NumberType.BIG_DECIMAL) {
                    writeNumber(p.getDecimalValue());
                    return;
                } else if (n2 == JsonParser.NumberType.FLOAT) {
                    writeNumber(p.getFloatValue());
                    return;
                } else {
                    writeNumber(p.getDoubleValue());
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
                writeObject(p.getEmbeddedObject());
                return;
        }
        writeStartObject();
    }

    public void copyCurrentStructure(JsonParser p) throws IOException {
        JsonToken t = p.getCurrentToken();
        if (t == null) {
            _reportError("No current event to copy");
        }
        int id = t.id();
        if (id == 5) {
            writeFieldName(p.getCurrentName());
            id = p.nextToken().id();
        }
        switch (id) {
            case 1:
                writeStartObject();
                while (p.nextToken() != JsonToken.END_OBJECT) {
                    copyCurrentStructure(p);
                }
                writeEndObject();
                break;
            case 3:
                writeStartArray();
                while (p.nextToken() != JsonToken.END_ARRAY) {
                    copyCurrentStructure(p);
                }
                writeEndArray();
                break;
            default:
                copyCurrentEvent(p);
                break;
        }
    }

    protected void _reportError(String msg) throws JsonGenerationException {
        throw new JsonGenerationException(msg, this);
    }

    protected final void _throwInternal() {
        VersionUtil.throwInternal();
    }

    protected void _reportUnsupportedOperation() {
        throw new UnsupportedOperationException("Operation not supported by generator of type " + getClass().getName());
    }

    protected void _writeSimpleObject(Object value) throws IOException {
        if (value == null) {
            writeNull();
            return;
        }
        if (value instanceof String) {
            writeString((String) value);
            return;
        }
        if (value instanceof Number) {
            Number n = (Number) value;
            if (n instanceof Integer) {
                writeNumber(n.intValue());
                return;
            }
            if (n instanceof Long) {
                writeNumber(n.longValue());
                return;
            }
            if (n instanceof Double) {
                writeNumber(n.doubleValue());
                return;
            }
            if (n instanceof Float) {
                writeNumber(n.floatValue());
                return;
            }
            if (n instanceof Short) {
                writeNumber(n.shortValue());
                return;
            }
            if (n instanceof Byte) {
                writeNumber(n.byteValue());
                return;
            }
            if (n instanceof BigInteger) {
                writeNumber((BigInteger) n);
                return;
            }
            if (n instanceof BigDecimal) {
                writeNumber((BigDecimal) n);
                return;
            } else if (n instanceof AtomicInteger) {
                writeNumber(((AtomicInteger) n).get());
                return;
            } else if (n instanceof AtomicLong) {
                writeNumber(((AtomicLong) n).get());
                return;
            }
        } else if (value instanceof byte[]) {
            writeBinary((byte[]) value);
            return;
        } else if (value instanceof Boolean) {
            writeBoolean(((Boolean) value).booleanValue());
            return;
        } else if (value instanceof AtomicBoolean) {
            writeBoolean(((AtomicBoolean) value).get());
            return;
        }
        throw new IllegalStateException("No ObjectCodec defined for the generator, can only serialize simple wrapper types (type passed " + value.getClass().getName() + ")");
    }
}
