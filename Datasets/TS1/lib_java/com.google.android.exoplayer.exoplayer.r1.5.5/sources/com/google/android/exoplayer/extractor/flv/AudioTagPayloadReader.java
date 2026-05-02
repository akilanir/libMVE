package com.google.android.exoplayer.extractor.flv;

import android.util.Pair;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.extractor.TrackOutput;
import com.google.android.exoplayer.extractor.flv.TagPayloadReader;
import com.google.android.exoplayer.util.CodecSpecificDataUtil;
import com.google.android.exoplayer.util.MimeTypes;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.util.Collections;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/extractor/flv/AudioTagPayloadReader.class */
final class AudioTagPayloadReader extends TagPayloadReader {
    private static final int AUDIO_FORMAT_AAC = 10;
    private static final int AAC_PACKET_TYPE_SEQUENCE_HEADER = 0;
    private static final int AAC_PACKET_TYPE_AAC_RAW = 1;
    private static final int[] AUDIO_SAMPLING_RATE_TABLE = {5500, 11000, 22000, 44000};
    private boolean hasParsedAudioDataHeader;
    private boolean hasOutputFormat;

    public AudioTagPayloadReader(TrackOutput output) {
        super(output);
    }

    @Override // com.google.android.exoplayer.extractor.flv.TagPayloadReader
    public void seek() {
    }

    @Override // com.google.android.exoplayer.extractor.flv.TagPayloadReader
    protected boolean parseHeader(ParsableByteArray data) throws TagPayloadReader.UnsupportedFormatException {
        if (!this.hasParsedAudioDataHeader) {
            int header = data.readUnsignedByte();
            int audioFormat = (header >> 4) & 15;
            int sampleRateIndex = (header >> 2) & 3;
            if (sampleRateIndex < 0 || sampleRateIndex >= AUDIO_SAMPLING_RATE_TABLE.length) {
                throw new TagPayloadReader.UnsupportedFormatException("Invalid sample rate index: " + sampleRateIndex);
            }
            if (audioFormat != 10) {
                throw new TagPayloadReader.UnsupportedFormatException("Audio format not supported: " + audioFormat);
            }
            this.hasParsedAudioDataHeader = true;
            return true;
        }
        data.skipBytes(1);
        return true;
    }

    @Override // com.google.android.exoplayer.extractor.flv.TagPayloadReader
    protected void parsePayload(ParsableByteArray data, long timeUs) {
        int packetType = data.readUnsignedByte();
        if (packetType != 0 || this.hasOutputFormat) {
            if (packetType == 1) {
                int bytesToWrite = data.bytesLeft();
                this.output.sampleData(data, bytesToWrite);
                this.output.sampleMetadata(timeUs, 1, bytesToWrite, 0, null);
                return;
            }
            return;
        }
        byte[] audioSpecifiConfig = new byte[data.bytesLeft()];
        data.readBytes(audioSpecifiConfig, 0, audioSpecifiConfig.length);
        Pair<Integer, Integer> audioParams = CodecSpecificDataUtil.parseAacAudioSpecificConfig(audioSpecifiConfig);
        MediaFormat mediaFormat = MediaFormat.createAudioFormat(null, MimeTypes.AUDIO_AAC, -1, -1, getDurationUs(), ((Integer) audioParams.second).intValue(), ((Integer) audioParams.first).intValue(), Collections.singletonList(audioSpecifiConfig), null);
        this.output.format(mediaFormat);
        this.hasOutputFormat = true;
    }
}
