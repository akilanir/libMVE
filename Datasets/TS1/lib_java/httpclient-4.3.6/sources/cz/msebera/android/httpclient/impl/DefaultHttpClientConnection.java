package cz.msebera.android.httpclient.impl;

import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.params.CoreConnectionPNames;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;
import java.net.Socket;

@NotThreadSafe
@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/DefaultHttpClientConnection.class */
public class DefaultHttpClientConnection extends SocketHttpClientConnection {
    @Override // cz.msebera.android.httpclient.impl.SocketHttpClientConnection
    public void bind(Socket socket, HttpParams params) throws IOException {
        Args.notNull(socket, "Socket");
        Args.notNull(params, "HTTP parameters");
        assertNotOpen();
        socket.setTcpNoDelay(params.getBooleanParameter(CoreConnectionPNames.TCP_NODELAY, true));
        socket.setSoTimeout(params.getIntParameter(CoreConnectionPNames.SO_TIMEOUT, 0));
        socket.setKeepAlive(params.getBooleanParameter(CoreConnectionPNames.SO_KEEPALIVE, false));
        int linger = params.getIntParameter(CoreConnectionPNames.SO_LINGER, -1);
        if (linger >= 0) {
            socket.setSoLinger(linger > 0, linger);
        }
        super.bind(socket, params);
    }
}
