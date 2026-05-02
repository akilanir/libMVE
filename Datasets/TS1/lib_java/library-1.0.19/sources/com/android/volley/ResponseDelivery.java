package com.android.volley;

/* loaded from: library-1.0.19.jar:com/android/volley/ResponseDelivery.class */
public interface ResponseDelivery {
    void postResponse(Request<?> request, Response<?> response);

    void postResponse(Request<?> request, Response<?> response, Runnable runnable);

    void postError(Request<?> request, VolleyError volleyError);
}
