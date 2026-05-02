package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.annotation.Immutable;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/cache/FailureCacheValue.class */
public class FailureCacheValue {
    private final long creationTimeInNanos = System.nanoTime();
    private final String key;
    private final int errorCount;

    public FailureCacheValue(String key, int errorCount) {
        this.key = key;
        this.errorCount = errorCount;
    }

    public long getCreationTimeInNanos() {
        return this.creationTimeInNanos;
    }

    public String getKey() {
        return this.key;
    }

    public int getErrorCount() {
        return this.errorCount;
    }

    public String toString() {
        return "[entry creationTimeInNanos=" + this.creationTimeInNanos + "; key=" + this.key + "; errorCount=" + this.errorCount + ']';
    }
}
