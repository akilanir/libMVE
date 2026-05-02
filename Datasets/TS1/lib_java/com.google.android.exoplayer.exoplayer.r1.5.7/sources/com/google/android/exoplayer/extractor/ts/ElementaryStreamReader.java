package com.google.android.exoplayer.extractor.ts;

import com.google.android.exoplayer.extractor.TrackOutput;
import com.google.android.exoplayer.util.ParsableByteArray;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ts/ElementaryStreamReader.class */
abstract class ElementaryStreamReader {
    protected final TrackOutput output;

    public abstract void seek();

    public abstract void packetStarted(long j, boolean z);

    public abstract void consume(ParsableByteArray parsableByteArray);

    public abstract void packetFinished();

    protected ElementaryStreamReader(TrackOutput output) {
        this.output = output;
    }
}
