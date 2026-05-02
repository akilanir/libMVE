package com.google.android.exoplayer.upstream;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/upstream/Allocation.class */
public final class Allocation {
    public final byte[] data;
    private final int offset;

    public Allocation(byte[] data, int offset) {
        this.data = data;
        this.offset = offset;
    }

    public int translateOffset(int offset) {
        return this.offset + offset;
    }
}
