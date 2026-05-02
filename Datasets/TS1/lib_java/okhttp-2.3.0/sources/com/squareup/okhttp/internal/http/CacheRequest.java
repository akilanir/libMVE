package com.squareup.okhttp.internal.http;

import java.io.IOException;
import okio.Sink;

/* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/internal/http/CacheRequest.class */
public interface CacheRequest {
    Sink body() throws IOException;

    void abort();
}
