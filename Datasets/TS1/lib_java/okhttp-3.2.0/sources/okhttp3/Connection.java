package okhttp3;

import java.net.Socket;

/* loaded from: okhttp-3.2.0.jar:okhttp3/Connection.class */
public interface Connection {
    Route route();

    Socket socket();

    Handshake handshake();

    Protocol protocol();
}
