package rx.internal.operators;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import rx.Observable;
import rx.Observer;
import rx.Subscriber;
import rx.Subscription;
import rx.functions.Action0;
import rx.subscriptions.Subscriptions;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorWindowWithSize.class */
public final class OperatorWindowWithSize<T> implements Observable.Operator<Observable<T>, T> {
    final int size;
    final int skip;

    public OperatorWindowWithSize(int size, int skip) {
        this.size = size;
        this.skip = skip;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(Subscriber<? super Observable<T>> child) {
        if (this.skip == this.size) {
            return new ExactSubscriber(child);
        }
        return new InexactSubscriber(child);
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorWindowWithSize$ExactSubscriber.class */
    final class ExactSubscriber extends Subscriber<T> {
        final Subscriber<? super Observable<T>> child;
        int count;
        BufferUntilSubscriber<T> window;
        volatile boolean noWindow = true;
        final Subscription parentSubscription = this;

        public ExactSubscriber(Subscriber<? super Observable<T>> child) {
            this.child = child;
            child.add(Subscriptions.create(new Action0() { // from class: rx.internal.operators.OperatorWindowWithSize.ExactSubscriber.1
                @Override // rx.functions.Action0
                public void call() {
                    if (ExactSubscriber.this.noWindow) {
                        ExactSubscriber.this.parentSubscription.unsubscribe();
                    }
                }
            }));
        }

        @Override // rx.Subscriber
        public void onStart() {
            request(Long.MAX_VALUE);
        }

        @Override // rx.Observer
        public void onNext(T t) {
            if (this.window == null) {
                this.noWindow = false;
                this.window = BufferUntilSubscriber.create();
                this.child.onNext(this.window);
            }
            this.window.onNext(t);
            int i = this.count + 1;
            this.count = i;
            if (i % OperatorWindowWithSize.this.size == 0) {
                this.window.onCompleted();
                this.window = null;
                this.noWindow = true;
                if (this.child.isUnsubscribed()) {
                    this.parentSubscription.unsubscribe();
                }
            }
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            if (this.window != null) {
                this.window.onError(e);
            }
            this.child.onError(e);
        }

        @Override // rx.Observer
        public void onCompleted() {
            if (this.window != null) {
                this.window.onCompleted();
            }
            this.child.onCompleted();
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorWindowWithSize$InexactSubscriber.class */
    final class InexactSubscriber extends Subscriber<T> {
        final Subscriber<? super Observable<T>> child;
        int count;
        final List<CountedSubject<T>> chunks = new LinkedList();
        final Subscription parentSubscription = this;

        public InexactSubscriber(Subscriber<? super Observable<T>> child) {
            this.child = child;
            child.add(Subscriptions.create(new Action0() { // from class: rx.internal.operators.OperatorWindowWithSize.InexactSubscriber.1
                @Override // rx.functions.Action0
                public void call() {
                    if (InexactSubscriber.this.chunks == null || InexactSubscriber.this.chunks.size() == 0) {
                        InexactSubscriber.this.parentSubscription.unsubscribe();
                    }
                }
            }));
        }

        @Override // rx.Subscriber
        public void onStart() {
            request(Long.MAX_VALUE);
        }

        @Override // rx.Observer
        public void onNext(T t) {
            int i = this.count;
            this.count = i + 1;
            if (i % OperatorWindowWithSize.this.skip == 0 && !this.child.isUnsubscribed()) {
                CountedSubject<T> cs = createCountedSubject();
                this.chunks.add(cs);
                this.child.onNext(cs.producer);
            }
            Iterator<CountedSubject<T>> it = this.chunks.iterator();
            while (it.hasNext()) {
                CountedSubject<T> cs2 = it.next();
                cs2.consumer.onNext(t);
                int i2 = cs2.count + 1;
                cs2.count = i2;
                if (i2 == OperatorWindowWithSize.this.size) {
                    it.remove();
                    cs2.consumer.onCompleted();
                }
            }
            if (this.chunks.size() == 0 && this.child.isUnsubscribed()) {
                this.parentSubscription.unsubscribe();
            }
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            List<CountedSubject<T>> list = new ArrayList<>(this.chunks);
            this.chunks.clear();
            for (CountedSubject<T> cs : list) {
                cs.consumer.onError(e);
            }
            this.child.onError(e);
        }

        @Override // rx.Observer
        public void onCompleted() {
            List<CountedSubject<T>> list = new ArrayList<>(this.chunks);
            this.chunks.clear();
            for (CountedSubject<T> cs : list) {
                cs.consumer.onCompleted();
            }
            this.child.onCompleted();
        }

        CountedSubject<T> createCountedSubject() {
            BufferUntilSubscriber<T> bus = BufferUntilSubscriber.create();
            return new CountedSubject<>(bus, bus);
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorWindowWithSize$CountedSubject.class */
    static final class CountedSubject<T> {
        final Observer<T> consumer;
        final Observable<T> producer;
        int count;

        public CountedSubject(Observer<T> consumer, Observable<T> producer) {
            this.consumer = consumer;
            this.producer = producer;
        }
    }
}
