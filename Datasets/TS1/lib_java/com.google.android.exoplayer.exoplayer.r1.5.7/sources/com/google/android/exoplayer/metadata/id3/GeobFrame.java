package com.google.android.exoplayer.metadata.id3;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/metadata/id3/GeobFrame.class */
public final class GeobFrame extends Id3Frame {
    public static final String ID = "GEOB";
    public final String mimeType;
    public final String filename;
    public final String description;
    public final byte[] data;

    public GeobFrame(String mimeType, String filename, String description, byte[] data) {
        super(ID);
        this.mimeType = mimeType;
        this.filename = filename;
        this.description = description;
        this.data = data;
    }
}
