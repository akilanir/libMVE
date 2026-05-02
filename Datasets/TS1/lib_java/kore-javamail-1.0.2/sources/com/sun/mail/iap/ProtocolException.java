package com.sun.mail.iap;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/iap/ProtocolException.class */
public class ProtocolException extends Exception {
    protected transient Response response;
    private static final long serialVersionUID = -4360500807971797439L;

    public ProtocolException() {
        this.response = null;
    }

    public ProtocolException(String message) {
        super(message);
        this.response = null;
    }

    public ProtocolException(String message, Throwable cause) {
        super(message, cause);
        this.response = null;
    }

    public ProtocolException(Response r) {
        super(r.toString());
        this.response = null;
        this.response = r;
    }

    public Response getResponse() {
        return this.response;
    }
}
