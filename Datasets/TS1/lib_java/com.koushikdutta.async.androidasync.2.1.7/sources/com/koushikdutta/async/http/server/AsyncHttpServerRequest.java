package com.koushikdutta.async.http.server;

import com.koushikdutta.async.AsyncSocket;
import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.http.Headers;
import com.koushikdutta.async.http.Multimap;
import com.koushikdutta.async.http.body.AsyncHttpRequestBody;
import java.util.regex.Matcher;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/server/AsyncHttpServerRequest.class */
public interface AsyncHttpServerRequest extends DataEmitter {
    Headers getHeaders();

    Matcher getMatcher();

    AsyncHttpRequestBody getBody();

    AsyncSocket getSocket();

    String getPath();

    Multimap getQuery();

    String getMethod();
}
