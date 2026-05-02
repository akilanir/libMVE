package com.loopj.android.http;

import android.content.Context;
import cz.msebera.android.httpclient.client.methods.HttpUriRequest;
import cz.msebera.android.httpclient.conn.scheme.SchemeRegistry;
import cz.msebera.android.httpclient.impl.client.DefaultHttpClient;
import cz.msebera.android.httpclient.protocol.HttpContext;

/* loaded from: android-async-http-1.4.9.jar:com/loopj/android/http/SyncHttpClient.class */
public class SyncHttpClient extends AsyncHttpClient {
    public SyncHttpClient() {
        super(false, 80, 443);
    }

    public SyncHttpClient(int httpPort) {
        super(false, httpPort, 443);
    }

    public SyncHttpClient(int httpPort, int httpsPort) {
        super(false, httpPort, httpsPort);
    }

    public SyncHttpClient(boolean fixNoHttpResponseException, int httpPort, int httpsPort) {
        super(fixNoHttpResponseException, httpPort, httpsPort);
    }

    public SyncHttpClient(SchemeRegistry schemeRegistry) {
        super(schemeRegistry);
    }

    @Override // com.loopj.android.http.AsyncHttpClient
    protected RequestHandle sendRequest(DefaultHttpClient client, HttpContext httpContext, HttpUriRequest uriRequest, String contentType, ResponseHandlerInterface responseHandler, Context context) {
        if (contentType != null) {
            uriRequest.addHeader(AsyncHttpClient.HEADER_CONTENT_TYPE, contentType);
        }
        responseHandler.setUseSynchronousMode(true);
        newAsyncHttpRequest(client, httpContext, uriRequest, contentType, responseHandler, context).run();
        return new RequestHandle(null);
    }
}
