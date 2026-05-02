package com.koushikdutta.async.http;

import android.net.Uri;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/AsyncHttpPost.class */
public class AsyncHttpPost extends AsyncHttpRequest {
    public static final String METHOD = "POST";

    public AsyncHttpPost(String uri) {
        this(Uri.parse(uri));
    }

    public AsyncHttpPost(Uri uri) {
        super(uri, METHOD);
    }
}
