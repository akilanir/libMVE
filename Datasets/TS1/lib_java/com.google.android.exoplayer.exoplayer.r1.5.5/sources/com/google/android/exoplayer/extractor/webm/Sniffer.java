package com.google.android.exoplayer.extractor.webm;

import com.google.android.exoplayer.extractor.ExtractorInput;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/extractor/webm/Sniffer.class */
final class Sniffer {
    private static final int SEARCH_LENGTH = 1024;
    private static final int ID_EBML = 440786851;
    private final ParsableByteArray scratch = new ParsableByteArray(8);
    private int peekLength;

    public boolean sniff(ExtractorInput input) throws IOException, InterruptedException {
        long inputLength = input.getLength();
        int bytesToSearch = (int) ((inputLength == -1 || inputLength > 1024) ? 1024L : inputLength);
        input.peekFully(this.scratch.data, 0, 4);
        long tag = this.scratch.readUnsignedInt();
        this.peekLength = 4;
        while (tag != 440786851) {
            int i = this.peekLength + 1;
            this.peekLength = i;
            if (i == bytesToSearch) {
                return false;
            }
            input.peekFully(this.scratch.data, 0, 1);
            tag = ((tag << 8) & (-256)) | (this.scratch.data[0] & 255);
        }
        long headerSize = readUint(input);
        long headerStart = this.peekLength;
        if (headerSize == Long.MIN_VALUE) {
            return false;
        }
        if (inputLength != -1 && headerStart + headerSize >= inputLength) {
            return false;
        }
        while (this.peekLength < headerStart + headerSize) {
            long id = readUint(input);
            if (id == Long.MIN_VALUE) {
                return false;
            }
            long size = readUint(input);
            if (size < 0 || size > 2147483647L) {
                return false;
            }
            if (size != 0) {
                input.advancePeekPosition((int) size);
                this.peekLength = (int) (this.peekLength + size);
            }
        }
        return ((long) this.peekLength) == headerStart + headerSize;
    }

    private long readUint(ExtractorInput input) throws IOException, InterruptedException {
        input.peekFully(this.scratch.data, 0, 1);
        int value = this.scratch.data[0] & 255;
        if (value == 0) {
            return Long.MIN_VALUE;
        }
        int mask = 128;
        int length = 0;
        while ((value & mask) == 0) {
            mask >>= 1;
            length++;
        }
        int value2 = value & (mask ^ (-1));
        input.peekFully(this.scratch.data, 1, length);
        for (int i = 0; i < length; i++) {
            value2 = (value2 << 8) + (this.scratch.data[i + 1] & 255);
        }
        this.peekLength += length + 1;
        return value2;
    }
}
