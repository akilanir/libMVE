package org.springframework.http.client;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.Proxy;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import org.springframework.http.HttpMethod;
import org.springframework.util.Assert;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/SimpleClientHttpRequestFactory.class */
public class SimpleClientHttpRequestFactory implements ClientHttpRequestFactory {
    private static final int DEFAULT_CHUNK_SIZE = 0;
    private Proxy proxy;
    private boolean bufferRequestBody = true;
    private int chunkSize = DEFAULT_CHUNK_SIZE;
    private int connectTimeout = -1;
    private int readTimeout = -1;

    public void setProxy(Proxy proxy) {
        this.proxy = proxy;
    }

    public void setBufferRequestBody(boolean bufferRequestBody) {
        this.bufferRequestBody = bufferRequestBody;
    }

    public void setChunkSize(int chunkSize) {
        this.chunkSize = chunkSize;
    }

    public void setConnectTimeout(int connectTimeout) {
        this.connectTimeout = connectTimeout;
    }

    public void setReadTimeout(int readTimeout) {
        this.readTimeout = readTimeout;
    }

    @Override // org.springframework.http.client.ClientHttpRequestFactory
    public ClientHttpRequest createRequest(URI uri, HttpMethod httpMethod) throws IOException {
        HttpURLConnection connection = openConnection(uri.toURL(), this.proxy);
        prepareConnection(connection, httpMethod.name());
        if (this.bufferRequestBody) {
            return new SimpleBufferingClientHttpRequest(connection);
        }
        return new SimpleStreamingClientHttpRequest(connection, this.chunkSize);
    }

    protected HttpURLConnection openConnection(URL url, Proxy proxy) throws IOException {
        URLConnection urlConnection = proxy != null ? url.openConnection(proxy) : url.openConnection();
        Assert.isInstanceOf(HttpURLConnection.class, urlConnection);
        return (HttpURLConnection) urlConnection;
    }

    protected void prepareConnection(HttpURLConnection connection, String httpMethod) throws IOException {
        if (this.connectTimeout >= 0) {
            connection.setConnectTimeout(this.connectTimeout);
        }
        if (this.readTimeout >= 0) {
            connection.setReadTimeout(this.readTimeout);
        }
        connection.setDoInput(true);
        if ("GET".equals(httpMethod)) {
            connection.setInstanceFollowRedirects(true);
        } else {
            connection.setInstanceFollowRedirects(false);
        }
        if ("PUT".equals(httpMethod) || "POST".equals(httpMethod)) {
            connection.setDoOutput(true);
        } else {
            connection.setDoOutput(false);
        }
        connection.setRequestMethod(httpMethod);
    }
}
