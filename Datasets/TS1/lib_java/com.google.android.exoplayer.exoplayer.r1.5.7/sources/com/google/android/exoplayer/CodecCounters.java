package com.google.android.exoplayer;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/CodecCounters.class */
public final class CodecCounters {
    public int codecInitCount;
    public int codecReleaseCount;
    public int inputBufferCount;
    public int outputFormatChangedCount;
    public int outputBuffersChangedCount;
    public int renderedOutputBufferCount;
    public int skippedOutputBufferCount;
    public int droppedOutputBufferCount;
    public int maxConsecutiveDroppedOutputBufferCount;

    public synchronized void ensureUpdated() {
    }

    public String getDebugString() {
        ensureUpdated();
        StringBuilder builder = new StringBuilder();
        builder.append("cic:").append(this.codecInitCount);
        builder.append(" crc:").append(this.codecReleaseCount);
        builder.append(" ibc:").append(this.inputBufferCount);
        builder.append(" ofc:").append(this.outputFormatChangedCount);
        builder.append(" obc:").append(this.outputBuffersChangedCount);
        builder.append(" ren:").append(this.renderedOutputBufferCount);
        builder.append(" sob:").append(this.skippedOutputBufferCount);
        builder.append(" dob:").append(this.droppedOutputBufferCount);
        builder.append(" mcdob:").append(this.maxConsecutiveDroppedOutputBufferCount);
        return builder.toString();
    }
}
