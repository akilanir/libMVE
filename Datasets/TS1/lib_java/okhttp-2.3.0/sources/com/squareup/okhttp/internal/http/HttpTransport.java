package com.squareup.okhttp.internal.http;

import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import com.squareup.okhttp.ResponseBody;
import java.io.IOException;
import okio.Okio;
import okio.Sink;
import okio.Source;

/* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/internal/http/HttpTransport.class */
public final class HttpTransport implements Transport {
    private final HttpEngine httpEngine;
    private final HttpConnection httpConnection;

    public HttpTransport(HttpEngine httpEngine, HttpConnection httpConnection) {
        this.httpEngine = httpEngine;
        this.httpConnection = httpConnection;
    }

    @Override // com.squareup.okhttp.internal.http.Transport
    public Sink createRequestBody(Request request, long contentLength) throws IOException {
        if ("chunked".equalsIgnoreCase(request.header("Transfer-Encoding"))) {
            return this.httpConnection.newChunkedSink();
        }
        if (contentLength != -1) {
            return this.httpConnection.newFixedLengthSink(contentLength);
        }
        throw new IllegalStateException("Cannot stream a request body without chunked encoding or a known content length!");
    }

    @Override // com.squareup.okhttp.internal.http.Transport
    public void finishRequest() throws IOException {
        this.httpConnection.flush();
    }

    @Override // com.squareup.okhttp.internal.http.Transport
    public void writeRequestBody(RetryableSink requestBody) throws IOException {
        this.httpConnection.writeRequestBody(requestBody);
    }

    @Override // com.squareup.okhttp.internal.http.Transport
    public void writeRequestHeaders(Request request) throws IOException {
        this.httpEngine.writingRequestHeaders();
        String requestLine = RequestLine.get(request, this.httpEngine.getConnection().getRoute().getProxy().type(), this.httpEngine.getConnection().getProtocol());
        this.httpConnection.writeRequest(request.headers(), requestLine);
    }

    @Override // com.squareup.okhttp.internal.http.Transport
    public Response.Builder readResponseHeaders() throws IOException {
        return this.httpConnection.readResponse();
    }

    @Override // com.squareup.okhttp.internal.http.Transport
    public void releaseConnectionOnIdle() throws IOException {
        if (canReuseConnection()) {
            this.httpConnection.poolOnIdle();
        } else {
            this.httpConnection.closeOnIdle();
        }
    }

    @Override // com.squareup.okhttp.internal.http.Transport
    public boolean canReuseConnection() {
        if ("close".equalsIgnoreCase(this.httpEngine.getRequest().header("Connection")) || "close".equalsIgnoreCase(this.httpEngine.getResponse().header("Connection")) || this.httpConnection.isClosed()) {
            return false;
        }
        return true;
    }

    @Override // com.squareup.okhttp.internal.http.Transport
    public ResponseBody openResponseBody(Response response) throws IOException {
        Source source = getTransferStream(response);
        return new RealResponseBody(response.headers(), Okio.buffer(source));
    }

    private Source getTransferStream(Response response) throws IOException {
        if (!HttpEngine.hasBody(response)) {
            return this.httpConnection.newFixedLengthSource(0L);
        }
        if ("chunked".equalsIgnoreCase(response.header("Transfer-Encoding"))) {
            return this.httpConnection.newChunkedSource(this.httpEngine);
        }
        long contentLength = OkHeaders.contentLength(response);
        if (contentLength != -1) {
            return this.httpConnection.newFixedLengthSource(contentLength);
        }
        return this.httpConnection.newUnknownLengthSource();
    }

    @Override // com.squareup.okhttp.internal.http.Transport
    public void disconnect(HttpEngine engine) throws IOException {
        this.httpConnection.closeIfOwnedBy(engine);
    }
}
