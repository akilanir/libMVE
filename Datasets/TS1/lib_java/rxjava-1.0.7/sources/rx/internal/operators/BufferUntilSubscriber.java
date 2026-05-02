package rx.internal.operators;

import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import rx.Observable;
import rx.Observer;
import rx.Subscriber;
import rx.functions.Action0;
import rx.subjects.Subject;
import rx.subscriptions.Subscriptions;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/BufferUntilSubscriber.class */
public final class BufferUntilSubscriber<T> extends Subject<T, T> {
    final State<T> state;
    private boolean forward;
    private static final Observer EMPTY_OBSERVER = new Observer() { // from class: rx.internal.operators.BufferUntilSubscriber.1
        @Override // rx.Observer
        public void onCompleted() {
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
        }

        @Override // rx.Observer
        public void onNext(Object t) {
        }
    };

    public static <T> BufferUntilSubscriber<T> create() {
        State<T> state = new State<>();
        return new BufferUntilSubscriber<>(state);
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/BufferUntilSubscriber$State.class */
    static final class State<T> {
        static final AtomicReferenceFieldUpdater<State, Observer> OBSERVER_UPDATER = AtomicReferenceFieldUpdater.newUpdater(State.class, Observer.class, "observerRef");
        volatile Observer<? super T> observerRef = null;
        Object guard = new Object();
        boolean emitting = false;
        final ConcurrentLinkedQueue<Object> buffer = new ConcurrentLinkedQueue<>();
        final NotificationLite<T> nl = NotificationLite.instance();

        State() {
        }

        boolean casObserverRef(Observer<? super T> expected, Observer<? super T> next) {
            return OBSERVER_UPDATER.compareAndSet(this, expected, next);
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/BufferUntilSubscriber$OnSubscribeAction.class */
    static final class OnSubscribeAction<T> implements Observable.OnSubscribe<T> {
        final State<T> state;

        public OnSubscribeAction(State<T> state) {
            this.state = state;
        }

        @Override // rx.functions.Action1
        public void call(Subscriber<? super T> s) {
            if (this.state.casObserverRef(null, s)) {
                s.add(Subscriptions.create(new Action0() { // from class: rx.internal.operators.BufferUntilSubscriber.OnSubscribeAction.1
                    @Override // rx.functions.Action0
                    public void call() {
                        OnSubscribeAction.this.state.observerRef = BufferUntilSubscriber.EMPTY_OBSERVER;
                    }
                }));
                boolean win = false;
                synchronized (this.state.guard) {
                    if (!this.state.emitting) {
                        this.state.emitting = true;
                        win = true;
                    }
                }
                if (win) {
                    NotificationLite<T> nl = NotificationLite.instance();
                    while (true) {
                        Object o = this.state.buffer.poll();
                        if (o != null) {
                            nl.accept(this.state.observerRef, o);
                        } else {
                            synchronized (this.state.guard) {
                                if (this.state.buffer.isEmpty()) {
                                    this.state.emitting = false;
                                    return;
                                }
                            }
                        }
                    }
                }
            } else {
                s.onError(new IllegalStateException("Only one subscriber allowed!"));
            }
        }
    }

    private BufferUntilSubscriber(State<T> state) {
        super(new OnSubscribeAction(state));
        this.forward = false;
        this.state = state;
    }

    private void emit(Object v) {
        synchronized (this.state.guard) {
            this.state.buffer.add(v);
            if (this.state.observerRef != null && !this.state.emitting) {
                this.forward = true;
                this.state.emitting = true;
            }
        }
        if (!this.forward) {
            return;
        }
        while (true) {
            Object o = this.state.buffer.poll();
            if (o != null) {
                this.state.nl.accept(this.state.observerRef, o);
            } else {
                return;
            }
        }
    }

    @Override // rx.Observer
    public void onCompleted() {
        if (this.forward) {
            this.state.observerRef.onCompleted();
        } else {
            emit(this.state.nl.completed());
        }
    }

    @Override // rx.Observer
    public void onError(Throwable e) {
        if (this.forward) {
            this.state.observerRef.onError(e);
        } else {
            emit(this.state.nl.error(e));
        }
    }

    @Override // rx.Observer
    public void onNext(T t) {
        if (this.forward) {
            this.state.observerRef.onNext(t);
        } else {
            emit(this.state.nl.next(t));
        }
    }

    @Override // rx.subjects.Subject
    public boolean hasObservers() {
        boolean z;
        synchronized (this.state.guard) {
            z = this.state.observerRef != null;
        }
        return z;
    }
}
