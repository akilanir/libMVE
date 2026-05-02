package ezvcard.io.json;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonGenerator;
import ezvcard.VCardDataType;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.Kind;
import ezvcard.util.StringUtils;
import java.io.Closeable;
import java.io.Flushable;
import java.io.IOException;
import java.io.Writer;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/json/JCardRawWriter.class */
public class JCardRawWriter implements Closeable, Flushable {
    private final Writer writer;
    private final boolean wrapInArray;
    private JsonGenerator generator;
    private boolean indent = false;
    private boolean open = false;

    public JCardRawWriter(Writer writer, boolean wrapInArray) {
        this.writer = writer;
        this.wrapInArray = wrapInArray;
    }

    public boolean isIndent() {
        return this.indent;
    }

    public void setIndent(boolean indent) {
        this.indent = indent;
    }

    public void writeStartVCard() throws IOException {
        if (this.generator == null) {
            init();
        }
        if (this.open) {
            writeEndVCard();
        }
        this.generator.writeStartArray();
        indent(0);
        this.generator.writeString("vcard");
        this.generator.writeStartArray();
        this.open = true;
    }

    public void writeEndVCard() throws IOException {
        if (!this.open) {
            throw new IllegalStateException("Call \"writeStartVCard\" first.");
        }
        this.generator.writeEndArray();
        this.generator.writeEndArray();
        this.open = false;
    }

    public void writeProperty(String propertyName, VCardDataType dataType, JCardValue value) throws IOException {
        writeProperty(null, propertyName, new VCardParameters(), dataType, value);
    }

    public void writeProperty(String group, String propertyName, VCardParameters parameters, VCardDataType dataType, JCardValue value) throws IOException {
        if (!this.open) {
            throw new IllegalStateException("Call \"writeStartVCard\" first.");
        }
        this.generator.writeStartArray();
        indent(2);
        this.generator.writeString(propertyName);
        this.generator.writeStartObject();
        Iterator i$ = parameters.iterator();
        while (i$.hasNext()) {
            Map.Entry<String, List<String>> entry = i$.next();
            String name = entry.getKey().toLowerCase();
            List<String> values = entry.getValue();
            if (!values.isEmpty()) {
                if (values.size() == 1) {
                    this.generator.writeStringField(name, values.get(0));
                } else {
                    this.generator.writeArrayFieldStart(name);
                    for (String paramValue : values) {
                        this.generator.writeString(paramValue);
                    }
                    this.generator.writeEndArray();
                }
            }
        }
        if (group != null) {
            this.generator.writeStringField(Kind.GROUP, group);
        }
        this.generator.writeEndObject();
        this.generator.writeString(dataType == null ? "unknown" : dataType.getName().toLowerCase());
        if (value.getValues().isEmpty()) {
            this.generator.writeString("");
        } else {
            for (JsonValue jsonValue : value.getValues()) {
                writeValue(jsonValue);
            }
        }
        this.generator.writeEndArray();
    }

    private void writeValue(JsonValue jsonValue) throws IOException {
        if (jsonValue.isNull()) {
            this.generator.writeNull();
            return;
        }
        Object val = jsonValue.getValue();
        if (val != null) {
            if (val instanceof Byte) {
                this.generator.writeNumber(((Byte) val).byteValue());
                return;
            }
            if (val instanceof Short) {
                this.generator.writeNumber(((Short) val).shortValue());
                return;
            }
            if (val instanceof Integer) {
                this.generator.writeNumber(((Integer) val).intValue());
                return;
            }
            if (val instanceof Long) {
                this.generator.writeNumber(((Long) val).longValue());
                return;
            }
            if (val instanceof Float) {
                this.generator.writeNumber(((Float) val).floatValue());
                return;
            }
            if (val instanceof Double) {
                this.generator.writeNumber(((Double) val).doubleValue());
                return;
            } else if (val instanceof Boolean) {
                this.generator.writeBoolean(((Boolean) val).booleanValue());
                return;
            } else {
                this.generator.writeString(val.toString());
                return;
            }
        }
        List<JsonValue> array = jsonValue.getArray();
        if (array != null) {
            this.generator.writeStartArray();
            for (JsonValue element : array) {
                writeValue(element);
            }
            this.generator.writeEndArray();
            return;
        }
        Map<String, JsonValue> object = jsonValue.getObject();
        if (object != null) {
            this.generator.writeStartObject();
            for (Map.Entry<String, JsonValue> entry : object.entrySet()) {
                this.generator.writeFieldName(entry.getKey());
                writeValue(entry.getValue());
            }
            this.generator.writeEndObject();
        }
    }

    private void indent(int spaces) throws IOException {
        if (!this.indent) {
            return;
        }
        this.generator.writeRaw(StringUtils.NEWLINE);
        for (int i = 0; i < spaces; i++) {
            this.generator.writeRaw(' ');
        }
    }

    @Override // java.io.Flushable
    public void flush() throws IOException {
        if (this.generator == null) {
            return;
        }
        this.generator.flush();
    }

    public void closeJsonStream() throws IOException {
        if (this.generator == null) {
            return;
        }
        while (this.open) {
            writeEndVCard();
        }
        if (this.wrapInArray) {
            indent(0);
            this.generator.writeEndArray();
        }
        this.generator.close();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.generator == null) {
            return;
        }
        closeJsonStream();
        this.writer.close();
    }

    private void init() throws IOException {
        JsonFactory factory = new JsonFactory();
        factory.configure(JsonGenerator.Feature.AUTO_CLOSE_TARGET, false);
        this.generator = factory.createGenerator(this.writer);
        if (this.wrapInArray) {
            this.generator.writeStartArray();
            indent(0);
        }
    }
}
