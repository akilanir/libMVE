package org.springframework.http.client.support;

import android.os.Build;
import android.util.Log;
import java.io.IOException;
import java.net.URI;
import org.springframework.http.HttpMethod;
import org.springframework.http.client.ClientHttpRequest;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.util.Assert;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/client/support/HttpAccessor.class */
public abstract class HttpAccessor {
    private static final String TAG = HttpAccessor.class.getSimpleName();
    private ClientHttpRequestFactory requestFactory;

    protected HttpAccessor() {
        if (Build.VERSION.SDK_INT >= 9) {
            this.requestFactory = new SimpleClientHttpRequestFactory();
        } else {
            this.requestFactory = new HttpComponentsClientHttpRequestFactory();
        }
    }

    public void setRequestFactory(ClientHttpRequestFactory requestFactory) {
        Assert.notNull(requestFactory, "'requestFactory' must not be null");
        this.requestFactory = requestFactory;
    }

    public ClientHttpRequestFactory getRequestFactory() {
        return this.requestFactory;
    }

    protected ClientHttpRequest createRequest(URI url, HttpMethod method) throws IOException {
        ClientHttpRequest request = getRequestFactory().createRequest(url, method);
        if (Log.isLoggable(TAG, 3)) {
            Log.d(TAG, "Created " + method.name() + " request for \"" + url + "\"");
        }
        return request;
    }
}
