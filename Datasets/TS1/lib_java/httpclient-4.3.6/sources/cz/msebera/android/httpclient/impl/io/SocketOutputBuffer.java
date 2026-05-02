package cz.msebera.android.httpclient.impl.io;

import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;
import java.net.Socket;

@NotThreadSafe
@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/io/SocketOutputBuffer.class */
public class SocketOutputBuffer extends AbstractSessionOutputBuffer {
    public SocketOutputBuffer(Socket socket, int buffersize, HttpParams params) throws IOException {
        Args.notNull(socket, "Socket");
        int n = buffersize;
        n = n < 0 ? socket.getSendBufferSize() : n;
        init(socket.getOutputStream(), n < 1024 ? 1024 : n, params);
    }
}
