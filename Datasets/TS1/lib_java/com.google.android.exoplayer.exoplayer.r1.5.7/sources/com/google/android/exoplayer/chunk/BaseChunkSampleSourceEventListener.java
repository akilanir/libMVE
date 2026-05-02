package com.google.android.exoplayer.chunk;

import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/chunk/BaseChunkSampleSourceEventListener.class */
public interface BaseChunkSampleSourceEventListener {
    void onLoadStarted(int i, long j, int i2, int i3, Format format, long j2, long j3);

    void onLoadCompleted(int i, long j, int i2, int i3, Format format, long j2, long j3, long j4, long j5);

    void onLoadCanceled(int i, long j);

    void onLoadError(int i, IOException iOException);

    void onUpstreamDiscarded(int i, long j, long j2);

    void onDownstreamFormatChanged(int i, Format format, int i2, long j);
}
