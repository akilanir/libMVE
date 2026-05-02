package okhttp3;

import java.net.Socket;

/* loaded from: okhttp-3.1.2.jar:okhttp3/Connection.class */
public interface Connection {
    Route route();

    Socket socket();

    Handshake handshake();

    Protocol protocol();
}
