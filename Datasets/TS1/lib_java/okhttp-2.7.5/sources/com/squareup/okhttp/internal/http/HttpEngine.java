package com.squareup.okhttp.internal.http;

import com.squareup.okhttp.Address;
import com.squareup.okhttp.CertificatePinner;
import com.squareup.okhttp.Connection;
import com.squareup.okhttp.Headers;
import com.squareup.okhttp.HttpUrl;
import com.squareup.okhttp.Interceptor;
import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Protocol;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import com.squareup.okhttp.ResponseBody;
import com.squareup.okhttp.Route;
import com.squareup.okhttp.internal.Internal;
import com.squareup.okhttp.internal.InternalCache;
import com.squareup.okhttp.internal.Util;
import com.squareup.okhttp.internal.Version;
import com.squareup.okhttp.internal.http.CacheStrategy;
import java.io.Closeable;
import java.io.IOException;
import java.net.CookieHandler;
import java.net.ProtocolException;
import java.net.Proxy;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSocketFactory;
import okio.Buffer;
import okio.BufferedSink;
import okio.BufferedSource;
import okio.GzipSource;
import okio.Okio;
import okio.Sink;
import okio.Source;
import okio.Timeout;

/* loaded from: okhttp-2.7.5.jar:com/squareup/okhttp/internal/http/HttpEngine.class */
public final class HttpEngine {
    public static final int MAX_FOLLOW_UPS = 20;
    private static final ResponseBody EMPTY_BODY = new ResponseBody() { // from class: com.squareup.okhttp.internal.http.HttpEngine.1
        @Override // com.squareup.okhttp.ResponseBody
        public MediaType contentType() {
            return null;
        }

        @Override // com.squareup.okhttp.ResponseBody
        public long contentLength() {
            return 0L;
        }

        @Override // com.squareup.okhttp.ResponseBody
        public BufferedSource source() {
            return new Buffer();
        }
    };
    final OkHttpClient client;
    public final StreamAllocation streamAllocation;
    private final Response priorResponse;
    private HttpStream httpStream;
    long sentRequestMillis = -1;
    private boolean transparentGzip;
    public final boolean bufferRequestBody;
    private final Request userRequest;
    private Request networkRequest;
    private Response cacheResponse;
    private Response userResponse;
    private Sink requestBodyOut;
    private BufferedSink bufferedRequestBody;
    private final boolean callerWritesRequestBody;
    private final boolean forWebSocket;
    private CacheRequest storeRequest;
    private CacheStrategy cacheStrategy;

    public HttpEngine(OkHttpClient client, Request request, boolean bufferRequestBody, boolean callerWritesRequestBody, boolean forWebSocket, StreamAllocation streamAllocation, RetryableSink requestBodyOut, Response priorResponse) {
        this.client = client;
        this.userRequest = request;
        this.bufferRequestBody = bufferRequestBody;
        this.callerWritesRequestBody = callerWritesRequestBody;
        this.forWebSocket = forWebSocket;
        this.streamAllocation = streamAllocation != null ? streamAllocation : new StreamAllocation(client.getConnectionPool(), createAddress(client, request));
        this.requestBodyOut = requestBodyOut;
        this.priorResponse = priorResponse;
    }

    public void sendRequest() throws RequestException, RouteException, IOException {
        if (this.cacheStrategy != null) {
            return;
        }
        if (this.httpStream != null) {
            throw new IllegalStateException();
        }
        Request request = networkRequest(this.userRequest);
        InternalCache responseCache = Internal.instance.internalCache(this.client);
        Response cacheCandidate = responseCache != null ? responseCache.get(request) : null;
        long now = System.currentTimeMillis();
        this.cacheStrategy = new CacheStrategy.Factory(now, request, cacheCandidate).get();
        this.networkRequest = this.cacheStrategy.networkRequest;
        this.cacheResponse = this.cacheStrategy.cacheResponse;
        if (responseCache != null) {
            responseCache.trackResponse(this.cacheStrategy);
        }
        if (cacheCandidate != null && this.cacheResponse == null) {
            Util.closeQuietly(cacheCandidate.body());
        }
        if (this.networkRequest != null) {
            this.httpStream = connect();
            this.httpStream.setHttpEngine(this);
            if (this.callerWritesRequestBody && permitsRequestBody(this.networkRequest) && this.requestBodyOut == null) {
                long contentLength = OkHeaders.contentLength(request);
                if (!this.bufferRequestBody) {
                    this.httpStream.writeRequestHeaders(this.networkRequest);
                    this.requestBodyOut = this.httpStream.createRequestBody(this.networkRequest, contentLength);
                    return;
                } else {
                    if (contentLength > 2147483647L) {
                        throw new IllegalStateException("Use setFixedLengthStreamingMode() or setChunkedStreamingMode() for requests larger than 2 GiB.");
                    }
                    if (contentLength != -1) {
                        this.httpStream.writeRequestHeaders(this.networkRequest);
                        this.requestBodyOut = new RetryableSink((int) contentLength);
                        return;
                    } else {
                        this.requestBodyOut = new RetryableSink();
                        return;
                    }
                }
            }
            return;
        }
        if (this.cacheResponse != null) {
            this.userResponse = this.cacheResponse.newBuilder().request(this.userRequest).priorResponse(stripBody(this.priorResponse)).cacheResponse(stripBody(this.cacheResponse)).build();
        } else {
            this.userResponse = new Response.Builder().request(this.userRequest).priorResponse(stripBody(this.priorResponse)).protocol(Protocol.HTTP_1_1).code(504).message("Unsatisfiable Request (only-if-cached)").body(EMPTY_BODY).build();
        }
        this.userResponse = unzip(this.userResponse);
    }

    private HttpStream connect() throws RouteException, RequestException, IOException {
        boolean doExtensiveHealthChecks = !this.networkRequest.method().equals("GET");
        return this.streamAllocation.newStream(this.client.getConnectTimeout(), this.client.getReadTimeout(), this.client.getWriteTimeout(), this.client.getRetryOnConnectionFailure(), doExtensiveHealthChecks);
    }

    private static Response stripBody(Response response) {
        return (response == null || response.body() == null) ? response : response.newBuilder().body(null).build();
    }

    public void writingRequestHeaders() {
        if (this.sentRequestMillis != -1) {
            throw new IllegalStateException();
        }
        this.sentRequestMillis = System.currentTimeMillis();
    }

    boolean permitsRequestBody(Request request) {
        return HttpMethod.permitsRequestBody(request.method());
    }

    public Sink getRequestBody() {
        if (this.cacheStrategy == null) {
            throw new IllegalStateException();
        }
        return this.requestBodyOut;
    }

    public BufferedSink getBufferedRequestBody() {
        BufferedSink result = this.bufferedRequestBody;
        if (result != null) {
            return result;
        }
        Sink requestBody = getRequestBody();
        if (requestBody == null) {
            return null;
        }
        BufferedSink buffer = Okio.buffer(requestBody);
        this.bufferedRequestBody = buffer;
        return buffer;
    }

    public boolean hasResponse() {
        return this.userResponse != null;
    }

    public Request getRequest() {
        return this.userRequest;
    }

    public Response getResponse() {
        if (this.userResponse == null) {
            throw new IllegalStateException();
        }
        return this.userResponse;
    }

    public Connection getConnection() {
        return this.streamAllocation.connection();
    }

    public HttpEngine recover(RouteException e) {
        if (!this.streamAllocation.recover(e) || !this.client.getRetryOnConnectionFailure()) {
            return null;
        }
        StreamAllocation streamAllocation = close();
        return new HttpEngine(this.client, this.userRequest, this.bufferRequestBody, this.callerWritesRequestBody, this.forWebSocket, streamAllocation, (RetryableSink) this.requestBodyOut, this.priorResponse);
    }

    public HttpEngine recover(IOException e, Sink requestBodyOut) {
        if (!this.streamAllocation.recover(e, requestBodyOut) || !this.client.getRetryOnConnectionFailure()) {
            return null;
        }
        StreamAllocation streamAllocation = close();
        return new HttpEngine(this.client, this.userRequest, this.bufferRequestBody, this.callerWritesRequestBody, this.forWebSocket, streamAllocation, (RetryableSink) requestBodyOut, this.priorResponse);
    }

    public HttpEngine recover(IOException e) {
        return recover(e, this.requestBodyOut);
    }

    private void maybeCache() throws IOException {
        InternalCache responseCache = Internal.instance.internalCache(this.client);
        if (responseCache == null) {
            return;
        }
        if (!CacheStrategy.isCacheable(this.userResponse, this.networkRequest)) {
            if (HttpMethod.invalidatesCache(this.networkRequest.method())) {
                try {
                    responseCache.remove(this.networkRequest);
                    return;
                } catch (IOException e) {
                    return;
                }
            }
            return;
        }
        this.storeRequest = responseCache.put(stripBody(this.userResponse));
    }

    public void releaseStreamAllocation() throws IOException {
        this.streamAllocation.release();
    }

    public void cancel() {
        this.streamAllocation.cancel();
    }

    public StreamAllocation close() {
        if (this.bufferedRequestBody != null) {
            Util.closeQuietly((Closeable) this.bufferedRequestBody);
        } else if (this.requestBodyOut != null) {
            Util.closeQuietly((Closeable) this.requestBodyOut);
        }
        if (this.userResponse != null) {
            Util.closeQuietly(this.userResponse.body());
        } else {
            this.streamAllocation.connectionFailed();
        }
        return this.streamAllocation;
    }

    private Response unzip(Response response) throws IOException {
        if (!this.transparentGzip || !"gzip".equalsIgnoreCase(this.userResponse.header("Content-Encoding"))) {
            return response;
        }
        if (response.body() == null) {
            return response;
        }
        GzipSource responseBody = new GzipSource(response.body().source());
        Headers strippedHeaders = response.headers().newBuilder().removeAll("Content-Encoding").removeAll("Content-Length").build();
        return response.newBuilder().headers(strippedHeaders).body(new RealResponseBody(strippedHeaders, Okio.buffer(responseBody))).build();
    }

    public static boolean hasBody(Response response) {
        if (response.request().method().equals("HEAD")) {
            return false;
        }
        int responseCode = response.code();
        if (((responseCode < 100 || responseCode >= 200) && responseCode != 204 && responseCode != 304) || OkHeaders.contentLength(response) != -1 || "chunked".equalsIgnoreCase(response.header("Transfer-Encoding"))) {
            return true;
        }
        return false;
    }

    private Request networkRequest(Request request) throws IOException {
        Request.Builder result = request.newBuilder();
        if (request.header("Host") == null) {
            result.header("Host", Util.hostHeader(request.httpUrl()));
        }
        if (request.header("Connection") == null) {
            result.header("Connection", "Keep-Alive");
        }
        if (request.header("Accept-Encoding") == null) {
            this.transparentGzip = true;
            result.header("Accept-Encoding", "gzip");
        }
        CookieHandler cookieHandler = this.client.getCookieHandler();
        if (cookieHandler != null) {
            Map<String, List<String>> headers = OkHeaders.toMultimap(result.build().headers(), null);
            Map<String, List<String>> cookies = cookieHandler.get(request.uri(), headers);
            OkHeaders.addCookies(result, cookies);
        }
        if (request.header("User-Agent") == null) {
            result.header("User-Agent", Version.userAgent());
        }
        return result.build();
    }

    public void readResponse() throws IOException {
        Response networkResponse;
        if (this.userResponse != null) {
            return;
        }
        if (this.networkRequest == null && this.cacheResponse == null) {
            throw new IllegalStateException("call sendRequest() first!");
        }
        if (this.networkRequest == null) {
            return;
        }
        if (this.forWebSocket) {
            this.httpStream.writeRequestHeaders(this.networkRequest);
            networkResponse = readNetworkResponse();
        } else if (!this.callerWritesRequestBody) {
            networkResponse = new NetworkInterceptorChain(0, this.networkRequest).proceed(this.networkRequest);
        } else {
            if (this.bufferedRequestBody != null && this.bufferedRequestBody.buffer().size() > 0) {
                this.bufferedRequestBody.emit();
            }
            if (this.sentRequestMillis == -1) {
                if (OkHeaders.contentLength(this.networkRequest) == -1 && (this.requestBodyOut instanceof RetryableSink)) {
                    long contentLength = ((RetryableSink) this.requestBodyOut).contentLength();
                    this.networkRequest = this.networkRequest.newBuilder().header("Content-Length", Long.toString(contentLength)).build();
                }
                this.httpStream.writeRequestHeaders(this.networkRequest);
            }
            if (this.requestBodyOut != null) {
                if (this.bufferedRequestBody != null) {
                    this.bufferedRequestBody.close();
                } else {
                    this.requestBodyOut.close();
                }
                if (this.requestBodyOut instanceof RetryableSink) {
                    this.httpStream.writeRequestBody((RetryableSink) this.requestBodyOut);
                }
            }
            networkResponse = readNetworkResponse();
        }
        receiveHeaders(networkResponse.headers());
        if (this.cacheResponse != null) {
            if (validate(this.cacheResponse, networkResponse)) {
                this.userResponse = this.cacheResponse.newBuilder().request(this.userRequest).priorResponse(stripBody(this.priorResponse)).headers(combine(this.cacheResponse.headers(), networkResponse.headers())).cacheResponse(stripBody(this.cacheResponse)).networkResponse(stripBody(networkResponse)).build();
                networkResponse.body().close();
                releaseStreamAllocation();
                InternalCache responseCache = Internal.instance.internalCache(this.client);
                responseCache.trackConditionalCacheHit();
                responseCache.update(this.cacheResponse, stripBody(this.userResponse));
                this.userResponse = unzip(this.userResponse);
                return;
            }
            Util.closeQuietly(this.cacheResponse.body());
        }
        this.userResponse = networkResponse.newBuilder().request(this.userRequest).priorResponse(stripBody(this.priorResponse)).cacheResponse(stripBody(this.cacheResponse)).networkResponse(stripBody(networkResponse)).build();
        if (hasBody(this.userResponse)) {
            maybeCache();
            this.userResponse = unzip(cacheWritingResponse(this.storeRequest, this.userResponse));
        }
    }

    /* loaded from: okhttp-2.7.5.jar:com/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain.class */
    class NetworkInterceptorChain implements Interceptor.Chain {
        private final int index;
        private final Request request;
        private int calls;

        NetworkInterceptorChain(int index, Request request) {
            this.index = index;
            this.request = request;
        }

        @Override // com.squareup.okhttp.Interceptor.Chain
        public Connection connection() {
            return HttpEngine.this.streamAllocation.connection();
        }

        @Override // com.squareup.okhttp.Interceptor.Chain
        public Request request() {
            return this.request;
        }

        @Override // com.squareup.okhttp.Interceptor.Chain
        public Response proceed(Request request) throws IOException {
            this.calls++;
            if (this.index > 0) {
                Interceptor caller = HttpEngine.this.client.networkInterceptors().get(this.index - 1);
                Address address = connection().getRoute().getAddress();
                if (!request.httpUrl().host().equals(address.getUriHost()) || request.httpUrl().port() != address.getUriPort()) {
                    throw new IllegalStateException("network interceptor " + caller + " must retain the same host and port");
                }
                if (this.calls > 1) {
                    throw new IllegalStateException("network interceptor " + caller + " must call proceed() exactly once");
                }
            }
            if (this.index >= HttpEngine.this.client.networkInterceptors().size()) {
                HttpEngine.this.httpStream.writeRequestHeaders(request);
                HttpEngine.this.networkRequest = request;
                if (HttpEngine.this.permitsRequestBody(request) && request.body() != null) {
                    Sink requestBodyOut = HttpEngine.this.httpStream.createRequestBody(request, request.body().contentLength());
                    BufferedSink bufferedRequestBody = Okio.buffer(requestBodyOut);
                    request.body().writeTo(bufferedRequestBody);
                    bufferedRequestBody.close();
                }
                Response response = HttpEngine.this.readNetworkResponse();
                int code = response.code();
                if ((code == 204 || code == 205) && response.body().contentLength() > 0) {
                    throw new ProtocolException("HTTP " + code + " had non-zero Content-Length: " + response.body().contentLength());
                }
                return response;
            }
            NetworkInterceptorChain chain = HttpEngine.this.new NetworkInterceptorChain(this.index + 1, request);
            Interceptor interceptor = HttpEngine.this.client.networkInterceptors().get(this.index);
            Response interceptedResponse = interceptor.intercept(chain);
            if (chain.calls != 1) {
                throw new IllegalStateException("network interceptor " + interceptor + " must call proceed() exactly once");
            }
            if (interceptedResponse == null) {
                throw new NullPointerException("network interceptor " + interceptor + " returned null");
            }
            return interceptedResponse;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Response readNetworkResponse() throws IOException {
        this.httpStream.finishRequest();
        Response networkResponse = this.httpStream.readResponseHeaders().request(this.networkRequest).handshake(this.streamAllocation.connection().getHandshake()).header(OkHeaders.SENT_MILLIS, Long.toString(this.sentRequestMillis)).header(OkHeaders.RECEIVED_MILLIS, Long.toString(System.currentTimeMillis())).build();
        if (!this.forWebSocket) {
            networkResponse = networkResponse.newBuilder().body(this.httpStream.openResponseBody(networkResponse)).build();
        }
        if ("close".equalsIgnoreCase(networkResponse.request().header("Connection")) || "close".equalsIgnoreCase(networkResponse.header("Connection"))) {
            this.streamAllocation.noNewStreams();
        }
        return networkResponse;
    }

    private Response cacheWritingResponse(final CacheRequest cacheRequest, Response response) throws IOException {
        Sink cacheBodyUnbuffered;
        if (cacheRequest != null && (cacheBodyUnbuffered = cacheRequest.body()) != null) {
            final BufferedSource source = response.body().source();
            final BufferedSink cacheBody = Okio.buffer(cacheBodyUnbuffered);
            Source cacheWritingSource = new Source() { // from class: com.squareup.okhttp.internal.http.HttpEngine.2
                boolean cacheRequestClosed;

                public long read(Buffer sink, long byteCount) throws IOException {
                    try {
                        long bytesRead = source.read(sink, byteCount);
                        if (bytesRead == -1) {
                            if (!this.cacheRequestClosed) {
                                this.cacheRequestClosed = true;
                                cacheBody.close();
                                return -1L;
                            }
                            return -1L;
                        }
                        sink.copyTo(cacheBody.buffer(), sink.size() - bytesRead, bytesRead);
                        cacheBody.emitCompleteSegments();
                        return bytesRead;
                    } catch (IOException e) {
                        if (!this.cacheRequestClosed) {
                            this.cacheRequestClosed = true;
                            cacheRequest.abort();
                        }
                        throw e;
                    }
                }

                public Timeout timeout() {
                    return source.timeout();
                }

                public void close() throws IOException {
                    if (!this.cacheRequestClosed && !Util.discard(this, 100, TimeUnit.MILLISECONDS)) {
                        this.cacheRequestClosed = true;
                        cacheRequest.abort();
                    }
                    source.close();
                }
            };
            return response.newBuilder().body(new RealResponseBody(response.headers(), Okio.buffer(cacheWritingSource))).build();
        }
        return response;
    }

    private static boolean validate(Response cached, Response network) {
        Date networkLastModified;
        if (network.code() == 304) {
            return true;
        }
        Date lastModified = cached.headers().getDate("Last-Modified");
        if (lastModified != null && (networkLastModified = network.headers().getDate("Last-Modified")) != null && networkLastModified.getTime() < lastModified.getTime()) {
            return true;
        }
        return false;
    }

    private static Headers combine(Headers cachedHeaders, Headers networkHeaders) throws IOException {
        Headers.Builder result = new Headers.Builder();
        int size = cachedHeaders.size();
        for (int i = 0; i < size; i++) {
            String fieldName = cachedHeaders.name(i);
            String value = cachedHeaders.value(i);
            if ((!"Warning".equalsIgnoreCase(fieldName) || !value.startsWith("1")) && (!OkHeaders.isEndToEnd(fieldName) || networkHeaders.get(fieldName) == null)) {
                result.add(fieldName, value);
            }
        }
        int size2 = networkHeaders.size();
        for (int i2 = 0; i2 < size2; i2++) {
            String fieldName2 = networkHeaders.name(i2);
            if (!"Content-Length".equalsIgnoreCase(fieldName2) && OkHeaders.isEndToEnd(fieldName2)) {
                result.add(fieldName2, networkHeaders.value(i2));
            }
        }
        return result.build();
    }

    public void receiveHeaders(Headers headers) throws IOException {
        CookieHandler cookieHandler = this.client.getCookieHandler();
        if (cookieHandler != null) {
            cookieHandler.put(this.userRequest.uri(), OkHeaders.toMultimap(headers, null));
        }
    }

    public Request followUpRequest() throws IOException {
        Proxy proxy;
        String location;
        HttpUrl url;
        if (this.userResponse == null) {
            throw new IllegalStateException();
        }
        Connection connection = this.streamAllocation.connection();
        Route route = connection != null ? connection.getRoute() : null;
        if (route != null) {
            proxy = route.getProxy();
        } else {
            proxy = this.client.getProxy();
        }
        Proxy selectedProxy = proxy;
        int responseCode = this.userResponse.code();
        String method = this.userRequest.method();
        switch (responseCode) {
            case StatusLine.HTTP_TEMP_REDIRECT /* 307 */:
            case StatusLine.HTTP_PERM_REDIRECT /* 308 */:
                if (!method.equals("GET") && !method.equals("HEAD")) {
                    return null;
                }
                break;
            case 300:
            case 301:
            case 302:
            case 303:
                if (!this.client.getFollowRedirects() || (location = this.userResponse.header("Location")) == null || (url = this.userRequest.httpUrl().resolve(location)) == null) {
                    return null;
                }
                boolean sameScheme = url.scheme().equals(this.userRequest.httpUrl().scheme());
                if (!sameScheme && !this.client.getFollowSslRedirects()) {
                    return null;
                }
                Request.Builder requestBuilder = this.userRequest.newBuilder();
                if (HttpMethod.permitsRequestBody(method)) {
                    if (HttpMethod.redirectsToGet(method)) {
                        requestBuilder.method("GET", null);
                    } else {
                        requestBuilder.method(method, null);
                    }
                    requestBuilder.removeHeader("Transfer-Encoding");
                    requestBuilder.removeHeader("Content-Length");
                    requestBuilder.removeHeader("Content-Type");
                }
                if (!sameConnection(url)) {
                    requestBuilder.removeHeader("Authorization");
                }
                return requestBuilder.url(url).build();
            case 407:
                if (selectedProxy.type() != Proxy.Type.HTTP) {
                    throw new ProtocolException("Received HTTP_PROXY_AUTH (407) code while not using proxy");
                }
            case 401:
                return OkHeaders.processAuthHeader(this.client.getAuthenticator(), this.userResponse, selectedProxy);
            default:
                return null;
        }
    }

    public boolean sameConnection(HttpUrl followUp) {
        HttpUrl url = this.userRequest.httpUrl();
        return url.host().equals(followUp.host()) && url.port() == followUp.port() && url.scheme().equals(followUp.scheme());
    }

    private static Address createAddress(OkHttpClient client, Request request) {
        SSLSocketFactory sslSocketFactory = null;
        HostnameVerifier hostnameVerifier = null;
        CertificatePinner certificatePinner = null;
        if (request.isHttps()) {
            sslSocketFactory = client.getSslSocketFactory();
            hostnameVerifier = client.getHostnameVerifier();
            certificatePinner = client.getCertificatePinner();
        }
        return new Address(request.httpUrl().host(), request.httpUrl().port(), client.getDns(), client.getSocketFactory(), sslSocketFactory, hostnameVerifier, certificatePinner, client.getAuthenticator(), client.getProxy(), client.getProtocols(), client.getConnectionSpecs(), client.getProxySelector());
    }
}
