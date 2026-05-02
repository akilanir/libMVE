package com.mapzen.android.lost.internal;

import android.location.Location;
import android.os.Build;

/* loaded from: lost-1.0.1.jar:com/mapzen/android/lost/internal/SystemClock.class */
public class SystemClock implements Clock {
    public static final long MS_TO_NS = 1000000;

    @Override // com.mapzen.android.lost.internal.Clock
    public long getCurrentTimeInMillis() {
        return System.currentTimeMillis();
    }

    public static long getTimeInNanos(Location location) {
        if (Build.VERSION.SDK_INT >= 17) {
            return location.getElapsedRealtimeNanos();
        }
        return location.getTime() * MS_TO_NS;
    }
}
