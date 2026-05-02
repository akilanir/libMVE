package cz.msebera.android.httpclient.client.protocol;

import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpHeaders;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpRequestInterceptor;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.protocol.HttpContext;
import java.io.IOException;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/protocol/RequestAcceptEncoding.class */
public class RequestAcceptEncoding implements HttpRequestInterceptor {
    @Override // cz.msebera.android.httpclient.HttpRequestInterceptor
    public void process(HttpRequest request, HttpContext context) throws HttpException, IOException {
        if (!request.containsHeader(HttpHeaders.ACCEPT_ENCODING)) {
            request.addHeader(HttpHeaders.ACCEPT_ENCODING, "gzip,deflate");
        }
    }
}
