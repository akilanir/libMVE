package org.jsoup;

import java.io.IOException;

/* loaded from: jsoup-1.7.3.jar:org/jsoup/HttpStatusException.class */
public class HttpStatusException extends IOException {
    private int statusCode;
    private String url;

    public HttpStatusException(String message, int statusCode, String url) {
        super(message);
        this.statusCode = statusCode;
        this.url = url;
    }

    public int getStatusCode() {
        return this.statusCode;
    }

    public String getUrl() {
        return this.url;
    }

    @Override // java.lang.Throwable
    public String toString() {
        return super.toString() + ". Status=" + this.statusCode + ", URL=" + this.url;
    }
}
