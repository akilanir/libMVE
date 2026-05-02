package com.koushikdutta.async.http;

import com.koushikdutta.async.AsyncSocket;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/WebSocket.class */
public interface WebSocket extends AsyncSocket {

    /* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/WebSocket$PingCallback.class */
    public interface PingCallback {
        void onPingReceived(String str);
    }

    /* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/WebSocket$PongCallback.class */
    public interface PongCallback {
        void onPongReceived(String str);
    }

    /* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/WebSocket$StringCallback.class */
    public interface StringCallback {
        void onStringAvailable(String str);
    }

    void send(byte[] bArr);

    void send(String str);

    void send(byte[] bArr, int i, int i2);

    void ping(String str);

    void pong(String str);

    void setStringCallback(StringCallback stringCallback);

    StringCallback getStringCallback();

    void setPingCallback(PingCallback pingCallback);

    void setPongCallback(PongCallback pongCallback);

    PongCallback getPongCallback();

    boolean isBuffering();

    AsyncSocket getSocket();
}
