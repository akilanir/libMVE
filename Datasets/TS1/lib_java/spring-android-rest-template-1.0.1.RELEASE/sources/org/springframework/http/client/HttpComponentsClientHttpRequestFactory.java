package org.springframework.http.client;

import java.io.IOException;
import java.net.URI;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpHead;
import org.apache.http.client.methods.HttpOptions;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.methods.HttpTrace;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.conn.params.ConnManagerParams;
import org.apache.http.conn.params.ConnPerRouteBean;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParams;
import org.apache.http.params.HttpProtocolParams;
import org.apache.http.protocol.HttpContext;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.http.HttpMethod;
import org.springframework.util.Assert;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/HttpComponentsClientHttpRequestFactory.class */
public class HttpComponentsClientHttpRequestFactory implements ClientHttpRequestFactory, DisposableBean {
    private static final int DEFAULT_MAX_TOTAL_CONNECTIONS = 100;
    private static final int DEFAULT_MAX_CONNECTIONS_PER_ROUTE = 5;
    private static final int DEFAULT_READ_TIMEOUT_MILLISECONDS = 60000;
    private HttpClient httpClient;

    public HttpComponentsClientHttpRequestFactory() {
        SchemeRegistry schemeRegistry = new SchemeRegistry();
        schemeRegistry.register(new Scheme("http", PlainSocketFactory.getSocketFactory(), 80));
        schemeRegistry.register(new Scheme("https", SSLSocketFactory.getSocketFactory(), 443));
        HttpParams params = new BasicHttpParams();
        ThreadSafeClientConnManager connectionManager = new ThreadSafeClientConnManager(params, schemeRegistry);
        ConnManagerParams.setMaxTotalConnections(params, DEFAULT_MAX_TOTAL_CONNECTIONS);
        ConnManagerParams.setMaxConnectionsPerRoute(params, new ConnPerRouteBean(DEFAULT_MAX_CONNECTIONS_PER_ROUTE));
        this.httpClient = new DefaultHttpClient(connectionManager, null);
        setReadTimeout(DEFAULT_READ_TIMEOUT_MILLISECONDS);
    }

    public HttpComponentsClientHttpRequestFactory(HttpClient httpClient) {
        Assert.notNull(httpClient, "HttpClient must not be null");
        this.httpClient = httpClient;
    }

    public void setHttpClient(HttpClient httpClient) {
        this.httpClient = httpClient;
    }

    public HttpClient getHttpClient() {
        return this.httpClient;
    }

    public void setConnectTimeout(int timeout) {
        Assert.isTrue(timeout >= 0, "Timeout must be a non-negative value");
        getHttpClient().getParams().setIntParameter("http.connection.timeout", timeout);
    }

    public void setReadTimeout(int timeout) {
        Assert.isTrue(timeout >= 0, "Timeout must be a non-negative value");
        getHttpClient().getParams().setIntParameter("http.socket.timeout", timeout);
    }

    @Override // org.springframework.http.client.ClientHttpRequestFactory
    public ClientHttpRequest createRequest(URI uri, HttpMethod httpMethod) throws IOException {
        HttpUriRequest httpRequest = createHttpRequest(httpMethod, uri);
        postProcessHttpRequest(httpRequest);
        return new HttpComponentsClientHttpRequest(getHttpClient(), httpRequest, createHttpContext(httpMethod, uri));
    }

    /* renamed from: org.springframework.http.client.HttpComponentsClientHttpRequestFactory$1, reason: invalid class name */
    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/HttpComponentsClientHttpRequestFactory$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$springframework$http$HttpMethod = new int[HttpMethod.values().length];

        static {
            try {
                $SwitchMap$org$springframework$http$HttpMethod[HttpMethod.GET.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$springframework$http$HttpMethod[HttpMethod.DELETE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$org$springframework$http$HttpMethod[HttpMethod.HEAD.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$org$springframework$http$HttpMethod[HttpMethod.OPTIONS.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$org$springframework$http$HttpMethod[HttpMethod.POST.ordinal()] = HttpComponentsClientHttpRequestFactory.DEFAULT_MAX_CONNECTIONS_PER_ROUTE;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$org$springframework$http$HttpMethod[HttpMethod.PUT.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$org$springframework$http$HttpMethod[HttpMethod.TRACE.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
        }
    }

    protected HttpUriRequest createHttpRequest(HttpMethod httpMethod, URI uri) {
        switch (AnonymousClass1.$SwitchMap$org$springframework$http$HttpMethod[httpMethod.ordinal()]) {
            case 1:
                return new HttpGet(uri);
            case 2:
                return new HttpDelete(uri);
            case 3:
                return new HttpHead(uri);
            case 4:
                return new HttpOptions(uri);
            case DEFAULT_MAX_CONNECTIONS_PER_ROUTE /* 5 */:
                return new HttpPost(uri);
            case 6:
                return new HttpPut(uri);
            case 7:
                return new HttpTrace(uri);
            default:
                throw new IllegalArgumentException("Invalid HTTP method: " + httpMethod);
        }
    }

    protected void postProcessHttpRequest(HttpUriRequest httpRequest) {
        HttpParams params = httpRequest.getParams();
        HttpProtocolParams.setUseExpectContinue(params, false);
    }

    protected HttpContext createHttpContext(HttpMethod httpMethod, URI uri) {
        return null;
    }

    public void destroy() {
        getHttpClient().getConnectionManager().shutdown();
    }
}
