package com.loopj.android.http;

import cz.msebera.android.httpclient.Header;
import java.io.UnsupportedEncodingException;

/* loaded from: android-async-http-1.4.9.jar:com/loopj/android/http/TextHttpResponseHandler.class */
public abstract class TextHttpResponseHandler extends AsyncHttpResponseHandler {
    private static final String LOG_TAG = "TextHttpRH";

    public abstract void onFailure(int i, Header[] headerArr, String str, Throwable th);

    public abstract void onSuccess(int i, Header[] headerArr, String str);

    public TextHttpResponseHandler() {
        this(AsyncHttpResponseHandler.DEFAULT_CHARSET);
    }

    public TextHttpResponseHandler(String encoding) {
        setCharset(encoding);
    }

    public static String getResponseString(byte[] stringBytes, String charset) {
        String str;
        if (stringBytes == null) {
            str = null;
        } else {
            try {
                str = new String(stringBytes, charset);
            } catch (UnsupportedEncodingException e) {
                AsyncHttpClient.log.e(LOG_TAG, "Encoding response into string failed", e);
                return null;
            }
        }
        String toReturn = str;
        if (toReturn != null && toReturn.startsWith(AsyncHttpResponseHandler.UTF8_BOM)) {
            return toReturn.substring(1);
        }
        return toReturn;
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public void onSuccess(int statusCode, Header[] headers, byte[] responseBytes) {
        onSuccess(statusCode, headers, getResponseString(responseBytes, getCharset()));
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    public void onFailure(int statusCode, Header[] headers, byte[] responseBytes, Throwable throwable) {
        onFailure(statusCode, headers, getResponseString(responseBytes, getCharset()), throwable);
    }
}
