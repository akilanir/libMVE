package com.koushikdutta.async.http.body;

import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.DataSink;
import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.http.AsyncHttpRequest;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/body/AsyncHttpRequestBody.class */
public interface AsyncHttpRequestBody<T> {
    void write(AsyncHttpRequest asyncHttpRequest, DataSink dataSink, CompletedCallback completedCallback);

    void parse(DataEmitter dataEmitter, CompletedCallback completedCallback);

    String getContentType();

    boolean readFullyOnRequest();

    int length();

    T get();
}
