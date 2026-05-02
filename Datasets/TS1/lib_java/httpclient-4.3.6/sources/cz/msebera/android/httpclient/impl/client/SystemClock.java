package cz.msebera.android.httpclient.impl.client;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/SystemClock.class */
class SystemClock implements Clock {
    SystemClock() {
    }

    @Override // cz.msebera.android.httpclient.impl.client.Clock
    public long getCurrentTime() {
        return System.currentTimeMillis();
    }
}
