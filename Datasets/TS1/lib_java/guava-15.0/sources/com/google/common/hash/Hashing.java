package com.google.common.hash;

import com.google.common.annotations.Beta;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import java.nio.ByteBuffer;
import java.util.Iterator;
import java.util.zip.Adler32;
import java.util.zip.CRC32;
import java.util.zip.Checksum;
import javax.annotation.Nullable;

@Beta
/* loaded from: guava-15.0.jar:com/google/common/hash/Hashing.class */
public final class Hashing {
    private static final int GOOD_FAST_HASH_SEED = (int) System.currentTimeMillis();
    private static final HashFunction GOOD_FAST_HASH_FUNCTION_32 = murmur3_32(GOOD_FAST_HASH_SEED);
    private static final HashFunction GOOD_FAST_HASH_FUNCTION_128 = murmur3_128(GOOD_FAST_HASH_SEED);
    private static final HashFunction MURMUR3_32 = new Murmur3_32HashFunction(0);
    private static final HashFunction MURMUR3_128 = new Murmur3_128HashFunction(0);
    private static final HashFunction SIP_HASH_24 = new SipHashFunction(2, 4, 506097522914230528L, 1084818905618843912L);
    private static final HashFunction MD5 = new MessageDigestHashFunction("MD5", "Hashing.md5()");
    private static final HashFunction SHA_1 = new MessageDigestHashFunction("SHA-1", "Hashing.sha1()");
    private static final HashFunction SHA_256 = new MessageDigestHashFunction("SHA-256", "Hashing.sha256()");
    private static final HashFunction SHA_512 = new MessageDigestHashFunction("SHA-512", "Hashing.sha512()");
    private static final HashFunction CRC_32 = checksumHashFunction(ChecksumType.CRC_32, "Hashing.crc32()");
    private static final HashFunction ADLER_32 = checksumHashFunction(ChecksumType.ADLER_32, "Hashing.adler32()");

    public static HashFunction goodFastHash(int minimumBits) {
        int bits = checkPositiveAndMakeMultipleOf32(minimumBits);
        if (bits == 32) {
            return GOOD_FAST_HASH_FUNCTION_32;
        }
        if (bits <= 128) {
            return GOOD_FAST_HASH_FUNCTION_128;
        }
        int hashFunctionsNeeded = (bits + 127) / 128;
        HashFunction[] hashFunctions = new HashFunction[hashFunctionsNeeded];
        hashFunctions[0] = GOOD_FAST_HASH_FUNCTION_128;
        int seed = GOOD_FAST_HASH_SEED;
        for (int i = 1; i < hashFunctionsNeeded; i++) {
            seed += 1500450271;
            hashFunctions[i] = murmur3_128(seed);
        }
        return new ConcatenatedHashFunction(hashFunctions);
    }

    public static HashFunction murmur3_32(int seed) {
        return new Murmur3_32HashFunction(seed);
    }

    public static HashFunction murmur3_32() {
        return MURMUR3_32;
    }

    public static HashFunction murmur3_128(int seed) {
        return new Murmur3_128HashFunction(seed);
    }

    public static HashFunction murmur3_128() {
        return MURMUR3_128;
    }

    public static HashFunction sipHash24() {
        return SIP_HASH_24;
    }

    public static HashFunction sipHash24(long k0, long k1) {
        return new SipHashFunction(2, 4, k0, k1);
    }

    public static HashFunction md5() {
        return MD5;
    }

    public static HashFunction sha1() {
        return SHA_1;
    }

    public static HashFunction sha256() {
        return SHA_256;
    }

    public static HashFunction sha512() {
        return SHA_512;
    }

    public static HashFunction crc32() {
        return CRC_32;
    }

    public static HashFunction adler32() {
        return ADLER_32;
    }

    private static HashFunction checksumHashFunction(ChecksumType type, String toString) {
        return new ChecksumHashFunction(type, type.bits, toString);
    }

    /* loaded from: guava-15.0.jar:com/google/common/hash/Hashing$ChecksumType.class */
    enum ChecksumType implements Supplier<Checksum> {
        CRC_32(32) { // from class: com.google.common.hash.Hashing.ChecksumType.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.google.common.hash.Hashing.ChecksumType, com.google.common.base.Supplier
            public Checksum get() {
                return new CRC32();
            }
        },
        ADLER_32(32) { // from class: com.google.common.hash.Hashing.ChecksumType.2
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.google.common.hash.Hashing.ChecksumType, com.google.common.base.Supplier
            public Checksum get() {
                return new Adler32();
            }
        };

        private final int bits;

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.common.base.Supplier
        public abstract Checksum get();

        ChecksumType(int bits) {
            this.bits = bits;
        }
    }

    public static int consistentHash(HashCode hashCode, int buckets) {
        return consistentHash(hashCode.padToLong(), buckets);
    }

    public static int consistentHash(long input, int buckets) {
        int candidate;
        Preconditions.checkArgument(buckets > 0, "buckets must be positive: %s", Integer.valueOf(buckets));
        LinearCongruentialGenerator generator = new LinearCongruentialGenerator(input);
        int i = 0;
        while (true) {
            candidate = i;
            int next = (int) ((candidate + 1) / generator.nextDouble());
            if (next < 0 || next >= buckets) {
                break;
            }
            i = next;
        }
        return candidate;
    }

    public static HashCode combineOrdered(Iterable<HashCode> hashCodes) {
        Iterator<HashCode> iterator = hashCodes.iterator();
        Preconditions.checkArgument(iterator.hasNext(), "Must be at least 1 hash code to combine.");
        int bits = iterator.next().bits();
        byte[] resultBytes = new byte[bits / 8];
        for (HashCode hashCode : hashCodes) {
            byte[] nextBytes = hashCode.asBytes();
            Preconditions.checkArgument(nextBytes.length == resultBytes.length, "All hashcodes must have the same bit length.");
            for (int i = 0; i < nextBytes.length; i++) {
                resultBytes[i] = (byte) ((resultBytes[i] * 37) ^ nextBytes[i]);
            }
        }
        return HashCode.fromBytesNoCopy(resultBytes);
    }

    public static HashCode combineUnordered(Iterable<HashCode> hashCodes) {
        Iterator<HashCode> iterator = hashCodes.iterator();
        Preconditions.checkArgument(iterator.hasNext(), "Must be at least 1 hash code to combine.");
        byte[] resultBytes = new byte[iterator.next().bits() / 8];
        for (HashCode hashCode : hashCodes) {
            byte[] nextBytes = hashCode.asBytes();
            Preconditions.checkArgument(nextBytes.length == resultBytes.length, "All hashcodes must have the same bit length.");
            for (int i = 0; i < nextBytes.length; i++) {
                int i2 = i;
                resultBytes[i2] = (byte) (resultBytes[i2] + nextBytes[i]);
            }
        }
        return HashCode.fromBytesNoCopy(resultBytes);
    }

    static int checkPositiveAndMakeMultipleOf32(int bits) {
        Preconditions.checkArgument(bits > 0, "Number of bits must be positive");
        return (bits + 31) & (-32);
    }

    @VisibleForTesting
    /* loaded from: guava-15.0.jar:com/google/common/hash/Hashing$ConcatenatedHashFunction.class */
    static final class ConcatenatedHashFunction extends AbstractCompositeHashFunction {
        private final int bits;

        ConcatenatedHashFunction(HashFunction... functions) {
            super(functions);
            int bitSum = 0;
            for (HashFunction function : functions) {
                bitSum += function.bits();
            }
            this.bits = bitSum;
        }

        @Override // com.google.common.hash.AbstractCompositeHashFunction
        HashCode makeHash(Hasher[] hashers) {
            byte[] bytes = new byte[this.bits / 8];
            ByteBuffer buffer = ByteBuffer.wrap(bytes);
            for (Hasher hasher : hashers) {
                buffer.put(hasher.hash().asBytes());
            }
            return HashCode.fromBytesNoCopy(bytes);
        }

        @Override // com.google.common.hash.HashFunction
        public int bits() {
            return this.bits;
        }

        public boolean equals(@Nullable Object object) {
            if (object instanceof ConcatenatedHashFunction) {
                ConcatenatedHashFunction other = (ConcatenatedHashFunction) object;
                if (this.bits != other.bits || this.functions.length != other.functions.length) {
                    return false;
                }
                for (int i = 0; i < this.functions.length; i++) {
                    if (!this.functions[i].equals(other.functions[i])) {
                        return false;
                    }
                }
                return true;
            }
            return false;
        }

        public int hashCode() {
            int hash = this.bits;
            HashFunction[] arr$ = this.functions;
            for (HashFunction function : arr$) {
                hash ^= function.hashCode();
            }
            return hash;
        }
    }

    /* loaded from: guava-15.0.jar:com/google/common/hash/Hashing$LinearCongruentialGenerator.class */
    private static final class LinearCongruentialGenerator {
        private long state;

        public LinearCongruentialGenerator(long seed) {
            this.state = seed;
        }

        public double nextDouble() {
            this.state = (2862933555777941757L * this.state) + 1;
            return (((int) (this.state >>> 33)) + 1) / 2.147483648E9d;
        }
    }

    private Hashing() {
    }
}
