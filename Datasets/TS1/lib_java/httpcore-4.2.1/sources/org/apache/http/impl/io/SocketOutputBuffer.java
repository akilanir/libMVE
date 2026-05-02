package org.apache.http.impl.io;

import java.io.IOException;
import java.net.Socket;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.params.HttpParams;

@NotThreadSafe
/* loaded from: httpcore-4.2.1.jar:org/apache/http/impl/io/SocketOutputBuffer.class */
public class SocketOutputBuffer extends AbstractSessionOutputBuffer {
    public SocketOutputBuffer(Socket socket, int buffersize, HttpParams params) throws IOException {
        if (socket == null) {
            throw new IllegalArgumentException("Socket may not be null");
        }
        buffersize = buffersize < 0 ? socket.getSendBufferSize() : buffersize;
        init(socket.getOutputStream(), buffersize < 1024 ? 1024 : buffersize, params);
    }
}
