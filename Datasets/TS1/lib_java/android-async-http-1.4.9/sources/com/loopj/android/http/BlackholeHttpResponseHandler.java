package com.loopj.android.http;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpResponse;

/* loaded from: android-async-http-1.4.9.jar:com/loopj/android/http/BlackholeHttpResponseHandler.class */
public class BlackholeHttpResponseHandler extends AsyncHttpResponseHandler {
    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public void onSuccess(int statusCode, Header[] headers, byte[] responseBody) {
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public void onFailure(int statusCode, Header[] headers, byte[] responseBody, Throwable error) {
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public void onProgress(long bytesWritten, long totalSize) {
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public void onCancel() {
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public void onFinish() {
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler, com.loopj.android.http.ResponseHandlerInterface
    public void onPostProcessResponse(ResponseHandlerInterface instance, HttpResponse response) {
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler, com.loopj.android.http.ResponseHandlerInterface
    public void onPreProcessResponse(ResponseHandlerInterface instance, HttpResponse response) {
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public void onRetry(int retryNo) {
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public void onStart() {
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public void onUserException(Throwable error) {
    }
}
