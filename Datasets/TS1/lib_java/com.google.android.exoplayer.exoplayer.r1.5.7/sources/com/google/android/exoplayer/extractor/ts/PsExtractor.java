package com.google.android.exoplayer.extractor.ts;

import android.util.SparseArray;
import com.google.android.exoplayer.extractor.Extractor;
import com.google.android.exoplayer.extractor.ExtractorInput;
import com.google.android.exoplayer.extractor.ExtractorOutput;
import com.google.android.exoplayer.extractor.PositionHolder;
import com.google.android.exoplayer.extractor.SeekMap;
import com.google.android.exoplayer.util.MpegAudioHeader;
import com.google.android.exoplayer.util.ParsableBitArray;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ts/PsExtractor.class */
public final class PsExtractor implements Extractor {
    private static final int PACK_START_CODE = 442;
    private static final int SYSTEM_HEADER_START_CODE = 443;
    private static final int PACKET_START_CODE_PREFIX = 1;
    private static final int MPEG_PROGRAM_END_CODE = 441;
    private static final long MAX_SEARCH_LENGTH = 1048576;
    public static final int PRIVATE_STREAM_1 = 189;
    public static final int AUDIO_STREAM = 192;
    public static final int AUDIO_STREAM_MASK = 224;
    public static final int VIDEO_STREAM = 224;
    public static final int VIDEO_STREAM_MASK = 240;
    private final PtsTimestampAdjuster ptsTimestampAdjuster;
    private final SparseArray<PesReader> psPayloadReaders;
    private final ParsableByteArray psPacketBuffer;
    private boolean foundAllTracks;
    private boolean foundAudioTrack;
    private boolean foundVideoTrack;
    private ExtractorOutput output;

    public PsExtractor() {
        this(new PtsTimestampAdjuster(0L));
    }

    public PsExtractor(PtsTimestampAdjuster ptsTimestampAdjuster) {
        this.ptsTimestampAdjuster = ptsTimestampAdjuster;
        this.psPacketBuffer = new ParsableByteArray(MpegAudioHeader.MAX_FRAME_SIZE_BYTES);
        this.psPayloadReaders = new SparseArray<>();
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public boolean sniff(ExtractorInput input) throws IOException, InterruptedException {
        byte[] scratch = new byte[14];
        input.peekFully(scratch, 0, 14);
        if (PACK_START_CODE != (((scratch[0] & 255) << 24) | ((scratch[1] & 255) << 16) | ((scratch[2] & 255) << 8) | (scratch[3] & 255)) || (scratch[4] & 196) != 68 || (scratch[6] & 4) != 4 || (scratch[8] & 4) != 4 || (scratch[9] & 1) != 1 || (scratch[12] & 3) != 3) {
            return false;
        }
        int packStuffingLength = scratch[13] & 7;
        input.advancePeekPosition(packStuffingLength);
        input.peekFully(scratch, 0, 3);
        return 1 == ((((scratch[0] & 255) << 16) | ((scratch[1] & 255) << 8)) | (scratch[2] & 255));
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public void init(ExtractorOutput output) {
        this.output = output;
        output.seekMap(SeekMap.UNSEEKABLE);
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public void seek() {
        this.ptsTimestampAdjuster.reset();
        for (int i = 0; i < this.psPayloadReaders.size(); i++) {
            this.psPayloadReaders.valueAt(i).seek();
        }
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public void release() {
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public int read(ExtractorInput input, PositionHolder seekPosition) throws IOException, InterruptedException {
        if (!input.peekFully(this.psPacketBuffer.data, 0, 4, true)) {
            return -1;
        }
        this.psPacketBuffer.setPosition(0);
        int nextStartCode = this.psPacketBuffer.readInt();
        if (nextStartCode == MPEG_PROGRAM_END_CODE) {
            return -1;
        }
        if (nextStartCode == PACK_START_CODE) {
            input.peekFully(this.psPacketBuffer.data, 0, 10);
            this.psPacketBuffer.setPosition(0);
            this.psPacketBuffer.skipBytes(9);
            int packStuffingLength = this.psPacketBuffer.readUnsignedByte() & 7;
            input.skipFully(packStuffingLength + 14);
            return 0;
        }
        if (nextStartCode == SYSTEM_HEADER_START_CODE) {
            input.peekFully(this.psPacketBuffer.data, 0, 2);
            this.psPacketBuffer.setPosition(0);
            int systemHeaderLength = this.psPacketBuffer.readUnsignedShort();
            input.skipFully(systemHeaderLength + 6);
            return 0;
        }
        if (((nextStartCode & (-256)) >> 8) != 1) {
            input.skipFully(1);
            return 0;
        }
        int streamId = nextStartCode & 255;
        PesReader payloadReader = this.psPayloadReaders.get(streamId);
        if (!this.foundAllTracks) {
            if (payloadReader == null) {
                ElementaryStreamReader elementaryStreamReader = null;
                if (!this.foundAudioTrack && streamId == 189) {
                    elementaryStreamReader = new Ac3Reader(this.output.track(streamId), false);
                    this.foundAudioTrack = true;
                } else if (!this.foundAudioTrack && (streamId & 224) == 192) {
                    elementaryStreamReader = new MpegAudioReader(this.output.track(streamId));
                    this.foundAudioTrack = true;
                } else if (!this.foundVideoTrack && (streamId & VIDEO_STREAM_MASK) == 224) {
                    elementaryStreamReader = new H262Reader(this.output.track(streamId));
                    this.foundVideoTrack = true;
                }
                if (elementaryStreamReader != null) {
                    payloadReader = new PesReader(elementaryStreamReader, this.ptsTimestampAdjuster);
                    this.psPayloadReaders.put(streamId, payloadReader);
                }
            }
            if ((this.foundAudioTrack && this.foundVideoTrack) || input.getPosition() > MAX_SEARCH_LENGTH) {
                this.foundAllTracks = true;
                this.output.endTracks();
            }
        }
        input.peekFully(this.psPacketBuffer.data, 0, 2);
        this.psPacketBuffer.setPosition(0);
        int payloadLength = this.psPacketBuffer.readUnsignedShort();
        int pesLength = payloadLength + 6;
        if (payloadReader == null) {
            input.skipFully(pesLength);
            return 0;
        }
        if (this.psPacketBuffer.capacity() < pesLength) {
            this.psPacketBuffer.reset(new byte[pesLength], pesLength);
        }
        input.readFully(this.psPacketBuffer.data, 0, pesLength);
        this.psPacketBuffer.setPosition(6);
        this.psPacketBuffer.setLimit(pesLength);
        payloadReader.consume(this.psPacketBuffer, this.output);
        this.psPacketBuffer.setLimit(this.psPacketBuffer.capacity());
        return 0;
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ts/PsExtractor$PesReader.class */
    private static final class PesReader {
        private static final int PES_SCRATCH_SIZE = 64;
        private final ElementaryStreamReader pesPayloadReader;
        private final PtsTimestampAdjuster ptsTimestampAdjuster;
        private final ParsableBitArray pesScratch = new ParsableBitArray(new byte[PES_SCRATCH_SIZE]);
        private boolean ptsFlag;
        private boolean dtsFlag;
        private boolean seenFirstDts;
        private int extendedHeaderLength;
        private long timeUs;

        public PesReader(ElementaryStreamReader pesPayloadReader, PtsTimestampAdjuster ptsTimestampAdjuster) {
            this.pesPayloadReader = pesPayloadReader;
            this.ptsTimestampAdjuster = ptsTimestampAdjuster;
        }

        public void seek() {
            this.seenFirstDts = false;
            this.pesPayloadReader.seek();
        }

        public void consume(ParsableByteArray data, ExtractorOutput output) {
            data.readBytes(this.pesScratch.data, 0, 3);
            this.pesScratch.setPosition(0);
            parseHeader();
            data.readBytes(this.pesScratch.data, 0, this.extendedHeaderLength);
            this.pesScratch.setPosition(0);
            parseHeaderExtension();
            this.pesPayloadReader.packetStarted(this.timeUs, true);
            this.pesPayloadReader.consume(data);
            this.pesPayloadReader.packetFinished();
        }

        private void parseHeader() {
            this.pesScratch.skipBits(8);
            this.ptsFlag = this.pesScratch.readBit();
            this.dtsFlag = this.pesScratch.readBit();
            this.pesScratch.skipBits(6);
            this.extendedHeaderLength = this.pesScratch.readBits(8);
        }

        private void parseHeaderExtension() {
            this.timeUs = 0L;
            if (this.ptsFlag) {
                this.pesScratch.skipBits(4);
                long pts = this.pesScratch.readBits(3) << 30;
                this.pesScratch.skipBits(1);
                this.pesScratch.skipBits(1);
                long pts2 = pts | (this.pesScratch.readBits(15) << 15) | this.pesScratch.readBits(15);
                this.pesScratch.skipBits(1);
                if (!this.seenFirstDts && this.dtsFlag) {
                    this.pesScratch.skipBits(4);
                    long dts = this.pesScratch.readBits(3) << 30;
                    this.pesScratch.skipBits(1);
                    this.pesScratch.skipBits(1);
                    this.pesScratch.skipBits(1);
                    this.ptsTimestampAdjuster.adjustTimestamp(dts | (this.pesScratch.readBits(15) << 15) | this.pesScratch.readBits(15));
                    this.seenFirstDts = true;
                }
                this.timeUs = this.ptsTimestampAdjuster.adjustTimestamp(pts2);
            }
        }
    }
}
