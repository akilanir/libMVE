package com.facebook.stetho.websocket;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/websocket/SimpleSession.class */
public interface SimpleSession {
    void sendText(String str);

    void sendBinary(byte[] bArr);

    void close(int i, String str);

    boolean isOpen();
}
