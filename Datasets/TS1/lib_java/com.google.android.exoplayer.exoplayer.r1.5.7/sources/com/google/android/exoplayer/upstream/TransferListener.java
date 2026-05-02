package com.google.android.exoplayer.upstream;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/upstream/TransferListener.class */
public interface TransferListener {
    void onTransferStart();

    void onBytesTransferred(int i);

    void onTransferEnd();
}
