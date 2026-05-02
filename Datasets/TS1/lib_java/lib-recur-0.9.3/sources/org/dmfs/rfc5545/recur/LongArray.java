package org.dmfs.rfc5545.recur;

import java.util.Arrays;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/LongArray.class */
final class LongArray {
    private static final int DEFAULT_SIZE = 48;
    private long[] mLongs;
    private int mCount;
    private int mPos;
    private boolean mSorted;

    public LongArray() {
        this(DEFAULT_SIZE);
    }

    public LongArray(int i) {
        this.mCount = 0;
        this.mPos = 0;
        this.mSorted = true;
        this.mLongs = new long[i];
    }

    public void add(long j) {
        long[] jArr = this.mLongs;
        int length = jArr.length;
        int i = this.mCount;
        if (i == length) {
            jArr = resizeBuffer(length + (length >> 1));
        }
        this.mSorted &= i == 0 || j > jArr[i - 1];
        jArr[i] = j;
        this.mCount = i + 1;
    }

    private long[] resizeBuffer(int i) {
        long[] jArr = new long[i];
        long[] jArr2 = this.mLongs;
        System.arraycopy(jArr2, 0, jArr, 0, Math.min(jArr2.length, i));
        this.mLongs = jArr;
        return jArr;
    }

    public void sort() {
        if (this.mSorted) {
            return;
        }
        Arrays.sort(this.mLongs, 0, this.mCount);
        this.mSorted = true;
    }

    public void clear() {
        this.mCount = 0;
        this.mPos = 0;
        this.mSorted = true;
    }

    public int size() {
        return this.mCount;
    }

    public boolean hasNext() {
        return this.mPos < this.mCount;
    }

    public long next() {
        if (this.mPos >= this.mCount) {
            throw new ArrayIndexOutOfBoundsException("no more elements");
        }
        long[] jArr = this.mLongs;
        int i = this.mPos;
        this.mPos = i + 1;
        return jArr[i];
    }

    public long peek() {
        if (this.mPos >= this.mCount) {
            throw new ArrayIndexOutOfBoundsException("no more elements");
        }
        return this.mLongs[this.mPos];
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v6, types: [long[]] */
    public void deduplicate() {
        if (this.mSorted) {
            return;
        }
        int i = this.mCount;
        sort();
        ?? r0 = this.mLongs;
        int i2 = 1;
        long j = r0[0];
        for (int i3 = 1; i3 < i; i3++) {
            long j2 = r0[i3];
            if (j2 > j) {
                i2++;
                j = j2;
                r0[r0] = j2;
            }
        }
        this.mCount = i2;
    }
}
