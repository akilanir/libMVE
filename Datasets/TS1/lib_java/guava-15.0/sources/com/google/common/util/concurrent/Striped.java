package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import com.google.common.collect.Iterables;
import com.google.common.collect.MapMaker;
import com.google.common.math.IntMath;
import java.math.RoundingMode;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.Semaphore;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

@Beta
/* loaded from: guava-15.0.jar:com/google/common/util/concurrent/Striped.class */
public abstract class Striped<L> {
    private static final Supplier<ReadWriteLock> READ_WRITE_LOCK_SUPPLIER = new Supplier<ReadWriteLock>() { // from class: com.google.common.util.concurrent.Striped.5
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.common.base.Supplier
        public ReadWriteLock get() {
            return new ReentrantReadWriteLock();
        }
    };
    private static final int ALL_SET = -1;

    public abstract L get(Object obj);

    public abstract L getAt(int i);

    abstract int indexFor(Object obj);

    public abstract int size();

    private Striped() {
    }

    public Iterable<L> bulkGet(Iterable<?> keys) {
        Object[] array = Iterables.toArray(keys, Object.class);
        int[] stripes = new int[array.length];
        for (int i = 0; i < array.length; i++) {
            stripes[i] = indexFor(array[i]);
        }
        Arrays.sort(stripes);
        for (int i2 = 0; i2 < array.length; i2++) {
            array[i2] = getAt(stripes[i2]);
        }
        List<L> asList = Arrays.asList(array);
        return Collections.unmodifiableList(asList);
    }

    public static Striped<Lock> lock(int stripes) {
        return new CompactStriped(stripes, new Supplier<Lock>() { // from class: com.google.common.util.concurrent.Striped.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.google.common.base.Supplier
            public Lock get() {
                return new PaddedLock();
            }
        });
    }

    public static Striped<Lock> lazyWeakLock(int stripes) {
        return new LazyStriped(stripes, new Supplier<Lock>() { // from class: com.google.common.util.concurrent.Striped.2
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.google.common.base.Supplier
            public Lock get() {
                return new ReentrantLock(false);
            }
        });
    }

    public static Striped<Semaphore> semaphore(int stripes, final int permits) {
        return new CompactStriped(stripes, new Supplier<Semaphore>() { // from class: com.google.common.util.concurrent.Striped.3
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.google.common.base.Supplier
            public Semaphore get() {
                return new PaddedSemaphore(permits);
            }
        });
    }

    public static Striped<Semaphore> lazyWeakSemaphore(int stripes, final int permits) {
        return new LazyStriped(stripes, new Supplier<Semaphore>() { // from class: com.google.common.util.concurrent.Striped.4
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.google.common.base.Supplier
            public Semaphore get() {
                return new Semaphore(permits, false);
            }
        });
    }

    public static Striped<ReadWriteLock> readWriteLock(int stripes) {
        return new CompactStriped(stripes, READ_WRITE_LOCK_SUPPLIER);
    }

    public static Striped<ReadWriteLock> lazyWeakReadWriteLock(int stripes) {
        return new LazyStriped(stripes, READ_WRITE_LOCK_SUPPLIER);
    }

    /* loaded from: guava-15.0.jar:com/google/common/util/concurrent/Striped$PowerOfTwoStriped.class */
    private static abstract class PowerOfTwoStriped<L> extends Striped<L> {
        final int mask;

        PowerOfTwoStriped(int stripes) {
            super();
            Preconditions.checkArgument(stripes > 0, "Stripes must be positive");
            this.mask = stripes > 1073741824 ? -1 : Striped.ceilToPowerOfTwo(stripes) - 1;
        }

        @Override // com.google.common.util.concurrent.Striped
        final int indexFor(Object key) {
            int hash = Striped.smear(key.hashCode());
            return hash & this.mask;
        }

        @Override // com.google.common.util.concurrent.Striped
        public final L get(Object key) {
            return getAt(indexFor(key));
        }
    }

    /* loaded from: guava-15.0.jar:com/google/common/util/concurrent/Striped$CompactStriped.class */
    private static class CompactStriped<L> extends PowerOfTwoStriped<L> {
        private final Object[] array;

        private CompactStriped(int stripes, Supplier<L> supplier) {
            super(stripes);
            Preconditions.checkArgument(stripes <= 1073741824, "Stripes must be <= 2^30)");
            this.array = new Object[this.mask + 1];
            for (int i = 0; i < this.array.length; i++) {
                this.array[i] = supplier.get();
            }
        }

        @Override // com.google.common.util.concurrent.Striped
        public L getAt(int i) {
            return (L) this.array[i];
        }

        @Override // com.google.common.util.concurrent.Striped
        public int size() {
            return this.array.length;
        }
    }

    /* loaded from: guava-15.0.jar:com/google/common/util/concurrent/Striped$LazyStriped.class */
    private static class LazyStriped<L> extends PowerOfTwoStriped<L> {
        final ConcurrentMap<Integer, L> locks;
        final Supplier<L> supplier;
        final int size;

        LazyStriped(int i, Supplier<L> supplier) {
            super(i);
            this.size = this.mask == -1 ? Integer.MAX_VALUE : this.mask + 1;
            this.supplier = supplier;
            this.locks = (ConcurrentMap<Integer, L>) new MapMaker().weakValues2().makeMap();
        }

        @Override // com.google.common.util.concurrent.Striped
        public L getAt(int i) {
            if (this.size != Integer.MAX_VALUE) {
                Preconditions.checkElementIndex(i, size());
            }
            L l = this.locks.get(Integer.valueOf(i));
            if (l != null) {
                return l;
            }
            L l2 = this.supplier.get();
            return (L) Objects.firstNonNull(this.locks.putIfAbsent(Integer.valueOf(i), l2), l2);
        }

        @Override // com.google.common.util.concurrent.Striped
        public int size() {
            return this.size;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int ceilToPowerOfTwo(int x) {
        return 1 << IntMath.log2(x, RoundingMode.CEILING);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int smear(int hashCode) {
        int hashCode2 = hashCode ^ ((hashCode >>> 20) ^ (hashCode >>> 12));
        return (hashCode2 ^ (hashCode2 >>> 7)) ^ (hashCode2 >>> 4);
    }

    /* loaded from: guava-15.0.jar:com/google/common/util/concurrent/Striped$PaddedLock.class */
    private static class PaddedLock extends ReentrantLock {
        long q1;
        long q2;
        long q3;

        PaddedLock() {
            super(false);
        }
    }

    /* loaded from: guava-15.0.jar:com/google/common/util/concurrent/Striped$PaddedSemaphore.class */
    private static class PaddedSemaphore extends Semaphore {
        long q1;
        long q2;
        long q3;

        PaddedSemaphore(int permits) {
            super(permits, false);
        }
    }
}
