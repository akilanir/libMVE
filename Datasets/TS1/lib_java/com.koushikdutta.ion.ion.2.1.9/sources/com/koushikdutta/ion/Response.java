package com.koushikdutta.ion;

import com.koushikdutta.async.http.AsyncHttpRequest;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/Response.class */
public class Response<T> {
    private ResponseServedFrom servedFrom;
    private AsyncHttpRequest request;
    private T result;
    private Exception exception;
    private HeadersResponse headers;

    public Response(AsyncHttpRequest request, ResponseServedFrom servedFrom, HeadersResponse headers, Exception e, T result) {
        this.request = request;
        this.servedFrom = servedFrom;
        this.headers = headers;
        this.exception = e;
        this.result = result;
    }

    public ResponseServedFrom getServedFrom() {
        return this.servedFrom;
    }

    public AsyncHttpRequest getRequest() {
        return this.request;
    }

    public T getResult() {
        return this.result;
    }

    public Exception getException() {
        return this.exception;
    }

    public HeadersResponse getHeaders() {
        return this.headers;
    }
}
