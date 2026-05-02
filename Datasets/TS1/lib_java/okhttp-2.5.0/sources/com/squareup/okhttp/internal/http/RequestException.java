package com.squareup.okhttp.internal.http;

import java.io.IOException;

/* loaded from: okhttp-2.5.0.jar:com/squareup/okhttp/internal/http/RequestException.class */
public final class RequestException extends Exception {
    public RequestException(IOException cause) {
        super(cause);
    }

    @Override // java.lang.Throwable
    public IOException getCause() {
        return (IOException) super.getCause();
    }
}
