package com.google.android.exoplayer.metadata;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/metadata/PrivMetadata.class */
public final class PrivMetadata {
    public static final String TYPE = "PRIV";
    public final String owner;
    public final byte[] privateData;

    public PrivMetadata(String owner, byte[] privateData) {
        this.owner = owner;
        this.privateData = privateData;
    }
}
