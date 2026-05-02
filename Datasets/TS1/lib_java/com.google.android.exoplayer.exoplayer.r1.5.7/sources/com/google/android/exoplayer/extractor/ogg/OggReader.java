package com.google.android.exoplayer.extractor.ogg;

import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.extractor.ExtractorInput;
import com.google.android.exoplayer.extractor.ogg.OggUtil;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ogg/OggReader.class */
final class OggReader {
    public static final int OGG_MAX_SEGMENT_SIZE = 255;
    private final OggUtil.PageHeader pageHeader = new OggUtil.PageHeader();
    private final ParsableByteArray headerArray = new ParsableByteArray(282);
    private final OggUtil.PacketInfoHolder holder = new OggUtil.PacketInfoHolder();
    private int currentSegmentIndex = -1;
    private long elapsedSamples;

    OggReader() {
    }

    public void reset() {
        this.pageHeader.reset();
        this.headerArray.reset();
        this.currentSegmentIndex = -1;
    }

    public boolean readPacket(ExtractorInput input, ParsableByteArray packetArray) throws IOException, InterruptedException {
        Assertions.checkState((input == null || packetArray == null) ? false : true);
        boolean packetComplete = false;
        while (!packetComplete) {
            if (this.currentSegmentIndex < 0) {
                if (!OggUtil.populatePageHeader(input, this.pageHeader, this.headerArray, true)) {
                    return false;
                }
                int segmentIndex = 0;
                int bytesToSkip = this.pageHeader.headerSize;
                if ((this.pageHeader.type & 1) == 1 && packetArray.limit() == 0) {
                    OggUtil.calculatePacketSize(this.pageHeader, 0, this.holder);
                    segmentIndex = 0 + this.holder.segmentCount;
                    bytesToSkip += this.holder.size;
                }
                input.skipFully(bytesToSkip);
                this.currentSegmentIndex = segmentIndex;
            }
            OggUtil.calculatePacketSize(this.pageHeader, this.currentSegmentIndex, this.holder);
            int segmentIndex2 = this.currentSegmentIndex + this.holder.segmentCount;
            if (this.holder.size > 0) {
                input.readFully(packetArray.data, packetArray.limit(), this.holder.size);
                packetArray.setLimit(packetArray.limit() + this.holder.size);
                packetComplete = this.pageHeader.laces[segmentIndex2 - 1] != 255;
            }
            this.currentSegmentIndex = segmentIndex2 == this.pageHeader.pageSegmentCount ? -1 : segmentIndex2;
        }
        return true;
    }

    public long readGranuleOfLastPage(ExtractorInput input) throws IOException, InterruptedException {
        Assertions.checkArgument(input.getLength() != -1);
        OggUtil.skipToNextPage(input);
        this.pageHeader.reset();
        while ((this.pageHeader.type & 4) != 4) {
            if (this.pageHeader.bodySize > 0) {
                input.skipFully(this.pageHeader.bodySize);
            }
            OggUtil.populatePageHeader(input, this.pageHeader, this.headerArray, false);
            input.skipFully(this.pageHeader.headerSize);
        }
        return this.pageHeader.granulePosition;
    }

    public long skipToPageOfGranule(ExtractorInput input, long targetGranule) throws IOException, InterruptedException {
        OggUtil.skipToNextPage(input);
        OggUtil.populatePageHeader(input, this.pageHeader, this.headerArray, false);
        while (this.pageHeader.granulePosition < targetGranule) {
            input.skipFully(this.pageHeader.headerSize + this.pageHeader.bodySize);
            this.elapsedSamples = this.pageHeader.granulePosition;
            OggUtil.populatePageHeader(input, this.pageHeader, this.headerArray, false);
        }
        if (this.elapsedSamples == 0) {
            throw new ParserException();
        }
        input.resetPeekPosition();
        long returnValue = this.elapsedSamples;
        this.elapsedSamples = 0L;
        this.currentSegmentIndex = -1;
        return returnValue;
    }

    public OggUtil.PageHeader getPageHeader() {
        return this.pageHeader;
    }
}
