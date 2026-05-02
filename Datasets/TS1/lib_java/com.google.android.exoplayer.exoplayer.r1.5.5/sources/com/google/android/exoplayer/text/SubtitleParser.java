package com.google.android.exoplayer.text;

import com.google.android.exoplayer.ParserException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/text/SubtitleParser.class */
public interface SubtitleParser {
    boolean canParse(String str);

    Subtitle parse(byte[] bArr, int i, int i2) throws ParserException;
}
