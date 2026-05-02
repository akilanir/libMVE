package rx.observables;

import java.util.Iterator;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicReference;
import rx.Observable;
import rx.Subscriber;
import rx.Subscription;
import rx.functions.Action1;
import rx.functions.Func1;
import rx.internal.operators.BlockingOperatorLatest;
import rx.internal.operators.BlockingOperatorMostRecent;
import rx.internal.operators.BlockingOperatorNext;
import rx.internal.operators.BlockingOperatorToFuture;
import rx.internal.operators.BlockingOperatorToIterator;
import rx.internal.util.UtilityFunctions;

/* loaded from: rxjava-1.0.7.jar:rx/observables/BlockingObservable.class */
public final class BlockingObservable<T> {
    private final Observable<? extends T> o;

    private BlockingObservable(Observable<? extends T> o) {
        this.o = o;
    }

    public static <T> BlockingObservable<T> from(Observable<? extends T> o) {
        return new BlockingObservable<>(o);
    }

    public void forEach(final Action1<? super T> action1) {
        final CountDownLatch countDownLatch = new CountDownLatch(1);
        final AtomicReference atomicReference = new AtomicReference();
        Subscription subscribe = this.o.subscribe((Subscriber<? super Object>) new Subscriber<T>() { // from class: rx.observables.BlockingObservable.1
            @Override // rx.Observer
            public void onCompleted() {
                countDownLatch.countDown();
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                atomicReference.set(e);
                countDownLatch.countDown();
            }

            @Override // rx.Observer
            public void onNext(T args) {
                action1.call(args);
            }
        });
        try {
            countDownLatch.await();
            if (atomicReference.get() != null) {
                if (atomicReference.get() instanceof RuntimeException) {
                    throw ((RuntimeException) atomicReference.get());
                }
                throw new RuntimeException((Throwable) atomicReference.get());
            }
        } catch (InterruptedException e) {
            subscribe.unsubscribe();
            Thread.currentThread().interrupt();
            throw new RuntimeException("Interrupted while waiting for subscription to complete.", e);
        }
    }

    public Iterator<T> getIterator() {
        return BlockingOperatorToIterator.toIterator(this.o);
    }

    public T first() {
        return blockForSingle(this.o.first());
    }

    public T first(Func1<? super T, Boolean> predicate) {
        return blockForSingle(this.o.first(predicate));
    }

    public T firstOrDefault(T defaultValue) {
        return blockForSingle(this.o.map(UtilityFunctions.identity()).firstOrDefault(defaultValue));
    }

    public T firstOrDefault(T defaultValue, Func1<? super T, Boolean> predicate) {
        return blockForSingle(this.o.filter(predicate).map(UtilityFunctions.identity()).firstOrDefault(defaultValue));
    }

    public T last() {
        return blockForSingle(this.o.last());
    }

    public T last(Func1<? super T, Boolean> predicate) {
        return blockForSingle(this.o.last(predicate));
    }

    public T lastOrDefault(T defaultValue) {
        return blockForSingle(this.o.map(UtilityFunctions.identity()).lastOrDefault(defaultValue));
    }

    public T lastOrDefault(T defaultValue, Func1<? super T, Boolean> predicate) {
        return blockForSingle(this.o.filter(predicate).map(UtilityFunctions.identity()).lastOrDefault(defaultValue));
    }

    public Iterable<T> mostRecent(T initialValue) {
        return BlockingOperatorMostRecent.mostRecent(this.o, initialValue);
    }

    public Iterable<T> next() {
        return BlockingOperatorNext.next(this.o);
    }

    public Iterable<T> latest() {
        return BlockingOperatorLatest.latest(this.o);
    }

    public T single() {
        return blockForSingle(this.o.single());
    }

    public T single(Func1<? super T, Boolean> predicate) {
        return blockForSingle(this.o.single(predicate));
    }

    public T singleOrDefault(T defaultValue) {
        return blockForSingle(this.o.map(UtilityFunctions.identity()).singleOrDefault(defaultValue));
    }

    public T singleOrDefault(T defaultValue, Func1<? super T, Boolean> predicate) {
        return blockForSingle(this.o.filter(predicate).map(UtilityFunctions.identity()).singleOrDefault(defaultValue));
    }

    public Future<T> toFuture() {
        return BlockingOperatorToFuture.toFuture(this.o);
    }

    public Iterable<T> toIterable() {
        return new Iterable<T>() { // from class: rx.observables.BlockingObservable.2
            @Override // java.lang.Iterable
            public Iterator<T> iterator() {
                return BlockingObservable.this.getIterator();
            }
        };
    }

    private T blockForSingle(Observable<? extends T> observable) {
        final AtomicReference<T> returnItem = new AtomicReference<>();
        final AtomicReference<Throwable> returnException = new AtomicReference<>();
        final CountDownLatch latch = new CountDownLatch(1);
        Subscription subscription = observable.subscribe((Subscriber<? super Object>) new Subscriber<T>() { // from class: rx.observables.BlockingObservable.3
            @Override // rx.Observer
            public void onCompleted() {
                latch.countDown();
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                returnException.set(e);
                latch.countDown();
            }

            @Override // rx.Observer
            public void onNext(T item) {
                returnItem.set(item);
            }
        });
        try {
            latch.await();
            if (returnException.get() != null) {
                if (returnException.get() instanceof RuntimeException) {
                    throw ((RuntimeException) returnException.get());
                }
                throw new RuntimeException(returnException.get());
            }
            return returnItem.get();
        } catch (InterruptedException e) {
            subscription.unsubscribe();
            Thread.currentThread().interrupt();
            throw new RuntimeException("Interrupted while waiting for subscription to complete.", e);
        }
    }
}
