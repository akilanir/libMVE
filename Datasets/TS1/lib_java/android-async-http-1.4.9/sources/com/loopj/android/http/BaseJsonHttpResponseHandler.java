package com.loopj.android.http;

import cz.msebera.android.httpclient.Header;

/* loaded from: android-async-http-1.4.9.jar:com/loopj/android/http/BaseJsonHttpResponseHandler.class */
public abstract class BaseJsonHttpResponseHandler<JSON_TYPE> extends TextHttpResponseHandler {
    private static final String LOG_TAG = "BaseJsonHttpRH";

    public abstract void onSuccess(int i, Header[] headerArr, String str, JSON_TYPE json_type);

    public abstract void onFailure(int i, Header[] headerArr, Throwable th, String str, JSON_TYPE json_type);

    protected abstract JSON_TYPE parseResponse(String str, boolean z) throws Throwable;

    public BaseJsonHttpResponseHandler() {
        this(AsyncHttpResponseHandler.DEFAULT_CHARSET);
    }

    public BaseJsonHttpResponseHandler(String encoding) {
        super(encoding);
    }

    @Override // com.loopj.android.http.TextHttpResponseHandler
    public final void onSuccess(final int statusCode, final Header[] headers, final String responseString) {
        if (statusCode != 204) {
            Runnable parser = new Runnable() { // from class: com.loopj.android.http.BaseJsonHttpResponseHandler.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        final Object parseResponse = BaseJsonHttpResponseHandler.this.parseResponse(responseString, false);
                        BaseJsonHttpResponseHandler.this.postRunnable(new Runnable() { // from class: com.loopj.android.http.BaseJsonHttpResponseHandler.1.1
                            /* JADX WARN: Multi-variable type inference failed */
                            @Override // java.lang.Runnable
                            public void run() {
                                BaseJsonHttpResponseHandler.this.onSuccess(statusCode, headers, responseString, parseResponse);
                            }
                        });
                    } catch (Throwable t) {
                        AsyncHttpClient.log.d(BaseJsonHttpResponseHandler.LOG_TAG, "parseResponse thrown an problem", t);
                        BaseJsonHttpResponseHandler.this.postRunnable(new Runnable() { // from class: com.loopj.android.http.BaseJsonHttpResponseHandler.1.2
                            @Override // java.lang.Runnable
                            public void run() {
                                BaseJsonHttpResponseHandler.this.onFailure(statusCode, headers, t, responseString, null);
                            }
                        });
                    }
                }
            };
            if (!getUseSynchronousMode() && !getUsePoolThread()) {
                new Thread(parser).start();
                return;
            } else {
                parser.run();
                return;
            }
        }
        onSuccess(statusCode, headers, null, null);
    }

    @Override // com.loopj.android.http.TextHttpResponseHandler
    public final void onFailure(final int statusCode, final Header[] headers, final String responseString, final Throwable throwable) {
        if (responseString != null) {
            Runnable parser = new Runnable() { // from class: com.loopj.android.http.BaseJsonHttpResponseHandler.2
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        final Object parseResponse = BaseJsonHttpResponseHandler.this.parseResponse(responseString, true);
                        BaseJsonHttpResponseHandler.this.postRunnable(new Runnable() { // from class: com.loopj.android.http.BaseJsonHttpResponseHandler.2.1
                            /* JADX WARN: Multi-variable type inference failed */
                            @Override // java.lang.Runnable
                            public void run() {
                                BaseJsonHttpResponseHandler.this.onFailure(statusCode, headers, throwable, responseString, parseResponse);
                            }
                        });
                    } catch (Throwable t) {
                        AsyncHttpClient.log.d(BaseJsonHttpResponseHandler.LOG_TAG, "parseResponse thrown an problem", t);
                        BaseJsonHttpResponseHandler.this.postRunnable(new Runnable() { // from class: com.loopj.android.http.BaseJsonHttpResponseHandler.2.2
                            @Override // java.lang.Runnable
                            public void run() {
                                BaseJsonHttpResponseHandler.this.onFailure(statusCode, headers, throwable, responseString, null);
                            }
                        });
                    }
                }
            };
            if (!getUseSynchronousMode() && !getUsePoolThread()) {
                new Thread(parser).start();
                return;
            } else {
                parser.run();
                return;
            }
        }
        onFailure(statusCode, headers, throwable, null, null);
    }
}
