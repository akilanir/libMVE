package com.koushikdutta.async.future;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/future/Future.class */
public interface Future<T> extends Cancellable, java.util.concurrent.Future<T> {
    Future<T> setCallback(FutureCallback<T> futureCallback);

    <C extends FutureCallback<T>> C then(C c);

    T tryGet();

    Exception tryGetException();
}
