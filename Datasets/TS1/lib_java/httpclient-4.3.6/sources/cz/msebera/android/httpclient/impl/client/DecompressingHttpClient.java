package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpEntityEnclosingRequest;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpHeaders;
import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpRequestInterceptor;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.HttpResponseInterceptor;
import cz.msebera.android.httpclient.client.ClientProtocolException;
import cz.msebera.android.httpclient.client.HttpClient;
import cz.msebera.android.httpclient.client.ResponseHandler;
import cz.msebera.android.httpclient.client.methods.HttpUriRequest;
import cz.msebera.android.httpclient.client.protocol.RequestAcceptEncoding;
import cz.msebera.android.httpclient.client.protocol.ResponseContentEncoding;
import cz.msebera.android.httpclient.client.utils.URIUtils;
import cz.msebera.android.httpclient.conn.ClientConnectionManager;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.protocol.BasicHttpContext;
import cz.msebera.android.httpclient.protocol.HttpContext;
import cz.msebera.android.httpclient.util.EntityUtils;
import java.io.IOException;
import java.net.URI;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/DecompressingHttpClient.class */
public class DecompressingHttpClient implements HttpClient {
    private final HttpClient backend;
    private final HttpRequestInterceptor acceptEncodingInterceptor;
    private final HttpResponseInterceptor contentEncodingInterceptor;

    public DecompressingHttpClient() {
        this(new DefaultHttpClient());
    }

    public DecompressingHttpClient(HttpClient backend) {
        this(backend, new RequestAcceptEncoding(), new ResponseContentEncoding());
    }

    DecompressingHttpClient(HttpClient backend, HttpRequestInterceptor requestInterceptor, HttpResponseInterceptor responseInterceptor) {
        this.backend = backend;
        this.acceptEncodingInterceptor = requestInterceptor;
        this.contentEncodingInterceptor = responseInterceptor;
    }

    @Override // cz.msebera.android.httpclient.client.HttpClient
    public HttpParams getParams() {
        return this.backend.getParams();
    }

    @Override // cz.msebera.android.httpclient.client.HttpClient
    public ClientConnectionManager getConnectionManager() {
        return this.backend.getConnectionManager();
    }

    @Override // cz.msebera.android.httpclient.client.HttpClient
    public HttpResponse execute(HttpUriRequest request) throws IOException, ClientProtocolException {
        return execute(getHttpHost(request), request, (HttpContext) null);
    }

    public HttpClient getHttpClient() {
        return this.backend;
    }

    HttpHost getHttpHost(HttpUriRequest request) {
        URI uri = request.getURI();
        return URIUtils.extractHost(uri);
    }

    @Override // cz.msebera.android.httpclient.client.HttpClient
    public HttpResponse execute(HttpUriRequest request, HttpContext context) throws IOException, ClientProtocolException {
        return execute(getHttpHost(request), request, context);
    }

    @Override // cz.msebera.android.httpclient.client.HttpClient
    public HttpResponse execute(HttpHost target, HttpRequest request) throws IOException, ClientProtocolException {
        return execute(target, request, (HttpContext) null);
    }

    @Override // cz.msebera.android.httpclient.client.HttpClient
    public HttpResponse execute(HttpHost target, HttpRequest request, HttpContext context) throws IOException, ClientProtocolException {
        HttpContext basicHttpContext;
        HttpRequest wrapped;
        if (context != null) {
            basicHttpContext = context;
        } else {
            try {
                basicHttpContext = new BasicHttpContext();
            } catch (HttpException e) {
                throw new ClientProtocolException(e);
            }
        }
        HttpContext localContext = basicHttpContext;
        if (request instanceof HttpEntityEnclosingRequest) {
            wrapped = new EntityEnclosingRequestWrapper((HttpEntityEnclosingRequest) request);
        } else {
            wrapped = new RequestWrapper(request);
        }
        this.acceptEncodingInterceptor.process(wrapped, localContext);
        HttpResponse response = this.backend.execute(target, wrapped, localContext);
        try {
            this.contentEncodingInterceptor.process(response, localContext);
            if (Boolean.TRUE.equals(localContext.getAttribute(ResponseContentEncoding.UNCOMPRESSED))) {
                response.removeHeaders("Content-Length");
                response.removeHeaders("Content-Encoding");
                response.removeHeaders(HttpHeaders.CONTENT_MD5);
            }
            return response;
        } catch (HttpException ex) {
            EntityUtils.consume(response.getEntity());
            throw ex;
        } catch (IOException ex2) {
            EntityUtils.consume(response.getEntity());
            throw ex2;
        } catch (RuntimeException ex3) {
            EntityUtils.consume(response.getEntity());
            throw ex3;
        }
    }

    @Override // cz.msebera.android.httpclient.client.HttpClient
    public <T> T execute(HttpUriRequest httpUriRequest, ResponseHandler<? extends T> responseHandler) throws IOException, ClientProtocolException {
        return (T) execute(getHttpHost(httpUriRequest), httpUriRequest, responseHandler);
    }

    @Override // cz.msebera.android.httpclient.client.HttpClient
    public <T> T execute(HttpUriRequest httpUriRequest, ResponseHandler<? extends T> responseHandler, HttpContext httpContext) throws IOException, ClientProtocolException {
        return (T) execute(getHttpHost(httpUriRequest), httpUriRequest, responseHandler, httpContext);
    }

    @Override // cz.msebera.android.httpclient.client.HttpClient
    public <T> T execute(HttpHost httpHost, HttpRequest httpRequest, ResponseHandler<? extends T> responseHandler) throws IOException, ClientProtocolException {
        return (T) execute(httpHost, httpRequest, responseHandler, null);
    }

    @Override // cz.msebera.android.httpclient.client.HttpClient
    public <T> T execute(HttpHost target, HttpRequest request, ResponseHandler<? extends T> responseHandler, HttpContext context) throws IOException, ClientProtocolException {
        HttpResponse response = execute(target, request, context);
        try {
            T handleResponse = responseHandler.handleResponse(response);
            HttpEntity entity = response.getEntity();
            if (entity != null) {
                EntityUtils.consume(entity);
            }
            return handleResponse;
        } catch (Throwable th) {
            HttpEntity entity2 = response.getEntity();
            if (entity2 != null) {
                EntityUtils.consume(entity2);
            }
            throw th;
        }
    }
}
