package com.koushikdutta.async.http;

import com.koushikdutta.async.AsyncSocket;
import com.koushikdutta.async.DataEmitter;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/AsyncHttpResponse.class */
public interface AsyncHttpResponse extends DataEmitter {
    String protocol();

    String message();

    int code();

    Headers headers();

    AsyncSocket detachSocket();

    AsyncHttpRequest getRequest();
}
