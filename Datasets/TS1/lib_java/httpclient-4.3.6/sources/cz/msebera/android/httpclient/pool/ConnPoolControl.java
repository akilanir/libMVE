package cz.msebera.android.httpclient.pool;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/pool/ConnPoolControl.class */
public interface ConnPoolControl<T> {
    void setMaxTotal(int i);

    int getMaxTotal();

    void setDefaultMaxPerRoute(int i);

    int getDefaultMaxPerRoute();

    void setMaxPerRoute(T t, int i);

    int getMaxPerRoute(T t);

    PoolStats getTotalStats();

    PoolStats getStats(T t);
}
