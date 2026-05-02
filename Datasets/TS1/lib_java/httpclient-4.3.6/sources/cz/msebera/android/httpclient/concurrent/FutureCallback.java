package cz.msebera.android.httpclient.concurrent;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/concurrent/FutureCallback.class */
public interface FutureCallback<T> {
    void completed(T t);

    void failed(Exception exc);

    void cancelled();
}
