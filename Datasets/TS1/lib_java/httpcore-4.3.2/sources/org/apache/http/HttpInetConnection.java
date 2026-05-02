package org.apache.http;

import java.net.InetAddress;

/* loaded from: httpcore-4.3.2.jar:org/apache/http/HttpInetConnection.class */
public interface HttpInetConnection extends HttpConnection {
    InetAddress getLocalAddress();

    int getLocalPort();

    InetAddress getRemoteAddress();

    int getRemotePort();
}
