package com.facebook.stetho.websocket;

import java.io.IOException;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/websocket/WriteCallback.class */
interface WriteCallback {
    void onFailure(IOException iOException);

    void onSuccess();
}
