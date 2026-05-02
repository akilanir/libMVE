package com.loopj.android.http;

import cz.msebera.android.httpclient.client.methods.HttpEntityEnclosingRequestBase;
import java.net.URI;

/* loaded from: android-async-http-1.4.9.jar:com/loopj/android/http/HttpGet.class */
public final class HttpGet extends HttpEntityEnclosingRequestBase {
    public static final String METHOD_NAME = "GET";

    public HttpGet() {
    }

    public HttpGet(URI uri) {
        setURI(uri);
    }

    public HttpGet(String uri) {
        setURI(URI.create(uri));
    }

    public String getMethod() {
        return METHOD_NAME;
    }
}
