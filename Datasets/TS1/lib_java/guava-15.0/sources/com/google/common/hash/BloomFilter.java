package com.google.common.hash;

import com.google.common.annotations.Beta;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.hash.BloomFilterStrategies;
import java.io.Serializable;
import javax.annotation.Nullable;

@Beta
/* loaded from: guava-15.0.jar:com/google/common/hash/BloomFilter.class */
public final class BloomFilter<T> implements Predicate<T>, Serializable {
    private final BloomFilterStrategies.BitArray bits;
    private final int numHashFunctions;
    private final Funnel<T> funnel;
    private final Strategy strategy;

    /* loaded from: guava-15.0.jar:com/google/common/hash/BloomFilter$Strategy.class */
    interface Strategy extends Serializable {
        <T> boolean put(T t, Funnel<? super T> funnel, int i, BloomFilterStrategies.BitArray bitArray);

        <T> boolean mightContain(T t, Funnel<? super T> funnel, int i, BloomFilterStrategies.BitArray bitArray);

        int ordinal();
    }

    private BloomFilter(BloomFilterStrategies.BitArray bits, int numHashFunctions, Funnel<T> funnel, Strategy strategy) {
        Preconditions.checkArgument(numHashFunctions > 0, "numHashFunctions (%s) must be > 0", Integer.valueOf(numHashFunctions));
        Preconditions.checkArgument(numHashFunctions <= 255, "numHashFunctions (%s) must be <= 255", Integer.valueOf(numHashFunctions));
        this.bits = (BloomFilterStrategies.BitArray) Preconditions.checkNotNull(bits);
        this.numHashFunctions = numHashFunctions;
        this.funnel = (Funnel) Preconditions.checkNotNull(funnel);
        this.strategy = (Strategy) Preconditions.checkNotNull(strategy);
    }

    public BloomFilter<T> copy() {
        return new BloomFilter<>(this.bits.copy(), this.numHashFunctions, this.funnel, this.strategy);
    }

    public boolean mightContain(T object) {
        return this.strategy.mightContain(object, this.funnel, this.numHashFunctions, this.bits);
    }

    @Override // com.google.common.base.Predicate
    public boolean apply(T input) {
        return mightContain(input);
    }

    public boolean put(T object) {
        return this.strategy.put(object, this.funnel, this.numHashFunctions, this.bits);
    }

    public double expectedFpp() {
        return Math.pow(this.bits.bitCount() / bitSize(), this.numHashFunctions);
    }

    @VisibleForTesting
    long bitSize() {
        return this.bits.bitSize();
    }

    public boolean isCompatible(BloomFilter<T> that) {
        Preconditions.checkNotNull(that);
        return this != that && this.numHashFunctions == that.numHashFunctions && bitSize() == that.bitSize() && this.strategy.equals(that.strategy) && this.funnel.equals(that.funnel);
    }

    public void putAll(BloomFilter<T> that) {
        Preconditions.checkNotNull(that);
        Preconditions.checkArgument(this != that, "Cannot combine a BloomFilter with itself.");
        Preconditions.checkArgument(this.numHashFunctions == that.numHashFunctions, "BloomFilters must have the same number of hash functions (%s != %s)", Integer.valueOf(this.numHashFunctions), Integer.valueOf(that.numHashFunctions));
        Preconditions.checkArgument(bitSize() == that.bitSize(), "BloomFilters must have the same size underlying bit arrays (%s != %s)", Long.valueOf(bitSize()), Long.valueOf(that.bitSize()));
        Preconditions.checkArgument(this.strategy.equals(that.strategy), "BloomFilters must have equal strategies (%s != %s)", this.strategy, that.strategy);
        Preconditions.checkArgument(this.funnel.equals(that.funnel), "BloomFilters must have equal funnels (%s != %s)", this.funnel, that.funnel);
        this.bits.putAll(that.bits);
    }

    @Override // com.google.common.base.Predicate
    public boolean equals(@Nullable Object object) {
        if (object == this) {
            return true;
        }
        if (object instanceof BloomFilter) {
            BloomFilter<?> that = (BloomFilter) object;
            return this.numHashFunctions == that.numHashFunctions && this.funnel.equals(that.funnel) && this.bits.equals(that.bits) && this.strategy.equals(that.strategy);
        }
        return false;
    }

    public int hashCode() {
        return Objects.hashCode(Integer.valueOf(this.numHashFunctions), this.funnel, this.strategy, this.bits);
    }

    public static <T> BloomFilter<T> create(Funnel<T> funnel, int expectedInsertions, double fpp) {
        Preconditions.checkNotNull(funnel);
        Preconditions.checkArgument(expectedInsertions >= 0, "Expected insertions (%s) must be >= 0", Integer.valueOf(expectedInsertions));
        Preconditions.checkArgument(fpp > 0.0d, "False positive probability (%s) must be > 0.0", Double.valueOf(fpp));
        Preconditions.checkArgument(fpp < 1.0d, "False positive probability (%s) must be < 1.0", Double.valueOf(fpp));
        if (expectedInsertions == 0) {
            expectedInsertions = 1;
        }
        long numBits = optimalNumOfBits(expectedInsertions, fpp);
        int numHashFunctions = optimalNumOfHashFunctions(expectedInsertions, numBits);
        try {
            return new BloomFilter<>(new BloomFilterStrategies.BitArray(numBits), numHashFunctions, funnel, BloomFilterStrategies.MURMUR128_MITZ_32);
        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException("Could not create BloomFilter of " + numBits + " bits", e);
        }
    }

    public static <T> BloomFilter<T> create(Funnel<T> funnel, int expectedInsertions) {
        return create(funnel, expectedInsertions, 0.03d);
    }

    @VisibleForTesting
    static int optimalNumOfHashFunctions(long n, long m) {
        return Math.max(1, (int) Math.round((m / n) * Math.log(2.0d)));
    }

    @VisibleForTesting
    static long optimalNumOfBits(long n, double p) {
        if (p == 0.0d) {
            p = Double.MIN_VALUE;
        }
        return (long) (((-n) * Math.log(p)) / (Math.log(2.0d) * Math.log(2.0d)));
    }

    private Object writeReplace() {
        return new SerialForm(this);
    }

    /* loaded from: guava-15.0.jar:com/google/common/hash/BloomFilter$SerialForm.class */
    private static class SerialForm<T> implements Serializable {
        final long[] data;
        final int numHashFunctions;
        final Funnel<T> funnel;
        final Strategy strategy;
        private static final long serialVersionUID = 1;

        SerialForm(BloomFilter<T> bf) {
            this.data = ((BloomFilter) bf).bits.data;
            this.numHashFunctions = ((BloomFilter) bf).numHashFunctions;
            this.funnel = ((BloomFilter) bf).funnel;
            this.strategy = ((BloomFilter) bf).strategy;
        }

        Object readResolve() {
            return new BloomFilter(new BloomFilterStrategies.BitArray(this.data), this.numHashFunctions, this.funnel, this.strategy);
        }
    }
}
