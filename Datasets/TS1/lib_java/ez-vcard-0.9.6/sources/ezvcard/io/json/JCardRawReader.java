package ezvcard.io.json;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import ezvcard.VCardDataType;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.Kind;
import java.io.Closeable;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/json/JCardRawReader.class */
public class JCardRawReader implements Closeable {
    private final Reader reader;
    private JsonParser parser;
    private boolean eof = false;
    private JCardDataStreamListener listener;

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/json/JCardRawReader$JCardDataStreamListener.class */
    public interface JCardDataStreamListener {
        void beginVCard();

        void readProperty(String str, String str2, VCardParameters vCardParameters, VCardDataType vCardDataType, JCardValue jCardValue);
    }

    public JCardRawReader(Reader reader) {
        this.reader = reader;
    }

    public int getLineNum() {
        if (this.parser == null) {
            return 0;
        }
        return this.parser.getCurrentLocation().getLineNr();
    }

    public void readNext(JCardDataStreamListener listener) throws IOException {
        JsonToken cur;
        if (this.parser == null) {
            JsonFactory factory = new JsonFactory();
            this.parser = factory.createParser(this.reader);
        } else if (this.parser.isClosed()) {
            return;
        }
        this.listener = listener;
        JsonToken jsonToken = null;
        while (true) {
            JsonToken prev = jsonToken;
            cur = this.parser.nextToken();
            if (cur == null || (prev == JsonToken.START_ARRAY && cur == JsonToken.VALUE_STRING && "vcard".equals(this.parser.getValueAsString()))) {
                break;
            } else {
                jsonToken = cur;
            }
        }
        if (cur == null) {
            this.eof = true;
        } else {
            listener.beginVCard();
            parseProperties();
        }
    }

    private void parseProperties() throws IOException {
        checkNext(JsonToken.START_ARRAY);
        while (this.parser.nextToken() != JsonToken.END_ARRAY) {
            checkCurrent(JsonToken.START_ARRAY);
            this.parser.nextToken();
            parseProperty();
        }
    }

    private void parseProperty() throws IOException {
        checkCurrent(JsonToken.VALUE_STRING);
        String propertyName = this.parser.getValueAsString().toLowerCase();
        VCardParameters parameters = parseParameters();
        List<String> removed = parameters.removeAll(Kind.GROUP);
        String group = removed.isEmpty() ? null : removed.get(0);
        checkNext(JsonToken.VALUE_STRING);
        String dataTypeStr = this.parser.getText().toLowerCase();
        VCardDataType dataType = "unknown".equals(dataTypeStr) ? null : VCardDataType.get(dataTypeStr);
        List<JsonValue> values = parseValues();
        JCardValue value = new JCardValue(values);
        this.listener.readProperty(group, propertyName, parameters, dataType, value);
    }

    private VCardParameters parseParameters() throws IOException {
        checkNext(JsonToken.START_OBJECT);
        VCardParameters parameters = new VCardParameters();
        while (this.parser.nextToken() != JsonToken.END_OBJECT) {
            String parameterName = this.parser.getText();
            if (this.parser.nextToken() == JsonToken.START_ARRAY) {
                while (this.parser.nextToken() != JsonToken.END_ARRAY) {
                    parameters.put(parameterName, this.parser.getText());
                }
            } else {
                parameters.put(parameterName, this.parser.getValueAsString());
            }
        }
        return parameters;
    }

    private List<JsonValue> parseValues() throws IOException {
        List<JsonValue> values = new ArrayList<>();
        while (this.parser.nextToken() != JsonToken.END_ARRAY) {
            JsonValue value = parseValue();
            values.add(value);
        }
        return values;
    }

    /* renamed from: ezvcard.io.json.JCardRawReader$1, reason: invalid class name */
    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/json/JCardRawReader$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$fasterxml$jackson$core$JsonToken = new int[JsonToken.values().length];

        static {
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.VALUE_FALSE.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.VALUE_TRUE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.VALUE_NUMBER_FLOAT.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.VALUE_NUMBER_INT.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.VALUE_NULL.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.START_ARRAY.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.START_OBJECT.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
        }
    }

    private Object parseValueElement() throws IOException {
        switch (AnonymousClass1.$SwitchMap$com$fasterxml$jackson$core$JsonToken[this.parser.getCurrentToken().ordinal()]) {
            case 1:
            case 2:
                return Boolean.valueOf(this.parser.getBooleanValue());
            case 3:
                return Double.valueOf(this.parser.getDoubleValue());
            case 4:
                return Long.valueOf(this.parser.getLongValue());
            case 5:
                return null;
            default:
                return this.parser.getText();
        }
    }

    private List<JsonValue> parseValueArray() throws IOException {
        List<JsonValue> array = new ArrayList<>();
        while (this.parser.nextToken() != JsonToken.END_ARRAY) {
            JsonValue value = parseValue();
            array.add(value);
        }
        return array;
    }

    private Map<String, JsonValue> parseValueObject() throws IOException {
        Map<String, JsonValue> object = new HashMap<>();
        while (this.parser.nextToken() != JsonToken.END_OBJECT) {
            checkCurrent(JsonToken.FIELD_NAME);
            String key = this.parser.getText();
            this.parser.nextToken();
            JsonValue value = parseValue();
            object.put(key, value);
        }
        return object;
    }

    private JsonValue parseValue() throws IOException {
        switch (AnonymousClass1.$SwitchMap$com$fasterxml$jackson$core$JsonToken[this.parser.getCurrentToken().ordinal()]) {
            case 6:
                return new JsonValue(parseValueArray());
            case 7:
                return new JsonValue(parseValueObject());
            default:
                return new JsonValue(parseValueElement());
        }
    }

    private void checkNext(JsonToken expected) throws IOException {
        JsonToken actual = this.parser.nextToken();
        check(expected, actual);
    }

    private void checkCurrent(JsonToken expected) throws JCardParseException {
        JsonToken actual = this.parser.getCurrentToken();
        check(expected, actual);
    }

    private void check(JsonToken expected, JsonToken actual) throws JCardParseException {
        if (actual != expected) {
            throw new JCardParseException(expected, actual);
        }
    }

    public boolean eof() {
        return this.eof;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.reader.close();
    }
}
