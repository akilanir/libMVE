package com.loopj.android.http;

import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.client.methods.HttpUriRequest;
import cz.msebera.android.httpclient.impl.client.AbstractHttpClient;
import cz.msebera.android.httpclient.protocol.HttpContext;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: android-async-http-1.4.9.jar:com/loopj/android/http/AsyncHttpRequest.class */
public class AsyncHttpRequest implements Runnable {
    private final AbstractHttpClient client;
    private final HttpContext context;
    private final HttpUriRequest request;
    private final ResponseHandlerInterface responseHandler;
    private final AtomicBoolean isCancelled = new AtomicBoolean();
    private int executionCount;
    private boolean cancelIsNotified;
    private volatile boolean isFinished;
    private boolean isRequestPreProcessed;

    public AsyncHttpRequest(AbstractHttpClient client, HttpContext context, HttpUriRequest request, ResponseHandlerInterface responseHandler) {
        this.client = (AbstractHttpClient) Utils.notNull(client, "client");
        this.context = (HttpContext) Utils.notNull(context, "context");
        this.request = (HttpUriRequest) Utils.notNull(request, "request");
        this.responseHandler = (ResponseHandlerInterface) Utils.notNull(responseHandler, "responseHandler");
    }

    public void onPreProcessRequest(AsyncHttpRequest request) {
    }

    public void onPostProcessRequest(AsyncHttpRequest request) {
    }

    @Override // java.lang.Runnable
    public void run() {
        if (isCancelled()) {
            return;
        }
        if (!this.isRequestPreProcessed) {
            this.isRequestPreProcessed = true;
            onPreProcessRequest(this);
        }
        if (isCancelled()) {
            return;
        }
        this.responseHandler.sendStartMessage();
        if (isCancelled()) {
            return;
        }
        try {
            makeRequestWithRetries();
        } catch (IOException e) {
            if (!isCancelled()) {
                this.responseHandler.sendFailureMessage(0, null, null, e);
            } else {
                AsyncHttpClient.log.e("AsyncHttpRequest", "makeRequestWithRetries returned error", e);
            }
        }
        if (isCancelled()) {
            return;
        }
        this.responseHandler.sendFinishMessage();
        if (isCancelled()) {
            return;
        }
        onPostProcessRequest(this);
        this.isFinished = true;
    }

    private void makeRequest() throws IOException {
        if (isCancelled()) {
            return;
        }
        if (this.request.getURI().getScheme() == null) {
            throw new MalformedURLException("No valid URI scheme was provided");
        }
        if (this.responseHandler instanceof RangeFileAsyncHttpResponseHandler) {
            ((RangeFileAsyncHttpResponseHandler) this.responseHandler).updateRequestHeaders(this.request);
        }
        HttpResponse response = this.client.execute(this.request, this.context);
        if (isCancelled()) {
            return;
        }
        this.responseHandler.onPreProcessResponse(this.responseHandler, response);
        if (isCancelled()) {
            return;
        }
        this.responseHandler.sendResponseMessage(response);
        if (isCancelled()) {
            return;
        }
        this.responseHandler.onPostProcessResponse(this.responseHandler, response);
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x005b  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00c3 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x000c A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void makeRequestWithRetries() throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 263
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.loopj.android.http.AsyncHttpRequest.makeRequestWithRetries():void");
    }

    public boolean isCancelled() {
        boolean cancelled = this.isCancelled.get();
        if (cancelled) {
            sendCancelNotification();
        }
        return cancelled;
    }

    private synchronized void sendCancelNotification() {
        if (!this.isFinished && this.isCancelled.get() && !this.cancelIsNotified) {
            this.cancelIsNotified = true;
            this.responseHandler.sendCancelMessage();
        }
    }

    public boolean isDone() {
        return isCancelled() || this.isFinished;
    }

    public boolean cancel(boolean mayInterruptIfRunning) {
        this.isCancelled.set(true);
        this.request.abort();
        return isCancelled();
    }

    public AsyncHttpRequest setRequestTag(Object TAG) {
        this.responseHandler.setTag(TAG);
        return this;
    }

    public Object getTag() {
        return this.responseHandler.getTag();
    }
}
