package com.google.android.exoplayer.extractor.ogg;

import com.google.android.exoplayer.C;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.extractor.Extractor;
import com.google.android.exoplayer.extractor.ExtractorInput;
import com.google.android.exoplayer.extractor.ExtractorOutput;
import com.google.android.exoplayer.extractor.PositionHolder;
import com.google.android.exoplayer.extractor.SeekMap;
import com.google.android.exoplayer.extractor.TrackOutput;
import com.google.android.exoplayer.extractor.ogg.OggUtil;
import com.google.android.exoplayer.extractor.ogg.VorbisUtil;
import com.google.android.exoplayer.util.MimeTypes;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.io.IOException;
import java.util.ArrayList;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ogg/OggVorbisExtractor.class */
public final class OggVorbisExtractor implements Extractor, SeekMap {
    private TrackOutput trackOutput;
    private VorbisSetup vorbisSetup;
    private int previousPacketBlockSize;
    private long elapsedSamples;
    private boolean seenFirstAudioPacket;
    private ExtractorOutput extractorOutput;
    private VorbisUtil.VorbisIdHeader vorbisIdHeader;
    private VorbisUtil.CommentHeader commentHeader;
    private long inputLength;
    private long audioStartPosition;
    private long totalSamples;
    private long duration;
    private final ParsableByteArray scratch = new ParsableByteArray(new byte[65025], 0);
    private final OggReader oggReader = new OggReader();
    private final OggSeeker oggSeeker = new OggSeeker();
    private long targetGranule = -1;

    @Override // com.google.android.exoplayer.extractor.Extractor
    public boolean sniff(ExtractorInput input) throws IOException, InterruptedException {
        try {
            OggUtil.PageHeader header = new OggUtil.PageHeader();
            if (!OggUtil.populatePageHeader(input, header, this.scratch, true) || (header.type & 2) != 2 || header.bodySize < 7) {
                this.scratch.reset();
                return false;
            }
            this.scratch.reset();
            input.peekFully(this.scratch.data, 0, 7);
            boolean verifyVorbisHeaderCapturePattern = VorbisUtil.verifyVorbisHeaderCapturePattern(1, this.scratch, true);
            this.scratch.reset();
            return verifyVorbisHeaderCapturePattern;
        } catch (ParserException e) {
            this.scratch.reset();
            return false;
        } catch (Throwable th) {
            this.scratch.reset();
            throw th;
        }
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public void init(ExtractorOutput output) {
        this.trackOutput = output.track(0);
        output.endTracks();
        this.extractorOutput = output;
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public void seek() {
        this.oggReader.reset();
        this.previousPacketBlockSize = 0;
        this.elapsedSamples = 0L;
        this.seenFirstAudioPacket = false;
        this.scratch.reset();
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public void release() {
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public int read(ExtractorInput input, PositionHolder seekPosition) throws IOException, InterruptedException {
        if (this.totalSamples == 0) {
            if (this.vorbisSetup == null) {
                this.inputLength = input.getLength();
                this.vorbisSetup = readSetupHeaders(input, this.scratch);
                this.audioStartPosition = input.getPosition();
                this.extractorOutput.seekMap(this);
                if (this.inputLength != -1) {
                    seekPosition.position = input.getLength() - 8000;
                    return 1;
                }
            }
            this.totalSamples = this.inputLength == -1 ? -1L : this.oggReader.readGranuleOfLastPage(input);
            ArrayList<byte[]> codecInitialisationData = new ArrayList<>();
            codecInitialisationData.add(this.vorbisSetup.idHeader.data);
            codecInitialisationData.add(this.vorbisSetup.setupHeaderData);
            this.duration = this.inputLength == -1 ? -1L : (this.totalSamples * C.MICROS_PER_SECOND) / this.vorbisSetup.idHeader.sampleRate;
            this.trackOutput.format(MediaFormat.createAudioFormat(null, MimeTypes.AUDIO_VORBIS, this.vorbisSetup.idHeader.bitrateNominal, 65025, this.duration, this.vorbisSetup.idHeader.channels, (int) this.vorbisSetup.idHeader.sampleRate, codecInitialisationData, null));
            if (this.inputLength != -1) {
                this.oggSeeker.setup(this.inputLength - this.audioStartPosition, this.totalSamples);
                seekPosition.position = this.audioStartPosition;
                return 1;
            }
        }
        if (!this.seenFirstAudioPacket && this.targetGranule > -1) {
            OggUtil.skipToNextPage(input);
            long position = this.oggSeeker.getNextSeekPosition(this.targetGranule, input);
            if (position != -1) {
                seekPosition.position = position;
                return 1;
            }
            this.elapsedSamples = this.oggReader.skipToPageOfGranule(input, this.targetGranule);
            this.previousPacketBlockSize = this.vorbisIdHeader.blockSize0;
            this.seenFirstAudioPacket = true;
            this.oggSeeker.reset();
        }
        if (this.oggReader.readPacket(input, this.scratch)) {
            if ((this.scratch.data[0] & 1) != 1) {
                int packetBlockSize = decodeBlockSize(this.scratch.data[0], this.vorbisSetup);
                int samplesInPacket = this.seenFirstAudioPacket ? (packetBlockSize + this.previousPacketBlockSize) / 4 : 0;
                if (this.elapsedSamples + samplesInPacket >= this.targetGranule) {
                    appendNumberOfSamples(this.scratch, samplesInPacket);
                    long timeUs = (this.elapsedSamples * C.MICROS_PER_SECOND) / this.vorbisSetup.idHeader.sampleRate;
                    this.trackOutput.sampleData(this.scratch, this.scratch.limit());
                    this.trackOutput.sampleMetadata(timeUs, 1, this.scratch.limit(), 0, null);
                    this.targetGranule = -1L;
                }
                this.seenFirstAudioPacket = true;
                this.elapsedSamples += samplesInPacket;
                this.previousPacketBlockSize = packetBlockSize;
            }
            this.scratch.reset();
            return 0;
        }
        return -1;
    }

    VorbisSetup readSetupHeaders(ExtractorInput input, ParsableByteArray scratch) throws IOException, InterruptedException {
        if (this.vorbisIdHeader == null) {
            this.oggReader.readPacket(input, scratch);
            this.vorbisIdHeader = VorbisUtil.readVorbisIdentificationHeader(scratch);
            scratch.reset();
        }
        if (this.commentHeader == null) {
            this.oggReader.readPacket(input, scratch);
            this.commentHeader = VorbisUtil.readVorbisCommentHeader(scratch);
            scratch.reset();
        }
        this.oggReader.readPacket(input, scratch);
        byte[] setupHeaderData = new byte[scratch.limit()];
        System.arraycopy(scratch.data, 0, setupHeaderData, 0, scratch.limit());
        VorbisUtil.Mode[] modes = VorbisUtil.readVorbisModes(scratch, this.vorbisIdHeader.channels);
        int iLogModes = VorbisUtil.iLog(modes.length - 1);
        scratch.reset();
        return new VorbisSetup(this.vorbisIdHeader, this.commentHeader, setupHeaderData, modes, iLogModes);
    }

    static void appendNumberOfSamples(ParsableByteArray buffer, long packetSampleCount) {
        buffer.setLimit(buffer.limit() + 4);
        buffer.data[buffer.limit() - 4] = (byte) (packetSampleCount & 255);
        buffer.data[buffer.limit() - 3] = (byte) ((packetSampleCount >>> 8) & 255);
        buffer.data[buffer.limit() - 2] = (byte) ((packetSampleCount >>> 16) & 255);
        buffer.data[buffer.limit() - 1] = (byte) ((packetSampleCount >>> 24) & 255);
    }

    private static int decodeBlockSize(byte firstByteOfAudioPacket, VorbisSetup vorbisSetup) {
        int currentBlockSize;
        int modeNumber = OggUtil.readBits(firstByteOfAudioPacket, vorbisSetup.iLogModes, 1);
        if (!vorbisSetup.modes[modeNumber].blockFlag) {
            currentBlockSize = vorbisSetup.idHeader.blockSize0;
        } else {
            currentBlockSize = vorbisSetup.idHeader.blockSize1;
        }
        return currentBlockSize;
    }

    @Override // com.google.android.exoplayer.extractor.SeekMap
    public boolean isSeekable() {
        return (this.vorbisSetup == null || this.inputLength == -1) ? false : true;
    }

    @Override // com.google.android.exoplayer.extractor.SeekMap
    public long getPosition(long timeUs) {
        if (timeUs == 0) {
            this.targetGranule = -1L;
            return this.audioStartPosition;
        }
        this.targetGranule = (this.vorbisSetup.idHeader.sampleRate * timeUs) / C.MICROS_PER_SECOND;
        return Math.max(this.audioStartPosition, (((this.inputLength - this.audioStartPosition) * timeUs) / this.duration) - 4000);
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ogg/OggVorbisExtractor$VorbisSetup.class */
    static final class VorbisSetup {
        public final VorbisUtil.VorbisIdHeader idHeader;
        public final VorbisUtil.CommentHeader commentHeader;
        public final byte[] setupHeaderData;
        public final VorbisUtil.Mode[] modes;
        public final int iLogModes;

        public VorbisSetup(VorbisUtil.VorbisIdHeader idHeader, VorbisUtil.CommentHeader commentHeader, byte[] setupHeaderData, VorbisUtil.Mode[] modes, int iLogModes) {
            this.idHeader = idHeader;
            this.commentHeader = commentHeader;
            this.setupHeaderData = setupHeaderData;
            this.modes = modes;
            this.iLogModes = iLogModes;
        }
    }
}
