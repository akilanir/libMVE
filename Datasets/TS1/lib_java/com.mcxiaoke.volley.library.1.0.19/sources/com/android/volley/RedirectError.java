package com.android.volley;

/* loaded from: com.mcxiaoke.volley.library.1.0.19.jar:com/android/volley/RedirectError.class */
public class RedirectError extends VolleyError {
    public RedirectError() {
    }

    public RedirectError(Throwable cause) {
        super(cause);
    }

    public RedirectError(NetworkResponse response) {
        super(response);
    }
}
