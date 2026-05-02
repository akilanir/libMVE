package com.google.android.exoplayer.metadata;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/metadata/GeobMetadata.class */
public final class GeobMetadata {
    public static final String TYPE = "GEOB";
    public final String mimeType;
    public final String filename;
    public final String description;
    public final byte[] data;

    public GeobMetadata(String mimeType, String filename, String description, byte[] data) {
        this.mimeType = mimeType;
        this.filename = filename;
        this.description = description;
        this.data = data;
    }
}
