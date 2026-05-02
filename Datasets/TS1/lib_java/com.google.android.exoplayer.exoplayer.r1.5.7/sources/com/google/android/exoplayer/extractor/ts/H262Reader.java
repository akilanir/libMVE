package com.google.android.exoplayer.extractor.ts;

import android.util.Pair;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.extractor.TrackOutput;
import com.google.android.exoplayer.util.MimeTypes;
import com.google.android.exoplayer.util.NalUnitUtil;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.util.Arrays;
import java.util.Collections;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ts/H262Reader.class */
final class H262Reader extends ElementaryStreamReader {
    private static final int START_PICTURE = 0;
    private static final int START_SEQUENCE_HEADER = 179;
    private static final int START_EXTENSION = 181;
    private static final int START_GROUP = 184;
    private static final double[] FRAME_RATE_VALUES = {23.976023976023978d, 24.0d, 25.0d, 29.97002997002997d, 30.0d, 50.0d, 59.94005994005994d, 60.0d};
    private boolean hasOutputFormat;
    private long frameDurationUs;
    private final boolean[] prefixFlags;
    private final CsdBuffer csdBuffer;
    private boolean foundFirstFrameInGroup;
    private long totalBytesWritten;
    private long pesTimeUs;
    private boolean pesPtsUsAvailable;
    private boolean isKeyframe;
    private long framePosition;
    private long frameTimeUs;

    public H262Reader(TrackOutput output) {
        super(output);
        this.prefixFlags = new boolean[4];
        this.csdBuffer = new CsdBuffer(128);
    }

    @Override // com.google.android.exoplayer.extractor.ts.ElementaryStreamReader
    public void seek() {
        NalUnitUtil.clearPrefixFlags(this.prefixFlags);
        this.csdBuffer.reset();
        this.pesPtsUsAvailable = false;
        this.foundFirstFrameInGroup = false;
        this.totalBytesWritten = 0L;
    }

    @Override // com.google.android.exoplayer.extractor.ts.ElementaryStreamReader
    public void packetStarted(long pesTimeUs, boolean dataAlignmentIndicator) {
        this.pesPtsUsAvailable = pesTimeUs != -1;
        if (this.pesPtsUsAvailable) {
            this.pesTimeUs = pesTimeUs;
        }
    }

    @Override // com.google.android.exoplayer.extractor.ts.ElementaryStreamReader
    public void consume(ParsableByteArray data) {
        if (data.bytesLeft() > 0) {
            int offset = data.getPosition();
            int limit = data.limit();
            byte[] dataArray = data.data;
            this.totalBytesWritten += data.bytesLeft();
            this.output.sampleData(data, data.bytesLeft());
            int i = offset;
            while (true) {
                int searchOffset = i;
                int startCodeOffset = NalUnitUtil.findNalUnit(dataArray, searchOffset, limit, this.prefixFlags);
                if (startCodeOffset == limit) {
                    break;
                }
                int startCodeValue = data.data[startCodeOffset + 3] & 255;
                if (!this.hasOutputFormat) {
                    int lengthToStartCode = startCodeOffset - offset;
                    if (lengthToStartCode > 0) {
                        this.csdBuffer.onData(dataArray, offset, startCodeOffset);
                    }
                    int bytesAlreadyPassed = lengthToStartCode < 0 ? -lengthToStartCode : 0;
                    if (this.csdBuffer.onStartCode(startCodeValue, bytesAlreadyPassed)) {
                        Pair<MediaFormat, Long> result = parseCsdBuffer(this.csdBuffer);
                        this.output.format((MediaFormat) result.first);
                        this.frameDurationUs = ((Long) result.second).longValue();
                        this.hasOutputFormat = true;
                    }
                }
                if (this.hasOutputFormat && (startCodeValue == START_GROUP || startCodeValue == 0)) {
                    int bytesWrittenPastStartCode = limit - startCodeOffset;
                    if (this.foundFirstFrameInGroup) {
                        int flags = this.isKeyframe ? 1 : 0;
                        int size = ((int) (this.totalBytesWritten - this.framePosition)) - bytesWrittenPastStartCode;
                        this.output.sampleMetadata(this.frameTimeUs, flags, size, bytesWrittenPastStartCode, null);
                        this.isKeyframe = false;
                    }
                    if (startCodeValue == START_GROUP) {
                        this.foundFirstFrameInGroup = false;
                        this.isKeyframe = true;
                    } else {
                        this.frameTimeUs = this.pesPtsUsAvailable ? this.pesTimeUs : this.frameTimeUs + this.frameDurationUs;
                        this.framePosition = this.totalBytesWritten - bytesWrittenPastStartCode;
                        this.pesPtsUsAvailable = false;
                        this.foundFirstFrameInGroup = true;
                    }
                }
                offset = startCodeOffset;
                i = offset + 3;
            }
            if (!this.hasOutputFormat) {
                this.csdBuffer.onData(dataArray, offset, limit);
            }
        }
    }

    @Override // com.google.android.exoplayer.extractor.ts.ElementaryStreamReader
    public void packetFinished() {
    }

    private static Pair<MediaFormat, Long> parseCsdBuffer(CsdBuffer csdBuffer) {
        byte[] csdData = Arrays.copyOf(csdBuffer.data, csdBuffer.length);
        int firstByte = csdData[4] & 255;
        int secondByte = csdData[5] & 255;
        int thirdByte = csdData[6] & 255;
        int width = (firstByte << 4) | (secondByte >> 4);
        int height = ((secondByte & 15) << 8) | thirdByte;
        float pixelWidthHeightRatio = 1.0f;
        int aspectRatioCode = (csdData[7] & 240) >> 4;
        switch (aspectRatioCode) {
            case 2:
                pixelWidthHeightRatio = (4 * height) / (3 * width);
                break;
            case 3:
                pixelWidthHeightRatio = (16 * height) / (9 * width);
                break;
            case 4:
                pixelWidthHeightRatio = (121 * height) / (100 * width);
                break;
        }
        MediaFormat format = MediaFormat.createVideoFormat(null, MimeTypes.VIDEO_MPEG2, -1, -1, -1L, width, height, Collections.singletonList(csdData), -1, pixelWidthHeightRatio);
        long frameDurationUs = 0;
        int frameRateCodeMinusOne = (csdData[7] & 15) - 1;
        if (0 <= frameRateCodeMinusOne && frameRateCodeMinusOne < FRAME_RATE_VALUES.length) {
            double frameRate = FRAME_RATE_VALUES[frameRateCodeMinusOne];
            int sequenceExtensionPosition = csdBuffer.sequenceExtensionPosition;
            int frameRateExtensionN = (csdData[sequenceExtensionPosition + 9] & 96) >> 5;
            int frameRateExtensionD = csdData[sequenceExtensionPosition + 9] & 31;
            if (frameRateExtensionN != frameRateExtensionD) {
                frameRate *= (frameRateExtensionN + 1.0d) / (frameRateExtensionD + 1);
            }
            frameDurationUs = (long) (1000000.0d / frameRate);
        }
        return Pair.create(format, Long.valueOf(frameDurationUs));
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer.class */
    private static final class CsdBuffer {
        private boolean isFilling;
        public int length;
        public int sequenceExtensionPosition;
        public byte[] data;

        public CsdBuffer(int initialCapacity) {
            this.data = new byte[initialCapacity];
        }

        public void reset() {
            this.isFilling = false;
            this.length = 0;
            this.sequenceExtensionPosition = 0;
        }

        public boolean onStartCode(int startCodeValue, int bytesAlreadyPassed) {
            if (this.isFilling) {
                if (this.sequenceExtensionPosition == 0 && startCodeValue == H262Reader.START_EXTENSION) {
                    this.sequenceExtensionPosition = this.length;
                    return false;
                }
                this.length -= bytesAlreadyPassed;
                this.isFilling = false;
                return true;
            }
            if (startCodeValue == H262Reader.START_SEQUENCE_HEADER) {
                this.isFilling = true;
                return false;
            }
            return false;
        }

        public void onData(byte[] newData, int offset, int limit) {
            if (!this.isFilling) {
                return;
            }
            int readLength = limit - offset;
            if (this.data.length < this.length + readLength) {
                this.data = Arrays.copyOf(this.data, (this.length + readLength) * 2);
            }
            System.arraycopy(newData, offset, this.data, this.length, readLength);
            this.length += readLength;
        }
    }
}
