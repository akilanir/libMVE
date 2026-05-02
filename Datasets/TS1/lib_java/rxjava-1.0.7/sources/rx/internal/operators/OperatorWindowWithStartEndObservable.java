package rx.internal.operators;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import rx.Observable;
import rx.Observer;
import rx.Subscriber;
import rx.functions.Func1;
import rx.observers.SerializedObserver;
import rx.observers.SerializedSubscriber;
import rx.subscriptions.CompositeSubscription;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorWindowWithStartEndObservable.class */
public final class OperatorWindowWithStartEndObservable<T, U, V> implements Observable.Operator<Observable<T>, T> {
    final Observable<? extends U> windowOpenings;
    final Func1<? super U, ? extends Observable<? extends V>> windowClosingSelector;

    public OperatorWindowWithStartEndObservable(Observable<? extends U> windowOpenings, Func1<? super U, ? extends Observable<? extends V>> windowClosingSelector) {
        this.windowOpenings = windowOpenings;
        this.windowClosingSelector = windowClosingSelector;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(Subscriber<? super Observable<T>> child) {
        final OperatorWindowWithStartEndObservable<T, U, V>.SourceSubscriber sub = new SourceSubscriber(child);
        Subscriber<U> open = new Subscriber<U>(child) { // from class: rx.internal.operators.OperatorWindowWithStartEndObservable.1
            @Override // rx.Subscriber
            public void onStart() {
                request(Long.MAX_VALUE);
            }

            @Override // rx.Observer
            public void onNext(U t) {
                sub.beginWindow(t);
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                sub.onError(e);
            }

            @Override // rx.Observer
            public void onCompleted() {
                sub.onCompleted();
            }
        };
        this.windowOpenings.unsafeSubscribe(open);
        return sub;
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorWindowWithStartEndObservable$SerializedSubject.class */
    static final class SerializedSubject<T> {
        final Observer<T> consumer;
        final Observable<T> producer;

        public SerializedSubject(Observer<T> consumer, Observable<T> producer) {
            this.consumer = new SerializedObserver(consumer);
            this.producer = producer;
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorWindowWithStartEndObservable$SourceSubscriber.class */
    final class SourceSubscriber extends Subscriber<T> {
        final Subscriber<? super Observable<T>> child;
        final CompositeSubscription csub;
        final Object guard;
        final List<SerializedSubject<T>> chunks;
        boolean done;

        public SourceSubscriber(Subscriber<? super Observable<T>> child) {
            super(child);
            this.child = new SerializedSubscriber(child);
            this.guard = new Object();
            this.chunks = new LinkedList();
            this.csub = new CompositeSubscription();
            child.add(this.csub);
        }

        @Override // rx.Subscriber
        public void onStart() {
            request(Long.MAX_VALUE);
        }

        @Override // rx.Observer
        public void onNext(T t) {
            synchronized (this.guard) {
                if (this.done) {
                    return;
                }
                List<SerializedSubject<T>> list = new ArrayList<>(this.chunks);
                for (SerializedSubject<T> cs : list) {
                    cs.consumer.onNext(t);
                }
            }
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            synchronized (this.guard) {
                if (this.done) {
                    return;
                }
                this.done = true;
                List<SerializedSubject<T>> list = new ArrayList<>(this.chunks);
                this.chunks.clear();
                for (SerializedSubject<T> cs : list) {
                    cs.consumer.onError(e);
                }
                this.child.onError(e);
            }
        }

        @Override // rx.Observer
        public void onCompleted() {
            synchronized (this.guard) {
                if (this.done) {
                    return;
                }
                this.done = true;
                List<SerializedSubject<T>> list = new ArrayList<>(this.chunks);
                this.chunks.clear();
                for (SerializedSubject<T> cs : list) {
                    cs.consumer.onCompleted();
                }
                this.child.onCompleted();
            }
        }

        void beginWindow(U token) {
            final SerializedSubject<T> s = createSerializedSubject();
            synchronized (this.guard) {
                if (this.done) {
                    return;
                }
                this.chunks.add(s);
                this.child.onNext(s.producer);
                try {
                    Observable<? extends V> end = OperatorWindowWithStartEndObservable.this.windowClosingSelector.call(token);
                    Subscriber<V> v = new Subscriber<V>() { // from class: rx.internal.operators.OperatorWindowWithStartEndObservable.SourceSubscriber.1
                        boolean once = true;

                        @Override // rx.Observer
                        public void onNext(V t) {
                            onCompleted();
                        }

                        @Override // rx.Observer
                        public void onError(Throwable e) {
                        }

                        @Override // rx.Observer
                        public void onCompleted() {
                            if (this.once) {
                                this.once = false;
                                SourceSubscriber.this.endWindow(s);
                                SourceSubscriber.this.csub.remove(this);
                            }
                        }
                    };
                    this.csub.add(v);
                    end.unsafeSubscribe(v);
                } catch (Throwable e) {
                    onError(e);
                }
            }
        }

        void endWindow(SerializedSubject<T> window) {
            boolean terminate = false;
            synchronized (this.guard) {
                if (this.done) {
                    return;
                }
                Iterator<SerializedSubject<T>> it = this.chunks.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    SerializedSubject<T> s = it.next();
                    if (s == window) {
                        terminate = true;
                        it.remove();
                        break;
                    }
                }
                if (terminate) {
                    window.consumer.onCompleted();
                }
            }
        }

        SerializedSubject<T> createSerializedSubject() {
            BufferUntilSubscriber<T> bus = BufferUntilSubscriber.create();
            return new SerializedSubject<>(bus, bus);
        }
    }
}
