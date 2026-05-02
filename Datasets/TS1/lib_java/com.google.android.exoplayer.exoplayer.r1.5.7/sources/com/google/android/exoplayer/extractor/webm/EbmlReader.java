package com.google.android.exoplayer.extractor.webm;

import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.extractor.ExtractorInput;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/webm/EbmlReader.class */
interface EbmlReader {
    public static final int TYPE_UNKNOWN = 0;
    public static final int TYPE_MASTER = 1;
    public static final int TYPE_UNSIGNED_INT = 2;
    public static final int TYPE_STRING = 3;
    public static final int TYPE_BINARY = 4;
    public static final int TYPE_FLOAT = 5;

    void init(EbmlReaderOutput ebmlReaderOutput);

    void reset();

    boolean read(ExtractorInput extractorInput) throws ParserException, IOException, InterruptedException;
}
