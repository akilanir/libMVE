package ezvcard.io.json;

import com.fasterxml.jackson.core.JsonToken;
import java.io.IOException;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/json/JCardParseException.class */
public class JCardParseException extends IOException {
    private final JsonToken expected;
    private final JsonToken actual;

    public JCardParseException(JsonToken expected, JsonToken actual) {
        super("Expected " + expected + " but was " + actual + ".");
        this.expected = expected;
        this.actual = actual;
    }

    public JsonToken getExpectedToken() {
        return this.expected;
    }

    public JsonToken getActualToken() {
        return this.actual;
    }
}
