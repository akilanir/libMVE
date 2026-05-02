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

/* loaded from: jackson-core-2.4.2.jar:com/fasterxml/jackson/core/base/GeneratorBase.class */
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

    protected GeneratorBase(int features, ObjectCodec codec) {
        this._features = features;
        DupDetector dups = JsonGenerator.Feature.STRICT_DUPLICATE_DETECTION.enabledIn(features) ? DupDetector.rootDetector(this) : null;
        this._writeContext = JsonWriteContext.createRootContext(dups);
        this._objectCodec = codec;
        this._cfgNumbersAsStrings = JsonGenerator.Feature.WRITE_NUMBERS_AS_STRINGS.enabledIn(features);
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator, com.fasterxml.jackson.core.Versioned
    public Version version() {
        return VersionUtil.versionFor(getClass());
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public JsonGenerator enable(JsonGenerator.Feature f) {
        this._features |= f.getMask();
        if (f == JsonGenerator.Feature.WRITE_NUMBERS_AS_STRINGS) {
            this._cfgNumbersAsStrings = true;
        } else if (f == JsonGenerator.Feature.ESCAPE_NON_ASCII) {
            setHighestNonEscapedChar(127);
        }
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public JsonGenerator disable(JsonGenerator.Feature f) {
        this._features &= f.getMask() ^ (-1);
        if (f == JsonGenerator.Feature.WRITE_NUMBERS_AS_STRINGS) {
            this._cfgNumbersAsStrings = false;
        } else if (f == JsonGenerator.Feature.ESCAPE_NON_ASCII) {
            setHighestNonEscapedChar(0);
        }
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public final boolean isEnabled(JsonGenerator.Feature f) {
        return (this._features & f.getMask()) != 0;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public int getFeatureMask() {
        return this._features;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public JsonGenerator setFeatureMask(int mask) {
        this._features = mask;
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
    public JsonGenerator setCodec(ObjectCodec oc) {
        this._objectCodec = oc;
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
    public void writeFieldName(SerializableString name) throws IOException {
        writeFieldName(name.getValue());
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeString(SerializableString text) throws IOException {
        writeString(text.getValue());
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRawValue(String text) throws IOException {
        _verifyValueWrite("write raw value");
        writeRaw(text);
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRawValue(String text, int offset, int len) throws IOException {
        _verifyValueWrite("write raw value");
        writeRaw(text, offset, len);
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeRawValue(char[] text, int offset, int len) throws IOException {
        _verifyValueWrite("write raw value");
        writeRaw(text, offset, len);
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public int writeBinary(Base64Variant b64variant, InputStream data, int dataLength) throws IOException {
        _reportUnsupportedOperation();
        return 0;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeObject(Object value) throws IOException {
        if (value == null) {
            writeNull();
        } else if (this._objectCodec != null) {
            this._objectCodec.writeValue(this, value);
        } else {
            _writeSimpleObject(value);
        }
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void writeTree(TreeNode rootNode) throws IOException {
        if (rootNode == null) {
            writeNull();
        } else {
            if (this._objectCodec == null) {
                throw new IllegalStateException("No ObjectCodec defined");
            }
            this._objectCodec.writeValue(this, rootNode);
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
}
