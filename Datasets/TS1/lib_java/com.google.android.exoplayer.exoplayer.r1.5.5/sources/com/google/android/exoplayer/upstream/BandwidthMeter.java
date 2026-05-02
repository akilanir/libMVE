package com.google.android.exoplayer.upstream;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/upstream/BandwidthMeter.class */
public interface BandwidthMeter extends TransferListener {
    public static final long NO_ESTIMATE = -1;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/upstream/BandwidthMeter$EventListener.class */
    public interface EventListener {
        void onBandwidthSample(int i, long j, long j2);
    }

    long getBitrateEstimate();
}
