package com.koushikdutta.ion.loader;

import android.net.Uri;
import com.koushikdutta.async.http.AsyncHttpRequest;
import com.koushikdutta.async.http.Headers;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/loader/AsyncHttpRequestFactory.class */
public interface AsyncHttpRequestFactory {
    AsyncHttpRequest createAsyncHttpRequest(Uri uri, String str, Headers headers);
}
