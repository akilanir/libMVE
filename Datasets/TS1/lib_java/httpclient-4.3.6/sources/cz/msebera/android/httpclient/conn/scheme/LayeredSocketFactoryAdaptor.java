package cz.msebera.android.httpclient.conn.scheme;

import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/scheme/LayeredSocketFactoryAdaptor.class */
class LayeredSocketFactoryAdaptor extends SocketFactoryAdaptor implements LayeredSocketFactory {
    private final LayeredSchemeSocketFactory factory;

    LayeredSocketFactoryAdaptor(LayeredSchemeSocketFactory factory) {
        super(factory);
        this.factory = factory;
    }

    @Override // cz.msebera.android.httpclient.conn.scheme.LayeredSocketFactory
    public Socket createSocket(Socket socket, String host, int port, boolean autoClose) throws IOException, UnknownHostException {
        return this.factory.createLayeredSocket(socket, host, port, autoClose);
    }
}
