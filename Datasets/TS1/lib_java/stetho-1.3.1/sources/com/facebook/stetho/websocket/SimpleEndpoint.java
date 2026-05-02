package com.facebook.stetho.websocket;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/websocket/SimpleEndpoint.class */
public interface SimpleEndpoint {
    void onOpen(SimpleSession simpleSession);

    void onMessage(SimpleSession simpleSession, String str);

    void onMessage(SimpleSession simpleSession, byte[] bArr, int i);

    void onClose(SimpleSession simpleSession, int i, String str);

    void onError(SimpleSession simpleSession, Throwable th);
}
