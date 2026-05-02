package com.koushikdutta.async.http;

import com.koushikdutta.async.http.AsyncHttpClientMiddleware;
import javax.net.ssl.SSLEngine;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/AsyncSSLEngineConfigurator.class */
public interface AsyncSSLEngineConfigurator {
    void configureEngine(SSLEngine sSLEngine, AsyncHttpClientMiddleware.GetSocketData getSocketData, String str, int i);
}
