package com.google.common.cache;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import com.google.common.util.concurrent.Futures;
import com.google.common.util.concurrent.ListenableFuture;
import java.io.Serializable;
import java.util.Map;

@GwtCompatible(emulated = true)
/* loaded from: guava-15.0.jar:com/google/common/cache/CacheLoader.class */
public abstract class CacheLoader<K, V> {
    public abstract V load(K k) throws Exception;

    protected CacheLoader() {
    }

    @GwtIncompatible("Futures")
    public ListenableFuture<V> reload(K key, V oldValue) throws Exception {
        Preconditions.checkNotNull(key);
        Preconditions.checkNotNull(oldValue);
        return Futures.immediateFuture(load(key));
    }

    public Map<K, V> loadAll(Iterable<? extends K> keys) throws Exception {
        throw new UnsupportedLoadingOperationException();
    }

    @Beta
    public static <K, V> CacheLoader<K, V> from(Function<K, V> function) {
        return new FunctionToCacheLoader(function);
    }

    /* loaded from: guava-15.0.jar:com/google/common/cache/CacheLoader$FunctionToCacheLoader.class */
    private static final class FunctionToCacheLoader<K, V> extends CacheLoader<K, V> implements Serializable {
        private final Function<K, V> computingFunction;
        private static final long serialVersionUID = 0;

        public FunctionToCacheLoader(Function<K, V> computingFunction) {
            this.computingFunction = (Function) Preconditions.checkNotNull(computingFunction);
        }

        @Override // com.google.common.cache.CacheLoader
        public V load(K k) {
            return (V) this.computingFunction.apply(Preconditions.checkNotNull(k));
        }
    }

    @Beta
    public static <V> CacheLoader<Object, V> from(Supplier<V> supplier) {
        return new SupplierToCacheLoader(supplier);
    }

    /* loaded from: guava-15.0.jar:com/google/common/cache/CacheLoader$SupplierToCacheLoader.class */
    private static final class SupplierToCacheLoader<V> extends CacheLoader<Object, V> implements Serializable {
        private final Supplier<V> computingSupplier;
        private static final long serialVersionUID = 0;

        public SupplierToCacheLoader(Supplier<V> computingSupplier) {
            this.computingSupplier = (Supplier) Preconditions.checkNotNull(computingSupplier);
        }

        @Override // com.google.common.cache.CacheLoader
        public V load(Object key) {
            Preconditions.checkNotNull(key);
            return this.computingSupplier.get();
        }
    }

    /* loaded from: guava-15.0.jar:com/google/common/cache/CacheLoader$UnsupportedLoadingOperationException.class */
    static final class UnsupportedLoadingOperationException extends UnsupportedOperationException {
        UnsupportedLoadingOperationException() {
        }
    }

    /* loaded from: guava-15.0.jar:com/google/common/cache/CacheLoader$InvalidCacheLoadException.class */
    public static final class InvalidCacheLoadException extends RuntimeException {
        public InvalidCacheLoadException(String message) {
            super(message);
        }
    }
}
