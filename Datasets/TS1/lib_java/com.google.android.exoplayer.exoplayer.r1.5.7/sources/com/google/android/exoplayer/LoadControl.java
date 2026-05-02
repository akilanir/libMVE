package com.google.android.exoplayer;

import com.google.android.exoplayer.upstream.Allocator;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/LoadControl.class */
public interface LoadControl {
    void register(Object obj, int i);

    void unregister(Object obj);

    Allocator getAllocator();

    void trimAllocator();

    boolean update(Object obj, long j, long j2, boolean z);
}
