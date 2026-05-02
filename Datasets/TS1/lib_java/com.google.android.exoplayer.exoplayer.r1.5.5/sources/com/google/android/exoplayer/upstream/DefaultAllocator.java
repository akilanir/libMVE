package com.google.android.exoplayer.upstream;

import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Util;
import java.util.Arrays;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/upstream/DefaultAllocator.class */
public final class DefaultAllocator implements Allocator {
    private static final int AVAILABLE_EXTRA_CAPACITY = 100;
    private final int individualAllocationSize;
    private final byte[] initialAllocationBlock;
    private int allocatedCount;
    private int availableCount;
    private Allocation[] availableAllocations;

    public DefaultAllocator(int individualAllocationSize) {
        this(individualAllocationSize, 0);
    }

    public DefaultAllocator(int individualAllocationSize, int initialAllocationCount) {
        Assertions.checkArgument(individualAllocationSize > 0);
        Assertions.checkArgument(initialAllocationCount >= 0);
        this.individualAllocationSize = individualAllocationSize;
        this.availableCount = initialAllocationCount;
        this.availableAllocations = new Allocation[initialAllocationCount + AVAILABLE_EXTRA_CAPACITY];
        if (initialAllocationCount > 0) {
            this.initialAllocationBlock = new byte[initialAllocationCount * individualAllocationSize];
            for (int i = 0; i < initialAllocationCount; i++) {
                int allocationOffset = i * individualAllocationSize;
                this.availableAllocations[i] = new Allocation(this.initialAllocationBlock, allocationOffset);
            }
            return;
        }
        this.initialAllocationBlock = null;
    }

    @Override // com.google.android.exoplayer.upstream.Allocator
    public synchronized Allocation allocate() {
        Allocation allocation;
        this.allocatedCount++;
        if (this.availableCount > 0) {
            Allocation[] allocationArr = this.availableAllocations;
            int i = this.availableCount - 1;
            this.availableCount = i;
            allocation = allocationArr[i];
            this.availableAllocations[this.availableCount] = null;
        } else {
            allocation = new Allocation(new byte[this.individualAllocationSize], 0);
        }
        return allocation;
    }

    @Override // com.google.android.exoplayer.upstream.Allocator
    public synchronized void release(Allocation allocation) {
        Assertions.checkArgument(allocation.data == this.initialAllocationBlock || allocation.data.length == this.individualAllocationSize);
        this.allocatedCount--;
        if (this.availableCount == this.availableAllocations.length) {
            this.availableAllocations = (Allocation[]) Arrays.copyOf(this.availableAllocations, this.availableAllocations.length * 2);
        }
        Allocation[] allocationArr = this.availableAllocations;
        int i = this.availableCount;
        this.availableCount = i + 1;
        allocationArr[i] = allocation;
        notifyAll();
    }

    @Override // com.google.android.exoplayer.upstream.Allocator
    public synchronized void trim(int targetSize) {
        int targetAllocationCount = Util.ceilDivide(targetSize, this.individualAllocationSize);
        int targetAvailableCount = Math.max(0, targetAllocationCount - this.allocatedCount);
        if (targetAvailableCount >= this.availableCount) {
            return;
        }
        if (this.initialAllocationBlock != null) {
            int lowIndex = 0;
            int highIndex = this.availableCount - 1;
            while (lowIndex <= highIndex) {
                Allocation lowAllocation = this.availableAllocations[lowIndex];
                if (lowAllocation.data == this.initialAllocationBlock) {
                    lowIndex++;
                } else {
                    Allocation highAllocation = this.availableAllocations[lowIndex];
                    if (highAllocation.data != this.initialAllocationBlock) {
                        highIndex--;
                    } else {
                        int i = lowIndex;
                        lowIndex++;
                        this.availableAllocations[i] = highAllocation;
                        int i2 = highIndex;
                        highIndex--;
                        this.availableAllocations[i2] = lowAllocation;
                    }
                }
            }
            targetAvailableCount = Math.max(targetAvailableCount, lowIndex);
            if (targetAvailableCount >= this.availableCount) {
                return;
            }
        }
        Arrays.fill(this.availableAllocations, targetAvailableCount, this.availableCount, (Object) null);
        this.availableCount = targetAvailableCount;
    }

    @Override // com.google.android.exoplayer.upstream.Allocator
    public synchronized int getTotalBytesAllocated() {
        return this.allocatedCount * this.individualAllocationSize;
    }

    @Override // com.google.android.exoplayer.upstream.Allocator
    public synchronized void blockWhileTotalBytesAllocatedExceeds(int limit) throws InterruptedException {
        while (getTotalBytesAllocated() > limit) {
            wait();
        }
    }

    @Override // com.google.android.exoplayer.upstream.Allocator
    public int getIndividualAllocationLength() {
        return this.individualAllocationSize;
    }
}
