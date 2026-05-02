package com.google.android.exoplayer.dash.mpd;

import com.google.android.exoplayer.util.ManifestFetcher;
import java.util.Collections;
import java.util.List;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/mpd/MediaPresentationDescription.class */
public class MediaPresentationDescription implements ManifestFetcher.RedirectingManifest {
    public final long availabilityStartTime;
    public final long duration;
    public final long minBufferTime;
    public final boolean dynamic;
    public final long minUpdatePeriod;
    public final long timeShiftBufferDepth;
    public final UtcTimingElement utcTiming;
    public final String location;
    private final List<Period> periods;

    public MediaPresentationDescription(long availabilityStartTime, long duration, long minBufferTime, boolean dynamic, long minUpdatePeriod, long timeShiftBufferDepth, UtcTimingElement utcTiming, String location, List<Period> periods) {
        this.availabilityStartTime = availabilityStartTime;
        this.duration = duration;
        this.minBufferTime = minBufferTime;
        this.dynamic = dynamic;
        this.minUpdatePeriod = minUpdatePeriod;
        this.timeShiftBufferDepth = timeShiftBufferDepth;
        this.utcTiming = utcTiming;
        this.location = location;
        this.periods = periods == null ? Collections.emptyList() : periods;
    }

    @Override // com.google.android.exoplayer.util.ManifestFetcher.RedirectingManifest
    public final String getNextManifestUri() {
        return this.location;
    }

    public final int getPeriodCount() {
        return this.periods.size();
    }

    public final Period getPeriod(int index) {
        return this.periods.get(index);
    }

    public final long getPeriodDuration(int index) {
        if (index != this.periods.size() - 1) {
            return this.periods.get(index + 1).startMs - this.periods.get(index).startMs;
        }
        if (this.duration == -1) {
            return -1L;
        }
        return this.duration - this.periods.get(index).startMs;
    }
}
