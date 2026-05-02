package com.koushikdutta.async.http;

import android.net.Uri;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/AsyncHttpGet.class */
public class AsyncHttpGet extends AsyncHttpRequest {
    public static final String METHOD = "GET";

    public AsyncHttpGet(String uri) {
        super(Uri.parse(uri), METHOD);
    }

    public AsyncHttpGet(Uri uri) {
        super(uri, METHOD);
    }
}
