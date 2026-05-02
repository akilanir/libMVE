package com.google.android.exoplayer;

import java.nio.ByteBuffer;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/SampleHolder.class */
public final class SampleHolder {
    public static final int BUFFER_REPLACEMENT_MODE_DISABLED = 0;
    public static final int BUFFER_REPLACEMENT_MODE_NORMAL = 1;
    public static final int BUFFER_REPLACEMENT_MODE_DIRECT = 2;
    public final CryptoInfo cryptoInfo = new CryptoInfo();
    public ByteBuffer data;
    public int size;
    public int flags;
    public long timeUs;
    private final int bufferReplacementMode;

    public SampleHolder(int bufferReplacementMode) {
        this.bufferReplacementMode = bufferReplacementMode;
    }

    public void ensureSpaceForWrite(int length) throws IllegalStateException {
        if (this.data == null) {
            this.data = createReplacementBuffer(length);
            return;
        }
        int capacity = this.data.capacity();
        int position = this.data.position();
        int requiredCapacity = position + length;
        if (capacity >= requiredCapacity) {
            return;
        }
        ByteBuffer newData = createReplacementBuffer(requiredCapacity);
        if (position > 0) {
            this.data.position(0);
            this.data.limit(position);
            newData.put(this.data);
        }
        this.data = newData;
    }

    public boolean isEncrypted() {
        return (this.flags & 2) != 0;
    }

    public boolean isDecodeOnly() {
        return (this.flags & C.SAMPLE_FLAG_DECODE_ONLY) != 0;
    }

    public boolean isSyncFrame() {
        return (this.flags & 1) != 0;
    }

    public void clearData() {
        if (this.data != null) {
            this.data.clear();
        }
    }

    private ByteBuffer createReplacementBuffer(int requiredCapacity) {
        if (this.bufferReplacementMode == 1) {
            return ByteBuffer.allocate(requiredCapacity);
        }
        if (this.bufferReplacementMode == 2) {
            return ByteBuffer.allocateDirect(requiredCapacity);
        }
        int currentCapacity = this.data == null ? 0 : this.data.capacity();
        throw new IllegalStateException("Buffer too small (" + currentCapacity + " < " + requiredCapacity + ")");
    }
}
