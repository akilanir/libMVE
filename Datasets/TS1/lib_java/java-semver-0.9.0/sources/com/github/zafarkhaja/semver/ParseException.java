package com.github.zafarkhaja.semver;

/* loaded from: java-semver-0.9.0.jar:com/github/zafarkhaja/semver/ParseException.class */
public class ParseException extends RuntimeException {
    public ParseException() {
    }

    public ParseException(String message) {
        super(message);
    }

    public ParseException(String message, UnexpectedCharacterException cause) {
        super(message);
        initCause(cause);
    }

    @Override // java.lang.Throwable
    public String toString() {
        Throwable cause = getCause();
        String msg = getMessage();
        if (msg != null) {
            return msg + (cause != null ? " (" + cause.toString() + ")" : "");
        }
        return cause != null ? cause.toString() : "";
    }
}
