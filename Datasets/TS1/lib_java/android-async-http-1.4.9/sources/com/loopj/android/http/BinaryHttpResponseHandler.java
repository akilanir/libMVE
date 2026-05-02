package com.loopj.android.http;

import android.os.Looper;
import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.StatusLine;
import cz.msebera.android.httpclient.client.HttpResponseException;
import java.io.IOException;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

/* loaded from: android-async-http-1.4.9.jar:com/loopj/android/http/BinaryHttpResponseHandler.class */
public abstract class BinaryHttpResponseHandler extends AsyncHttpResponseHandler {
    private static final String LOG_TAG = "BinaryHttpRH";
    private String[] mAllowedContentTypes;

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public abstract void onSuccess(int i, Header[] headerArr, byte[] bArr);

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public abstract void onFailure(int i, Header[] headerArr, byte[] bArr, Throwable th);

    public BinaryHttpResponseHandler() {
        this.mAllowedContentTypes = new String[]{RequestParams.APPLICATION_OCTET_STREAM, "image/jpeg", "image/png", "image/gif"};
    }

    public BinaryHttpResponseHandler(String[] allowedContentTypes) {
        this.mAllowedContentTypes = new String[]{RequestParams.APPLICATION_OCTET_STREAM, "image/jpeg", "image/png", "image/gif"};
        if (allowedContentTypes != null) {
            this.mAllowedContentTypes = allowedContentTypes;
        } else {
            AsyncHttpClient.log.e(LOG_TAG, "Constructor passed allowedContentTypes was null !");
        }
    }

    public BinaryHttpResponseHandler(String[] allowedContentTypes, Looper looper) {
        super(looper);
        this.mAllowedContentTypes = new String[]{RequestParams.APPLICATION_OCTET_STREAM, "image/jpeg", "image/png", "image/gif"};
        if (allowedContentTypes != null) {
            this.mAllowedContentTypes = allowedContentTypes;
        } else {
            AsyncHttpClient.log.e(LOG_TAG, "Constructor passed allowedContentTypes was null !");
        }
    }

    public String[] getAllowedContentTypes() {
        return this.mAllowedContentTypes;
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler, com.loopj.android.http.ResponseHandlerInterface
    public final void sendResponseMessage(HttpResponse response) throws IOException {
        StatusLine status = response.getStatusLine();
        Header[] contentTypeHeaders = response.getHeaders(AsyncHttpClient.HEADER_CONTENT_TYPE);
        if (contentTypeHeaders.length != 1) {
            sendFailureMessage(status.getStatusCode(), response.getAllHeaders(), null, new HttpResponseException(status.getStatusCode(), "None, or more than one, Content-Type Header found!"));
            return;
        }
        Header contentTypeHeader = contentTypeHeaders[0];
        boolean foundAllowedContentType = false;
        for (String anAllowedContentType : getAllowedContentTypes()) {
            try {
                if (Pattern.matches(anAllowedContentType, contentTypeHeader.getValue())) {
                    foundAllowedContentType = true;
                }
            } catch (PatternSyntaxException e) {
                AsyncHttpClient.log.e(LOG_TAG, "Given pattern is not valid: " + anAllowedContentType, e);
            }
        }
        if (!foundAllowedContentType) {
            sendFailureMessage(status.getStatusCode(), response.getAllHeaders(), null, new HttpResponseException(status.getStatusCode(), "Content-Type (" + contentTypeHeader.getValue() + ") not allowed!"));
        } else {
            super.sendResponseMessage(response);
        }
    }
}
