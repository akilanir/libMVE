package com.google.android.exoplayer.extractor;

import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/extractor/Extractor.class */
public interface Extractor {
    public static final int RESULT_CONTINUE = 0;
    public static final int RESULT_SEEK = 1;
    public static final int RESULT_END_OF_INPUT = -1;

    void init(ExtractorOutput extractorOutput);

    boolean sniff(ExtractorInput extractorInput) throws IOException, InterruptedException;

    int read(ExtractorInput extractorInput, PositionHolder positionHolder) throws IOException, InterruptedException;

    void seek();
}
