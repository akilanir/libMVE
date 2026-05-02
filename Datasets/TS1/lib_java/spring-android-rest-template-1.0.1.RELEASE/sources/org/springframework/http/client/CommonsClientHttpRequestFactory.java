package org.springframework.http.client;

import java.io.IOException;
import java.net.URI;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethodBase;
import org.apache.commons.httpclient.MultiThreadedHttpConnectionManager;
import org.apache.commons.httpclient.methods.DeleteMethod;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.HeadMethod;
import org.apache.commons.httpclient.methods.OptionsMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.PutMethod;
import org.apache.commons.httpclient.methods.TraceMethod;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.http.HttpMethod;
import org.springframework.util.Assert;

@Deprecated
/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/CommonsClientHttpRequestFactory.class */
public class CommonsClientHttpRequestFactory implements ClientHttpRequestFactory, DisposableBean {
    private static final int DEFAULT_READ_TIMEOUT_MILLISECONDS = 60000;
    private HttpClient httpClient;

    public CommonsClientHttpRequestFactory() {
        this.httpClient = new HttpClient(new MultiThreadedHttpConnectionManager());
        setReadTimeout(DEFAULT_READ_TIMEOUT_MILLISECONDS);
    }

    public CommonsClientHttpRequestFactory(HttpClient httpClient) {
        Assert.notNull(httpClient, "httpClient must not be null");
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
        this.httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(timeout);
    }

    public void setReadTimeout(int timeout) {
        Assert.isTrue(timeout >= 0, "Timeout must be a non-negative value");
        getHttpClient().getHttpConnectionManager().getParams().setSoTimeout(timeout);
    }

    @Override // org.springframework.http.client.ClientHttpRequestFactory
    public ClientHttpRequest createRequest(URI uri, HttpMethod httpMethod) throws IOException {
        HttpMethodBase commonsHttpMethod = createCommonsHttpMethod(httpMethod, uri.toString());
        postProcessCommonsHttpMethod(commonsHttpMethod);
        return new CommonsClientHttpRequest(getHttpClient(), commonsHttpMethod);
    }

    protected HttpMethodBase createCommonsHttpMethod(HttpMethod httpMethod, String uri) {
        switch (httpMethod) {
            case GET:
                return new GetMethod(uri);
            case DELETE:
                return new DeleteMethod(uri);
            case HEAD:
                return new HeadMethod(uri);
            case OPTIONS:
                return new OptionsMethod(uri);
            case POST:
                return new PostMethod(uri);
            case PUT:
                return new PutMethod(uri);
            case TRACE:
                return new TraceMethod(uri);
            default:
                throw new IllegalArgumentException("Invalid HTTP method: " + httpMethod);
        }
    }

    protected void postProcessCommonsHttpMethod(HttpMethodBase httpMethod) {
    }

    public void destroy() {
        MultiThreadedHttpConnectionManager httpConnectionManager = getHttpClient().getHttpConnectionManager();
        if (httpConnectionManager instanceof MultiThreadedHttpConnectionManager) {
            httpConnectionManager.shutdown();
        }
    }
}
