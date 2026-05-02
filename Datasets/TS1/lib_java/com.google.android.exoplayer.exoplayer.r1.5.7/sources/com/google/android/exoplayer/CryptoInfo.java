package com.google.android.exoplayer;

import android.annotation.TargetApi;
import android.media.MediaCodec;
import android.media.MediaExtractor;
import com.google.android.exoplayer.extractor.mp4.Atom;
import com.google.android.exoplayer.util.Util;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/CryptoInfo.class */
public final class CryptoInfo {
    public byte[] iv;
    public byte[] key;
    public int mode;
    public int[] numBytesOfClearData;
    public int[] numBytesOfEncryptedData;
    public int numSubSamples;
    private final MediaCodec.CryptoInfo frameworkCryptoInfo;

    public CryptoInfo() {
        this.frameworkCryptoInfo = Util.SDK_INT >= 16 ? newFrameworkCryptoInfoV16() : null;
    }

    public void set(int numSubSamples, int[] numBytesOfClearData, int[] numBytesOfEncryptedData, byte[] key, byte[] iv, int mode) {
        this.numSubSamples = numSubSamples;
        this.numBytesOfClearData = numBytesOfClearData;
        this.numBytesOfEncryptedData = numBytesOfEncryptedData;
        this.key = key;
        this.iv = iv;
        this.mode = mode;
        if (Util.SDK_INT >= 16) {
            updateFrameworkCryptoInfoV16();
        }
    }

    @TargetApi(Atom.LONG_HEADER_SIZE)
    public void setFromExtractorV16(MediaExtractor extractor) {
        extractor.getSampleCryptoInfo(this.frameworkCryptoInfo);
        this.numSubSamples = this.frameworkCryptoInfo.numSubSamples;
        this.numBytesOfClearData = this.frameworkCryptoInfo.numBytesOfClearData;
        this.numBytesOfEncryptedData = this.frameworkCryptoInfo.numBytesOfEncryptedData;
        this.key = this.frameworkCryptoInfo.key;
        this.iv = this.frameworkCryptoInfo.iv;
        this.mode = this.frameworkCryptoInfo.mode;
    }

    @TargetApi(Atom.LONG_HEADER_SIZE)
    public MediaCodec.CryptoInfo getFrameworkCryptoInfoV16() {
        return this.frameworkCryptoInfo;
    }

    @TargetApi(Atom.LONG_HEADER_SIZE)
    private MediaCodec.CryptoInfo newFrameworkCryptoInfoV16() {
        return new MediaCodec.CryptoInfo();
    }

    @TargetApi(Atom.LONG_HEADER_SIZE)
    private void updateFrameworkCryptoInfoV16() {
        this.frameworkCryptoInfo.set(this.numSubSamples, this.numBytesOfClearData, this.numBytesOfEncryptedData, this.key, this.iv, this.mode);
    }
}
