package com.google.android.exoplayer;

import com.google.android.exoplayer.MediaCodecUtil;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/MediaCodecSelector.class */
public interface MediaCodecSelector {
    public static final MediaCodecSelector DEFAULT = new MediaCodecSelector() { // from class: com.google.android.exoplayer.MediaCodecSelector.1
        private static final String RAW_DECODER_NAME = "OMX.google.raw.decoder";

        @Override // com.google.android.exoplayer.MediaCodecSelector
        public DecoderInfo getDecoderInfo(String mimeType, boolean requiresSecureDecoder) throws MediaCodecUtil.DecoderQueryException {
            return MediaCodecUtil.getDecoderInfo(mimeType, requiresSecureDecoder);
        }

        @Override // com.google.android.exoplayer.MediaCodecSelector
        public String getPassthroughDecoderName() throws MediaCodecUtil.DecoderQueryException {
            return RAW_DECODER_NAME;
        }
    };

    DecoderInfo getDecoderInfo(String str, boolean z) throws MediaCodecUtil.DecoderQueryException;

    String getPassthroughDecoderName() throws MediaCodecUtil.DecoderQueryException;
}
