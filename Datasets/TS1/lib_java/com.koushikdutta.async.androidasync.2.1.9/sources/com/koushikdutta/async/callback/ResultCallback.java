package com.koushikdutta.async.callback;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/callback/ResultCallback.class */
public interface ResultCallback<S, T> {
    void onCompleted(Exception exc, S s, T t);
}
