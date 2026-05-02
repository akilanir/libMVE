package com.google.android.exoplayer.util.extensions;

import java.lang.Exception;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/util/extensions/Decoder.class */
public interface Decoder<I, O, E extends Exception> {
    I dequeueInputBuffer() throws Exception;

    void queueInputBuffer(I i) throws Exception;

    O dequeueOutputBuffer() throws Exception;

    void flush();

    void release();
}
