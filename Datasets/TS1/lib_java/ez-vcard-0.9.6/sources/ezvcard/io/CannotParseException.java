package ezvcard.io;

import ezvcard.Messages;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/CannotParseException.class */
public class CannotParseException extends RuntimeException {
    public CannotParseException() {
    }

    public CannotParseException(String reason) {
        super(reason);
    }

    public CannotParseException(int code, Object... args) {
        this(Messages.INSTANCE.getParseMessage(code, args));
    }
}
