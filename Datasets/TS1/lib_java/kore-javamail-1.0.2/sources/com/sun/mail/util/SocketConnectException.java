package com.sun.mail.util;

import java.io.IOException;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/SocketConnectException.class */
public class SocketConnectException extends IOException {
    private String host;
    private int port;
    private int cto;
    private static final long serialVersionUID = 3997871560538755463L;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !SocketConnectException.class.desiredAssertionStatus();
    }

    public SocketConnectException(String msg, Exception cause, String host, int port, int cto) {
        super(msg);
        initCause(cause);
        this.host = host;
        this.port = port;
        this.cto = cto;
    }

    public Exception getException() {
        Throwable t = getCause();
        if ($assertionsDisabled || t == null || (t instanceof Exception)) {
            return (Exception) t;
        }
        throw new AssertionError();
    }

    public String getHost() {
        return this.host;
    }

    public int getPort() {
        return this.port;
    }

    public int getConnectionTimeout() {
        return this.cto;
    }
}
