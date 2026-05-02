package com.android.volley;

/* loaded from: com.mcxiaoke.volley.library.1.0.19.jar:com/android/volley/NetworkError.class */
public class NetworkError extends VolleyError {
    public NetworkError() {
    }

    public NetworkError(Throwable cause) {
        super(cause);
    }

    public NetworkError(NetworkResponse networkResponse) {
        super(networkResponse);
    }
}
