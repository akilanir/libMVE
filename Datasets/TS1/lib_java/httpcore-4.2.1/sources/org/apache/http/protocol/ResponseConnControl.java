package org.apache.http.protocol;

import java.io.IOException;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseInterceptor;
import org.apache.http.HttpVersion;
import org.apache.http.ProtocolVersion;
import org.apache.http.annotation.Immutable;

@Immutable
/* loaded from: httpcore-4.2.1.jar:org/apache/http/protocol/ResponseConnControl.class */
public class ResponseConnControl implements HttpResponseInterceptor {
    @Override // org.apache.http.HttpResponseInterceptor
    public void process(HttpResponse response, HttpContext context) throws HttpException, IOException {
        if (response == null) {
            throw new IllegalArgumentException("HTTP response may not be null");
        }
        if (context == null) {
            throw new IllegalArgumentException("HTTP context may not be null");
        }
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
        HttpRequest request = (HttpRequest) context.getAttribute(ExecutionContext.HTTP_REQUEST);
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
