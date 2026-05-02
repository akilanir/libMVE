package ezvcard.io.text;

import java.io.IOException;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/text/VCardParseException.class */
public class VCardParseException extends IOException {
    private final String line;

    public VCardParseException(String line) {
        super("Problem parsing vCard line: " + line);
        this.line = line;
    }

    public String getLine() {
        return this.line;
    }
}
