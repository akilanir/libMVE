package com.facebook.stetho.inspector.network;

import java.io.IOException;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/network/ResponseHandler.class */
public interface ResponseHandler {
    void onRead(int i);

    void onReadDecoded(int i);

    void onEOF();

    void onError(IOException iOException);
}
