package cz.msebera.android.httpclient.protocol;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.HttpResponseInterceptor;
import cz.msebera.android.httpclient.HttpVersion;
import cz.msebera.android.httpclient.ProtocolVersion;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/protocol/ResponseConnControl.class */
public class ResponseConnControl implements HttpResponseInterceptor {
    @Override // cz.msebera.android.httpclient.HttpResponseInterceptor
    public void process(HttpResponse response, HttpContext context) throws HttpException, IOException {
        Args.notNull(response, "HTTP response");
        HttpCoreContext corecontext = HttpCoreContext.adapt(context);
        int status = response.getStatusLine().getStatusCode();
        if (status == 400 || status == 408 || status == 411 || status == 413 || status == 414 || status == 503 || status == 501) {
            response.setHeader("Connection", HTTP.CONN_CLOSE);
            return;
        }
        Header explicit = response.getFirstHeader("Connection");
        if (explicit != null && HTTP.CONN_CLOSE.equalsIgnoreCase(explicit.getValue())) {
            return;
        }
        HttpEntity entity = response.getEntity();
        if (entity != null) {
            ProtocolVersion ver = response.getStatusLine().getProtocolVersion();
            if (entity.getContentLength() < 0 && (!entity.isChunked() || ver.lessEquals(HttpVersion.HTTP_1_0))) {
                response.setHeader("Connection", HTTP.CONN_CLOSE);
                return;
            }
        }
        HttpRequest request = corecontext.getRequest();
        if (request != null) {
            Header header = request.getFirstHeader("Connection");
            if (header != null) {
                response.setHeader("Connection", header.getValue());
            } else if (request.getProtocolVersion().lessEquals(HttpVersion.HTTP_1_0)) {
                response.setHeader("Connection", HTTP.CONN_CLOSE);
            }
        }
    }
}
