package com.koushikdutta.async.http.callback;

import com.koushikdutta.async.http.AsyncHttpResponse;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/callback/HttpConnectCallback.class */
public interface HttpConnectCallback {
    void onConnectCompleted(Exception exc, AsyncHttpResponse asyncHttpResponse);
}
