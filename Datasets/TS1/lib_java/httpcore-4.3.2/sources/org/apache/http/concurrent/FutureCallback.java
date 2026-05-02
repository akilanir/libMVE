package org.apache.http.concurrent;

/* loaded from: httpcore-4.3.2.jar:org/apache/http/concurrent/FutureCallback.class */
public interface FutureCallback<T> {
    void completed(T t);

    void failed(Exception exc);

    void cancelled();
}
