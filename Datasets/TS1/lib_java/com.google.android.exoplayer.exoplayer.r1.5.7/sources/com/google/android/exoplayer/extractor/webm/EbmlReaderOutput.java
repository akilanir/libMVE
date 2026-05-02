package com.google.android.exoplayer.extractor.webm;

import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.extractor.ExtractorInput;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/webm/EbmlReaderOutput.class */
interface EbmlReaderOutput {
    int getElementType(int i);

    boolean isLevel1Element(int i);

    void startMasterElement(int i, long j, long j2) throws ParserException;

    void endMasterElement(int i) throws ParserException;

    void integerElement(int i, long j) throws ParserException;

    void floatElement(int i, double d) throws ParserException;

    void stringElement(int i, String str) throws ParserException;

    void binaryElement(int i, int i2, ExtractorInput extractorInput) throws ParserException, IOException, InterruptedException;
}
