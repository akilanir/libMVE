package org.apache.http.protocol;

import java.io.IOException;
import org.apache.http.HttpEntity;
import org.apache.http.HttpException;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseInterceptor;
import org.apache.http.HttpVersion;
import org.apache.http.ProtocolException;
import org.apache.http.ProtocolVersion;
import org.apache.http.annotation.Immutable;

@Immutable
/* loaded from: httpcore-4.2.1.jar:org/apache/http/protocol/ResponseContent.class */
public class ResponseContent implements HttpResponseInterceptor {
    private final boolean overwrite;

    public ResponseContent() {
        this(false);
    }

    public ResponseContent(boolean overwrite) {
        this.overwrite = overwrite;
    }

    @Override // org.apache.http.HttpResponseInterceptor
    public void process(HttpResponse response, HttpContext context) throws HttpException, IOException {
        if (response == null) {
            throw new IllegalArgumentException("HTTP response may not be null");
        }
        if (this.overwrite) {
            response.removeHeaders("Transfer-Encoding");
            response.removeHeaders("Content-Length");
        } else {
            if (response.containsHeader("Transfer-Encoding")) {
                throw new ProtocolException("Transfer-encoding header already present");
            }
            if (response.containsHeader("Content-Length")) {
                throw new ProtocolException("Content-Length header already present");
            }
        }
        ProtocolVersion ver = response.getStatusLine().getProtocolVersion();
        HttpEntity entity = response.getEntity();
        if (entity != null) {
            long len = entity.getContentLength();
            if (entity.isChunked() && !ver.lessEquals(HttpVersion.HTTP_1_0)) {
                response.addHeader("Transfer-Encoding", HTTP.CHUNK_CODING);
            } else if (len >= 0) {
                response.addHeader("Content-Length", Long.toString(entity.getContentLength()));
            }
            if (entity.getContentType() != null && !response.containsHeader("Content-Type")) {
                response.addHeader(entity.getContentType());
            }
            if (entity.getContentEncoding() != null && !response.containsHeader("Content-Encoding")) {
                response.addHeader(entity.getContentEncoding());
                return;
            }
            return;
        }
        int status = response.getStatusLine().getStatusCode();
        if (status != 204 && status != 304 && status != 205) {
            response.addHeader("Content-Length", "0");
        }
    }
}
