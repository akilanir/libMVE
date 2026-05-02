package cz.msebera.android.httpclient.protocol;

import cz.msebera.android.httpclient.HttpConnection;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.HttpInetConnection;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpRequestInterceptor;
import cz.msebera.android.httpclient.HttpVersion;
import cz.msebera.android.httpclient.ProtocolException;
import cz.msebera.android.httpclient.ProtocolVersion;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;
import java.net.InetAddress;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/protocol/RequestTargetHost.class */
public class RequestTargetHost implements HttpRequestInterceptor {
    @Override // cz.msebera.android.httpclient.HttpRequestInterceptor
    public void process(HttpRequest request, HttpContext context) throws HttpException, IOException {
        Args.notNull(request, "HTTP request");
        HttpCoreContext corecontext = HttpCoreContext.adapt(context);
        ProtocolVersion ver = request.getRequestLine().getProtocolVersion();
        String method = request.getRequestLine().getMethod();
        if ((!method.equalsIgnoreCase("CONNECT") || !ver.lessEquals(HttpVersion.HTTP_1_0)) && !request.containsHeader("Host")) {
            HttpHost targethost = corecontext.getTargetHost();
            if (targethost == null) {
                HttpConnection conn = corecontext.getConnection();
                if (conn instanceof HttpInetConnection) {
                    InetAddress address = ((HttpInetConnection) conn).getRemoteAddress();
                    int port = ((HttpInetConnection) conn).getRemotePort();
                    if (address != null) {
                        targethost = new HttpHost(address.getHostName(), port);
                    }
                }
                if (targethost == null) {
                    if (ver.lessEquals(HttpVersion.HTTP_1_0)) {
                        return;
                    } else {
                        throw new ProtocolException("Target host missing");
                    }
                }
            }
            request.addHeader("Host", targethost.toHostString());
        }
    }
}
