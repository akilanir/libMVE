package com.google.android.exoplayer.extractor.wav;

import com.google.android.exoplayer.C;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/wav/WavHeader.class */
final class WavHeader {
    private final int numChannels;
    private final int sampleRateHz;
    private final int averageBytesPerSecond;
    private final int blockAlignment;
    private final int bitsPerSample;
    private long dataStartPosition;
    private long dataSize;

    public WavHeader(int numChannels, int sampleRateHz, int averageBytesPerSecond, int blockAlignment, int bitsPerSample) {
        this.numChannels = numChannels;
        this.sampleRateHz = sampleRateHz;
        this.averageBytesPerSecond = averageBytesPerSecond;
        this.blockAlignment = blockAlignment;
        this.bitsPerSample = bitsPerSample;
    }

    public long getDurationUs() {
        return (getNumFrames() * C.MICROS_PER_SECOND) / this.sampleRateHz;
    }

    public long getNumSamples() {
        return this.dataSize / getBytesPerSample();
    }

    public long getNumFrames() {
        return getNumSamples() / getNumChannels();
    }

    public int getBytesPerSample() {
        return this.blockAlignment / this.numChannels;
    }

    public int getBytesPerFrame() {
        return this.blockAlignment;
    }

    public int getBitrate() {
        return this.sampleRateHz * this.bitsPerSample * this.numChannels;
    }

    public int getSampleRateHz() {
        return this.sampleRateHz;
    }

    public int getNumChannels() {
        return this.numChannels;
    }

    public long getPosition(long timeUs) {
        long unroundedPosition = (timeUs * this.averageBytesPerSecond) / C.MICROS_PER_SECOND;
        return ((unroundedPosition / this.numChannels) * this.numChannels) + this.dataStartPosition;
    }

    public long getTimeUs(long position) {
        return (position * C.MICROS_PER_SECOND) / this.averageBytesPerSecond;
    }

    public boolean hasDataBounds() {
        return (this.dataStartPosition == 0 || this.dataSize == 0) ? false : true;
    }

    public void setDataBounds(long dataStartPosition, long dataSize) {
        this.dataStartPosition = dataStartPosition;
        this.dataSize = dataSize;
    }
}
