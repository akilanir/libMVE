package com.koushikdutta.async.future;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/future/DependentCancellable.class */
public interface DependentCancellable extends Cancellable {
    DependentCancellable setParent(Cancellable cancellable);
}
