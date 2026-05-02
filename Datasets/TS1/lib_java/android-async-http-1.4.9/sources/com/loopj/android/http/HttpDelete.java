package com.loopj.android.http;

import cz.msebera.android.httpclient.client.methods.HttpEntityEnclosingRequestBase;
import java.net.URI;

/* loaded from: android-async-http-1.4.9.jar:com/loopj/android/http/HttpDelete.class */
public final class HttpDelete extends HttpEntityEnclosingRequestBase {
    public static final String METHOD_NAME = "DELETE";

    public HttpDelete() {
    }

    public HttpDelete(URI uri) {
        setURI(uri);
    }

    public HttpDelete(String uri) {
        setURI(URI.create(uri));
    }

    public String getMethod() {
        return METHOD_NAME;
    }
}
