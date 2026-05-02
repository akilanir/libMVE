package ezvcard.io;

import ezvcard.Messages;
import java.util.ArrayList;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/ParseWarnings.class */
public class ParseWarnings {
    private final List<String> warnings = new ArrayList();

    public void add(Integer line, String propertyName, int code, Object... args) {
        String message = Messages.INSTANCE.getParseMessage(code, args);
        add(line, propertyName, message);
    }

    public void add(Integer line, String propertyName, String message) {
        int code;
        if (line == null && propertyName == null) {
            this.warnings.add(message);
            return;
        }
        if (line == null && propertyName != null) {
            code = 35;
        } else if (line != null && propertyName == null) {
            code = 37;
        } else {
            code = 36;
        }
        String warning = Messages.INSTANCE.getParseMessage(code, line, propertyName, message);
        this.warnings.add(warning);
    }

    public List<String> copy() {
        return new ArrayList(this.warnings);
    }

    public void clear() {
        this.warnings.clear();
    }
}
