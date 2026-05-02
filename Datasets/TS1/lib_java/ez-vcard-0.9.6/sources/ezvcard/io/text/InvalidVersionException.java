package ezvcard.io.text;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/text/InvalidVersionException.class */
public class InvalidVersionException extends VCardParseException {
    private final String version;

    public InvalidVersionException(String version, String line) {
        super(line);
        this.version = version;
    }

    public String getVersion() {
        return this.version;
    }
}
