package com.google.android.exoplayer.util.extensions;

import com.google.android.exoplayer.SampleHolder;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/util/extensions/InputBuffer.class */
public class InputBuffer extends Buffer {
    public final SampleHolder sampleHolder = new SampleHolder(2);

    @Override // com.google.android.exoplayer.util.extensions.Buffer
    public void reset() {
        super.reset();
        this.sampleHolder.clearData();
    }
}
