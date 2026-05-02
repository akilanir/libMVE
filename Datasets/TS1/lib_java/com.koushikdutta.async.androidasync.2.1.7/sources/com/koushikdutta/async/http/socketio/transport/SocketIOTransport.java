package com.koushikdutta.async.http.socketio.transport;

import com.koushikdutta.async.AsyncServer;
import com.koushikdutta.async.callback.CompletedCallback;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/socketio/transport/SocketIOTransport.class */
public interface SocketIOTransport {

    /* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/socketio/transport/SocketIOTransport$StringCallback.class */
    public interface StringCallback {
        void onStringAvailable(String str);
    }

    void send(String str);

    void disconnect();

    void setStringCallback(StringCallback stringCallback);

    void setClosedCallback(CompletedCallback completedCallback);

    AsyncServer getServer();

    boolean isConnected();

    boolean heartbeats();

    String getSessionId();
}
