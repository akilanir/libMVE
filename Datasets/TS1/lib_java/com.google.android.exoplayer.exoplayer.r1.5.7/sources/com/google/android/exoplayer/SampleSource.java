package com.google.android.exoplayer;

import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/SampleSource.class */
public interface SampleSource {
    public static final int END_OF_STREAM = -1;
    public static final int NOTHING_READ = -2;
    public static final int SAMPLE_READ = -3;
    public static final int FORMAT_READ = -4;
    public static final long NO_DISCONTINUITY = Long.MIN_VALUE;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/SampleSource$SampleSourceReader.class */
    public interface SampleSourceReader {
        void maybeThrowError() throws IOException;

        boolean prepare(long j);

        int getTrackCount();

        MediaFormat getFormat(int i);

        void enable(int i, long j);

        boolean continueBuffering(int i, long j);

        long readDiscontinuity(int i);

        int readData(int i, long j, MediaFormatHolder mediaFormatHolder, SampleHolder sampleHolder);

        void seekToUs(long j);

        long getBufferedPositionUs();

        void disable(int i);

        void release();
    }

    SampleSourceReader register();
}
