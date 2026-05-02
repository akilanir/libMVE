package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.conn.HttpClientConnectionManager;
import cz.msebera.android.httpclient.impl.conn.PoolingHttpClientConnectionManager;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/HttpClients.class */
public class HttpClients {
    private HttpClients() {
    }

    public static HttpClientBuilder custom() {
        return HttpClientBuilder.create();
    }

    public static CloseableHttpClient createDefault() {
        return HttpClientBuilder.create().build();
    }

    public static CloseableHttpClient createSystem() {
        return HttpClientBuilder.create().useSystemProperties().build();
    }

    public static CloseableHttpClient createMinimal() {
        return new MinimalHttpClient(new PoolingHttpClientConnectionManager());
    }

    public static CloseableHttpClient createMinimal(HttpClientConnectionManager connManager) {
        return new MinimalHttpClient(connManager);
    }
}
