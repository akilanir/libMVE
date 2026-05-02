package cz.msebera.android.httpclient.conn;

import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.annotation.Immutable;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.InetAddress;
import java.util.Arrays;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/ConnectTimeoutException.class */
public class ConnectTimeoutException extends InterruptedIOException {
    private static final long serialVersionUID = -4816682903149535989L;
    private final HttpHost host;

    public ConnectTimeoutException() {
        this.host = null;
    }

    public ConnectTimeoutException(String message) {
        super(message);
        this.host = null;
    }

    public ConnectTimeoutException(IOException cause, HttpHost host, InetAddress... remoteAddresses) {
        super("Connect to " + (host != null ? host.toHostString() : "remote host") + ((remoteAddresses == null || remoteAddresses.length <= 0) ? "" : " " + Arrays.asList(remoteAddresses)) + ((cause == null || cause.getMessage() == null) ? " timed out" : " failed: " + cause.getMessage()));
        this.host = host;
        initCause(cause);
    }

    public HttpHost getHost() {
        return this.host;
    }
}
