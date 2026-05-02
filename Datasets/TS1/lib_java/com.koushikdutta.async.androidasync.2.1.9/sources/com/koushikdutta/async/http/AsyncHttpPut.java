package com.koushikdutta.async.http;

import android.net.Uri;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/AsyncHttpPut.class */
public class AsyncHttpPut extends AsyncHttpRequest {
    public static final String METHOD = "PUT";

    public AsyncHttpPut(String uri) {
        this(Uri.parse(uri));
    }

    public AsyncHttpPut(Uri uri) {
        super(uri, METHOD);
    }
}
