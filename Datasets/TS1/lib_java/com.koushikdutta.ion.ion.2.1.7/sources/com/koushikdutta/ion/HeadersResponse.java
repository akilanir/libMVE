package com.koushikdutta.ion;

import com.koushikdutta.async.http.Headers;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/HeadersResponse.class */
public class HeadersResponse {
    Headers headers;
    int code;
    String message;

    public HeadersResponse(int code, String message, Headers headers) {
        this.headers = headers;
        this.code = code;
        this.message = message;
    }

    public Headers getHeaders() {
        return this.headers;
    }

    public int code() {
        return this.code;
    }

    public HeadersResponse code(int code) {
        this.code = code;
        return this;
    }

    public String message() {
        return this.message;
    }

    public HeadersResponse message(String message) {
        this.message = message;
        return this;
    }
}
