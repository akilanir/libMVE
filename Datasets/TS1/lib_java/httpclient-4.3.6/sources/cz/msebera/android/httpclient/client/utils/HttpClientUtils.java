package cz.msebera.android.httpclient.client.utils;

import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.client.HttpClient;
import cz.msebera.android.httpclient.client.methods.CloseableHttpResponse;
import cz.msebera.android.httpclient.util.EntityUtils;
import java.io.Closeable;
import java.io.IOException;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/utils/HttpClientUtils.class */
public class HttpClientUtils {
    private HttpClientUtils() {
    }

    public static void closeQuietly(HttpResponse response) {
        HttpEntity entity;
        if (response != null && (entity = response.getEntity()) != null) {
            try {
                EntityUtils.consume(entity);
            } catch (IOException e) {
            }
        }
    }

    public static void closeQuietly(CloseableHttpResponse response) {
        if (response != null) {
            try {
                try {
                    EntityUtils.consume(response.getEntity());
                    response.close();
                } catch (Throwable th) {
                    response.close();
                    throw th;
                }
            } catch (IOException e) {
            }
        }
    }

    public static void closeQuietly(HttpClient httpClient) {
        if (httpClient != null && (httpClient instanceof Closeable)) {
            try {
                ((Closeable) httpClient).close();
            } catch (IOException e) {
            }
        }
    }
}
