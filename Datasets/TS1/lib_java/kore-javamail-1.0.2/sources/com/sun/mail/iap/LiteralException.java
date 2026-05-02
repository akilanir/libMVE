package com.sun.mail.iap;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/iap/LiteralException.class */
public class LiteralException extends ProtocolException {
    private static final long serialVersionUID = -6919179828339609913L;

    public LiteralException(Response r) {
        super(r.toString());
        this.response = r;
    }
}
