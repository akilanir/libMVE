package cz.msebera.android.httpclient.pool;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/pool/PoolEntryCallback.class */
public interface PoolEntryCallback<T, C> {
    void process(PoolEntry<T, C> poolEntry);
}
