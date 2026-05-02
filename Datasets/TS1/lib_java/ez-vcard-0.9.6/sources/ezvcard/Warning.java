package ezvcard;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/Warning.class */
public class Warning {
    private final Integer code;
    private final String message;

    public Warning(String message) {
        this(message, (Integer) null);
    }

    public Warning(int code, Object... args) {
        this(Messages.INSTANCE.getValidationWarning(code, args), Integer.valueOf(code));
    }

    public Warning(String message, Integer code) {
        this.code = code;
        this.message = message;
    }

    public Integer getCode() {
        return this.code;
    }

    public String getMessage() {
        return this.message;
    }

    public String toString() {
        if (this.code == null) {
            return this.message;
        }
        return "(" + this.code + ") " + this.message;
    }
}
