package com.google.android.exoplayer.metadata.id3;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/metadata/id3/TxxxFrame.class */
public final class TxxxFrame extends Id3Frame {
    public static final String ID = "TXXX";
    public final String description;
    public final String value;

    public TxxxFrame(String description, String value) {
        super(ID);
        this.description = description;
        this.value = value;
    }
}
