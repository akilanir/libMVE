package com.google.common.base;

import com.google.common.annotations.GwtCompatible;
import java.util.Iterator;
import java.util.NoSuchElementException;

@GwtCompatible
/* loaded from: guava-18.0.jar:com/google/common/base/AbstractIterator.class */
abstract class AbstractIterator<T> implements Iterator<T> {
    private State state = State.NOT_READY;
    private T next;

    /* loaded from: guava-18.0.jar:com/google/common/base/AbstractIterator$State.class */
    private enum State {
        READY,
        NOT_READY,
        DONE,
        FAILED
    }

    protected abstract T computeNext();

    protected AbstractIterator() {
    }

    protected final T endOfData() {
        this.state = State.DONE;
        return null;
    }

    /* renamed from: com.google.common.base.AbstractIterator$1, reason: invalid class name */
    /* loaded from: guava-18.0.jar:com/google/common/base/AbstractIterator$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$google$common$base$AbstractIterator$State = new int[State.values().length];

        static {
            try {
                $SwitchMap$com$google$common$base$AbstractIterator$State[State.DONE.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$google$common$base$AbstractIterator$State[State.READY.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
        }
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        Preconditions.checkState(this.state != State.FAILED);
        switch (AnonymousClass1.$SwitchMap$com$google$common$base$AbstractIterator$State[this.state.ordinal()]) {
            case Ascii.SOH /* 1 */:
                return false;
            case 2:
                return true;
            default:
                return tryToComputeNext();
        }
    }

    private boolean tryToComputeNext() {
        this.state = State.FAILED;
        this.next = computeNext();
        if (this.state != State.DONE) {
            this.state = State.READY;
            return true;
        }
        return false;
    }

    @Override // java.util.Iterator
    public final T next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        this.state = State.NOT_READY;
        T result = this.next;
        this.next = null;
        return result;
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException();
    }
}
