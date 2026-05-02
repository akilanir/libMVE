package com.google.android.exoplayer.extractor;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.upstream.Allocator;
import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/DefaultTrackOutput.class */
public class DefaultTrackOutput implements TrackOutput {
    private final RollingSampleBuffer rollingBuffer;
    private final SampleHolder sampleInfoHolder = new SampleHolder(0);
    private boolean needKeyframe = true;
    private long lastReadTimeUs = Long.MIN_VALUE;
    private long spliceOutTimeUs = Long.MIN_VALUE;
    private volatile long largestParsedTimestampUs = Long.MIN_VALUE;
    private volatile MediaFormat format;

    public DefaultTrackOutput(Allocator allocator) {
        this.rollingBuffer = new RollingSampleBuffer(allocator);
    }

    public void clear() {
        this.rollingBuffer.clear();
        this.needKeyframe = true;
        this.lastReadTimeUs = Long.MIN_VALUE;
        this.spliceOutTimeUs = Long.MIN_VALUE;
        this.largestParsedTimestampUs = Long.MIN_VALUE;
    }

    public int getWriteIndex() {
        return this.rollingBuffer.getWriteIndex();
    }

    public void discardUpstreamSamples(int discardFromIndex) {
        this.rollingBuffer.discardUpstreamSamples(discardFromIndex);
        this.largestParsedTimestampUs = this.rollingBuffer.peekSample(this.sampleInfoHolder) ? this.sampleInfoHolder.timeUs : Long.MIN_VALUE;
    }

    public int getReadIndex() {
        return this.rollingBuffer.getReadIndex();
    }

    public boolean hasFormat() {
        return this.format != null;
    }

    public MediaFormat getFormat() {
        return this.format;
    }

    public long getLargestParsedTimestampUs() {
        return this.largestParsedTimestampUs;
    }

    public boolean isEmpty() {
        return !advanceToEligibleSample();
    }

    public boolean getSample(SampleHolder holder) {
        boolean foundEligibleSample = advanceToEligibleSample();
        if (!foundEligibleSample) {
            return false;
        }
        this.rollingBuffer.readSample(holder);
        this.needKeyframe = false;
        this.lastReadTimeUs = holder.timeUs;
        return true;
    }

    public void discardUntil(long timeUs) {
        while (this.rollingBuffer.peekSample(this.sampleInfoHolder) && this.sampleInfoHolder.timeUs < timeUs) {
            this.rollingBuffer.skipSample();
            this.needKeyframe = true;
        }
        this.lastReadTimeUs = Long.MIN_VALUE;
    }

    public boolean skipToKeyframeBefore(long timeUs) {
        return this.rollingBuffer.skipToKeyframeBefore(timeUs);
    }

    public boolean configureSpliceTo(DefaultTrackOutput nextQueue) {
        long firstPossibleSpliceTime;
        if (this.spliceOutTimeUs != Long.MIN_VALUE) {
            return true;
        }
        if (this.rollingBuffer.peekSample(this.sampleInfoHolder)) {
            firstPossibleSpliceTime = this.sampleInfoHolder.timeUs;
        } else {
            firstPossibleSpliceTime = this.lastReadTimeUs + 1;
        }
        RollingSampleBuffer nextRollingBuffer = nextQueue.rollingBuffer;
        while (nextRollingBuffer.peekSample(this.sampleInfoHolder) && (this.sampleInfoHolder.timeUs < firstPossibleSpliceTime || !this.sampleInfoHolder.isSyncFrame())) {
            nextRollingBuffer.skipSample();
        }
        if (nextRollingBuffer.peekSample(this.sampleInfoHolder)) {
            this.spliceOutTimeUs = this.sampleInfoHolder.timeUs;
            return true;
        }
        return false;
    }

    private boolean advanceToEligibleSample() {
        boolean haveNext = this.rollingBuffer.peekSample(this.sampleInfoHolder);
        if (this.needKeyframe) {
            while (haveNext && !this.sampleInfoHolder.isSyncFrame()) {
                this.rollingBuffer.skipSample();
                haveNext = this.rollingBuffer.peekSample(this.sampleInfoHolder);
            }
        }
        if (!haveNext) {
            return false;
        }
        if (this.spliceOutTimeUs != Long.MIN_VALUE && this.sampleInfoHolder.timeUs >= this.spliceOutTimeUs) {
            return false;
        }
        return true;
    }

    public int sampleData(DataSource dataSource, int length, boolean allowEndOfInput) throws IOException {
        return this.rollingBuffer.appendData(dataSource, length, allowEndOfInput);
    }

    @Override // com.google.android.exoplayer.extractor.TrackOutput
    public void format(MediaFormat format) {
        this.format = format;
    }

    @Override // com.google.android.exoplayer.extractor.TrackOutput
    public int sampleData(ExtractorInput input, int length, boolean allowEndOfInput) throws IOException, InterruptedException {
        return this.rollingBuffer.appendData(input, length, allowEndOfInput);
    }

    @Override // com.google.android.exoplayer.extractor.TrackOutput
    public void sampleData(ParsableByteArray buffer, int length) {
        this.rollingBuffer.appendData(buffer, length);
    }

    @Override // com.google.android.exoplayer.extractor.TrackOutput
    public void sampleMetadata(long timeUs, int flags, int size, int offset, byte[] encryptionKey) {
        this.largestParsedTimestampUs = Math.max(this.largestParsedTimestampUs, timeUs);
        this.rollingBuffer.commitSample(timeUs, flags, (this.rollingBuffer.getWritePosition() - size) - offset, size, encryptionKey);
    }
}
