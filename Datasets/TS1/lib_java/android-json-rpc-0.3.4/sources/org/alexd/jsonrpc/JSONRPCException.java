package org.alexd.jsonrpc;

/* loaded from: android-json-rpc-0.3.4.jar:org/alexd/jsonrpc/JSONRPCException.class */
public class JSONRPCException extends Exception {
    private static final long serialVersionUID = 4657697652848090922L;

    public JSONRPCException(Object error) {
        super(error.toString());
    }

    public JSONRPCException(String message, Throwable innerException) {
        super(message, innerException);
    }
}
