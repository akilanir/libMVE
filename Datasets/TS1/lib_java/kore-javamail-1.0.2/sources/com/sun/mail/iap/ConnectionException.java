package com.sun.mail.iap;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/iap/ConnectionException.class */
public class ConnectionException extends ProtocolException {
    private transient Protocol p;
    private static final long serialVersionUID = 5749739604257464727L;

    public ConnectionException() {
    }

    public ConnectionException(String s) {
        super(s);
    }

    public ConnectionException(Protocol p, Response r) {
        super(r);
        this.p = p;
    }

    public Protocol getProtocol() {
        return this.p;
    }
}
