package rx.internal.util;

import android.R;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicIntegerArray;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.atomic.AtomicReferenceArray;
import rx.Subscription;
import rx.functions.Func1;

/* loaded from: rxjava-1.0.7.jar:rx/internal/util/IndexedRingBuffer.class */
public final class IndexedRingBuffer<E> implements Subscription {
    private static final ObjectPool<IndexedRingBuffer> POOL = new ObjectPool<IndexedRingBuffer>() { // from class: rx.internal.util.IndexedRingBuffer.1
        /* JADX INFO: Access modifiers changed from: protected */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // rx.internal.util.ObjectPool
        public IndexedRingBuffer createObject() {
            return new IndexedRingBuffer();
        }
    };
    private final ElementSection<E> elements;
    private final IndexSection removed;
    final AtomicInteger index;
    final AtomicInteger removedIndex;
    static int _size;
    static final int SIZE;

    static {
        _size = 256;
        if (PlatformDependent.isAndroid()) {
            _size = 8;
        }
        String sizeFromProperty = System.getProperty("rx.indexed-ring-buffer.size");
        if (sizeFromProperty != null) {
            try {
                _size = Integer.parseInt(sizeFromProperty);
            } catch (Exception e) {
                System.err.println("Failed to set 'rx.indexed-ring-buffer.size' with value " + sizeFromProperty + " => " + e.getMessage());
            }
        }
        SIZE = _size;
    }

    public static final IndexedRingBuffer getInstance() {
        return POOL.borrowObject();
    }

    public void releaseToPool() {
        int maxIndex = this.index.get();
        int realIndex = 0;
        ElementSection<E> elementSection = this.elements;
        loop0: while (true) {
            ElementSection<E> section = elementSection;
            if (section == null) {
                break;
            }
            int i = 0;
            while (i < SIZE) {
                if (realIndex >= maxIndex) {
                    break loop0;
                }
                ((ElementSection) section).array.set(i, null);
                i++;
                realIndex++;
            }
            elementSection = (ElementSection) ((ElementSection) section).next.get();
        }
        this.index.set(0);
        this.removedIndex.set(0);
        POOL.returnObject(this);
    }

    @Override // rx.Subscription
    public void unsubscribe() {
        releaseToPool();
    }

    private IndexedRingBuffer() {
        this.elements = new ElementSection<>();
        this.removed = new IndexSection();
        this.index = new AtomicInteger();
        this.removedIndex = new AtomicInteger();
    }

    public int add(E e) {
        int i = getIndexForAdd();
        if (i >= SIZE) {
            int sectionIndex = i % SIZE;
            ((ElementSection) getElementSection(i)).array.set(sectionIndex, e);
            return i;
        }
        ((ElementSection) this.elements).array.set(i, e);
        return i;
    }

    public E remove(int i) {
        Object andSet;
        if (i >= SIZE) {
            andSet = ((ElementSection) getElementSection(i)).array.getAndSet(i % SIZE, null);
        } else {
            andSet = ((ElementSection) this.elements).array.getAndSet(i, null);
        }
        pushRemovedIndex(i);
        return (E) andSet;
    }

    private IndexSection getIndexSection(int index) {
        if (index < SIZE) {
            return this.removed;
        }
        int numSections = index / SIZE;
        IndexSection a = this.removed;
        for (int i = 0; i < numSections; i++) {
            a = a.getNext();
        }
        return a;
    }

    private ElementSection<E> getElementSection(int index) {
        if (index < SIZE) {
            return this.elements;
        }
        int numSections = index / SIZE;
        ElementSection<E> a = this.elements;
        for (int i = 0; i < numSections; i++) {
            a = a.getNext();
        }
        return a;
    }

    private synchronized int getIndexForAdd() {
        int i;
        int ri = getIndexFromPreviouslyRemoved();
        if (ri >= 0) {
            if (ri < SIZE) {
                i = this.removed.getAndSet(ri, -1);
            } else {
                int sectionIndex = ri % SIZE;
                i = getIndexSection(ri).getAndSet(sectionIndex, -1);
            }
            if (i == this.index.get()) {
                this.index.getAndIncrement();
            }
        } else {
            i = this.index.getAndIncrement();
        }
        return i;
    }

    private synchronized int getIndexFromPreviouslyRemoved() {
        int currentRi;
        do {
            currentRi = this.removedIndex.get();
            if (currentRi <= 0) {
                return -1;
            }
        } while (!this.removedIndex.compareAndSet(currentRi, currentRi - 1));
        return currentRi - 1;
    }

    private synchronized void pushRemovedIndex(int elementIndex) {
        int i = this.removedIndex.getAndIncrement();
        if (i < SIZE) {
            this.removed.set(i, elementIndex);
        } else {
            int sectionIndex = i % SIZE;
            getIndexSection(i).set(sectionIndex, elementIndex);
        }
    }

    @Override // rx.Subscription
    public boolean isUnsubscribed() {
        return false;
    }

    public int forEach(Func1<? super E, Boolean> action) {
        return forEach(action, 0);
    }

    public int forEach(Func1<? super E, Boolean> action, int startIndex) {
        int endedAt = forEach(action, startIndex, this.index.get());
        if (startIndex > 0 && endedAt == this.index.get()) {
            endedAt = forEach(action, 0, startIndex);
        } else if (endedAt == this.index.get()) {
            endedAt = 0;
        }
        return endedAt;
    }

    private int forEach(Func1<? super E, Boolean> func1, int i, int i2) {
        int i3 = this.index.get();
        int i4 = i;
        ElementSection<E> elementSection = this.elements;
        if (i >= SIZE) {
            elementSection = getElementSection(i);
            i %= SIZE;
        }
        loop0: while (elementSection != null) {
            int i5 = i;
            while (i5 < SIZE) {
                if (i4 >= i3 || i4 >= i2) {
                    break loop0;
                }
                R.bool boolVar = (Object) ((ElementSection) elementSection).array.get(i5);
                if (boolVar != null) {
                    int i6 = i4;
                    if (!func1.call(boolVar).booleanValue()) {
                        return i6;
                    }
                }
                i5++;
                i4++;
            }
            elementSection = (ElementSection) ((ElementSection) elementSection).next.get();
            i = 0;
        }
        return i4;
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/util/IndexedRingBuffer$ElementSection.class */
    private static class ElementSection<E> {
        private final AtomicReferenceArray<E> array;
        private final AtomicReference<ElementSection<E>> next;

        private ElementSection() {
            this.array = new AtomicReferenceArray<>(IndexedRingBuffer.SIZE);
            this.next = new AtomicReference<>();
        }

        ElementSection<E> getNext() {
            if (this.next.get() != null) {
                return this.next.get();
            }
            ElementSection<E> newSection = new ElementSection<>();
            if (this.next.compareAndSet(null, newSection)) {
                return newSection;
            }
            return this.next.get();
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/util/IndexedRingBuffer$IndexSection.class */
    private static class IndexSection {
        private final AtomicIntegerArray unsafeArray;
        private final AtomicReference<IndexSection> _next;

        private IndexSection() {
            this.unsafeArray = new AtomicIntegerArray(IndexedRingBuffer.SIZE);
            this._next = new AtomicReference<>();
        }

        public int getAndSet(int expected, int newValue) {
            return this.unsafeArray.getAndSet(expected, newValue);
        }

        public void set(int i, int elementIndex) {
            this.unsafeArray.set(i, elementIndex);
        }

        IndexSection getNext() {
            if (this._next.get() != null) {
                return this._next.get();
            }
            IndexSection newSection = new IndexSection();
            if (this._next.compareAndSet(null, newSection)) {
                return newSection;
            }
            return this._next.get();
        }
    }
}
