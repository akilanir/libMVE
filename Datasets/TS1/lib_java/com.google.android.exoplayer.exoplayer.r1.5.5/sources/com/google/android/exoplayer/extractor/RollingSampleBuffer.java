package com.google.android.exoplayer.extractor;

import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.upstream.Allocation;
import com.google.android.exoplayer.upstream.Allocator;
import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.io.EOFException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.concurrent.LinkedBlockingDeque;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/extractor/RollingSampleBuffer.class */
final class RollingSampleBuffer {
    private static final int INITIAL_SCRATCH_SIZE = 32;
    private final Allocator allocator;
    private final int allocationLength;
    private final InfoQueue infoQueue = new InfoQueue();
    private final LinkedBlockingDeque<Allocation> dataQueue = new LinkedBlockingDeque<>();
    private final SampleExtrasHolder extrasHolder = new SampleExtrasHolder();
    private final ParsableByteArray scratch = new ParsableByteArray(32);
    private long totalBytesDropped;
    private long totalBytesWritten;
    private Allocation lastAllocation;
    private int lastAllocationOffset;

    public RollingSampleBuffer(Allocator allocator) {
        this.allocator = allocator;
        this.allocationLength = allocator.getIndividualAllocationLength();
        this.lastAllocationOffset = this.allocationLength;
    }

    public void clear() {
        this.infoQueue.clear();
        while (!this.dataQueue.isEmpty()) {
            this.allocator.release(this.dataQueue.remove());
        }
        this.totalBytesDropped = 0L;
        this.totalBytesWritten = 0L;
        this.lastAllocation = null;
        this.lastAllocationOffset = this.allocationLength;
    }

    public int getWriteIndex() {
        return this.infoQueue.getWriteIndex();
    }

    public void discardUpstreamSamples(int discardFromIndex) {
        this.totalBytesWritten = this.infoQueue.discardUpstreamSamples(discardFromIndex);
        dropUpstreamFrom(this.totalBytesWritten);
    }

    private void dropUpstreamFrom(long absolutePosition) {
        int relativePosition = (int) (absolutePosition - this.totalBytesDropped);
        int allocationIndex = relativePosition / this.allocationLength;
        int allocationOffset = relativePosition % this.allocationLength;
        int allocationDiscardCount = (this.dataQueue.size() - allocationIndex) - 1;
        if (allocationOffset == 0) {
            allocationDiscardCount++;
        }
        for (int i = 0; i < allocationDiscardCount; i++) {
            this.allocator.release(this.dataQueue.removeLast());
        }
        this.lastAllocation = this.dataQueue.peekLast();
        this.lastAllocationOffset = allocationOffset == 0 ? this.allocationLength : allocationOffset;
    }

    public int getReadIndex() {
        return this.infoQueue.getReadIndex();
    }

    public boolean peekSample(SampleHolder holder) {
        return this.infoQueue.peekSample(holder, this.extrasHolder);
    }

    public void skipSample() {
        long nextOffset = this.infoQueue.moveToNextSample();
        dropDownstreamTo(nextOffset);
    }

    public boolean skipToKeyframeBefore(long timeUs) {
        long nextOffset = this.infoQueue.skipToKeyframeBefore(timeUs);
        if (nextOffset == -1) {
            return false;
        }
        dropDownstreamTo(nextOffset);
        return true;
    }

    public boolean readSample(SampleHolder sampleHolder) {
        boolean haveSample = this.infoQueue.peekSample(sampleHolder, this.extrasHolder);
        if (!haveSample) {
            return false;
        }
        if (sampleHolder.isEncrypted()) {
            readEncryptionData(sampleHolder, this.extrasHolder);
        }
        sampleHolder.ensureSpaceForWrite(sampleHolder.size);
        readData(this.extrasHolder.offset, sampleHolder.data, sampleHolder.size);
        long nextOffset = this.infoQueue.moveToNextSample();
        dropDownstreamTo(nextOffset);
        return true;
    }

    private void readEncryptionData(SampleHolder sampleHolder, SampleExtrasHolder extrasHolder) {
        int subsampleCount;
        long offset = extrasHolder.offset;
        readData(offset, this.scratch.data, 1);
        long offset2 = offset + 1;
        byte signalByte = this.scratch.data[0];
        boolean subsampleEncryption = (signalByte & 128) != 0;
        int ivSize = signalByte & Byte.MAX_VALUE;
        if (sampleHolder.cryptoInfo.iv == null) {
            sampleHolder.cryptoInfo.iv = new byte[16];
        }
        readData(offset2, sampleHolder.cryptoInfo.iv, ivSize);
        long offset3 = offset2 + ivSize;
        if (subsampleEncryption) {
            readData(offset3, this.scratch.data, 2);
            offset3 += 2;
            this.scratch.setPosition(0);
            subsampleCount = this.scratch.readUnsignedShort();
        } else {
            subsampleCount = 1;
        }
        int[] clearDataSizes = sampleHolder.cryptoInfo.numBytesOfClearData;
        if (clearDataSizes == null || clearDataSizes.length < subsampleCount) {
            clearDataSizes = new int[subsampleCount];
        }
        int[] encryptedDataSizes = sampleHolder.cryptoInfo.numBytesOfEncryptedData;
        if (encryptedDataSizes == null || encryptedDataSizes.length < subsampleCount) {
            encryptedDataSizes = new int[subsampleCount];
        }
        if (subsampleEncryption) {
            int subsampleDataLength = 6 * subsampleCount;
            ensureCapacity(this.scratch, subsampleDataLength);
            readData(offset3, this.scratch.data, subsampleDataLength);
            offset3 += subsampleDataLength;
            this.scratch.setPosition(0);
            for (int i = 0; i < subsampleCount; i++) {
                clearDataSizes[i] = this.scratch.readUnsignedShort();
                encryptedDataSizes[i] = this.scratch.readUnsignedIntToInt();
            }
        } else {
            clearDataSizes[0] = 0;
            encryptedDataSizes[0] = sampleHolder.size - ((int) (offset3 - extrasHolder.offset));
        }
        sampleHolder.cryptoInfo.set(subsampleCount, clearDataSizes, encryptedDataSizes, extrasHolder.encryptionKeyId, sampleHolder.cryptoInfo.iv, 1);
        int bytesRead = (int) (offset3 - extrasHolder.offset);
        extrasHolder.offset += bytesRead;
        sampleHolder.size -= bytesRead;
    }

    private void readData(long absolutePosition, ByteBuffer target, int length) {
        int i = length;
        while (true) {
            int remaining = i;
            if (remaining > 0) {
                dropDownstreamTo(absolutePosition);
                int positionInAllocation = (int) (absolutePosition - this.totalBytesDropped);
                int toCopy = Math.min(remaining, this.allocationLength - positionInAllocation);
                Allocation allocation = this.dataQueue.peek();
                target.put(allocation.data, allocation.translateOffset(positionInAllocation), toCopy);
                absolutePosition += toCopy;
                i = remaining - toCopy;
            } else {
                return;
            }
        }
    }

    private void readData(long absolutePosition, byte[] target, int length) {
        int i = 0;
        while (true) {
            int bytesRead = i;
            if (bytesRead < length) {
                dropDownstreamTo(absolutePosition);
                int positionInAllocation = (int) (absolutePosition - this.totalBytesDropped);
                int toCopy = Math.min(length - bytesRead, this.allocationLength - positionInAllocation);
                Allocation allocation = this.dataQueue.peek();
                System.arraycopy(allocation.data, allocation.translateOffset(positionInAllocation), target, bytesRead, toCopy);
                absolutePosition += toCopy;
                i = bytesRead + toCopy;
            } else {
                return;
            }
        }
    }

    private void dropDownstreamTo(long absolutePosition) {
        int relativePosition = (int) (absolutePosition - this.totalBytesDropped);
        int allocationIndex = relativePosition / this.allocationLength;
        for (int i = 0; i < allocationIndex; i++) {
            this.allocator.release(this.dataQueue.remove());
            this.totalBytesDropped += this.allocationLength;
        }
    }

    private static void ensureCapacity(ParsableByteArray byteArray, int limit) {
        if (byteArray.limit() < limit) {
            byteArray.reset(new byte[limit], limit);
        }
    }

    public long getWritePosition() {
        return this.totalBytesWritten;
    }

    public int appendData(DataSource dataSource, int length, boolean allowEndOfInput) throws IOException {
        int bytesAppended = dataSource.read(this.lastAllocation.data, this.lastAllocation.translateOffset(this.lastAllocationOffset), prepareForAppend(length));
        if (bytesAppended == -1) {
            if (allowEndOfInput) {
                return -1;
            }
            throw new EOFException();
        }
        this.lastAllocationOffset += bytesAppended;
        this.totalBytesWritten += bytesAppended;
        return bytesAppended;
    }

    public int appendData(ExtractorInput input, int length, boolean allowEndOfInput) throws IOException, InterruptedException {
        int bytesAppended = input.read(this.lastAllocation.data, this.lastAllocation.translateOffset(this.lastAllocationOffset), prepareForAppend(length));
        if (bytesAppended == -1) {
            if (allowEndOfInput) {
                return -1;
            }
            throw new EOFException();
        }
        this.lastAllocationOffset += bytesAppended;
        this.totalBytesWritten += bytesAppended;
        return bytesAppended;
    }

    public void appendData(ParsableByteArray buffer, int length) {
        while (length > 0) {
            int thisAppendLength = prepareForAppend(length);
            buffer.readBytes(this.lastAllocation.data, this.lastAllocation.translateOffset(this.lastAllocationOffset), thisAppendLength);
            this.lastAllocationOffset += thisAppendLength;
            this.totalBytesWritten += thisAppendLength;
            length -= thisAppendLength;
        }
    }

    public void commitSample(long sampleTimeUs, int flags, long position, int size, byte[] encryptionKey) {
        this.infoQueue.commitSample(sampleTimeUs, flags, position, size, encryptionKey);
    }

    private int prepareForAppend(int length) {
        if (this.lastAllocationOffset == this.allocationLength) {
            this.lastAllocationOffset = 0;
            this.lastAllocation = this.allocator.allocate();
            this.dataQueue.add(this.lastAllocation);
        }
        return Math.min(length, this.allocationLength - this.lastAllocationOffset);
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/extractor/RollingSampleBuffer$InfoQueue.class */
    private static final class InfoQueue {
        private static final int SAMPLE_CAPACITY_INCREMENT = 1000;
        private int queueSize;
        private int absoluteReadIndex;
        private int relativeReadIndex;
        private int relativeWriteIndex;
        private int capacity = SAMPLE_CAPACITY_INCREMENT;
        private long[] offsets = new long[this.capacity];
        private long[] timesUs = new long[this.capacity];
        private int[] flags = new int[this.capacity];
        private int[] sizes = new int[this.capacity];
        private byte[][] encryptionKeys = new byte[this.capacity];

        public void clear() {
            this.absoluteReadIndex = 0;
            this.relativeReadIndex = 0;
            this.relativeWriteIndex = 0;
            this.queueSize = 0;
        }

        public int getWriteIndex() {
            return this.absoluteReadIndex + this.queueSize;
        }

        public long discardUpstreamSamples(int discardFromIndex) {
            int discardCount = getWriteIndex() - discardFromIndex;
            Assertions.checkArgument(0 <= discardCount && discardCount <= this.queueSize);
            if (discardCount == 0) {
                if (this.absoluteReadIndex == 0) {
                    return 0L;
                }
                int lastWriteIndex = (this.relativeWriteIndex == 0 ? this.capacity : this.relativeWriteIndex) - 1;
                return this.offsets[lastWriteIndex] + this.sizes[lastWriteIndex];
            }
            this.queueSize -= discardCount;
            this.relativeWriteIndex = ((this.relativeWriteIndex + this.capacity) - discardCount) % this.capacity;
            return this.offsets[this.relativeWriteIndex];
        }

        public int getReadIndex() {
            return this.absoluteReadIndex;
        }

        public synchronized boolean peekSample(SampleHolder holder, SampleExtrasHolder extrasHolder) {
            if (this.queueSize == 0) {
                return false;
            }
            holder.timeUs = this.timesUs[this.relativeReadIndex];
            holder.size = this.sizes[this.relativeReadIndex];
            holder.flags = this.flags[this.relativeReadIndex];
            extrasHolder.offset = this.offsets[this.relativeReadIndex];
            extrasHolder.encryptionKeyId = this.encryptionKeys[this.relativeReadIndex];
            return true;
        }

        public synchronized long moveToNextSample() {
            this.queueSize--;
            int lastReadIndex = this.relativeReadIndex;
            this.relativeReadIndex = lastReadIndex + 1;
            this.absoluteReadIndex++;
            if (this.relativeReadIndex == this.capacity) {
                this.relativeReadIndex = 0;
            }
            return this.queueSize > 0 ? this.offsets[this.relativeReadIndex] : this.sizes[lastReadIndex] + this.offsets[lastReadIndex];
        }

        public synchronized long skipToKeyframeBefore(long timeUs) {
            if (this.queueSize == 0 || timeUs < this.timesUs[this.relativeReadIndex]) {
                return -1L;
            }
            int lastWriteIndex = (this.relativeWriteIndex == 0 ? this.capacity : this.relativeWriteIndex) - 1;
            long lastTimeUs = this.timesUs[lastWriteIndex];
            if (timeUs > lastTimeUs) {
                return -1L;
            }
            int sampleCount = 0;
            int sampleCountToKeyframe = -1;
            int searchIndex = this.relativeReadIndex;
            while (searchIndex != this.relativeWriteIndex && this.timesUs[searchIndex] <= timeUs) {
                if ((this.flags[searchIndex] & 1) != 0) {
                    sampleCountToKeyframe = sampleCount;
                }
                searchIndex = (searchIndex + 1) % this.capacity;
                sampleCount++;
            }
            if (sampleCountToKeyframe == -1) {
                return -1L;
            }
            this.queueSize -= sampleCountToKeyframe;
            this.relativeReadIndex = (this.relativeReadIndex + sampleCountToKeyframe) % this.capacity;
            this.absoluteReadIndex += sampleCountToKeyframe;
            return this.offsets[this.relativeReadIndex];
        }

        /* JADX WARN: Type inference failed for: r0v29, types: [byte[], byte[][], java.lang.Object] */
        public synchronized void commitSample(long timeUs, int sampleFlags, long offset, int size, byte[] encryptionKey) {
            this.timesUs[this.relativeWriteIndex] = timeUs;
            this.offsets[this.relativeWriteIndex] = offset;
            this.sizes[this.relativeWriteIndex] = size;
            this.flags[this.relativeWriteIndex] = sampleFlags;
            this.encryptionKeys[this.relativeWriteIndex] = encryptionKey;
            this.queueSize++;
            if (this.queueSize == this.capacity) {
                int newCapacity = this.capacity + SAMPLE_CAPACITY_INCREMENT;
                long[] newOffsets = new long[newCapacity];
                long[] newTimesUs = new long[newCapacity];
                int[] newFlags = new int[newCapacity];
                int[] newSizes = new int[newCapacity];
                ?? r0 = new byte[newCapacity];
                int beforeWrap = this.capacity - this.relativeReadIndex;
                System.arraycopy(this.offsets, this.relativeReadIndex, newOffsets, 0, beforeWrap);
                System.arraycopy(this.timesUs, this.relativeReadIndex, newTimesUs, 0, beforeWrap);
                System.arraycopy(this.flags, this.relativeReadIndex, newFlags, 0, beforeWrap);
                System.arraycopy(this.sizes, this.relativeReadIndex, newSizes, 0, beforeWrap);
                System.arraycopy(this.encryptionKeys, this.relativeReadIndex, r0, 0, beforeWrap);
                int afterWrap = this.relativeReadIndex;
                System.arraycopy(this.offsets, 0, newOffsets, beforeWrap, afterWrap);
                System.arraycopy(this.timesUs, 0, newTimesUs, beforeWrap, afterWrap);
                System.arraycopy(this.flags, 0, newFlags, beforeWrap, afterWrap);
                System.arraycopy(this.sizes, 0, newSizes, beforeWrap, afterWrap);
                System.arraycopy(this.encryptionKeys, 0, r0, beforeWrap, afterWrap);
                this.offsets = newOffsets;
                this.timesUs = newTimesUs;
                this.flags = newFlags;
                this.sizes = newSizes;
                this.encryptionKeys = r0;
                this.relativeReadIndex = 0;
                this.relativeWriteIndex = this.capacity;
                this.queueSize = this.capacity;
                this.capacity = newCapacity;
                return;
            }
            this.relativeWriteIndex++;
            if (this.relativeWriteIndex == this.capacity) {
                this.relativeWriteIndex = 0;
            }
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/extractor/RollingSampleBuffer$SampleExtrasHolder.class */
    private static final class SampleExtrasHolder {
        public long offset;
        public byte[] encryptionKeyId;

        private SampleExtrasHolder() {
        }
    }
}
