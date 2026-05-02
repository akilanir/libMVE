package com.koushikdutta.async.http.callback;

import com.koushikdutta.async.callback.ResultCallback;
import com.koushikdutta.async.http.AsyncHttpResponse;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/callback/RequestCallback.class */
public interface RequestCallback<T> extends ResultCallback<AsyncHttpResponse, T> {
    void onConnect(AsyncHttpResponse asyncHttpResponse);

    void onProgress(AsyncHttpResponse asyncHttpResponse, long j, long j2);
}
