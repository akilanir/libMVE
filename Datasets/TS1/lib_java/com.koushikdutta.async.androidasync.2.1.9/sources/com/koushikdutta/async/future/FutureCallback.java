package com.koushikdutta.async.future;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/future/FutureCallback.class */
public interface FutureCallback<T> {
    void onCompleted(Exception exc, T t);
}
