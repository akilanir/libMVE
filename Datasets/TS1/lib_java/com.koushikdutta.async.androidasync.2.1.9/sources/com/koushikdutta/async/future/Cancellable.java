package com.koushikdutta.async.future;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/future/Cancellable.class */
public interface Cancellable {
    boolean isDone();

    boolean isCancelled();

    boolean cancel();
}
