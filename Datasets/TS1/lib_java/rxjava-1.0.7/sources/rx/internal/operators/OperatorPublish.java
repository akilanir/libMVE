package rx.internal.operators;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Observable;
import rx.Producer;
import rx.Subscriber;
import rx.Subscription;
import rx.exceptions.Exceptions;
import rx.exceptions.MissingBackpressureException;
import rx.functions.Action0;
import rx.functions.Action1;
import rx.functions.Func1;
import rx.internal.util.RxRingBuffer;
import rx.observables.ConnectableObservable;
import rx.subscriptions.Subscriptions;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorPublish.class */
public class OperatorPublish<T> extends ConnectableObservable<T> {
    final Observable<? extends T> source;
    private final RequestHandler<T> requestHandler;

    public static <T> ConnectableObservable<T> create(Observable<? extends T> source) {
        return new OperatorPublish(source);
    }

    public static <T, R> Observable<R> create(final Observable<? extends T> source, final Func1<? super Observable<T>, ? extends Observable<R>> selector) {
        return Observable.create(new Observable.OnSubscribe<R>() { // from class: rx.internal.operators.OperatorPublish.1
            @Override // rx.functions.Action1
            public void call(final Subscriber<? super R> child) {
                OperatorPublish<T> op = new OperatorPublish<>(source);
                ((Observable) selector.call(op)).unsafeSubscribe(child);
                op.connect(new Action1<Subscription>() { // from class: rx.internal.operators.OperatorPublish.1.1
                    @Override // rx.functions.Action1
                    public void call(Subscription sub) {
                        child.add(sub);
                    }
                });
            }
        });
    }

    private OperatorPublish(Observable<? extends T> source) {
        this(source, new Object(), new RequestHandler());
    }

    private OperatorPublish(Observable<? extends T> source, Object guard, final RequestHandler<T> requestHandler) {
        super(new Observable.OnSubscribe<T>() { // from class: rx.internal.operators.OperatorPublish.2
            @Override // rx.functions.Action1
            public void call(final Subscriber<? super T> subscriber) {
                subscriber.setProducer(new Producer() { // from class: rx.internal.operators.OperatorPublish.2.1
                    @Override // rx.Producer
                    public void request(long n) {
                        requestHandler.requestFromChildSubscriber(subscriber, n);
                    }
                });
                subscriber.add(Subscriptions.create(new Action0() { // from class: rx.internal.operators.OperatorPublish.2.2
                    @Override // rx.functions.Action0
                    public void call() {
                        requestHandler.state.removeSubscriber(subscriber);
                    }
                }));
            }
        });
        this.source = source;
        this.requestHandler = requestHandler;
    }

    @Override // rx.observables.ConnectableObservable
    public void connect(Action1<? super Subscription> connection) {
        boolean shouldSubscribe = false;
        OriginSubscriber<T> origin = ((RequestHandler) this.requestHandler).state.getOrigin();
        if (origin == null) {
            shouldSubscribe = true;
            ((RequestHandler) this.requestHandler).state.setOrigin(new OriginSubscriber<>(this.requestHandler));
        }
        if (shouldSubscribe) {
            connection.call(Subscriptions.create(new Action0() { // from class: rx.internal.operators.OperatorPublish.3
                @Override // rx.functions.Action0
                public void call() {
                    OriginSubscriber<T> s = OperatorPublish.this.requestHandler.state.getOrigin();
                    OperatorPublish.this.requestHandler.state.setOrigin(null);
                    if (s != null) {
                        s.unsubscribe();
                    }
                }
            }));
            OriginSubscriber<T> os = ((RequestHandler) this.requestHandler).state.getOrigin();
            if (os != null) {
                this.source.unsafeSubscribe(os);
            }
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorPublish$OriginSubscriber.class */
    private static class OriginSubscriber<T> extends Subscriber<T> {
        private final RequestHandler<T> requestHandler;
        private final AtomicLong originOutstanding = new AtomicLong();
        private final long THRESHOLD = RxRingBuffer.SIZE / 4;
        private final RxRingBuffer buffer = RxRingBuffer.getSpmcInstance();

        OriginSubscriber(RequestHandler<T> requestHandler) {
            this.requestHandler = requestHandler;
            add(this.buffer);
        }

        @Override // rx.Subscriber
        public void onStart() {
            requestMore(RxRingBuffer.SIZE);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void requestMore(long r) {
            this.originOutstanding.addAndGet(r);
            request(r);
        }

        @Override // rx.Observer
        public void onCompleted() {
            try {
                this.requestHandler.emit(((RequestHandler) this.requestHandler).notifier.completed());
            } catch (MissingBackpressureException e) {
                onError(e);
            }
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            List<Throwable> errors = null;
            Subscriber<? super T>[] arr$ = ((RequestHandler) this.requestHandler).state.getSubscribers();
            for (Subscriber<? super T> subscriber : arr$) {
                try {
                    subscriber.onError(e);
                } catch (Throwable e2) {
                    if (errors == null) {
                        errors = new ArrayList<>();
                    }
                    errors.add(e2);
                }
            }
            Exceptions.throwIfAny(errors);
        }

        @Override // rx.Observer
        public void onNext(T t) {
            try {
                this.requestHandler.emit(((RequestHandler) this.requestHandler).notifier.next(t));
            } catch (MissingBackpressureException e) {
                onError(e);
            }
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorPublish$State.class */
    private static class State<T> {
        private long outstandingRequests;
        private OriginSubscriber<T> origin;
        private final Map<Subscriber<? super T>, AtomicLong> ss;
        private Subscriber<? super T>[] subscribers;

        private State() {
            this.outstandingRequests = -1L;
            this.ss = new LinkedHashMap();
            this.subscribers = new Subscriber[0];
        }

        public synchronized OriginSubscriber<T> getOrigin() {
            return this.origin;
        }

        public synchronized void setOrigin(OriginSubscriber<T> o) {
            this.origin = o;
        }

        public synchronized boolean canEmitWithDecrement() {
            if (this.outstandingRequests > 0) {
                this.outstandingRequests--;
                return true;
            }
            return false;
        }

        public synchronized void incrementOutstandingAfterFailedEmit() {
            this.outstandingRequests++;
        }

        public synchronized Subscriber<? super T>[] getSubscribers() {
            return this.subscribers;
        }

        public synchronized long requestFromSubscriber(Subscriber<? super T> subscriber, long request) {
            long current;
            long u;
            Map<Subscriber<? super T>, AtomicLong> subs = this.ss;
            AtomicLong r = subs.get(subscriber);
            if (r == null) {
                subs.put(subscriber, new AtomicLong(request));
            } else {
                do {
                    current = r.get();
                    if (current == Long.MAX_VALUE) {
                        break;
                    }
                    u = current + request;
                    if (u < 0) {
                        u = Long.MAX_VALUE;
                    }
                } while (!r.compareAndSet(current, u));
            }
            return resetAfterSubscriberUpdate(subs);
        }

        public synchronized void removeSubscriber(Subscriber<? super T> subscriber) {
            Map<Subscriber<? super T>, AtomicLong> subs = this.ss;
            subs.remove(subscriber);
            resetAfterSubscriberUpdate(subs);
        }

        private long resetAfterSubscriberUpdate(Map<Subscriber<? super T>, AtomicLong> subs) {
            Subscriber<? super T>[] subscriberArray = new Subscriber[subs.size()];
            int i = 0;
            long lowest = -1;
            for (Map.Entry<Subscriber<? super T>, AtomicLong> e : subs.entrySet()) {
                int i2 = i;
                i++;
                subscriberArray[i2] = e.getKey();
                AtomicLong l = e.getValue();
                long c = l.get();
                if (lowest == -1 || c < lowest) {
                    lowest = c;
                }
            }
            this.subscribers = subscriberArray;
            this.outstandingRequests = lowest;
            return lowest;
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorPublish$RequestHandler.class */
    private static class RequestHandler<T> {
        private final NotificationLite<T> notifier;
        private final State<T> state;
        volatile long wip;
        static final AtomicLongFieldUpdater<RequestHandler> WIP = AtomicLongFieldUpdater.newUpdater(RequestHandler.class, "wip");

        private RequestHandler() {
            this.notifier = NotificationLite.instance();
            this.state = new State<>();
        }

        public void requestFromChildSubscriber(Subscriber<? super T> subscriber, long request) {
            this.state.requestFromSubscriber(subscriber, request);
            OriginSubscriber<T> originSubscriber = this.state.getOrigin();
            if (originSubscriber != null) {
                drainQueue(originSubscriber);
            }
        }

        public void emit(Object t) throws MissingBackpressureException {
            OriginSubscriber<T> originSubscriber = this.state.getOrigin();
            if (originSubscriber == null) {
                return;
            }
            if (this.notifier.isCompleted(t)) {
                ((OriginSubscriber) originSubscriber).buffer.onCompleted();
            } else {
                ((OriginSubscriber) originSubscriber).buffer.onNext(this.notifier.getValue(t));
            }
            drainQueue(originSubscriber);
        }

        private void requestMoreAfterEmission(int emitted) {
            OriginSubscriber<T> origin = this.state.getOrigin();
            if (emitted > 0 && origin != null) {
                long r = ((OriginSubscriber) origin).originOutstanding.addAndGet(-emitted);
                if (r <= ((OriginSubscriber) origin).THRESHOLD) {
                    origin.requestMore(RxRingBuffer.SIZE - ((OriginSubscriber) origin).THRESHOLD);
                }
            }
        }

        public void drainQueue(OriginSubscriber<T> originSubscriber) {
            if (WIP.getAndIncrement(this) == 0) {
                State<T> localState = this.state;
                Map<Subscriber<? super T>, AtomicLong> localMap = ((State) localState).ss;
                RxRingBuffer localBuffer = ((OriginSubscriber) originSubscriber).buffer;
                NotificationLite<T> nl = this.notifier;
                int emitted = 0;
                do {
                    WIP.set(this, 1L);
                    while (true) {
                        boolean shouldEmit = localState.canEmitWithDecrement();
                        if (!shouldEmit) {
                            break;
                        }
                        Object o = localBuffer.poll();
                        if (o == null) {
                            localState.incrementOutstandingAfterFailedEmit();
                            break;
                        }
                        Subscriber<? super T>[] arr$ = localState.getSubscribers();
                        for (Subscriber<? super T> s : arr$) {
                            AtomicLong req = localMap.get(s);
                            if (req != null) {
                                nl.accept(s, o);
                                req.decrementAndGet();
                            }
                        }
                        emitted++;
                    }
                } while (WIP.decrementAndGet(this) > 0);
                requestMoreAfterEmission(emitted);
            }
        }
    }
}
