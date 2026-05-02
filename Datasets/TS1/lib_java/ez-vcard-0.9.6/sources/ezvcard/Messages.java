package ezvcard;

import java.text.MessageFormat;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/Messages.class */
public enum Messages {
    INSTANCE;

    private final ResourceBundle messages = ResourceBundle.getBundle("ezvcard/messages");

    Messages() {
    }

    public String getValidationWarning(int code, Object... args) {
        return getMessage("validate." + code, args);
    }

    public String getParseMessage(int code, Object... args) {
        return getMessage("parse." + code, args);
    }

    public String getMessage(String key, Object... args) {
        try {
            String message = this.messages.getString(key);
            return MessageFormat.format(message, args);
        } catch (MissingResourceException e) {
            return null;
        }
    }
}
