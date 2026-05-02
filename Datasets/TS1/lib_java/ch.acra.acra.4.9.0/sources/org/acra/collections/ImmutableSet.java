package org.acra.collections;

import android.support.annotation.NonNull;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/collections/ImmutableSet.class */
public final class ImmutableSet<E> implements Set<E>, Serializable {
    private final Set<E> mSet;

    public ImmutableSet(E... elements) {
        this(Arrays.asList(elements));
    }

    public ImmutableSet(Collection<E> collection) {
        this.mSet = new HashSet(collection);
    }

    @Override // java.util.Set, java.util.Collection
    public boolean add(E object) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Set, java.util.Collection
    public boolean addAll(@NonNull Collection<? extends E> collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Set, java.util.Collection
    public void clear() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Set, java.util.Collection
    public boolean contains(Object object) {
        return this.mSet.contains(object);
    }

    @Override // java.util.Set, java.util.Collection
    public boolean containsAll(@NonNull Collection<?> collection) {
        return this.mSet.containsAll(collection);
    }

    @Override // java.util.Set, java.util.Collection
    public boolean isEmpty() {
        return this.mSet.isEmpty();
    }

    @Override // java.util.Set, java.util.Collection, java.lang.Iterable
    @NonNull
    public Iterator<E> iterator() {
        return new UnmodifiableIteratorWrapper(this.mSet.iterator());
    }

    @Override // java.util.Set, java.util.Collection
    public boolean remove(Object object) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Set, java.util.Collection
    public boolean removeAll(@NonNull Collection<?> collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Set, java.util.Collection
    public boolean retainAll(@NonNull Collection<?> collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Set, java.util.Collection
    public int size() {
        return this.mSet.size();
    }

    @Override // java.util.Set, java.util.Collection
    @NonNull
    public Object[] toArray() {
        return this.mSet.toArray();
    }

    @Override // java.util.Set, java.util.Collection
    @NonNull
    public <T> T[] toArray(@NonNull T[] tArr) {
        return (T[]) this.mSet.toArray(tArr);
    }

    /* loaded from: ch.acra.acra.4.9.0.jar:org/acra/collections/ImmutableSet$Builder.class */
    public static final class Builder<E> {
        private final Set<E> mSet = new HashSet();

        public void add(E element) {
            this.mSet.add(element);
        }

        public ImmutableSet<E> build() {
            return new ImmutableSet<>(this.mSet);
        }
    }
}
