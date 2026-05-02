package com.google.common.cache;

import java.lang.reflect.Field;
import java.security.AccessController;
import java.security.PrivilegedActionException;
import java.security.PrivilegedExceptionAction;
import java.util.Random;
import sun.misc.Unsafe;

/* loaded from: guava-15.0.jar:com/google/common/cache/Striped64.class */
abstract class Striped64 extends Number {
    static final ThreadHashCode threadHashCode = new ThreadHashCode();
    static final int NCPU = Runtime.getRuntime().availableProcessors();
    volatile transient Cell[] cells;
    volatile transient long base;
    volatile transient int busy;
    private static final Unsafe UNSAFE;
    private static final long baseOffset;
    private static final long busyOffset;

    abstract long fn(long j, long j2);

    /* loaded from: guava-15.0.jar:com/google/common/cache/Striped64$Cell.class */
    static final class Cell {
        volatile long p0;
        volatile long p1;
        volatile long p2;
        volatile long p3;
        volatile long p4;
        volatile long p5;
        volatile long p6;
        volatile long value;
        volatile long q0;
        volatile long q1;
        volatile long q2;
        volatile long q3;
        volatile long q4;
        volatile long q5;
        volatile long q6;
        private static final Unsafe UNSAFE;
        private static final long valueOffset;

        Cell(long x) {
            this.value = x;
        }

        final boolean cas(long cmp, long val) {
            return UNSAFE.compareAndSwapLong(this, valueOffset, cmp, val);
        }

        static {
            try {
                UNSAFE = Striped64.getUnsafe();
                valueOffset = UNSAFE.objectFieldOffset(Cell.class.getDeclaredField("value"));
            } catch (Exception e) {
                throw new Error(e);
            }
        }
    }

    /* loaded from: guava-15.0.jar:com/google/common/cache/Striped64$HashCode.class */
    static final class HashCode {
        static final Random rng = new Random();
        int code;

        HashCode() {
            int h = rng.nextInt();
            this.code = h == 0 ? 1 : h;
        }
    }

    /* loaded from: guava-15.0.jar:com/google/common/cache/Striped64$ThreadHashCode.class */
    static final class ThreadHashCode extends ThreadLocal<HashCode> {
        ThreadHashCode() {
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.lang.ThreadLocal
        public HashCode initialValue() {
            return new HashCode();
        }
    }

    static {
        try {
            UNSAFE = getUnsafe();
            baseOffset = UNSAFE.objectFieldOffset(Striped64.class.getDeclaredField("base"));
            busyOffset = UNSAFE.objectFieldOffset(Striped64.class.getDeclaredField("busy"));
        } catch (Exception e) {
            throw new Error(e);
        }
    }

    Striped64() {
    }

    final boolean casBase(long cmp, long val) {
        return UNSAFE.compareAndSwapLong(this, baseOffset, cmp, val);
    }

    final boolean casBusy() {
        return UNSAFE.compareAndSwapInt(this, busyOffset, 0, 1);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v29, types: [com.google.common.cache.Striped64$Cell, long] */
    final void retryUpdate(long x, HashCode hc, boolean wasUncontended) {
        int n;
        int m;
        int h = hc.code;
        boolean collide = false;
        while (true) {
            Cell[] cellArr = this.cells;
            if (cellArr != 0 && (n = cellArr.length) > 0) {
                ?? r0 = cellArr[(n - 1) & h];
                if (r0 == 0) {
                    if (this.busy == 0) {
                        Cell r = new Cell(x);
                        if (this.busy == 0 && casBusy()) {
                            boolean created = false;
                            try {
                                Cell[] rs = this.cells;
                                if (rs != null && (m = rs.length) > 0) {
                                    int j = (m - 1) & h;
                                    if (rs[j] == null) {
                                        rs[j] = r;
                                        created = true;
                                    }
                                }
                                this.busy = 0;
                                if (created) {
                                    break;
                                }
                            } finally {
                            }
                        }
                    }
                    collide = false;
                    int h2 = h ^ (h << 13);
                    int h3 = h2 ^ (h2 >>> 17);
                    h = h3 ^ (h3 << 5);
                } else {
                    if (!wasUncontended) {
                        wasUncontended = true;
                    } else {
                        if (r0.cas(r0, fn(r0.value, x))) {
                            break;
                        }
                        if (n >= NCPU || this.cells != cellArr) {
                            collide = false;
                        } else if (!collide) {
                            collide = true;
                        } else if (this.busy == 0 && casBusy()) {
                            try {
                                if (this.cells == cellArr) {
                                    Cell[] cellArr2 = new Cell[n << 1];
                                    for (int i = 0; i < n; i++) {
                                        cellArr2[i] = cellArr[i];
                                    }
                                    this.cells = cellArr2;
                                }
                                this.busy = 0;
                                collide = false;
                            } finally {
                            }
                        }
                    }
                    int h22 = h ^ (h << 13);
                    int h32 = h22 ^ (h22 >>> 17);
                    h = h32 ^ (h32 << 5);
                }
            } else if (this.busy == 0 && this.cells == cellArr && casBusy()) {
                boolean init = false;
                try {
                    if (this.cells == cellArr) {
                        Cell[] rs2 = new Cell[2];
                        rs2[h & 1] = new Cell(x);
                        this.cells = rs2;
                        init = true;
                    }
                    this.busy = 0;
                    if (init) {
                        break;
                    }
                } finally {
                    this.busy = 0;
                }
            } else {
                long v = this.base;
                if (casBase(v, fn(v, x))) {
                    break;
                }
            }
        }
        hc.code = h;
    }

    final void internalReset(long initialValue) {
        Cell[] as = this.cells;
        this.base = initialValue;
        if (as != null) {
            for (Cell a : as) {
                if (a != null) {
                    a.value = initialValue;
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Unsafe getUnsafe() {
        try {
            return Unsafe.getUnsafe();
        } catch (SecurityException e) {
            try {
                return (Unsafe) AccessController.doPrivileged(new PrivilegedExceptionAction<Unsafe>() { // from class: com.google.common.cache.Striped64.1
                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // java.security.PrivilegedExceptionAction
                    public Unsafe run() throws Exception {
                        Field[] arr$ = Unsafe.class.getDeclaredFields();
                        for (Field f : arr$) {
                            f.setAccessible(true);
                            Object x = f.get(null);
                            if (Unsafe.class.isInstance(x)) {
                                return (Unsafe) Unsafe.class.cast(x);
                            }
                        }
                        throw new NoSuchFieldError("the Unsafe");
                    }
                });
            } catch (PrivilegedActionException e2) {
                throw new RuntimeException("Could not initialize intrinsics", e2.getCause());
            }
        }
    }
}
