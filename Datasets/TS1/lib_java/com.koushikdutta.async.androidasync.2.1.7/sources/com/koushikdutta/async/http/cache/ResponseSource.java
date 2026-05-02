package com.koushikdutta.async.http.cache;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/cache/ResponseSource.class */
enum ResponseSource {
    CACHE,
    CONDITIONAL_CACHE,
    NETWORK;

    public boolean requiresConnection() {
        return this == CONDITIONAL_CACHE || this == NETWORK;
    }
}
