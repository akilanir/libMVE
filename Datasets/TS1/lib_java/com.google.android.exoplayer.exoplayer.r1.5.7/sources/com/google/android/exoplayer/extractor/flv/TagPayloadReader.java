package com.google.android.exoplayer.extractor.flv;

import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.extractor.TrackOutput;
import com.google.android.exoplayer.util.ParsableByteArray;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/flv/TagPayloadReader.class */
abstract class TagPayloadReader {
    protected final TrackOutput output;
    private long durationUs = -1;

    public abstract void seek();

    protected abstract boolean parseHeader(ParsableByteArray parsableByteArray) throws ParserException;

    protected abstract void parsePayload(ParsableByteArray parsableByteArray, long j) throws ParserException;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/flv/TagPayloadReader$UnsupportedFormatException.class */
    public static final class UnsupportedFormatException extends ParserException {
        public UnsupportedFormatException(String msg) {
            super(msg);
        }
    }

    protected TagPayloadReader(TrackOutput output) {
        this.output = output;
    }

    public final void setDurationUs(long durationUs) {
        this.durationUs = durationUs;
    }

    public final long getDurationUs() {
        return this.durationUs;
    }

    public final void consume(ParsableByteArray data, long timeUs) throws ParserException {
        if (parseHeader(data)) {
            parsePayload(data, timeUs);
        }
    }
}
