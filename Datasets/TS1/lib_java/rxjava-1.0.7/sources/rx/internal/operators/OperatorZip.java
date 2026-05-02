package rx.internal.operators;

import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Observable;
import rx.Observer;
import rx.Producer;
import rx.Subscriber;
import rx.exceptions.MissingBackpressureException;
import rx.exceptions.OnErrorThrowable;
import rx.functions.Func2;
import rx.functions.Func3;
import rx.functions.Func4;
import rx.functions.Func5;
import rx.functions.Func6;
import rx.functions.Func7;
import rx.functions.Func8;
import rx.functions.Func9;
import rx.functions.FuncN;
import rx.functions.Functions;
import rx.internal.util.RxRingBuffer;
import rx.subscriptions.CompositeSubscription;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorZip.class */
public final class OperatorZip<R> implements Observable.Operator<R, Observable<?>[]> {
    final FuncN<? extends R> zipFunction;

    public OperatorZip(FuncN<? extends R> f) {
        this.zipFunction = f;
    }

    public OperatorZip(Func2 f) {
        this.zipFunction = Functions.fromFunc(f);
    }

    public OperatorZip(Func3 f) {
        this.zipFunction = Functions.fromFunc(f);
    }

    public OperatorZip(Func4 f) {
        this.zipFunction = Functions.fromFunc(f);
    }

    public OperatorZip(Func5 f) {
        this.zipFunction = Functions.fromFunc(f);
    }

    public OperatorZip(Func6 f) {
        this.zipFunction = Functions.fromFunc(f);
    }

    public OperatorZip(Func7 f) {
        this.zipFunction = Functions.fromFunc(f);
    }

    public OperatorZip(Func8 f) {
        this.zipFunction = Functions.fromFunc(f);
    }

    public OperatorZip(Func9 f) {
        this.zipFunction = Functions.fromFunc(f);
    }

    @Override // rx.functions.Func1
    public Subscriber<? super Observable[]> call(Subscriber<? super R> child) {
        Zip<R> zipper = new Zip<>(child, this.zipFunction);
        ZipProducer<R> producer = new ZipProducer<>(zipper);
        child.setProducer(producer);
        OperatorZip<R>.ZipSubscriber subscriber = new ZipSubscriber(child, zipper, producer);
        return subscriber;
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorZip$ZipSubscriber.class */
    private final class ZipSubscriber extends Subscriber<Observable[]> {
        final Subscriber<? super R> child;
        final Zip<R> zipper;
        final ZipProducer<R> producer;
        boolean started;

        public ZipSubscriber(Subscriber<? super R> child, Zip<R> zipper, ZipProducer<R> producer) {
            super(child);
            this.started = false;
            this.child = child;
            this.zipper = zipper;
            this.producer = producer;
        }

        @Override // rx.Observer
        public void onCompleted() {
            if (!this.started) {
                this.child.onCompleted();
            }
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            this.child.onError(e);
        }

        @Override // rx.Observer
        public void onNext(Observable[] observables) {
            if (observables == null || observables.length == 0) {
                this.child.onCompleted();
            } else {
                this.started = true;
                this.zipper.start(observables, this.producer);
            }
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorZip$ZipProducer.class */
    private static final class ZipProducer<R> extends AtomicLong implements Producer {
        private static final long serialVersionUID = -1216676403723546796L;
        private Zip<R> zipper;

        public ZipProducer(Zip<R> zipper) {
            this.zipper = zipper;
        }

        @Override // rx.Producer
        public void request(long n) {
            BackpressureUtils.getAndAddRequest(this, n);
            this.zipper.tick();
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorZip$Zip.class */
    private static final class Zip<R> {
        private final Observer<? super R> child;
        private final FuncN<? extends R> zipFunction;
        volatile long counter;
        static final AtomicLongFieldUpdater<Zip> COUNTER_UPDATER = AtomicLongFieldUpdater.newUpdater(Zip.class, "counter");
        static final int THRESHOLD = (int) (RxRingBuffer.SIZE * 0.7d);
        private Object[] observers;
        private AtomicLong requested;
        private final CompositeSubscription childSubscription = new CompositeSubscription();
        int emitted = 0;

        public Zip(Subscriber<? super R> child, FuncN<? extends R> zipFunction) {
            this.child = child;
            this.zipFunction = zipFunction;
            child.add(this.childSubscription);
        }

        public void start(Observable[] os, AtomicLong requested) {
            this.observers = new Object[os.length];
            this.requested = requested;
            for (int i = 0; i < os.length; i++) {
                Zip<R>.InnerSubscriber io = new InnerSubscriber();
                this.observers[i] = io;
                this.childSubscription.add(io);
            }
            for (int i2 = 0; i2 < os.length; i2++) {
                os[i2].unsafeSubscribe((InnerSubscriber) this.observers[i2]);
            }
        }

        void tick() {
            Object[] objArr = this.observers;
            if (objArr != null && COUNTER_UPDATER.getAndIncrement(this) == 0) {
                int length = objArr.length;
                Observer<? super R> observer = this.child;
                AtomicLong atomicLong = this.requested;
                while (true) {
                    Object[] objArr2 = new Object[length];
                    boolean z = true;
                    for (int i = 0; i < length; i++) {
                        RxRingBuffer rxRingBuffer = ((InnerSubscriber) objArr[i]).items;
                        Object peek = rxRingBuffer.peek();
                        if (peek == null) {
                            z = false;
                        } else {
                            if (rxRingBuffer.isCompleted(peek)) {
                                observer.onCompleted();
                                this.childSubscription.unsubscribe();
                                return;
                            }
                            objArr2[i] = rxRingBuffer.getValue(peek);
                        }
                    }
                    if (atomicLong.get() > 0 && z) {
                        try {
                            observer.onNext(this.zipFunction.call(objArr2));
                            atomicLong.decrementAndGet();
                            this.emitted++;
                            for (Object obj : objArr) {
                                RxRingBuffer rxRingBuffer2 = ((InnerSubscriber) obj).items;
                                rxRingBuffer2.poll();
                                if (rxRingBuffer2.isCompleted(rxRingBuffer2.peek())) {
                                    observer.onCompleted();
                                    this.childSubscription.unsubscribe();
                                    return;
                                }
                            }
                            if (this.emitted > THRESHOLD) {
                                for (Object obj2 : objArr) {
                                    ((InnerSubscriber) obj2).requestMore(this.emitted);
                                }
                                this.emitted = 0;
                            }
                        } catch (Throwable th) {
                            observer.onError(OnErrorThrowable.addValueAsLastCause(th, objArr2));
                            return;
                        }
                    } else if (COUNTER_UPDATER.decrementAndGet(this) <= 0) {
                        return;
                    }
                }
            }
        }

        /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorZip$Zip$InnerSubscriber.class */
        final class InnerSubscriber extends Subscriber {
            final RxRingBuffer items = RxRingBuffer.getSpmcInstance();

            InnerSubscriber() {
            }

            @Override // rx.Subscriber
            public void onStart() {
                request(RxRingBuffer.SIZE);
            }

            public void requestMore(long n) {
                request(n);
            }

            @Override // rx.Observer
            public void onCompleted() {
                this.items.onCompleted();
                Zip.this.tick();
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                Zip.this.child.onError(e);
            }

            @Override // rx.Observer
            public void onNext(Object t) {
                try {
                    this.items.onNext(t);
                } catch (MissingBackpressureException e) {
                    onError(e);
                }
                Zip.this.tick();
            }
        }
    }
}
