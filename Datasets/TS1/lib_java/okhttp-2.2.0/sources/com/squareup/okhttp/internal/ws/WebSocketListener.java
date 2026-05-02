package com.squareup.okhttp.internal.ws;

import com.squareup.okhttp.internal.ws.WebSocket;
import java.io.IOException;
import okio.BufferedSource;

/* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/ws/WebSocketListener.class */
public interface WebSocketListener {
    void onMessage(BufferedSource bufferedSource, WebSocket.PayloadType payloadType) throws IOException;

    void onClose(int i, String str);

    void onFailure(IOException iOException);
}
