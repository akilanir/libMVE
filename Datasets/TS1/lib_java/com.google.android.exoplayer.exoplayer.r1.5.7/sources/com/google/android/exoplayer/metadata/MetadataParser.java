package com.google.android.exoplayer.metadata;

import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/metadata/MetadataParser.class */
public interface MetadataParser<T> {
    boolean canParse(String str);

    T parse(byte[] bArr, int i) throws IOException;
}
