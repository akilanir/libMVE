package cz.msebera.android.httpclient.impl.client.cache;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/cache/FailureCache.class */
public interface FailureCache {
    int getErrorCount(String str);

    void resetErrorCount(String str);

    void increaseErrorCount(String str);
}
