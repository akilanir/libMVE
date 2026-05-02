package com.fasterxml.jackson.core.util;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.FormatSchema;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonLocation;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonStreamContext;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.core.TreeNode;
import com.fasterxml.jackson.core.Version;
import com.fasterxml.jackson.core.type.TypeReference;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Writer;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Iterator;

/* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/util/JsonParserDelegate.class */
public class JsonParserDelegate extends JsonParser {
    protected JsonParser delegate;

    public JsonParserDelegate(JsonParser jsonParser) {
        this.delegate = jsonParser;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public void setCodec(ObjectCodec objectCodec) {
        this.delegate.setCodec(objectCodec);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public ObjectCodec getCodec() {
        return this.delegate.getCodec();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonParser enable(JsonParser.Feature feature) {
        this.delegate.enable(feature);
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonParser disable(JsonParser.Feature feature) {
        this.delegate.disable(feature);
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean isEnabled(JsonParser.Feature feature) {
        return this.delegate.isEnabled(feature);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonParser configure(JsonParser.Feature feature, boolean z) {
        return this.delegate.configure(feature, z);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int getFeatureMask() {
        return this.delegate.getFeatureMask();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonParser setFeatureMask(int i) {
        this.delegate.setFeatureMask(i);
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public FormatSchema getSchema() {
        return this.delegate.getSchema();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public void setSchema(FormatSchema formatSchema) {
        this.delegate.setSchema(formatSchema);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean canUseSchema(FormatSchema formatSchema) {
        return this.delegate.canUseSchema(formatSchema);
    }

    @Override // com.fasterxml.jackson.core.JsonParser, com.fasterxml.jackson.core.Versioned
    public Version version() {
        return this.delegate.version();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public Object getInputSource() {
        return this.delegate.getInputSource();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean requiresCustomCodec() {
        return this.delegate.requiresCustomCodec();
    }

    @Override // com.fasterxml.jackson.core.JsonParser, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.delegate.close();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean isClosed() {
        return this.delegate.isClosed();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonToken getCurrentToken() {
        return this.delegate.getCurrentToken();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int getCurrentTokenId() {
        return this.delegate.getCurrentTokenId();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean hasCurrentToken() {
        return this.delegate.hasCurrentToken();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public String getCurrentName() throws IOException, JsonParseException {
        return this.delegate.getCurrentName();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonLocation getCurrentLocation() {
        return this.delegate.getCurrentLocation();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonStreamContext getParsingContext() {
        return this.delegate.getParsingContext();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean isExpectedStartArrayToken() {
        return this.delegate.isExpectedStartArrayToken();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public void clearCurrentToken() {
        this.delegate.clearCurrentToken();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonToken getLastClearedToken() {
        return this.delegate.getLastClearedToken();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public void overrideCurrentName(String str) {
        this.delegate.overrideCurrentName(str);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public String getText() throws IOException, JsonParseException {
        return this.delegate.getText();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean hasTextCharacters() {
        return this.delegate.hasTextCharacters();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public char[] getTextCharacters() throws IOException, JsonParseException {
        return this.delegate.getTextCharacters();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int getTextLength() throws IOException, JsonParseException {
        return this.delegate.getTextLength();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int getTextOffset() throws IOException, JsonParseException {
        return this.delegate.getTextOffset();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public String nextTextValue() throws IOException, JsonParseException {
        return this.delegate.nextTextValue();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public BigInteger getBigIntegerValue() throws IOException, JsonParseException {
        return this.delegate.getBigIntegerValue();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean getBooleanValue() throws IOException, JsonParseException {
        return this.delegate.getBooleanValue();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public byte getByteValue() throws IOException, JsonParseException {
        return this.delegate.getByteValue();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public short getShortValue() throws IOException, JsonParseException {
        return this.delegate.getShortValue();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public BigDecimal getDecimalValue() throws IOException, JsonParseException {
        return this.delegate.getDecimalValue();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public double getDoubleValue() throws IOException, JsonParseException {
        return this.delegate.getDoubleValue();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public float getFloatValue() throws IOException, JsonParseException {
        return this.delegate.getFloatValue();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int getIntValue() throws IOException, JsonParseException {
        return this.delegate.getIntValue();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public long getLongValue() throws IOException, JsonParseException {
        return this.delegate.getLongValue();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonParser.NumberType getNumberType() throws IOException, JsonParseException {
        return this.delegate.getNumberType();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public Number getNumberValue() throws IOException, JsonParseException {
        return this.delegate.getNumberValue();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public Boolean nextBooleanValue() throws IOException, JsonParseException {
        return this.delegate.nextBooleanValue();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int nextIntValue(int i) throws IOException, JsonParseException {
        return this.delegate.nextIntValue(i);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public long nextLongValue(long j) throws IOException, JsonParseException {
        return this.delegate.nextLongValue(j);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int getValueAsInt() throws IOException, JsonParseException {
        return this.delegate.getValueAsInt();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int getValueAsInt(int i) throws IOException, JsonParseException {
        return this.delegate.getValueAsInt(i);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public long getValueAsLong() throws IOException, JsonParseException {
        return this.delegate.getValueAsLong();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public long getValueAsLong(long j) throws IOException, JsonParseException {
        return this.delegate.getValueAsLong(j);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public double getValueAsDouble() throws IOException, JsonParseException {
        return this.delegate.getValueAsDouble();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public double getValueAsDouble(double d) throws IOException, JsonParseException {
        return this.delegate.getValueAsDouble(d);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean getValueAsBoolean() throws IOException, JsonParseException {
        return this.delegate.getValueAsBoolean();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean getValueAsBoolean(boolean z) throws IOException, JsonParseException {
        return this.delegate.getValueAsBoolean(z);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public String getValueAsString() throws IOException, JsonParseException {
        return this.delegate.getValueAsString();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public String getValueAsString(String str) throws IOException, JsonParseException {
        return this.delegate.getValueAsString(str);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public <T> T readValueAs(Class<T> cls) throws IOException, JsonProcessingException {
        return (T) this.delegate.readValueAs(cls);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public <T> T readValueAs(TypeReference<?> typeReference) throws IOException, JsonProcessingException {
        return (T) this.delegate.readValueAs(typeReference);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public <T> Iterator<T> readValuesAs(Class<T> cls) throws IOException, JsonProcessingException {
        return this.delegate.readValuesAs(cls);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public <T> Iterator<T> readValuesAs(TypeReference<?> typeReference) throws IOException, JsonProcessingException {
        return this.delegate.readValuesAs(typeReference);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public <T extends TreeNode> T readValueAsTree() throws IOException, JsonProcessingException {
        return (T) this.delegate.readValueAsTree();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public Object getEmbeddedObject() throws IOException, JsonParseException {
        return this.delegate.getEmbeddedObject();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public byte[] getBinaryValue(Base64Variant base64Variant) throws IOException, JsonParseException {
        return this.delegate.getBinaryValue(base64Variant);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public byte[] getBinaryValue() throws IOException, JsonParseException {
        return this.delegate.getBinaryValue();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int readBinaryValue(Base64Variant base64Variant, OutputStream outputStream) throws IOException, JsonParseException {
        return this.delegate.readBinaryValue(base64Variant, outputStream);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int readBinaryValue(OutputStream outputStream) throws IOException, JsonParseException {
        return this.delegate.readBinaryValue(outputStream);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonLocation getTokenLocation() {
        return this.delegate.getTokenLocation();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonToken nextToken() throws IOException, JsonParseException {
        return this.delegate.nextToken();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonToken nextValue() throws IOException, JsonParseException {
        return this.delegate.nextValue();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean nextFieldName(SerializableString serializableString) throws IOException, JsonParseException {
        return this.delegate.nextFieldName(serializableString);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public JsonParser skipChildren() throws IOException, JsonParseException {
        this.delegate.skipChildren();
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int releaseBuffered(OutputStream outputStream) throws IOException {
        return this.delegate.releaseBuffered(outputStream);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public int releaseBuffered(Writer writer) throws IOException {
        return this.delegate.releaseBuffered(writer);
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean canReadObjectId() {
        return this.delegate.canReadObjectId();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public boolean canReadTypeId() {
        return this.delegate.canReadTypeId();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public Object getObjectId() throws IOException, JsonGenerationException {
        return this.delegate.getObjectId();
    }

    @Override // com.fasterxml.jackson.core.JsonParser
    public Object getTypeId() throws IOException, JsonGenerationException {
        return this.delegate.getTypeId();
    }
}
