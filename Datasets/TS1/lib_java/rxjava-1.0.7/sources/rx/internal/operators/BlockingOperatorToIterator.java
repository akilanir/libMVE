package rx.internal.operators;

import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import rx.Notification;
import rx.Observable;
import rx.Subscriber;
import rx.Subscription;
import rx.exceptions.Exceptions;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/BlockingOperatorToIterator.class */
public final class BlockingOperatorToIterator {
    private BlockingOperatorToIterator() {
        throw new IllegalStateException("No instances!");
    }

    public static <T> Iterator<T> toIterator(Observable<? extends T> source) {
        final BlockingQueue<Notification<? extends T>> notifications = new LinkedBlockingQueue<>();
        final Subscription subscription = source.materialize().subscribe((Subscriber<? super Notification<? extends T>>) new Subscriber<Notification<? extends T>>() { // from class: rx.internal.operators.BlockingOperatorToIterator.1
            @Override // rx.Observer
            public void onCompleted() {
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                notifications.offer(Notification.createOnError(e));
            }

            @Override // rx.Observer
            public void onNext(Notification<? extends T> args) {
                notifications.offer(args);
            }
        });
        return new Iterator<T>() { // from class: rx.internal.operators.BlockingOperatorToIterator.2
            private Notification<? extends T> buf;

            @Override // java.util.Iterator
            public boolean hasNext() {
                if (this.buf == null) {
                    this.buf = take();
                }
                if (this.buf.isOnError()) {
                    throw Exceptions.propagate(this.buf.getThrowable());
                }
                return !this.buf.isOnCompleted();
            }

            @Override // java.util.Iterator
            public T next() {
                if (hasNext()) {
                    T result = this.buf.getValue();
                    this.buf = null;
                    return result;
                }
                throw new NoSuchElementException();
            }

            private Notification<? extends T> take() {
                try {
                    return (Notification) notifications.take();
                } catch (InterruptedException e) {
                    subscription.unsubscribe();
                    throw Exceptions.propagate(e);
                }
            }

            @Override // java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException("Read-only iterator");
            }
        };
    }
}
