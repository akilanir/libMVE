package com.google.android.exoplayer;

import com.google.android.exoplayer.util.Clock;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/TimeRange.class */
public interface TimeRange {
    boolean isStatic();

    long[] getCurrentBoundsMs(long[] jArr);

    long[] getCurrentBoundsUs(long[] jArr);

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/TimeRange$StaticTimeRange.class */
    public static final class StaticTimeRange implements TimeRange {
        private final long startTimeUs;
        private final long endTimeUs;

        public StaticTimeRange(long startTimeUs, long endTimeUs) {
            this.startTimeUs = startTimeUs;
            this.endTimeUs = endTimeUs;
        }

        @Override // com.google.android.exoplayer.TimeRange
        public boolean isStatic() {
            return true;
        }

        @Override // com.google.android.exoplayer.TimeRange
        public long[] getCurrentBoundsMs(long[] out) {
            long[] out2 = getCurrentBoundsUs(out);
            out2[0] = out2[0] / 1000;
            out2[1] = out2[1] / 1000;
            return out2;
        }

        @Override // com.google.android.exoplayer.TimeRange
        public long[] getCurrentBoundsUs(long[] out) {
            if (out == null || out.length < 2) {
                out = new long[2];
            }
            out[0] = this.startTimeUs;
            out[1] = this.endTimeUs;
            return out;
        }

        public int hashCode() {
            int result = (31 * 17) + ((int) this.startTimeUs);
            return (31 * result) + ((int) this.endTimeUs);
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (obj == null || getClass() != obj.getClass()) {
                return false;
            }
            StaticTimeRange other = (StaticTimeRange) obj;
            return other.startTimeUs == this.startTimeUs && other.endTimeUs == this.endTimeUs;
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/TimeRange$DynamicTimeRange.class */
    public static final class DynamicTimeRange implements TimeRange {
        private final long minStartTimeUs;
        private final long maxEndTimeUs;
        private final long elapsedRealtimeAtStartUs;
        private final long bufferDepthUs;
        private final Clock systemClock;

        public DynamicTimeRange(long minStartTimeUs, long maxEndTimeUs, long elapsedRealtimeAtStartUs, long bufferDepthUs, Clock systemClock) {
            this.minStartTimeUs = minStartTimeUs;
            this.maxEndTimeUs = maxEndTimeUs;
            this.elapsedRealtimeAtStartUs = elapsedRealtimeAtStartUs;
            this.bufferDepthUs = bufferDepthUs;
            this.systemClock = systemClock;
        }

        @Override // com.google.android.exoplayer.TimeRange
        public boolean isStatic() {
            return false;
        }

        @Override // com.google.android.exoplayer.TimeRange
        public long[] getCurrentBoundsMs(long[] out) {
            long[] out2 = getCurrentBoundsUs(out);
            out2[0] = out2[0] / 1000;
            out2[1] = out2[1] / 1000;
            return out2;
        }

        @Override // com.google.android.exoplayer.TimeRange
        public long[] getCurrentBoundsUs(long[] out) {
            if (out == null || out.length < 2) {
                out = new long[2];
            }
            long currentEndTimeUs = Math.min(this.maxEndTimeUs, (this.systemClock.elapsedRealtime() * 1000) - this.elapsedRealtimeAtStartUs);
            long currentStartTimeUs = this.minStartTimeUs;
            if (this.bufferDepthUs != -1) {
                currentStartTimeUs = Math.max(currentStartTimeUs, currentEndTimeUs - this.bufferDepthUs);
            }
            out[0] = currentStartTimeUs;
            out[1] = currentEndTimeUs;
            return out;
        }

        public int hashCode() {
            int result = (31 * 17) + ((int) this.minStartTimeUs);
            return (31 * ((31 * ((31 * result) + ((int) this.maxEndTimeUs))) + ((int) this.elapsedRealtimeAtStartUs))) + ((int) this.bufferDepthUs);
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (obj == null || getClass() != obj.getClass()) {
                return false;
            }
            DynamicTimeRange other = (DynamicTimeRange) obj;
            return other.minStartTimeUs == this.minStartTimeUs && other.maxEndTimeUs == this.maxEndTimeUs && other.elapsedRealtimeAtStartUs == this.elapsedRealtimeAtStartUs && other.bufferDepthUs == this.bufferDepthUs;
        }
    }
}
