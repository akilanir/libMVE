package com.google.android.exoplayer.extractor;

import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/extractor/ExtractorInput.class */
public interface ExtractorInput {
    int read(byte[] bArr, int i, int i2) throws IOException, InterruptedException;

    boolean readFully(byte[] bArr, int i, int i2, boolean z) throws IOException, InterruptedException;

    void readFully(byte[] bArr, int i, int i2) throws IOException, InterruptedException;

    int skip(int i) throws IOException, InterruptedException;

    boolean skipFully(int i, boolean z) throws IOException, InterruptedException;

    void skipFully(int i) throws IOException, InterruptedException;

    boolean peekFully(byte[] bArr, int i, int i2, boolean z) throws IOException, InterruptedException;

    void peekFully(byte[] bArr, int i, int i2) throws IOException, InterruptedException;

    boolean advancePeekPosition(int i, boolean z) throws IOException, InterruptedException;

    void advancePeekPosition(int i) throws IOException, InterruptedException;

    void resetPeekPosition();

    long getPeekPosition();

    long getPosition();

    long getLength();
}
