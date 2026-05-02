package com.google.android.exoplayer.chunk;

import com.google.android.exoplayer.upstream.BandwidthMeter;
import java.util.List;
import java.util.Random;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/chunk/FormatEvaluator.class */
public interface FormatEvaluator {

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/chunk/FormatEvaluator$Evaluation.class */
    public static final class Evaluation {
        public int queueSize;
        public int trigger = 1;
        public Format format;
    }

    void enable();

    void disable();

    void evaluate(List<? extends MediaChunk> list, long j, Format[] formatArr, Evaluation evaluation);

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/chunk/FormatEvaluator$FixedEvaluator.class */
    public static final class FixedEvaluator implements FormatEvaluator {
        @Override // com.google.android.exoplayer.chunk.FormatEvaluator
        public void enable() {
        }

        @Override // com.google.android.exoplayer.chunk.FormatEvaluator
        public void disable() {
        }

        @Override // com.google.android.exoplayer.chunk.FormatEvaluator
        public void evaluate(List<? extends MediaChunk> queue, long playbackPositionUs, Format[] formats, Evaluation evaluation) {
            evaluation.format = formats[0];
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/chunk/FormatEvaluator$RandomEvaluator.class */
    public static final class RandomEvaluator implements FormatEvaluator {
        private final Random random;

        public RandomEvaluator() {
            this.random = new Random();
        }

        public RandomEvaluator(int seed) {
            this.random = new Random(seed);
        }

        @Override // com.google.android.exoplayer.chunk.FormatEvaluator
        public void enable() {
        }

        @Override // com.google.android.exoplayer.chunk.FormatEvaluator
        public void disable() {
        }

        @Override // com.google.android.exoplayer.chunk.FormatEvaluator
        public void evaluate(List<? extends MediaChunk> queue, long playbackPositionUs, Format[] formats, Evaluation evaluation) {
            Format newFormat = formats[this.random.nextInt(formats.length)];
            if (evaluation.format != null && !evaluation.format.equals(newFormat)) {
                evaluation.trigger = 3;
            }
            evaluation.format = newFormat;
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator.class */
    public static final class AdaptiveEvaluator implements FormatEvaluator {
        public static final int DEFAULT_MAX_INITIAL_BITRATE = 800000;
        public static final int DEFAULT_MIN_DURATION_FOR_QUALITY_INCREASE_MS = 10000;
        public static final int DEFAULT_MAX_DURATION_FOR_QUALITY_DECREASE_MS = 25000;
        public static final int DEFAULT_MIN_DURATION_TO_RETAIN_AFTER_DISCARD_MS = 25000;
        public static final float DEFAULT_BANDWIDTH_FRACTION = 0.75f;
        private final BandwidthMeter bandwidthMeter;
        private final int maxInitialBitrate;
        private final long minDurationForQualityIncreaseUs;
        private final long maxDurationForQualityDecreaseUs;
        private final long minDurationToRetainAfterDiscardUs;
        private final float bandwidthFraction;

        public AdaptiveEvaluator(BandwidthMeter bandwidthMeter) {
            this(bandwidthMeter, DEFAULT_MAX_INITIAL_BITRATE, 10000, 25000, 25000, 0.75f);
        }

        public AdaptiveEvaluator(BandwidthMeter bandwidthMeter, int maxInitialBitrate, int minDurationForQualityIncreaseMs, int maxDurationForQualityDecreaseMs, int minDurationToRetainAfterDiscardMs, float bandwidthFraction) {
            this.bandwidthMeter = bandwidthMeter;
            this.maxInitialBitrate = maxInitialBitrate;
            this.minDurationForQualityIncreaseUs = minDurationForQualityIncreaseMs * 1000;
            this.maxDurationForQualityDecreaseUs = maxDurationForQualityDecreaseMs * 1000;
            this.minDurationToRetainAfterDiscardUs = minDurationToRetainAfterDiscardMs * 1000;
            this.bandwidthFraction = bandwidthFraction;
        }

        @Override // com.google.android.exoplayer.chunk.FormatEvaluator
        public void enable() {
        }

        @Override // com.google.android.exoplayer.chunk.FormatEvaluator
        public void disable() {
        }

        @Override // com.google.android.exoplayer.chunk.FormatEvaluator
        public void evaluate(List<? extends MediaChunk> queue, long playbackPositionUs, Format[] formats, Evaluation evaluation) {
            long bufferedDurationUs = queue.isEmpty() ? 0L : queue.get(queue.size() - 1).endTimeUs - playbackPositionUs;
            Format current = evaluation.format;
            Format ideal = determineIdealFormat(formats, this.bandwidthMeter.getBitrateEstimate());
            boolean isHigher = (ideal == null || current == null || ideal.bitrate <= current.bitrate) ? false : true;
            boolean isLower = (ideal == null || current == null || ideal.bitrate >= current.bitrate) ? false : true;
            if (isHigher) {
                if (bufferedDurationUs < this.minDurationForQualityIncreaseUs) {
                    ideal = current;
                } else if (bufferedDurationUs >= this.minDurationToRetainAfterDiscardUs) {
                    int i = 1;
                    while (true) {
                        if (i >= queue.size()) {
                            break;
                        }
                        MediaChunk thisChunk = queue.get(i);
                        long durationBeforeThisSegmentUs = thisChunk.startTimeUs - playbackPositionUs;
                        if (durationBeforeThisSegmentUs < this.minDurationToRetainAfterDiscardUs || thisChunk.format.bitrate >= ideal.bitrate || thisChunk.format.height >= ideal.height || thisChunk.format.height >= 720 || thisChunk.format.width >= 1280) {
                            i++;
                        } else {
                            evaluation.queueSize = i;
                            break;
                        }
                    }
                }
            } else if (isLower && current != null && bufferedDurationUs >= this.maxDurationForQualityDecreaseUs) {
                ideal = current;
            }
            if (current != null && ideal != current) {
                evaluation.trigger = 3;
            }
            evaluation.format = ideal;
        }

        private Format determineIdealFormat(Format[] formats, long bitrateEstimate) {
            long effectiveBitrate = bitrateEstimate == -1 ? this.maxInitialBitrate : (long) (bitrateEstimate * this.bandwidthFraction);
            for (Format format : formats) {
                if (format.bitrate <= effectiveBitrate) {
                    return format;
                }
            }
            return formats[formats.length - 1];
        }
    }
}
