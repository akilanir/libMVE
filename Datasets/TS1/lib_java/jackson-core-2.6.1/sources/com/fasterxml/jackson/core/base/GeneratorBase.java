package com.fasterxml.jackson.core.base;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.PrettyPrinter;
import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.core.TreeNode;
import com.fasterxml.jackson.core.Version;
import com.fasterxml.jackson.core.json.DupDetector;
import com.fasterxml.jackson.core.json.JsonWriteContext;
import com.fasterxml.jackson.core.util.DefaultPrettyPrinter;
import com.fasterxml.jackson.core.util.VersionUtil;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: jackson-core-2.6.1.jar:com/fasterxml/jackson/core/base/GeneratorBase.class */
public abstract class GeneratorBase extends JsonGenerator {
    public static final int SURR1_FIRST = 55296;
    public static final int SURR1_LAST = 56319;
    public static final int SURR2_FIRST = 56320;
    public static final int SURR2_LAST = 57343;
    protected static final int DERIVED_FEATURES_MASK = (JsonGenerator.Feature.WRITE_NUMBERS_AS_STRINGS.getMask() | JsonGenerator.Feature.ESCAPE_NON_ASCII.getMask()) | JsonGenerator.Feature.STRICT_DUPLICATE_DETECTION.getMask();
    protected final String WRITE_BINARY = "write a binary value";
    protected final String WRITE_BOOLEAN = "write a boolean value";
    protected final String WRITE_NULL = "write a null";
    protected final String WRITE_NUMBER = "write a number";
    protected final String WRITE_RAW = "write a raw (unencoded) value";
    protected final String WRITE_STRING = "write a string";
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
        this._objectCodec = codec;
        DupDetector dups = JsonGenerator.Feature.STRICT_DUPLICATE_DETECTION.enabledIn(features) ? DupDetector.rootDetector(this) : null;
        this._writeContext = JsonWriteContext.createRootContext(dups);
        this._cfgNumbersAsStrings = JsonGenerator.Feature.WRITE_NUMBERS_AS_STRINGS.enabledIn(features);
    }

    protected GeneratorBase(int features, ObjectCodec codec, JsonWriteContext ctxt) {
        this._features = features;
        this._objectCodec = codec;
        this._writeContext = ctxt;
        this._cfgNumbersAsStrings = JsonGenerator.Feature.WRITE_NUMBERS_AS_STRINGS.enabledIn(features);
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator, com.fasterxml.jackson.core.Versioned
    public Version version() {
        return VersionUtil.versionFor(getClass());
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public Object getCurrentValue() {
        return this._writeContext.getCurrentValue();
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public void setCurrentValue(Object v) {
        this._writeContext.setCurrentValue(v);
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
    public JsonGenerator enable(JsonGenerator.Feature f) {
        int mask = f.getMask();
        this._features |= mask;
        if ((mask & DERIVED_FEATURES_MASK) != 0) {
            if (f == JsonGenerator.Feature.WRITE_NUMBERS_AS_STRINGS) {
                this._cfgNumbersAsStrings = true;
            } else if (f == JsonGenerator.Feature.ESCAPE_NON_ASCII) {
                setHighestNonEscapedChar(127);
            } else if (f == JsonGenerator.Feature.STRICT_DUPLICATE_DETECTION && this._writeContext.getDupDetector() == null) {
                this._writeContext = this._writeContext.withDupDetector(DupDetector.rootDetector(this));
            }
        }
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public JsonGenerator disable(JsonGenerator.Feature f) {
        int mask = f.getMask();
        this._features &= mask ^ (-1);
        if ((mask & DERIVED_FEATURES_MASK) != 0) {
            if (f == JsonGenerator.Feature.WRITE_NUMBERS_AS_STRINGS) {
                this._cfgNumbersAsStrings = false;
            } else if (f == JsonGenerator.Feature.ESCAPE_NON_ASCII) {
                setHighestNonEscapedChar(0);
            } else if (f == JsonGenerator.Feature.STRICT_DUPLICATE_DETECTION) {
                this._writeContext = this._writeContext.withDupDetector(null);
            }
        }
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public JsonGenerator setFeatureMask(int newMask) {
        int changed = newMask ^ this._features;
        this._features = newMask;
        if ((changed & DERIVED_FEATURES_MASK) != 0) {
            this._cfgNumbersAsStrings = JsonGenerator.Feature.WRITE_NUMBERS_AS_STRINGS.enabledIn(newMask);
            if (JsonGenerator.Feature.ESCAPE_NON_ASCII.enabledIn(changed)) {
                if (JsonGenerator.Feature.ESCAPE_NON_ASCII.enabledIn(newMask)) {
                    setHighestNonEscapedChar(127);
                } else {
                    setHighestNonEscapedChar(0);
                }
            }
            if (JsonGenerator.Feature.STRICT_DUPLICATE_DETECTION.enabledIn(changed)) {
                if (JsonGenerator.Feature.STRICT_DUPLICATE_DETECTION.enabledIn(newMask)) {
                    if (this._writeContext.getDupDetector() == null) {
                        this._writeContext = this._writeContext.withDupDetector(DupDetector.rootDetector(this));
                    }
                } else {
                    this._writeContext = this._writeContext.withDupDetector(null);
                }
            }
        }
        return this;
    }

    @Override // com.fasterxml.jackson.core.JsonGenerator
    public JsonGenerator useDefaultPrettyPrinter() {
        if (getPrettyPrinter() != null) {
            return this;
        }
        return setPrettyPrinter(_constructDefaultPrettyPrinter());
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
    public void writeRawValue(SerializableString text) throws IOException {
        _verifyValueWrite("write raw value");
        writeRaw(text);
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

    protected PrettyPrinter _constructDefaultPrettyPrinter() {
        return new DefaultPrettyPrinter();
    }

    protected final int _decodeSurrogate(int surr1, int surr2) throws IOException {
        if (surr2 < 56320 || surr2 > 57343) {
            String msg = "Incomplete surrogate pair: first char 0x" + Integer.toHexString(surr1) + ", second 0x" + Integer.toHexString(surr2);
            _reportError(msg);
        }
        int c = 65536 + ((surr1 - SURR1_FIRST) << 10) + (surr2 - SURR2_FIRST);
        return c;
    }
}
