package rx.internal.operators;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import rx.Observable;
import rx.Observer;
import rx.Subscriber;
import rx.functions.Func0;
import rx.observers.SerializedSubscriber;
import rx.observers.Subscribers;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorWindowWithObservable.class */
public final class OperatorWindowWithObservable<T, U> implements Observable.Operator<Observable<T>, T> {
    final Func0<? extends Observable<? extends U>> otherFactory;
    static final Object NEXT_SUBJECT = new Object();
    static final NotificationLite<Object> nl = NotificationLite.instance();

    public OperatorWindowWithObservable(Func0<? extends Observable<? extends U>> otherFactory) {
        this.otherFactory = otherFactory;
    }

    public OperatorWindowWithObservable(final Observable<U> other) {
        this.otherFactory = new Func0<Observable<U>>() { // from class: rx.internal.operators.OperatorWindowWithObservable.1
            @Override // rx.functions.Func0, java.util.concurrent.Callable
            public Observable<U> call() {
                return other;
            }
        };
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(Subscriber<? super Observable<T>> child) {
        try {
            Observable<? extends U> other = this.otherFactory.call();
            SourceSubscriber<T> sub = new SourceSubscriber<>(child);
            BoundarySubscriber<T, U> bs = new BoundarySubscriber<>(child, sub);
            sub.replaceWindow();
            other.unsafeSubscribe(bs);
            return sub;
        } catch (Throwable e) {
            child.onError(e);
            return Subscribers.empty();
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorWindowWithObservable$SourceSubscriber.class */
    static final class SourceSubscriber<T> extends Subscriber<T> {
        final Subscriber<? super Observable<T>> child;
        final Object guard;
        Observer<T> consumer;
        Observable<T> producer;
        boolean emitting;
        List<Object> queue;

        public SourceSubscriber(Subscriber<? super Observable<T>> child) {
            super(child);
            this.child = new SerializedSubscriber(child);
            this.guard = new Object();
        }

        @Override // rx.Subscriber
        public void onStart() {
            request(Long.MAX_VALUE);
        }

        @Override // rx.Observer
        public void onNext(T t) {
            synchronized (this.guard) {
                if (this.emitting) {
                    if (this.queue == null) {
                        this.queue = new ArrayList();
                    }
                    this.queue.add(t);
                    return;
                }
                List<Object> localQueue = this.queue;
                this.queue = null;
                this.emitting = true;
                boolean once = true;
                boolean skipFinal = false;
                do {
                    try {
                        drain(localQueue);
                        if (once) {
                            once = true;
                            emitValue(t);
                        }
                        synchronized (this.guard) {
                            localQueue = this.queue;
                            this.queue = null;
                            if (localQueue == null) {
                                this.emitting = false;
                                skipFinal = true;
                                if (1 == 0) {
                                    synchronized (this.guard) {
                                        this.emitting = false;
                                    }
                                    return;
                                }
                                return;
                            }
                        }
                    } catch (Throwable th) {
                        if (!skipFinal) {
                            synchronized (this.guard) {
                                this.emitting = false;
                            }
                        }
                        throw th;
                    }
                } while (!this.child.isUnsubscribed());
                if (0 == 0) {
                    synchronized (this.guard) {
                        this.emitting = false;
                    }
                }
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        void drain(List<Object> queue) {
            if (queue == null) {
                return;
            }
            for (Object o : queue) {
                if (o == OperatorWindowWithObservable.NEXT_SUBJECT) {
                    replaceSubject();
                } else if (OperatorWindowWithObservable.nl.isError(o)) {
                    error(OperatorWindowWithObservable.nl.getError(o));
                    return;
                } else {
                    if (OperatorWindowWithObservable.nl.isCompleted(o)) {
                        complete();
                        return;
                    }
                    emitValue(o);
                }
            }
        }

        void replaceSubject() {
            Observer<T> s = this.consumer;
            if (s != null) {
                s.onCompleted();
            }
            createNewWindow();
            this.child.onNext(this.producer);
        }

        void createNewWindow() {
            BufferUntilSubscriber<T> bus = BufferUntilSubscriber.create();
            this.consumer = bus;
            this.producer = bus;
        }

        void emitValue(T t) {
            Observer<T> s = this.consumer;
            if (s != null) {
                s.onNext(t);
            }
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            synchronized (this.guard) {
                if (this.emitting) {
                    this.queue = Collections.singletonList(OperatorWindowWithObservable.nl.error(e));
                    return;
                }
                this.queue = null;
                this.emitting = true;
                error(e);
            }
        }

        @Override // rx.Observer
        public void onCompleted() {
            synchronized (this.guard) {
                if (this.emitting) {
                    if (this.queue == null) {
                        this.queue = new ArrayList();
                    }
                    this.queue.add(OperatorWindowWithObservable.nl.completed());
                    return;
                }
                List<Object> localQueue = this.queue;
                this.queue = null;
                this.emitting = true;
                try {
                    drain(localQueue);
                    complete();
                } catch (Throwable e) {
                    error(e);
                }
            }
        }

        void replaceWindow() {
            synchronized (this.guard) {
                if (this.emitting) {
                    if (this.queue == null) {
                        this.queue = new ArrayList();
                    }
                    this.queue.add(OperatorWindowWithObservable.NEXT_SUBJECT);
                    return;
                }
                List<Object> localQueue = this.queue;
                this.queue = null;
                this.emitting = true;
                boolean once = true;
                boolean skipFinal = false;
                do {
                    try {
                        drain(localQueue);
                        if (once) {
                            once = false;
                            replaceSubject();
                        }
                        synchronized (this.guard) {
                            localQueue = this.queue;
                            this.queue = null;
                            if (localQueue == null) {
                                this.emitting = false;
                                skipFinal = true;
                                if (1 == 0) {
                                    synchronized (this.guard) {
                                        this.emitting = false;
                                    }
                                    return;
                                }
                                return;
                            }
                        }
                    } catch (Throwable th) {
                        if (!skipFinal) {
                            synchronized (this.guard) {
                                this.emitting = false;
                            }
                        }
                        throw th;
                    }
                } while (!this.child.isUnsubscribed());
                if (0 == 0) {
                    synchronized (this.guard) {
                        this.emitting = false;
                    }
                }
            }
        }

        void complete() {
            Observer<T> s = this.consumer;
            this.consumer = null;
            this.producer = null;
            if (s != null) {
                s.onCompleted();
            }
            this.child.onCompleted();
            unsubscribe();
        }

        void error(Throwable e) {
            Observer<T> s = this.consumer;
            this.consumer = null;
            this.producer = null;
            if (s != null) {
                s.onError(e);
            }
            this.child.onError(e);
            unsubscribe();
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorWindowWithObservable$BoundarySubscriber.class */
    static final class BoundarySubscriber<T, U> extends Subscriber<U> {
        final SourceSubscriber<T> sub;

        public BoundarySubscriber(Subscriber<?> child, SourceSubscriber<T> sub) {
            super(child);
            this.sub = sub;
        }

        @Override // rx.Subscriber
        public void onStart() {
            request(Long.MAX_VALUE);
        }

        @Override // rx.Observer
        public void onNext(U t) {
            this.sub.replaceWindow();
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            this.sub.onError(e);
        }

        @Override // rx.Observer
        public void onCompleted() {
            this.sub.onCompleted();
        }
    }
}
