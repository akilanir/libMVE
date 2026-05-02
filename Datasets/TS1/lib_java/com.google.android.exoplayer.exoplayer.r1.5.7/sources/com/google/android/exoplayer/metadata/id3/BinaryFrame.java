package com.google.android.exoplayer.metadata.id3;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/metadata/id3/BinaryFrame.class */
public final class BinaryFrame extends Id3Frame {
    public final byte[] data;

    public BinaryFrame(String type, byte[] data) {
        super(type);
        this.data = data;
    }
}
