package cz.msebera.android.httpclient.client.cache;

import cz.msebera.android.httpclient.annotation.NotThreadSafe;

@NotThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/cache/InputLimit.class */
public class InputLimit {
    private final long value;
    private boolean reached = false;

    public InputLimit(long value) {
        this.value = value;
    }

    public long getValue() {
        return this.value;
    }

    public void reached() {
        this.reached = true;
    }

    public boolean isReached() {
        return this.reached;
    }
}
