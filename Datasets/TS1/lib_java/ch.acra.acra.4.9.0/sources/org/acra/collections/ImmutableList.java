package org.acra.collections;

import android.support.annotation.NonNull;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/collections/ImmutableList.class */
public final class ImmutableList<E> implements List<E>, Serializable {
    private final List<E> mList;

    public ImmutableList(E... elements) {
        this(Arrays.asList(elements));
    }

    public ImmutableList(Collection<E> collection) {
        this.mList = new ArrayList(collection);
    }

    @Override // java.util.List
    public void add(int location, E object) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List, java.util.Collection
    public boolean add(E object) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List
    public boolean addAll(int location, @NonNull Collection<? extends E> collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List, java.util.Collection
    public boolean addAll(@NonNull Collection<? extends E> collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List, java.util.Collection
    public void clear() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List, java.util.Collection
    public boolean contains(Object object) {
        return this.mList.contains(object);
    }

    @Override // java.util.List, java.util.Collection
    public boolean containsAll(@NonNull Collection<?> collection) {
        return this.mList.containsAll(collection);
    }

    @Override // java.util.List
    public E get(int location) {
        return this.mList.get(location);
    }

    @Override // java.util.List
    public int indexOf(Object object) {
        return this.mList.indexOf(object);
    }

    @Override // java.util.List, java.util.Collection
    public boolean isEmpty() {
        return this.mList.isEmpty();
    }

    @Override // java.util.List, java.util.Collection, java.lang.Iterable
    @NonNull
    public Iterator<E> iterator() {
        return new UnmodifiableIteratorWrapper(this.mList.iterator());
    }

    @Override // java.util.List
    public int lastIndexOf(Object object) {
        return this.mList.lastIndexOf(object);
    }

    @Override // java.util.List
    public ListIterator<E> listIterator() {
        return new UnmodifiableListIteratorWrapper(this.mList.listIterator());
    }

    @Override // java.util.List
    @NonNull
    public ListIterator<E> listIterator(int location) {
        return new UnmodifiableListIteratorWrapper(this.mList.listIterator(location));
    }

    @Override // java.util.List
    public E remove(int location) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List, java.util.Collection
    public boolean remove(Object object) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List, java.util.Collection
    public boolean removeAll(@NonNull Collection<?> collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List, java.util.Collection
    public boolean retainAll(@NonNull Collection<?> collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List
    public E set(int location, E object) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List, java.util.Collection
    public int size() {
        return this.mList.size();
    }

    @Override // java.util.List
    @NonNull
    public List<E> subList(int start, int end) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List, java.util.Collection
    @NonNull
    public Object[] toArray() {
        return this.mList.toArray();
    }

    @Override // java.util.List, java.util.Collection
    @NonNull
    public <T> T[] toArray(@NonNull T[] tArr) {
        return (T[]) this.mList.toArray(tArr);
    }
}
