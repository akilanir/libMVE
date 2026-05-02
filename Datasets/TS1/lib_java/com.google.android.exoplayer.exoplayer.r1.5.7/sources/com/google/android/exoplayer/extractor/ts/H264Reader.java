package com.google.android.exoplayer.extractor.ts;

import android.util.SparseArray;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.extractor.TrackOutput;
import com.google.android.exoplayer.util.MimeTypes;
import com.google.android.exoplayer.util.NalUnitUtil;
import com.google.android.exoplayer.util.ParsableBitArray;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ts/H264Reader.class */
final class H264Reader extends ElementaryStreamReader {
    private static final int NAL_UNIT_TYPE_SEI = 6;
    private static final int NAL_UNIT_TYPE_SPS = 7;
    private static final int NAL_UNIT_TYPE_PPS = 8;
    private boolean hasOutputFormat;
    private final SeiReader seiReader;
    private final boolean[] prefixFlags;
    private final SampleReader sampleReader;
    private final NalUnitTargetBuffer sps;
    private final NalUnitTargetBuffer pps;
    private final NalUnitTargetBuffer sei;
    private long totalBytesWritten;
    private long pesTimeUs;
    private final ParsableByteArray seiWrapper;

    public H264Reader(TrackOutput output, SeiReader seiReader, boolean allowNonIdrKeyframes, boolean detectAccessUnits) {
        super(output);
        this.seiReader = seiReader;
        this.prefixFlags = new boolean[3];
        this.sampleReader = new SampleReader(output, allowNonIdrKeyframes, detectAccessUnits);
        this.sps = new NalUnitTargetBuffer(7, 128);
        this.pps = new NalUnitTargetBuffer(8, 128);
        this.sei = new NalUnitTargetBuffer(6, 128);
        this.seiWrapper = new ParsableByteArray();
    }

    @Override // com.google.android.exoplayer.extractor.ts.ElementaryStreamReader
    public void seek() {
        NalUnitUtil.clearPrefixFlags(this.prefixFlags);
        this.sps.reset();
        this.pps.reset();
        this.sei.reset();
        this.sampleReader.reset();
        this.totalBytesWritten = 0L;
    }

    @Override // com.google.android.exoplayer.extractor.ts.ElementaryStreamReader
    public void packetStarted(long pesTimeUs, boolean dataAlignmentIndicator) {
        this.pesTimeUs = pesTimeUs;
    }

    @Override // com.google.android.exoplayer.extractor.ts.ElementaryStreamReader
    public void consume(ParsableByteArray data) {
        if (data.bytesLeft() > 0) {
            int offset = data.getPosition();
            int limit = data.limit();
            byte[] dataArray = data.data;
            this.totalBytesWritten += data.bytesLeft();
            this.output.sampleData(data, data.bytesLeft());
            while (true) {
                int nalUnitOffset = NalUnitUtil.findNalUnit(dataArray, offset, limit, this.prefixFlags);
                if (nalUnitOffset == limit) {
                    nalUnitData(dataArray, offset, limit);
                    return;
                }
                int nalUnitType = NalUnitUtil.getNalUnitType(dataArray, nalUnitOffset);
                int lengthToNalUnit = nalUnitOffset - offset;
                if (lengthToNalUnit > 0) {
                    nalUnitData(dataArray, offset, nalUnitOffset);
                }
                int bytesWrittenPastPosition = limit - nalUnitOffset;
                long absolutePosition = this.totalBytesWritten - bytesWrittenPastPosition;
                endNalUnit(absolutePosition, bytesWrittenPastPosition, lengthToNalUnit < 0 ? -lengthToNalUnit : 0, this.pesTimeUs);
                startNalUnit(absolutePosition, nalUnitType, this.pesTimeUs);
                offset = nalUnitOffset + 3;
            }
        }
    }

    @Override // com.google.android.exoplayer.extractor.ts.ElementaryStreamReader
    public void packetFinished() {
    }

    private void startNalUnit(long position, int nalUnitType, long pesTimeUs) {
        if (!this.hasOutputFormat || this.sampleReader.needsSpsPps()) {
            this.sps.startNalUnit(nalUnitType);
            this.pps.startNalUnit(nalUnitType);
        }
        this.sei.startNalUnit(nalUnitType);
        this.sampleReader.startNalUnit(position, nalUnitType, pesTimeUs);
    }

    private void nalUnitData(byte[] dataArray, int offset, int limit) {
        if (!this.hasOutputFormat || this.sampleReader.needsSpsPps()) {
            this.sps.appendToNalUnit(dataArray, offset, limit);
            this.pps.appendToNalUnit(dataArray, offset, limit);
        }
        this.sei.appendToNalUnit(dataArray, offset, limit);
        this.sampleReader.appendToNalUnit(dataArray, offset, limit);
    }

    private void endNalUnit(long position, int offset, int discardPadding, long pesTimeUs) {
        if (!this.hasOutputFormat || this.sampleReader.needsSpsPps()) {
            this.sps.endNalUnit(discardPadding);
            this.pps.endNalUnit(discardPadding);
            if (!this.hasOutputFormat) {
                if (this.sps.isCompleted() && this.pps.isCompleted()) {
                    List<byte[]> initializationData = new ArrayList<>();
                    initializationData.add(Arrays.copyOf(this.sps.nalData, this.sps.nalLength));
                    initializationData.add(Arrays.copyOf(this.pps.nalData, this.pps.nalLength));
                    NalUnitUtil.SpsData spsData = NalUnitUtil.parseSpsNalUnit(unescape(this.sps));
                    NalUnitUtil.PpsData ppsData = NalUnitUtil.parsePpsNalUnit(unescape(this.pps));
                    this.output.format(MediaFormat.createVideoFormat(null, MimeTypes.VIDEO_H264, -1, -1, -1L, spsData.width, spsData.height, initializationData, -1, spsData.pixelWidthAspectRatio));
                    this.hasOutputFormat = true;
                    this.sampleReader.putSps(spsData);
                    this.sampleReader.putPps(ppsData);
                    this.sps.reset();
                    this.pps.reset();
                }
            } else if (this.sps.isCompleted()) {
                this.sampleReader.putSps(NalUnitUtil.parseSpsNalUnit(unescape(this.sps)));
                this.sps.reset();
            } else if (this.pps.isCompleted()) {
                NalUnitUtil.PpsData ppsData2 = NalUnitUtil.parsePpsNalUnit(unescape(this.pps));
                this.sampleReader.putPps(ppsData2);
                this.pps.reset();
            }
        }
        if (this.sei.endNalUnit(discardPadding)) {
            int unescapedLength = NalUnitUtil.unescapeStream(this.sei.nalData, this.sei.nalLength);
            this.seiWrapper.reset(this.sei.nalData, unescapedLength);
            this.seiWrapper.setPosition(4);
            this.seiReader.consume(pesTimeUs, this.seiWrapper);
        }
        this.sampleReader.endNalUnit(position, offset);
    }

    private static ParsableBitArray unescape(NalUnitTargetBuffer buffer) {
        int length = NalUnitUtil.unescapeStream(buffer.nalData, buffer.nalLength);
        ParsableBitArray bitArray = new ParsableBitArray(buffer.nalData, length);
        bitArray.skipBits(32);
        return bitArray;
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ts/H264Reader$SampleReader.class */
    private static final class SampleReader {
        private static final int DEFAULT_BUFFER_SIZE = 128;
        private static final int NAL_UNIT_TYPE_NON_IDR = 1;
        private static final int NAL_UNIT_TYPE_PARTITION_A = 2;
        private static final int NAL_UNIT_TYPE_IDR = 5;
        private static final int NAL_UNIT_TYPE_AUD = 9;
        private final TrackOutput output;
        private final boolean allowNonIdrKeyframes;
        private final boolean detectAccessUnits;
        private int bufferLength;
        private int nalUnitType;
        private long nalUnitStartPosition;
        private boolean isFilling;
        private long nalUnitTimeUs;
        private boolean readingSample;
        private long samplePosition;
        private long sampleTimeUs;
        private boolean sampleIsKeyframe;
        private final SparseArray<NalUnitUtil.SpsData> sps = new SparseArray<>();
        private final SparseArray<NalUnitUtil.PpsData> pps = new SparseArray<>();
        private SliceHeaderData previousSliceHeader = new SliceHeaderData();
        private SliceHeaderData sliceHeader = new SliceHeaderData();
        private final ParsableBitArray scratch = new ParsableBitArray();
        private byte[] buffer = new byte[DEFAULT_BUFFER_SIZE];

        public SampleReader(TrackOutput output, boolean allowNonIdrKeyframes, boolean detectAccessUnits) {
            this.output = output;
            this.allowNonIdrKeyframes = allowNonIdrKeyframes;
            this.detectAccessUnits = detectAccessUnits;
            reset();
        }

        public boolean needsSpsPps() {
            return this.detectAccessUnits;
        }

        public void putSps(NalUnitUtil.SpsData spsData) {
            this.sps.append(spsData.seqParameterSetId, spsData);
        }

        public void putPps(NalUnitUtil.PpsData ppsData) {
            this.pps.append(ppsData.picParameterSetId, ppsData);
        }

        public void reset() {
            this.isFilling = false;
            this.readingSample = false;
            this.sliceHeader.clear();
        }

        public void startNalUnit(long position, int type, long pesTimeUs) {
            this.nalUnitType = type;
            this.nalUnitTimeUs = pesTimeUs;
            this.nalUnitStartPosition = position;
            if (!this.allowNonIdrKeyframes || this.nalUnitType != 1) {
                if (!this.detectAccessUnits) {
                    return;
                }
                if (this.nalUnitType != 5 && this.nalUnitType != 1 && this.nalUnitType != 2) {
                    return;
                }
            }
            SliceHeaderData newSliceHeader = this.previousSliceHeader;
            this.previousSliceHeader = this.sliceHeader;
            this.sliceHeader = newSliceHeader;
            this.sliceHeader.clear();
            this.bufferLength = 0;
            this.isFilling = true;
        }

        public void appendToNalUnit(byte[] data, int offset, int limit) {
            if (!this.isFilling) {
                return;
            }
            int readLength = limit - offset;
            if (this.buffer.length < this.bufferLength + readLength) {
                this.buffer = Arrays.copyOf(this.buffer, (this.bufferLength + readLength) * 2);
            }
            System.arraycopy(data, offset, this.buffer, this.bufferLength, readLength);
            this.bufferLength += readLength;
            this.scratch.reset(this.buffer, this.bufferLength);
            if (this.scratch.bitsLeft() < 8) {
                return;
            }
            this.scratch.skipBits(1);
            int nalRefIdc = this.scratch.readBits(2);
            this.scratch.skipBits(5);
            if (!this.scratch.canReadExpGolombCodedNum()) {
                return;
            }
            this.scratch.readUnsignedExpGolombCodedInt();
            if (!this.scratch.canReadExpGolombCodedNum()) {
                return;
            }
            int sliceType = this.scratch.readUnsignedExpGolombCodedInt();
            if (!this.detectAccessUnits) {
                this.isFilling = false;
                this.sliceHeader.setSliceType(sliceType);
                return;
            }
            if (!this.scratch.canReadExpGolombCodedNum()) {
                return;
            }
            int picParameterSetId = this.scratch.readUnsignedExpGolombCodedInt();
            if (this.pps.indexOfKey(picParameterSetId) < 0) {
                this.isFilling = false;
                return;
            }
            NalUnitUtil.PpsData ppsData = this.pps.get(picParameterSetId);
            NalUnitUtil.SpsData spsData = this.sps.get(ppsData.seqParameterSetId);
            if (spsData.separateColorPlaneFlag) {
                if (this.scratch.bitsLeft() < 2) {
                    return;
                } else {
                    this.scratch.skipBits(2);
                }
            }
            if (this.scratch.bitsLeft() < spsData.frameNumLength) {
                return;
            }
            boolean fieldPicFlag = false;
            boolean bottomFieldFlagPresent = false;
            boolean bottomFieldFlag = false;
            int frameNum = this.scratch.readBits(spsData.frameNumLength);
            if (!spsData.frameMbsOnlyFlag) {
                if (this.scratch.bitsLeft() < 1) {
                    return;
                }
                fieldPicFlag = this.scratch.readBit();
                if (fieldPicFlag) {
                    if (this.scratch.bitsLeft() < 1) {
                        return;
                    }
                    bottomFieldFlag = this.scratch.readBit();
                    bottomFieldFlagPresent = true;
                }
            }
            boolean idrPicFlag = this.nalUnitType == 5;
            int idrPicId = 0;
            if (idrPicFlag) {
                if (!this.scratch.canReadExpGolombCodedNum()) {
                    return;
                } else {
                    idrPicId = this.scratch.readUnsignedExpGolombCodedInt();
                }
            }
            int picOrderCntLsb = 0;
            int deltaPicOrderCntBottom = 0;
            int deltaPicOrderCnt0 = 0;
            int deltaPicOrderCnt1 = 0;
            if (spsData.picOrderCountType == 0) {
                if (this.scratch.bitsLeft() < spsData.picOrderCntLsbLength) {
                    return;
                }
                picOrderCntLsb = this.scratch.readBits(spsData.picOrderCntLsbLength);
                if (ppsData.bottomFieldPicOrderInFramePresentFlag && !fieldPicFlag) {
                    if (!this.scratch.canReadExpGolombCodedNum()) {
                        return;
                    } else {
                        deltaPicOrderCntBottom = this.scratch.readSignedExpGolombCodedInt();
                    }
                }
            } else if (spsData.picOrderCountType == 1 && !spsData.deltaPicOrderAlwaysZeroFlag) {
                if (!this.scratch.canReadExpGolombCodedNum()) {
                    return;
                }
                deltaPicOrderCnt0 = this.scratch.readSignedExpGolombCodedInt();
                if (ppsData.bottomFieldPicOrderInFramePresentFlag && !fieldPicFlag) {
                    if (!this.scratch.canReadExpGolombCodedNum()) {
                        return;
                    } else {
                        deltaPicOrderCnt1 = this.scratch.readSignedExpGolombCodedInt();
                    }
                }
            }
            this.sliceHeader.setAll(spsData, nalRefIdc, sliceType, frameNum, picParameterSetId, fieldPicFlag, bottomFieldFlagPresent, bottomFieldFlag, idrPicFlag, idrPicId, picOrderCntLsb, deltaPicOrderCntBottom, deltaPicOrderCnt0, deltaPicOrderCnt1);
            this.isFilling = false;
        }

        public void endNalUnit(long position, int offset) {
            if (this.nalUnitType == NAL_UNIT_TYPE_AUD || (this.detectAccessUnits && this.sliceHeader.isFirstVclNalUnitOfPicture(this.previousSliceHeader))) {
                if (this.readingSample) {
                    int nalUnitLength = (int) (position - this.nalUnitStartPosition);
                    outputSample(offset + nalUnitLength);
                }
                this.samplePosition = this.nalUnitStartPosition;
                this.sampleTimeUs = this.nalUnitTimeUs;
                this.sampleIsKeyframe = false;
                this.readingSample = true;
            }
            this.sampleIsKeyframe |= this.nalUnitType == 5 || (this.allowNonIdrKeyframes && this.nalUnitType == 1 && this.sliceHeader.isISlice());
        }

        private void outputSample(int offset) {
            int flags = this.sampleIsKeyframe ? 1 : 0;
            int size = (int) (this.nalUnitStartPosition - this.samplePosition);
            this.output.sampleMetadata(this.sampleTimeUs, flags, size, offset, null);
        }

        /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ts/H264Reader$SampleReader$SliceHeaderData.class */
        private static final class SliceHeaderData {
            private static final int SLICE_TYPE_I = 2;
            private static final int SLICE_TYPE_ALL_I = 7;
            private boolean isComplete;
            private boolean hasSliceType;
            private NalUnitUtil.SpsData spsData;
            private int nalRefIdc;
            private int sliceType;
            private int frameNum;
            private int picParameterSetId;
            private boolean fieldPicFlag;
            private boolean bottomFieldFlagPresent;
            private boolean bottomFieldFlag;
            private boolean idrPicFlag;
            private int idrPicId;
            private int picOrderCntLsb;
            private int deltaPicOrderCntBottom;
            private int deltaPicOrderCnt0;
            private int deltaPicOrderCnt1;

            private SliceHeaderData() {
            }

            public void clear() {
                this.hasSliceType = false;
                this.isComplete = false;
            }

            public void setSliceType(int sliceType) {
                this.sliceType = sliceType;
                this.hasSliceType = true;
            }

            public void setAll(NalUnitUtil.SpsData spsData, int nalRefIdc, int sliceType, int frameNum, int picParameterSetId, boolean fieldPicFlag, boolean bottomFieldFlagPresent, boolean bottomFieldFlag, boolean idrPicFlag, int idrPicId, int picOrderCntLsb, int deltaPicOrderCntBottom, int deltaPicOrderCnt0, int deltaPicOrderCnt1) {
                this.spsData = spsData;
                this.nalRefIdc = nalRefIdc;
                this.sliceType = sliceType;
                this.frameNum = frameNum;
                this.picParameterSetId = picParameterSetId;
                this.fieldPicFlag = fieldPicFlag;
                this.bottomFieldFlagPresent = bottomFieldFlagPresent;
                this.bottomFieldFlag = bottomFieldFlag;
                this.idrPicFlag = idrPicFlag;
                this.idrPicId = idrPicId;
                this.picOrderCntLsb = picOrderCntLsb;
                this.deltaPicOrderCntBottom = deltaPicOrderCntBottom;
                this.deltaPicOrderCnt0 = deltaPicOrderCnt0;
                this.deltaPicOrderCnt1 = deltaPicOrderCnt1;
                this.isComplete = true;
                this.hasSliceType = true;
            }

            public boolean isISlice() {
                return this.hasSliceType && (this.sliceType == 7 || this.sliceType == 2);
            }

            /* JADX INFO: Access modifiers changed from: private */
            public boolean isFirstVclNalUnitOfPicture(SliceHeaderData other) {
                return this.isComplete && !(other.isComplete && this.frameNum == other.frameNum && this.picParameterSetId == other.picParameterSetId && this.fieldPicFlag == other.fieldPicFlag && ((!this.bottomFieldFlagPresent || !other.bottomFieldFlagPresent || this.bottomFieldFlag == other.bottomFieldFlag) && ((this.nalRefIdc == other.nalRefIdc || (this.nalRefIdc != 0 && other.nalRefIdc != 0)) && ((this.spsData.picOrderCountType != 0 || other.spsData.picOrderCountType != 0 || (this.picOrderCntLsb == other.picOrderCntLsb && this.deltaPicOrderCntBottom == other.deltaPicOrderCntBottom)) && ((this.spsData.picOrderCountType != 1 || other.spsData.picOrderCountType != 1 || (this.deltaPicOrderCnt0 == other.deltaPicOrderCnt0 && this.deltaPicOrderCnt1 == other.deltaPicOrderCnt1)) && this.idrPicFlag == other.idrPicFlag && (!this.idrPicFlag || !other.idrPicFlag || this.idrPicId == other.idrPicId))))));
            }
        }
    }
}
