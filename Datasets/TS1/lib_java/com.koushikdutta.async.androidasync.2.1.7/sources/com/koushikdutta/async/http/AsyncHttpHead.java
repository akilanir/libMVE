package com.koushikdutta.async.http;

import android.net.Uri;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/AsyncHttpHead.class */
public class AsyncHttpHead extends AsyncHttpRequest {
    public static final String METHOD = "HEAD";

    public AsyncHttpHead(Uri uri) {
        super(uri, METHOD);
    }
}
