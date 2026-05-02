package cz.msebera.android.httpclient;

import java.net.InetAddress;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/HttpInetConnection.class */
public interface HttpInetConnection extends HttpConnection {
    InetAddress getLocalAddress();

    int getLocalPort();

    InetAddress getRemoteAddress();

    int getRemotePort();
}
