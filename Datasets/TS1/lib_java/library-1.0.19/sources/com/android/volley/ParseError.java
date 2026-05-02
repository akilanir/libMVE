package com.android.volley;

/* loaded from: library-1.0.19.jar:com/android/volley/ParseError.class */
public class ParseError extends VolleyError {
    public ParseError() {
    }

    public ParseError(NetworkResponse networkResponse) {
        super(networkResponse);
    }

    public ParseError(Throwable cause) {
        super(cause);
    }
}
