package com.facebook.stetho.common;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/ThreadBound.class */
public interface ThreadBound {
    boolean checkThreadAccess();

    void verifyThreadAccess();

    <V> V postAndWait(UncheckedCallable<V> uncheckedCallable);

    void postAndWait(Runnable runnable);

    void postDelayed(Runnable runnable, long j);

    void removeCallbacks(Runnable runnable);
}
