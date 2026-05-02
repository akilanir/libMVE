package com.google.android.exoplayer.extractor.ogg;

import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.extractor.ExtractorInput;
import com.google.android.exoplayer.util.ParsableByteArray;
import com.google.android.exoplayer.util.Util;
import java.io.EOFException;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ogg/OggUtil.class */
final class OggUtil {
    private static final int TYPE_OGGS = Util.getIntegerCodeForString("OggS");

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ogg/OggUtil$PacketInfoHolder.class */
    public static class PacketInfoHolder {
        public int size;
        public int segmentCount;
    }

    OggUtil() {
    }

    public static int readBits(byte src, int length, int leastSignificantBitIndex) {
        return (src >> leastSignificantBitIndex) & (255 >>> (8 - length));
    }

    public static void skipToNextPage(ExtractorInput input) throws IOException, InterruptedException {
        byte[] buffer = new byte[2048];
        int peekLength = buffer.length;
        while (true) {
            if (input.getLength() != -1 && input.getPosition() + peekLength > input.getLength()) {
                peekLength = (int) (input.getLength() - input.getPosition());
                if (peekLength < 4) {
                    throw new EOFException();
                }
            }
            input.peekFully(buffer, 0, peekLength, false);
            for (int i = 0; i < peekLength - 3; i++) {
                if (buffer[i] == 79 && buffer[i + 1] == 103 && buffer[i + 2] == 103 && buffer[i + 3] == 83) {
                    input.skipFully(i);
                    return;
                }
            }
            input.skipFully(peekLength - 3);
        }
    }

    public static boolean populatePageHeader(ExtractorInput input, PageHeader header, ParsableByteArray scratch, boolean quite) throws IOException, InterruptedException {
        scratch.reset();
        header.reset();
        boolean hasEnoughBytes = input.getLength() == -1 || input.getLength() - input.getPeekPosition() >= 27;
        if (!hasEnoughBytes || !input.peekFully(scratch.data, 0, 27, true)) {
            if (quite) {
                return false;
            }
            throw new EOFException();
        }
        if (scratch.readUnsignedInt() != TYPE_OGGS) {
            if (quite) {
                return false;
            }
            throw new ParserException("expected OggS capture pattern at begin of page");
        }
        header.revision = scratch.readUnsignedByte();
        if (header.revision != 0) {
            if (quite) {
                return false;
            }
            throw new ParserException("unsupported bit stream revision");
        }
        header.type = scratch.readUnsignedByte();
        header.granulePosition = scratch.readLittleEndianLong();
        header.streamSerialNumber = scratch.readLittleEndianUnsignedInt();
        header.pageSequenceNumber = scratch.readLittleEndianUnsignedInt();
        header.pageChecksum = scratch.readLittleEndianUnsignedInt();
        header.pageSegmentCount = scratch.readUnsignedByte();
        scratch.reset();
        header.headerSize = 27 + header.pageSegmentCount;
        input.peekFully(scratch.data, 0, header.pageSegmentCount);
        for (int i = 0; i < header.pageSegmentCount; i++) {
            header.laces[i] = scratch.readUnsignedByte();
            header.bodySize += header.laces[i];
        }
        return true;
    }

    public static void calculatePacketSize(PageHeader header, int startSegmentIndex, PacketInfoHolder holder) {
        holder.segmentCount = 0;
        holder.size = 0;
        while (startSegmentIndex + holder.segmentCount < header.pageSegmentCount) {
            int[] iArr = header.laces;
            int i = holder.segmentCount;
            holder.segmentCount = i + 1;
            int segmentLength = iArr[startSegmentIndex + i];
            holder.size += segmentLength;
            if (segmentLength != 255) {
                return;
            }
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ogg/OggUtil$PageHeader.class */
    public static final class PageHeader {
        public int revision;
        public int type;
        public long granulePosition;
        public long streamSerialNumber;
        public long pageSequenceNumber;
        public long pageChecksum;
        public int pageSegmentCount;
        public int headerSize;
        public int bodySize;
        public final int[] laces = new int[255];

        public void reset() {
            this.revision = 0;
            this.type = 0;
            this.granulePosition = 0L;
            this.streamSerialNumber = 0L;
            this.pageSequenceNumber = 0L;
            this.pageChecksum = 0L;
            this.pageSegmentCount = 0;
            this.headerSize = 0;
            this.bodySize = 0;
        }
    }
}
