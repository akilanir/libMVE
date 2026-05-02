package com.squareup.okhttp;

import java.net.Socket;

/* loaded from: okhttp-2.7.5.jar:com/squareup/okhttp/Connection.class */
public interface Connection {
    Route getRoute();

    Socket getSocket();

    Handshake getHandshake();

    Protocol getProtocol();
}
