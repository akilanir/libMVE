package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.client.ClientProtocolException;
import cz.msebera.android.httpclient.client.HttpClient;
import cz.msebera.android.httpclient.client.ResponseHandler;
import cz.msebera.android.httpclient.client.methods.CloseableHttpResponse;
import cz.msebera.android.httpclient.client.methods.HttpUriRequest;
import cz.msebera.android.httpclient.client.utils.URIUtils;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.protocol.HttpContext;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.EntityUtils;
import java.io.Closeable;
import java.io.IOException;
import java.lang.reflect.UndeclaredThrowableException;
import java.net.URI;

@ThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/CloseableHttpClient.class */
public abstract class CloseableHttpClient implements HttpClient, Closeable {
    public HttpClientAndroidLog log = new HttpClientAndroidLog(getClass());

    protected abstract CloseableHttpResponse doExecute(HttpHost httpHost, HttpRequest httpRequest, HttpContext httpContext) throws IOException, ClientProtocolException;

    @Override // cz.msebera.android.httpclient.client.HttpClient
    public CloseableHttpResponse execute(HttpHost target, HttpRequest request, HttpContext context) throws IOException, ClientProtocolException {
        return doExecute(target, request, context);
    }

    @Override // cz.msebera.android.httpclient.client.HttpClient
    public CloseableHttpResponse execute(HttpUriRequest request, HttpContext context) throws IOException, ClientProtocolException {
        Args.notNull(request, "HTTP request");
        return doExecute(determineTarget(request), request, context);
    }

    private static HttpHost determineTarget(HttpUriRequest request) throws ClientProtocolException {
        HttpHost target = null;
        URI requestURI = request.getURI();
        if (requestURI.isAbsolute()) {
            target = URIUtils.extractHost(requestURI);
            if (target == null) {
                throw new ClientProtocolException("URI does not specify a valid host name: " + requestURI);
            }
        }
        return target;
    }

    @Override // cz.msebera.android.httpclient.client.HttpClient
    public CloseableHttpResponse execute(HttpUriRequest request) throws IOException, ClientProtocolException {
        return execute(request, (HttpContext) null);
    }

    @Override // cz.msebera.android.httpclient.client.HttpClient
    public CloseableHttpResponse execute(HttpHost target, HttpRequest request) throws IOException, ClientProtocolException {
        return doExecute(target, request, (HttpContext) null);
    }

    @Override // cz.msebera.android.httpclient.client.HttpClient
    public <T> T execute(HttpUriRequest httpUriRequest, ResponseHandler<? extends T> responseHandler) throws IOException, ClientProtocolException {
        return (T) execute(httpUriRequest, responseHandler, (HttpContext) null);
    }

    @Override // cz.msebera.android.httpclient.client.HttpClient
    public <T> T execute(HttpUriRequest httpUriRequest, ResponseHandler<? extends T> responseHandler, HttpContext httpContext) throws IOException, ClientProtocolException {
        return (T) execute(determineTarget(httpUriRequest), httpUriRequest, responseHandler, httpContext);
    }

    @Override // cz.msebera.android.httpclient.client.HttpClient
    public <T> T execute(HttpHost httpHost, HttpRequest httpRequest, ResponseHandler<? extends T> responseHandler) throws IOException, ClientProtocolException {
        return (T) execute(httpHost, httpRequest, responseHandler, null);
    }

    @Override // cz.msebera.android.httpclient.client.HttpClient
    public <T> T execute(HttpHost target, HttpRequest request, ResponseHandler<? extends T> responseHandler, HttpContext context) throws IOException, ClientProtocolException {
        Args.notNull(responseHandler, "Response handler");
        HttpResponse response = execute(target, request, context);
        try {
            T result = responseHandler.handleResponse(response);
            HttpEntity entity = response.getEntity();
            EntityUtils.consume(entity);
            return result;
        } catch (Exception t) {
            HttpEntity entity2 = response.getEntity();
            try {
                EntityUtils.consume(entity2);
            } catch (Exception t2) {
                this.log.warn("Error consuming content after an exception.", t2);
            }
            if (t instanceof RuntimeException) {
                throw ((RuntimeException) t);
            }
            if (t instanceof IOException) {
                throw ((IOException) t);
            }
            throw new UndeclaredThrowableException(t);
        }
    }
}
