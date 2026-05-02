package com.google.android.exoplayer.util;

import android.widget.TextView;
import com.google.android.exoplayer.CodecCounters;
import com.google.android.exoplayer.chunk.Format;
import com.google.android.exoplayer.upstream.BandwidthMeter;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/util/DebugTextViewHelper.class */
public final class DebugTextViewHelper implements Runnable {
    private static final int REFRESH_INTERVAL_MS = 1000;
    private final TextView textView;
    private final Provider debuggable;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/util/DebugTextViewHelper$Provider.class */
    public interface Provider {
        long getCurrentPosition();

        Format getFormat();

        BandwidthMeter getBandwidthMeter();

        CodecCounters getCodecCounters();
    }

    public DebugTextViewHelper(Provider debuggable, TextView textView) {
        this.debuggable = debuggable;
        this.textView = textView;
    }

    public void start() {
        stop();
        run();
    }

    public void stop() {
        this.textView.removeCallbacks(this);
    }

    @Override // java.lang.Runnable
    public void run() {
        this.textView.setText(getRenderString());
        this.textView.postDelayed(this, 1000L);
    }

    private String getRenderString() {
        return getTimeString() + " " + getQualityString() + " " + getBandwidthString() + " " + getVideoCodecCountersString();
    }

    private String getTimeString() {
        return "ms(" + this.debuggable.getCurrentPosition() + ")";
    }

    private String getQualityString() {
        Format format = this.debuggable.getFormat();
        return format == null ? "id:? br:? h:?" : "id:" + format.id + " br:" + format.bitrate + " h:" + format.height;
    }

    private String getBandwidthString() {
        BandwidthMeter bandwidthMeter = this.debuggable.getBandwidthMeter();
        if (bandwidthMeter == null || bandwidthMeter.getBitrateEstimate() == -1) {
            return "bw:?";
        }
        return "bw:" + (bandwidthMeter.getBitrateEstimate() / 1000);
    }

    private String getVideoCodecCountersString() {
        CodecCounters codecCounters = this.debuggable.getCodecCounters();
        return codecCounters == null ? "" : codecCounters.getDebugString();
    }
}
