package com.google.common.base;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.VisibleForTesting;
import java.io.Serializable;
import java.util.concurrent.TimeUnit;
import javax.annotation.Nullable;

@GwtCompatible
/* loaded from: guava-15.0.jar:com/google/common/base/Suppliers.class */
public final class Suppliers {
    private Suppliers() {
    }

    public static <F, T> Supplier<T> compose(Function<? super F, T> function, Supplier<F> supplier) {
        Preconditions.checkNotNull(function);
        Preconditions.checkNotNull(supplier);
        return new SupplierComposition(function, supplier);
    }

    /* loaded from: guava-15.0.jar:com/google/common/base/Suppliers$SupplierComposition.class */
    private static class SupplierComposition<F, T> implements Supplier<T>, Serializable {
        final Function<? super F, T> function;
        final Supplier<F> supplier;
        private static final long serialVersionUID = 0;

        SupplierComposition(Function<? super F, T> function, Supplier<F> supplier) {
            this.function = function;
            this.supplier = supplier;
        }

        @Override // com.google.common.base.Supplier
        public T get() {
            return this.function.apply(this.supplier.get());
        }

        public boolean equals(@Nullable Object obj) {
            if (obj instanceof SupplierComposition) {
                SupplierComposition<?, ?> that = (SupplierComposition) obj;
                return this.function.equals(that.function) && this.supplier.equals(that.supplier);
            }
            return false;
        }

        public int hashCode() {
            return Objects.hashCode(this.function, this.supplier);
        }

        public String toString() {
            return "Suppliers.compose(" + this.function + ", " + this.supplier + ")";
        }
    }

    public static <T> Supplier<T> memoize(Supplier<T> delegate) {
        return delegate instanceof MemoizingSupplier ? delegate : new MemoizingSupplier((Supplier) Preconditions.checkNotNull(delegate));
    }

    @VisibleForTesting
    /* loaded from: guava-15.0.jar:com/google/common/base/Suppliers$MemoizingSupplier.class */
    static class MemoizingSupplier<T> implements Supplier<T>, Serializable {
        final Supplier<T> delegate;
        volatile transient boolean initialized;
        transient T value;
        private static final long serialVersionUID = 0;

        MemoizingSupplier(Supplier<T> delegate) {
            this.delegate = delegate;
        }

        @Override // com.google.common.base.Supplier
        public T get() {
            if (!this.initialized) {
                synchronized (this) {
                    if (!this.initialized) {
                        T t = this.delegate.get();
                        this.value = t;
                        this.initialized = true;
                        return t;
                    }
                }
            }
            return this.value;
        }

        public String toString() {
            return "Suppliers.memoize(" + this.delegate + ")";
        }
    }

    public static <T> Supplier<T> memoizeWithExpiration(Supplier<T> delegate, long duration, TimeUnit unit) {
        return new ExpiringMemoizingSupplier(delegate, duration, unit);
    }

    @VisibleForTesting
    /* loaded from: guava-15.0.jar:com/google/common/base/Suppliers$ExpiringMemoizingSupplier.class */
    static class ExpiringMemoizingSupplier<T> implements Supplier<T>, Serializable {
        final Supplier<T> delegate;
        final long durationNanos;
        volatile transient T value;
        volatile transient long expirationNanos;
        private static final long serialVersionUID = 0;

        ExpiringMemoizingSupplier(Supplier<T> delegate, long duration, TimeUnit unit) {
            this.delegate = (Supplier) Preconditions.checkNotNull(delegate);
            this.durationNanos = unit.toNanos(duration);
            Preconditions.checkArgument(duration > serialVersionUID);
        }

        @Override // com.google.common.base.Supplier
        public T get() {
            long nanos = this.expirationNanos;
            long now = Platform.systemNanoTime();
            if (nanos == serialVersionUID || now - nanos >= serialVersionUID) {
                synchronized (this) {
                    if (nanos == this.expirationNanos) {
                        T t = this.delegate.get();
                        this.value = t;
                        long nanos2 = now + this.durationNanos;
                        this.expirationNanos = nanos2 == serialVersionUID ? 1L : nanos2;
                        return t;
                    }
                }
            }
            return this.value;
        }

        public String toString() {
            return "Suppliers.memoizeWithExpiration(" + this.delegate + ", " + this.durationNanos + ", NANOS)";
        }
    }

    public static <T> Supplier<T> ofInstance(@Nullable T instance) {
        return new SupplierOfInstance(instance);
    }

    /* loaded from: guava-15.0.jar:com/google/common/base/Suppliers$SupplierOfInstance.class */
    private static class SupplierOfInstance<T> implements Supplier<T>, Serializable {
        final T instance;
        private static final long serialVersionUID = 0;

        SupplierOfInstance(@Nullable T instance) {
            this.instance = instance;
        }

        @Override // com.google.common.base.Supplier
        public T get() {
            return this.instance;
        }

        public boolean equals(@Nullable Object obj) {
            if (obj instanceof SupplierOfInstance) {
                SupplierOfInstance<?> that = (SupplierOfInstance) obj;
                return Objects.equal(this.instance, that.instance);
            }
            return false;
        }

        public int hashCode() {
            return Objects.hashCode(this.instance);
        }

        public String toString() {
            return "Suppliers.ofInstance(" + this.instance + ")";
        }
    }

    public static <T> Supplier<T> synchronizedSupplier(Supplier<T> delegate) {
        return new ThreadSafeSupplier((Supplier) Preconditions.checkNotNull(delegate));
    }

    /* loaded from: guava-15.0.jar:com/google/common/base/Suppliers$ThreadSafeSupplier.class */
    private static class ThreadSafeSupplier<T> implements Supplier<T>, Serializable {
        final Supplier<T> delegate;
        private static final long serialVersionUID = 0;

        ThreadSafeSupplier(Supplier<T> delegate) {
            this.delegate = delegate;
        }

        @Override // com.google.common.base.Supplier
        public T get() {
            T t;
            synchronized (this.delegate) {
                t = this.delegate.get();
            }
            return t;
        }

        public String toString() {
            return "Suppliers.synchronizedSupplier(" + this.delegate + ")";
        }
    }

    @Beta
    public static <T> Function<Supplier<T>, T> supplierFunction() {
        return SupplierFunction.INSTANCE;
    }

    /* loaded from: guava-15.0.jar:com/google/common/base/Suppliers$SupplierFunction.class */
    private enum SupplierFunction implements Function<Supplier<?>, Object> {
        INSTANCE;

        @Override // com.google.common.base.Function
        public Object apply(Supplier<?> input) {
            return input.get();
        }

        @Override // java.lang.Enum
        public String toString() {
            return "Suppliers.supplierFunction()";
        }
    }
}
