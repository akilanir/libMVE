package com.fasterxml.jackson.core.base;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.core.TreeNode;
import com.fasterxml.jackson.core.Version;
import com.fasterxml.jackson.core.json.DupDetector;
import com.fasterxml.jackson.core.json.JsonWriteContext;
import com.fasterxml.jackson.core.util.DefaultPrettyPrinter;
import com.fasterxml.jackson.core.util.VersionUtil;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/base/GeneratorBase.class */
public abstract class GeneratorBase extends JsonGenerator {
    protected ObjectCodec _objectCodec;
    protected int _features;
    protected boolean _cfgNumbersAsStrings;
    protected JsonWriteContext _writeContext;
    protected boolean _closed;

    @Override // com.fasterxml.jackson.core.JsonGenerator, java.io.Flushable
    public abstract void flush() throws IOException;

    protected abstract void _releaseBuffers();

    protected abstract void _verifyValueWrite(String str) throws IOException;

    protected GeneratorBase(int i, ObjectCodec objectCodec) {
        this._features = i;
        this._writeContext = JsonWriteContext.createRootContext(JsonGenerator.Feature.STRICT_DUPLICATE_DETECTION.enabledIn(i) ? DupDetector.rootDetector(this) : null);
        this._objectCodec = objectCodec;
        this._cfgNumbersAsStrings = JsonGenerator.Feature.WRITE_NUMBERS_AS_STRINGS.enabledIn(i);
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator, com.fasterxml.jackson.core.Versioned
    public Version version() {
        return VersionUtil.versionFor(getClass());
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public JsonGenerator enable(JsonGenerator.Feature feature) {
        this._features |= feature.getMask();
        if (feature == JsonGenerator.Feature.WRITE_NUMBERS_AS_STRINGS) {
            this._cfgNumbersAsStrings = true;
        } else if (feature == JsonGenerator.Feature.ESCAPE_NON_ASCII) {
            setHighestNonEscapedChar(127);
        }
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public JsonGenerator disable(JsonGenerator.Feature feature) {
        this._features &= feature.getMask() ^ (-1);
        if (feature == JsonGenerator.Feature.WRITE_NUMBERS_AS_STRINGS) {
            this._cfgNumbersAsStrings = false;
        } else if (feature == JsonGenerator.Feature.ESCAPE_NON_ASCII) {
            setHighestNonEscapedChar(0);
        }
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public final boolean isEnabled(JsonGenerator.Feature feature) {
        return (this._features & feature.getMask()) != 0;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public int getFeatureMask() {
        return this._features;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public JsonGenerator setFeatureMask(int i) {
        this._features = i;
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public JsonGenerator useDefaultPrettyPrinter() {
        if (getPrettyPrinter() != null) {
            return this;
        }
        return setPrettyPrinter(new DefaultPrettyPrinter());
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public JsonGenerator setCodec(ObjectCodec objectCodec) {
        this._objectCodec = objectCodec;
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public final ObjectCodec getCodec() {
        return this._objectCodec;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public final JsonWriteContext getOutputContext() {
        return this._writeContext;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeFieldName(SerializableString serializableString) throws IOException {
        writeFieldName(serializableString.getValue());
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeString(SerializableString serializableString) throws IOException {
        writeString(serializableString.getValue());
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRawValue(String str) throws IOException {
        _verifyValueWrite("write raw value");
        writeRaw(str);
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRawValue(String str, int i, int i2) throws IOException {
        _verifyValueWrite("write raw value");
        writeRaw(str, i, i2);
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRawValue(char[] cArr, int i, int i2) throws IOException {
        _verifyValueWrite("write raw value");
        writeRaw(cArr, i, i2);
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public int writeBinary(Base64Variant base64Variant, InputStream inputStream, int i) throws IOException {
        _reportUnsupportedOperation();
        return 0;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeObject(Object obj) throws IOException {
        if (obj == null) {
            writeNull();
        } else if (this._objectCodec != null) {
            this._objectCodec.writeValue(this, obj);
        } else {
            _writeSimpleObject(obj);
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeTree(TreeNode treeNode) throws IOException {
        if (treeNode == null) {
            writeNull();
        } else {
            if (this._objectCodec == null) {
                throw new IllegalStateException("No ObjectCodec defined");
            }
            this._objectCodec.writeValue(this, treeNode);
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this._closed = true;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public boolean isClosed() {
        return this._closed;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    protected void _writeSimpleObject(Object obj) throws IOException {
        super._writeSimpleObject(obj);
    }
}
