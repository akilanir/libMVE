package com.google.common.hash;

import com.google.common.base.Preconditions;
import com.google.common.hash.BloomFilter;
import com.google.common.math.LongMath;
import com.google.common.primitives.Ints;
import java.math.RoundingMode;
import java.util.Arrays;

/* loaded from: guava-15.0.jar:com/google/common/hash/BloomFilterStrategies.class */
enum BloomFilterStrategies implements BloomFilter.Strategy {
    MURMUR128_MITZ_32 { // from class: com.google.common.hash.BloomFilterStrategies.1
        @Override // com.google.common.hash.BloomFilter.Strategy
        public <T> boolean put(T object, Funnel<? super T> funnel, int numHashFunctions, BitArray bits) {
            long hash64 = Hashing.murmur3_128().hashObject(object, funnel).asLong();
            int hash1 = (int) hash64;
            int hash2 = (int) (hash64 >>> 32);
            boolean bitsChanged = false;
            for (int i = 1; i <= numHashFunctions; i++) {
                int nextHash = hash1 + (i * hash2);
                if (nextHash < 0) {
                    nextHash ^= -1;
                }
                bitsChanged |= bits.set(nextHash % bits.bitSize());
            }
            return bitsChanged;
        }

        @Override // com.google.common.hash.BloomFilter.Strategy
        public <T> boolean mightContain(T object, Funnel<? super T> funnel, int numHashFunctions, BitArray bits) {
            long hash64 = Hashing.murmur3_128().hashObject(object, funnel).asLong();
            int hash1 = (int) hash64;
            int hash2 = (int) (hash64 >>> 32);
            for (int i = 1; i <= numHashFunctions; i++) {
                int nextHash = hash1 + (i * hash2);
                if (nextHash < 0) {
                    nextHash ^= -1;
                }
                if (!bits.get(nextHash % bits.bitSize())) {
                    return false;
                }
            }
            return true;
        }
    };

    /* loaded from: guava-15.0.jar:com/google/common/hash/BloomFilterStrategies$BitArray.class */
    static class BitArray {
        final long[] data;
        int bitCount;

        BitArray(long bits) {
            this(new long[Ints.checkedCast(LongMath.divide(bits, 64L, RoundingMode.CEILING))]);
        }

        BitArray(long[] data) {
            Preconditions.checkArgument(data.length > 0, "data length is zero!");
            this.data = data;
            int bitCount = 0;
            for (long value : data) {
                bitCount += Long.bitCount(value);
            }
            this.bitCount = bitCount;
        }

        boolean set(int index) {
            if (!get(index)) {
                long[] jArr = this.data;
                int i = index >> 6;
                jArr[i] = jArr[i] | (1 << index);
                this.bitCount++;
                return true;
            }
            return false;
        }

        boolean get(int index) {
            return (this.data[index >> 6] & (1 << index)) != 0;
        }

        int bitSize() {
            return this.data.length * 64;
        }

        int bitCount() {
            return this.bitCount;
        }

        BitArray copy() {
            return new BitArray((long[]) this.data.clone());
        }

        void putAll(BitArray array) {
            Preconditions.checkArgument(this.data.length == array.data.length, "BitArrays must be of equal length (%s != %s)", Integer.valueOf(this.data.length), Integer.valueOf(array.data.length));
            this.bitCount = 0;
            for (int i = 0; i < this.data.length; i++) {
                long[] jArr = this.data;
                int i2 = i;
                jArr[i2] = jArr[i2] | array.data[i];
                this.bitCount += Long.bitCount(this.data[i]);
            }
        }

        public boolean equals(Object o) {
            if (o instanceof BitArray) {
                BitArray bitArray = (BitArray) o;
                return Arrays.equals(this.data, bitArray.data);
            }
            return false;
        }

        public int hashCode() {
            return Arrays.hashCode(this.data);
        }
    }
}
