package com.android.volley;

import com.android.volley.Cache;

/* loaded from: com.mcxiaoke.volley.library.1.0.19.jar:com/android/volley/Response.class */
public class Response<T> {
    public final T result;
    public final Cache.Entry cacheEntry;
    public final VolleyError error;
    public boolean intermediate;

    /* loaded from: com.mcxiaoke.volley.library.1.0.19.jar:com/android/volley/Response$ErrorListener.class */
    public interface ErrorListener {
        void onErrorResponse(VolleyError volleyError);
    }

    /* loaded from: com.mcxiaoke.volley.library.1.0.19.jar:com/android/volley/Response$Listener.class */
    public interface Listener<T> {
        void onResponse(T t);
    }

    public static <T> Response<T> success(T result, Cache.Entry cacheEntry) {
        return new Response<>(result, cacheEntry);
    }

    public static <T> Response<T> error(VolleyError error) {
        return new Response<>(error);
    }

    public boolean isSuccess() {
        return this.error == null;
    }

    private Response(T result, Cache.Entry cacheEntry) {
        this.intermediate = false;
        this.result = result;
        this.cacheEntry = cacheEntry;
        this.error = null;
    }

    private Response(VolleyError error) {
        this.intermediate = false;
        this.result = null;
        this.cacheEntry = null;
        this.error = error;
    }
}
