package com.google.android.exoplayer.upstream;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/upstream/Allocator.class */
public interface Allocator {
    Allocation allocate();

    void release(Allocation allocation);

    void trim(int i);

    void blockWhileTotalBytesAllocatedExceeds(int i) throws InterruptedException;

    int getTotalBytesAllocated();

    int getIndividualAllocationLength();
}
