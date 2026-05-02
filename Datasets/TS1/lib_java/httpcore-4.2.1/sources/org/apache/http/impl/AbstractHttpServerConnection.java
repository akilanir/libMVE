package org.apache.http.impl;

import java.io.IOException;
import org.apache.http.HttpConnectionMetrics;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestFactory;
import org.apache.http.HttpResponse;
import org.apache.http.HttpServerConnection;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.impl.entity.DisallowIdentityContentLengthStrategy;
import org.apache.http.impl.entity.EntityDeserializer;
import org.apache.http.impl.entity.EntitySerializer;
import org.apache.http.impl.entity.LaxContentLengthStrategy;
import org.apache.http.impl.entity.StrictContentLengthStrategy;
import org.apache.http.impl.io.DefaultHttpRequestParser;
import org.apache.http.impl.io.HttpResponseWriter;
import org.apache.http.io.EofSensor;
import org.apache.http.io.HttpMessageParser;
import org.apache.http.io.HttpMessageWriter;
import org.apache.http.io.HttpTransportMetrics;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.io.SessionOutputBuffer;
import org.apache.http.params.HttpParams;

@NotThreadSafe
/* loaded from: httpcore-4.2.1.jar:org/apache/http/impl/AbstractHttpServerConnection.class */
public abstract class AbstractHttpServerConnection implements HttpServerConnection {
    private SessionInputBuffer inbuffer = null;
    private SessionOutputBuffer outbuffer = null;
    private EofSensor eofSensor = null;
    private HttpMessageParser<HttpRequest> requestParser = null;
    private HttpMessageWriter<HttpResponse> responseWriter = null;
    private HttpConnectionMetricsImpl metrics = null;
    private final EntitySerializer entityserializer = createEntitySerializer();
    private final EntityDeserializer entitydeserializer = createEntityDeserializer();

    protected abstract void assertOpen() throws IllegalStateException;

    protected EntityDeserializer createEntityDeserializer() {
        return new EntityDeserializer(new DisallowIdentityContentLengthStrategy(new LaxContentLengthStrategy(0)));
    }

    protected EntitySerializer createEntitySerializer() {
        return new EntitySerializer(new StrictContentLengthStrategy());
    }

    protected HttpRequestFactory createHttpRequestFactory() {
        return new DefaultHttpRequestFactory();
    }

    protected HttpMessageParser<HttpRequest> createRequestParser(SessionInputBuffer buffer, HttpRequestFactory requestFactory, HttpParams params) {
        return new DefaultHttpRequestParser(buffer, null, requestFactory, params);
    }

    protected HttpMessageWriter<HttpResponse> createResponseWriter(SessionOutputBuffer buffer, HttpParams params) {
        return new HttpResponseWriter(buffer, null, params);
    }

    protected HttpConnectionMetricsImpl createConnectionMetrics(HttpTransportMetrics inTransportMetric, HttpTransportMetrics outTransportMetric) {
        return new HttpConnectionMetricsImpl(inTransportMetric, outTransportMetric);
    }

    protected void init(SessionInputBuffer inbuffer, SessionOutputBuffer outbuffer, HttpParams params) {
        if (inbuffer == null) {
            throw new IllegalArgumentException("Input session buffer may not be null");
        }
        if (outbuffer == null) {
            throw new IllegalArgumentException("Output session buffer may not be null");
        }
        this.inbuffer = inbuffer;
        this.outbuffer = outbuffer;
        if (inbuffer instanceof EofSensor) {
            this.eofSensor = (EofSensor) inbuffer;
        }
        this.requestParser = createRequestParser(inbuffer, createHttpRequestFactory(), params);
        this.responseWriter = createResponseWriter(outbuffer, params);
        this.metrics = createConnectionMetrics(inbuffer.getMetrics(), outbuffer.getMetrics());
    }

    @Override // org.apache.http.HttpServerConnection
    public HttpRequest receiveRequestHeader() throws HttpException, IOException {
        assertOpen();
        HttpRequest request = (HttpRequest) this.requestParser.parse();
        this.metrics.incrementRequestCount();
        return request;
    }

    @Override // org.apache.http.HttpServerConnection
    public void receiveRequestEntity(HttpEntityEnclosingRequest request) throws HttpException, IOException {
        if (request == null) {
            throw new IllegalArgumentException("HTTP request may not be null");
        }
        assertOpen();
        HttpEntity entity = this.entitydeserializer.deserialize(this.inbuffer, request);
        request.setEntity(entity);
    }

    protected void doFlush() throws IOException {
        this.outbuffer.flush();
    }

    @Override // org.apache.http.HttpServerConnection
    public void flush() throws IOException {
        assertOpen();
        doFlush();
    }

    @Override // org.apache.http.HttpServerConnection
    public void sendResponseHeader(HttpResponse response) throws HttpException, IOException {
        if (response == null) {
            throw new IllegalArgumentException("HTTP response may not be null");
        }
        assertOpen();
        this.responseWriter.write(response);
        if (response.getStatusLine().getStatusCode() >= 200) {
            this.metrics.incrementResponseCount();
        }
    }

    @Override // org.apache.http.HttpServerConnection
    public void sendResponseEntity(HttpResponse response) throws HttpException, IOException {
        if (response.getEntity() == null) {
            return;
        }
        this.entityserializer.serialize(this.outbuffer, response, response.getEntity());
    }

    protected boolean isEof() {
        return this.eofSensor != null && this.eofSensor.isEof();
    }

    @Override // org.apache.http.HttpConnection
    public boolean isStale() {
        if (!isOpen() || isEof()) {
            return true;
        }
        try {
            this.inbuffer.isDataAvailable(1);
            return isEof();
        } catch (IOException e) {
            return true;
        }
    }

    @Override // org.apache.http.HttpConnection
    public HttpConnectionMetrics getMetrics() {
        return this.metrics;
    }
}
