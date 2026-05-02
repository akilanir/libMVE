package org.osmdroid.http;

import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.DefaultHttpClient;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/http/HttpClientFactory.class */
public class HttpClientFactory {
    private static IHttpClientFactory mFactoryInstance = new IHttpClientFactory() { // from class: org.osmdroid.http.HttpClientFactory.1
        @Override // org.osmdroid.http.IHttpClientFactory
        public HttpClient createHttpClient() {
            DefaultHttpClient client = new DefaultHttpClient();
            client.getParams().setParameter("http.useragent", "osmdroid");
            return client;
        }
    };

    public static void setFactoryInstance(IHttpClientFactory aHttpClientFactory) {
        mFactoryInstance = aHttpClientFactory;
    }

    public static HttpClient createHttpClient() {
        return mFactoryInstance.createHttpClient();
    }
}
