package okhttp3.internal.huc;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpRetryException;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.Proxy;
import java.net.SocketPermission;
import java.net.URL;
import java.net.UnknownHostException;
import java.security.Permission;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import okhttp3.Cache;
import okhttp3.Connection;
import okhttp3.Handshake;
import okhttp3.Headers;
import okhttp3.HttpUrl;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.Route;
import okhttp3.internal.Internal;
import okhttp3.internal.JavaNetHeaders;
import okhttp3.internal.Platform;
import okhttp3.internal.URLFilter;
import okhttp3.internal.Util;
import okhttp3.internal.Version;
import okhttp3.internal.http.HttpDate;
import okhttp3.internal.http.HttpEngine;
import okhttp3.internal.http.HttpMethod;
import okhttp3.internal.http.OkHeaders;
import okhttp3.internal.http.RequestException;
import okhttp3.internal.http.RetryableSink;
import okhttp3.internal.http.RouteException;
import okhttp3.internal.http.StatusLine;
import okhttp3.internal.http.StreamAllocation;
import okio.BufferedSink;
import okio.Sink;

/* loaded from: okhttp-urlconnection-3.2.0.jar:okhttp3/internal/huc/HttpURLConnectionImpl.class */
public class HttpURLConnectionImpl extends HttpURLConnection {
    private static final Set<String> METHODS = new LinkedHashSet(Arrays.asList("OPTIONS", "GET", "HEAD", "POST", "PUT", "DELETE", "TRACE", "PATCH"));
    private static final RequestBody EMPTY_REQUEST_BODY = RequestBody.create((MediaType) null, new byte[0]);
    OkHttpClient client;
    private Headers.Builder requestHeaders;
    private long fixedContentLength;
    private int followUpCount;
    protected IOException httpEngineFailure;
    protected HttpEngine httpEngine;
    private Headers responseHeaders;
    private Route route;
    Handshake handshake;
    private URLFilter urlFilter;

    public HttpURLConnectionImpl(URL url, OkHttpClient client) {
        super(url);
        this.requestHeaders = new Headers.Builder();
        this.fixedContentLength = -1L;
        this.client = client;
    }

    public HttpURLConnectionImpl(URL url, OkHttpClient client, URLFilter urlFilter) {
        this(url, client);
        this.urlFilter = urlFilter;
    }

    @Override // java.net.URLConnection
    public final void connect() throws IOException {
        boolean success;
        initHttpEngine();
        do {
            success = execute(false);
        } while (!success);
    }

    @Override // java.net.HttpURLConnection
    public final void disconnect() {
        if (this.httpEngine == null) {
            return;
        }
        this.httpEngine.cancel();
    }

    @Override // java.net.HttpURLConnection
    public final InputStream getErrorStream() {
        try {
            HttpEngine response = getResponse();
            if (HttpEngine.hasBody(response.getResponse()) && response.getResponse().code() >= 400) {
                return response.getResponse().body().byteStream();
            }
            return null;
        } catch (IOException e) {
            return null;
        }
    }

    private Headers getHeaders() throws IOException {
        if (this.responseHeaders == null) {
            Response response = getResponse().getResponse();
            Headers headers = response.headers();
            this.responseHeaders = headers.newBuilder().add(OkHeaders.SELECTED_PROTOCOL, response.protocol().toString()).add(OkHeaders.RESPONSE_SOURCE, responseSourceHeader(response)).build();
        }
        return this.responseHeaders;
    }

    private static String responseSourceHeader(Response response) {
        if (response.networkResponse() == null) {
            if (response.cacheResponse() == null) {
                return "NONE";
            }
            return "CACHE " + response.code();
        }
        if (response.cacheResponse() == null) {
            return "NETWORK " + response.code();
        }
        return "CONDITIONAL_CACHE " + response.networkResponse().code();
    }

    @Override // java.net.HttpURLConnection, java.net.URLConnection
    public final String getHeaderField(int position) {
        try {
            Headers headers = getHeaders();
            if (position < 0 || position >= headers.size()) {
                return null;
            }
            return headers.value(position);
        } catch (IOException e) {
            return null;
        }
    }

    @Override // java.net.URLConnection
    public final String getHeaderField(String fieldName) {
        String str;
        try {
            if (fieldName == null) {
                str = StatusLine.get(getResponse().getResponse()).toString();
            } else {
                str = getHeaders().get(fieldName);
            }
            return str;
        } catch (IOException e) {
            return null;
        }
    }

    @Override // java.net.HttpURLConnection, java.net.URLConnection
    public final String getHeaderFieldKey(int position) {
        try {
            Headers headers = getHeaders();
            if (position < 0 || position >= headers.size()) {
                return null;
            }
            return headers.name(position);
        } catch (IOException e) {
            return null;
        }
    }

    @Override // java.net.URLConnection
    public final Map<String, List<String>> getHeaderFields() {
        try {
            return JavaNetHeaders.toMultimap(getHeaders(), StatusLine.get(getResponse().getResponse()).toString());
        } catch (IOException e) {
            return Collections.emptyMap();
        }
    }

    @Override // java.net.URLConnection
    public final Map<String, List<String>> getRequestProperties() {
        if (this.connected) {
            throw new IllegalStateException("Cannot access request header fields after connection is set");
        }
        return JavaNetHeaders.toMultimap(this.requestHeaders.build(), null);
    }

    @Override // java.net.URLConnection
    public final InputStream getInputStream() throws IOException {
        if (!this.doInput) {
            throw new ProtocolException("This protocol does not support input");
        }
        HttpEngine response = getResponse();
        if (getResponseCode() >= 400) {
            throw new FileNotFoundException(this.url.toString());
        }
        return response.getResponse().body().byteStream();
    }

    @Override // java.net.URLConnection
    public final OutputStream getOutputStream() throws IOException {
        connect();
        BufferedSink sink = this.httpEngine.getBufferedRequestBody();
        if (sink == null) {
            throw new ProtocolException("method does not support a request body: " + this.method);
        }
        if (this.httpEngine.hasResponse()) {
            throw new ProtocolException("cannot write request body after response has been read");
        }
        return sink.outputStream();
    }

    @Override // java.net.HttpURLConnection, java.net.URLConnection
    public final Permission getPermission() throws IOException {
        int defaultPort;
        URL url = getURL();
        String hostname = url.getHost();
        if (url.getPort() != -1) {
            defaultPort = url.getPort();
        } else {
            defaultPort = HttpUrl.defaultPort(url.getProtocol());
        }
        int hostPort = defaultPort;
        if (usingProxy()) {
            InetSocketAddress proxyAddress = (InetSocketAddress) this.client.proxy().address();
            hostname = proxyAddress.getHostName();
            hostPort = proxyAddress.getPort();
        }
        return new SocketPermission(hostname + ":" + hostPort, "connect, resolve");
    }

    @Override // java.net.URLConnection
    public final String getRequestProperty(String field) {
        if (field == null) {
            return null;
        }
        return this.requestHeaders.get(field);
    }

    @Override // java.net.URLConnection
    public void setConnectTimeout(int timeoutMillis) {
        this.client = this.client.newBuilder().connectTimeout(timeoutMillis, TimeUnit.MILLISECONDS).build();
    }

    @Override // java.net.HttpURLConnection
    public void setInstanceFollowRedirects(boolean followRedirects) {
        this.client = this.client.newBuilder().followRedirects(followRedirects).build();
    }

    @Override // java.net.HttpURLConnection
    public boolean getInstanceFollowRedirects() {
        return this.client.followRedirects();
    }

    @Override // java.net.URLConnection
    public int getConnectTimeout() {
        return this.client.connectTimeoutMillis();
    }

    @Override // java.net.URLConnection
    public void setReadTimeout(int timeoutMillis) {
        this.client = this.client.newBuilder().readTimeout(timeoutMillis, TimeUnit.MILLISECONDS).build();
    }

    @Override // java.net.URLConnection
    public int getReadTimeout() {
        return this.client.readTimeoutMillis();
    }

    private void initHttpEngine() throws IOException {
        if (this.httpEngineFailure != null) {
            throw this.httpEngineFailure;
        }
        if (this.httpEngine != null) {
            return;
        }
        this.connected = true;
        try {
            if (this.doOutput) {
                if (this.method.equals("GET")) {
                    this.method = "POST";
                } else if (!HttpMethod.permitsRequestBody(this.method)) {
                    throw new ProtocolException(this.method + " does not support writing");
                }
            }
            this.httpEngine = newHttpEngine(this.method, null, null, null);
        } catch (IOException e) {
            this.httpEngineFailure = e;
            throw e;
        }
    }

    private HttpEngine newHttpEngine(String method, StreamAllocation streamAllocation, RetryableSink requestBody, Response priorResponse) throws MalformedURLException, UnknownHostException {
        RequestBody placeholderBody = HttpMethod.requiresRequestBody(method) ? EMPTY_REQUEST_BODY : null;
        URL url = getURL();
        HttpUrl httpUrl = Internal.instance.getHttpUrlChecked(url.toString());
        Request.Builder builder = new Request.Builder().url(httpUrl).method(method, placeholderBody);
        Headers headers = this.requestHeaders.build();
        int size = headers.size();
        for (int i = 0; i < size; i++) {
            builder.addHeader(headers.name(i), headers.value(i));
        }
        boolean bufferRequestBody = false;
        if (HttpMethod.permitsRequestBody(method)) {
            if (this.fixedContentLength != -1) {
                builder.header("Content-Length", Long.toString(this.fixedContentLength));
            } else if (this.chunkLength > 0) {
                builder.header("Transfer-Encoding", "chunked");
            } else {
                bufferRequestBody = true;
            }
            if (headers.get("Content-Type") == null) {
                builder.header("Content-Type", "application/x-www-form-urlencoded");
            }
        }
        if (headers.get("User-Agent") == null) {
            builder.header("User-Agent", defaultUserAgent());
        }
        Request request = builder.build();
        OkHttpClient engineClient = this.client;
        if (Internal.instance.internalCache(engineClient) != null && !getUseCaches()) {
            engineClient = this.client.newBuilder().cache((Cache) null).build();
        }
        return new HttpEngine(engineClient, request, bufferRequestBody, true, false, streamAllocation, requestBody, priorResponse);
    }

    private String defaultUserAgent() {
        String agent = System.getProperty("http.agent");
        return agent != null ? Util.toHumanReadableAscii(agent) : Version.userAgent();
    }

    private HttpEngine getResponse() throws IOException {
        initHttpEngine();
        if (this.httpEngine.hasResponse()) {
            return this.httpEngine;
        }
        while (true) {
            if (execute(true)) {
                Response response = this.httpEngine.getResponse();
                Request followUp = this.httpEngine.followUpRequest();
                if (followUp == null) {
                    this.httpEngine.releaseStreamAllocation();
                    return this.httpEngine;
                }
                int i = this.followUpCount + 1;
                this.followUpCount = i;
                if (i > 20) {
                    throw new ProtocolException("Too many follow-up requests: " + this.followUpCount);
                }
                this.url = followUp.url().url();
                this.requestHeaders = followUp.headers().newBuilder();
                Sink requestBody = this.httpEngine.getRequestBody();
                if (!followUp.method().equals(this.method)) {
                    requestBody = null;
                }
                if (requestBody != null && !(requestBody instanceof RetryableSink)) {
                    throw new HttpRetryException("Cannot retry streamed HTTP body", this.responseCode);
                }
                StreamAllocation streamAllocation = this.httpEngine.close();
                if (!this.httpEngine.sameConnection(followUp.url())) {
                    streamAllocation.release();
                    streamAllocation = null;
                }
                this.httpEngine = newHttpEngine(followUp.method(), streamAllocation, (RetryableSink) requestBody, response);
            }
        }
    }

    private boolean execute(boolean readResponse) throws IOException {
        if (this.urlFilter != null) {
            this.urlFilter.checkURLPermitted(this.httpEngine.getRequest().url().url());
        }
        try {
            try {
                try {
                    try {
                        this.httpEngine.sendRequest();
                        Connection connection = this.httpEngine.getConnection();
                        if (connection != null) {
                            this.route = connection.route();
                            this.handshake = connection.handshake();
                        } else {
                            this.route = null;
                            this.handshake = null;
                        }
                        if (readResponse) {
                            this.httpEngine.readResponse();
                        }
                        if (0 != 0) {
                            StreamAllocation streamAllocation = this.httpEngine.close();
                            streamAllocation.release();
                        }
                        return true;
                    } catch (IOException e) {
                        HttpEngine retryEngine = this.httpEngine.recover(e);
                        if (retryEngine == null) {
                            this.httpEngineFailure = e;
                            throw e;
                        }
                        this.httpEngine = retryEngine;
                        if (0 != 0) {
                            StreamAllocation streamAllocation2 = this.httpEngine.close();
                            streamAllocation2.release();
                        }
                        return false;
                    }
                } catch (RouteException e2) {
                    HttpEngine retryEngine2 = this.httpEngine.recover(e2.getLastConnectException());
                    if (retryEngine2 == null) {
                        IOException toThrow = e2.getLastConnectException();
                        this.httpEngineFailure = toThrow;
                        throw toThrow;
                    }
                    this.httpEngine = retryEngine2;
                    if (0 != 0) {
                        StreamAllocation streamAllocation3 = this.httpEngine.close();
                        streamAllocation3.release();
                    }
                    return false;
                }
            } catch (RequestException e3) {
                IOException toThrow2 = e3.getCause();
                this.httpEngineFailure = toThrow2;
                throw toThrow2;
            }
        } catch (Throwable th) {
            if (1 != 0) {
                StreamAllocation streamAllocation4 = this.httpEngine.close();
                streamAllocation4.release();
            }
            throw th;
        }
    }

    @Override // java.net.HttpURLConnection
    public final boolean usingProxy() {
        Proxy proxy;
        if (this.route != null) {
            proxy = this.route.proxy();
        } else {
            proxy = this.client.proxy();
        }
        Proxy proxy2 = proxy;
        return (proxy2 == null || proxy2.type() == Proxy.Type.DIRECT) ? false : true;
    }

    @Override // java.net.HttpURLConnection
    public String getResponseMessage() throws IOException {
        return getResponse().getResponse().message();
    }

    @Override // java.net.HttpURLConnection
    public final int getResponseCode() throws IOException {
        return getResponse().getResponse().code();
    }

    @Override // java.net.URLConnection
    public final void setRequestProperty(String field, String newValue) {
        if (this.connected) {
            throw new IllegalStateException("Cannot set request property after connection is made");
        }
        if (field == null) {
            throw new NullPointerException("field == null");
        }
        if (newValue == null) {
            Platform.get().logW("Ignoring header " + field + " because its value was null.");
        } else if ("X-Android-Transports".equals(field) || "X-Android-Protocols".equals(field)) {
            setProtocols(newValue, false);
        } else {
            this.requestHeaders.set(field, newValue);
        }
    }

    @Override // java.net.URLConnection
    public void setIfModifiedSince(long newValue) {
        super.setIfModifiedSince(newValue);
        if (this.ifModifiedSince != 0) {
            this.requestHeaders.set("If-Modified-Since", HttpDate.format(new Date(this.ifModifiedSince)));
        } else {
            this.requestHeaders.removeAll("If-Modified-Since");
        }
    }

    @Override // java.net.URLConnection
    public final void addRequestProperty(String field, String value) {
        if (this.connected) {
            throw new IllegalStateException("Cannot add request property after connection is made");
        }
        if (field == null) {
            throw new NullPointerException("field == null");
        }
        if (value == null) {
            Platform.get().logW("Ignoring header " + field + " because its value was null.");
        } else if ("X-Android-Transports".equals(field) || "X-Android-Protocols".equals(field)) {
            setProtocols(value, true);
        } else {
            this.requestHeaders.add(field, value);
        }
    }

    private void setProtocols(String protocolsString, boolean append) {
        List<Protocol> protocolsList = new ArrayList<>();
        if (append) {
            protocolsList.addAll(this.client.protocols());
        }
        for (String protocol : protocolsString.split(",", -1)) {
            try {
                protocolsList.add(Protocol.get(protocol));
            } catch (IOException e) {
                throw new IllegalStateException(e);
            }
        }
        this.client = this.client.newBuilder().protocols(protocolsList).build();
    }

    @Override // java.net.HttpURLConnection
    public void setRequestMethod(String method) throws ProtocolException {
        if (!METHODS.contains(method)) {
            throw new ProtocolException("Expected one of " + METHODS + " but was " + method);
        }
        this.method = method;
    }

    @Override // java.net.HttpURLConnection
    public void setFixedLengthStreamingMode(int contentLength) {
        setFixedLengthStreamingMode(contentLength);
    }

    @Override // java.net.HttpURLConnection
    public void setFixedLengthStreamingMode(long contentLength) {
        if (((HttpURLConnection) this).connected) {
            throw new IllegalStateException("Already connected");
        }
        if (this.chunkLength > 0) {
            throw new IllegalStateException("Already in chunked mode");
        }
        if (contentLength < 0) {
            throw new IllegalArgumentException("contentLength < 0");
        }
        this.fixedContentLength = contentLength;
        ((HttpURLConnection) this).fixedContentLength = (int) Math.min(contentLength, 2147483647L);
    }
}
