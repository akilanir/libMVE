package com.google.android.exoplayer.util;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/util/SystemClock.class */
public final class SystemClock implements Clock {
    @Override // com.google.android.exoplayer.util.Clock
    public long elapsedRealtime() {
        return android.os.SystemClock.elapsedRealtime();
    }
}
