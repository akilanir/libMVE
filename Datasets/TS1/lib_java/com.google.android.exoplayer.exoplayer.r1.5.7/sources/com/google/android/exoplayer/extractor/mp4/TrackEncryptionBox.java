package com.google.android.exoplayer.extractor.mp4;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/mp4/TrackEncryptionBox.class */
public final class TrackEncryptionBox {
    public final boolean isEncrypted;
    public final int initializationVectorSize;
    public final byte[] keyId;

    public TrackEncryptionBox(boolean isEncrypted, int initializationVectorSize, byte[] keyId) {
        this.isEncrypted = isEncrypted;
        this.initializationVectorSize = initializationVectorSize;
        this.keyId = keyId;
    }
}
