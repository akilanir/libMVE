package org.apache.http;

import java.io.IOException;
import java.net.Socket;
import org.apache.http.HttpConnection;

/* loaded from: httpcore-4.4.3.jar:org/apache/http/HttpConnectionFactory.class */
public interface HttpConnectionFactory<T extends HttpConnection> {
    T createConnection(Socket socket) throws IOException;
}
