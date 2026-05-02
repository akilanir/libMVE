package rx.internal.operators;

import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Observable;
import rx.Producer;
import rx.Subscriber;
import rx.exceptions.CompositeException;
import rx.exceptions.MissingBackpressureException;
import rx.exceptions.OnErrorThrowable;
import rx.functions.Func1;
import rx.internal.util.RxRingBuffer;
import rx.internal.util.ScalarSynchronousObservable;
import rx.internal.util.SubscriptionIndexedRingBuffer;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorMerge.class */
public class OperatorMerge<T> implements Observable.Operator<T, Observable<? extends T>> {
    private final boolean delayErrors;

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorMerge$HolderNoDelay.class */
    private static final class HolderNoDelay {
        static final OperatorMerge<Object> INSTANCE = new OperatorMerge<>(false);

        private HolderNoDelay() {
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorMerge$HolderDelayErrors.class */
    private static final class HolderDelayErrors {
        static final OperatorMerge<Object> INSTANCE = new OperatorMerge<>(true);

        private HolderDelayErrors() {
        }
    }

    public static <T> OperatorMerge<T> instance(boolean z) {
        if (z) {
            return (OperatorMerge<T>) HolderDelayErrors.INSTANCE;
        }
        return (OperatorMerge<T>) HolderNoDelay.INSTANCE;
    }

    private OperatorMerge() {
        this.delayErrors = false;
    }

    private OperatorMerge(boolean delayErrors) {
        this.delayErrors = delayErrors;
    }

    @Override // rx.functions.Func1
    public Subscriber<Observable<? extends T>> call(Subscriber<? super T> child) {
        return new MergeSubscriber(child, this.delayErrors);
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorMerge$MergeSubscriber.class */
    private static final class MergeSubscriber<T> extends Subscriber<Observable<? extends T>> {
        final NotificationLite<T> on;
        final Subscriber<? super T> actual;
        private final MergeProducer<T> mergeProducer;
        private int wip;
        private boolean completed;
        private final boolean delayErrors;
        private ConcurrentLinkedQueue<Throwable> exceptions;
        private volatile SubscriptionIndexedRingBuffer<InnerSubscriber<T>> childrenSubscribers;
        private volatile RxRingBuffer scalarValueQueue;
        private int missedEmitting;
        private boolean emitLock;
        int lastDrainedIndex;
        final Func1<InnerSubscriber<T>, Boolean> DRAIN_ACTION;

        public MergeSubscriber(Subscriber<? super T> actual, boolean delayErrors) {
            super(actual);
            this.on = NotificationLite.instance();
            this.scalarValueQueue = null;
            this.missedEmitting = 0;
            this.emitLock = false;
            this.lastDrainedIndex = 0;
            this.DRAIN_ACTION = new Func1<InnerSubscriber<T>, Boolean>() { // from class: rx.internal.operators.OperatorMerge.MergeSubscriber.1
                @Override // rx.functions.Func1
                public Boolean call(InnerSubscriber<T> s) {
                    if (((InnerSubscriber) s).q != null) {
                        long r = MergeSubscriber.this.mergeProducer.requested;
                        int emitted = s.drainQueue();
                        if (emitted > 0) {
                            s.requestMore(emitted);
                        }
                        if (emitted == r) {
                            return Boolean.FALSE;
                        }
                    }
                    return Boolean.TRUE;
                }
            };
            this.actual = actual;
            this.mergeProducer = new MergeProducer<>(this);
            this.delayErrors = delayErrors;
            actual.add(this);
            actual.setProducer(this.mergeProducer);
        }

        @Override // rx.Subscriber
        public void onStart() {
            request(RxRingBuffer.SIZE);
        }

        @Override // rx.Observer
        public void onNext(Observable<? extends T> t) {
            if (t instanceof ScalarSynchronousObservable) {
                ScalarSynchronousObservable<? extends T> t2 = (ScalarSynchronousObservable) t;
                handleScalarSynchronousObservable(t2);
            } else {
                if (t == null || isUnsubscribed()) {
                    return;
                }
                synchronized (this) {
                    this.wip++;
                }
                handleNewSource(t);
            }
        }

        private void handleNewSource(Observable<? extends T> t) {
            if (this.childrenSubscribers == null) {
                this.childrenSubscribers = new SubscriptionIndexedRingBuffer<>();
                add(this.childrenSubscribers);
            }
            MergeProducer<T> producerIfNeeded = null;
            if (((MergeProducer) this.mergeProducer).requested != Long.MAX_VALUE) {
                producerIfNeeded = this.mergeProducer;
            }
            InnerSubscriber<T> i = new InnerSubscriber<>(this, producerIfNeeded);
            i.sindex = this.childrenSubscribers.add(i);
            t.unsafeSubscribe(i);
            if (!isUnsubscribed()) {
                request(1L);
            }
        }

        private void handleScalarSynchronousObservable(ScalarSynchronousObservable<? extends T> t) {
            if (((MergeProducer) this.mergeProducer).requested == Long.MAX_VALUE) {
                handleScalarSynchronousObservableWithoutRequestLimits(t);
            } else {
                handleScalarSynchronousObservableWithRequestLimits(t);
            }
        }

        private void handleScalarSynchronousObservableWithoutRequestLimits(ScalarSynchronousObservable<? extends T> t) {
            T value = t.get();
            if (getEmitLock()) {
                try {
                    this.actual.onNext(value);
                    boolean moreToDrain = releaseEmitLock();
                    if (moreToDrain) {
                        drainQueuesIfNeeded();
                    }
                    request(1L);
                    return;
                } catch (Throwable th) {
                    releaseEmitLock();
                    throw th;
                }
            }
            try {
                getOrCreateScalarValueQueue().onNext(value);
            } catch (MissingBackpressureException e) {
                onError(e);
            }
        }

        private void handleScalarSynchronousObservableWithRequestLimits(ScalarSynchronousObservable<? extends T> scalarSynchronousObservable) {
            if (getEmitLock()) {
                boolean z = false;
                boolean z2 = false;
                try {
                    if (((MergeProducer) this.mergeProducer).requested > 0) {
                        z = true;
                        this.actual.onNext(scalarSynchronousObservable.get());
                        MergeProducer.REQUESTED.decrementAndGet(this.mergeProducer);
                        z2 = true;
                    }
                    if (releaseEmitLock()) {
                        drainQueuesIfNeeded();
                    }
                    if (z) {
                        request(1L);
                    }
                    if (z2) {
                        return;
                    }
                } finally {
                    releaseEmitLock();
                }
            }
            try {
                getOrCreateScalarValueQueue().onNext(scalarSynchronousObservable.get());
            } catch (MissingBackpressureException e) {
                onError(e);
            }
        }

        private RxRingBuffer getOrCreateScalarValueQueue() {
            RxRingBuffer svq = this.scalarValueQueue;
            if (svq == null) {
                svq = RxRingBuffer.getSpscInstance();
                this.scalarValueQueue = svq;
            }
            return svq;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public synchronized boolean releaseEmitLock() {
            this.emitLock = false;
            if (this.missedEmitting == 0) {
                return false;
            }
            return true;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public synchronized boolean getEmitLock() {
            if (this.emitLock) {
                this.missedEmitting++;
                return false;
            }
            this.emitLock = true;
            this.missedEmitting = 0;
            return true;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public boolean drainQueuesIfNeeded() {
            while (getEmitLock()) {
                try {
                    int emitted = drainScalarValueQueue();
                    drainChildrenQueues();
                    boolean moreToDrain = releaseEmitLock();
                    if (emitted > 0) {
                        request(emitted);
                    }
                    if (!moreToDrain) {
                        return true;
                    }
                } catch (Throwable th) {
                    releaseEmitLock();
                    throw th;
                }
            }
            return false;
        }

        private void drainChildrenQueues() {
            if (this.childrenSubscribers != null) {
                this.lastDrainedIndex = this.childrenSubscribers.forEach(this.DRAIN_ACTION, this.lastDrainedIndex);
            }
        }

        private int drainScalarValueQueue() {
            Object o;
            RxRingBuffer svq = this.scalarValueQueue;
            if (svq == null) {
                return 0;
            }
            long r = ((MergeProducer) this.mergeProducer).requested;
            int emittedWhileDraining = 0;
            if (r < 0) {
                while (true) {
                    Object o2 = svq.poll();
                    if (o2 == null) {
                        break;
                    }
                    this.on.accept(this.actual, o2);
                    emittedWhileDraining++;
                }
            } else if (r > 0) {
                for (int i = 0; i < r && (o = svq.poll()) != null; i++) {
                    this.on.accept(this.actual, o);
                    emittedWhileDraining++;
                }
                MergeProducer.REQUESTED.getAndAdd(this.mergeProducer, -emittedWhileDraining);
            }
            return emittedWhileDraining;
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            if (!this.completed) {
                this.completed = true;
                innerError(e, true);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void innerError(Throwable e, boolean parent) {
            if (this.delayErrors) {
                synchronized (this) {
                    if (this.exceptions == null) {
                        this.exceptions = new ConcurrentLinkedQueue<>();
                    }
                }
                this.exceptions.add(e);
                boolean sendOnComplete = false;
                synchronized (this) {
                    if (!parent) {
                        this.wip--;
                        if ((this.wip != 0 && this.completed) || this.wip < 0) {
                        }
                    } else {
                        sendOnComplete = this.wip != 0 ? true : true;
                    }
                }
                if (sendOnComplete) {
                    drainAndComplete();
                    return;
                }
                return;
            }
            this.actual.onError(e);
        }

        @Override // rx.Observer
        public void onCompleted() {
            boolean c = false;
            synchronized (this) {
                this.completed = true;
                if (this.wip == 0) {
                    c = true;
                }
            }
            if (c) {
                drainAndComplete();
            }
        }

        void completeInner(InnerSubscriber<T> s) {
            boolean sendOnComplete = false;
            synchronized (this) {
                this.wip--;
                if (this.wip == 0 && this.completed) {
                    sendOnComplete = true;
                }
            }
            this.childrenSubscribers.remove(s.sindex);
            if (sendOnComplete) {
                drainAndComplete();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void drainAndComplete() {
            Queue<Throwable> es;
            boolean moreToDrain = true;
            while (moreToDrain) {
                synchronized (this) {
                    this.missedEmitting = 0;
                }
                drainScalarValueQueue();
                drainChildrenQueues();
                synchronized (this) {
                    moreToDrain = this.missedEmitting > 0;
                }
            }
            RxRingBuffer svq = this.scalarValueQueue;
            if (svq == null || svq.isEmpty()) {
                if (this.delayErrors) {
                    synchronized (this) {
                        es = this.exceptions;
                    }
                    if (es != null) {
                        if (es.isEmpty()) {
                            this.actual.onCompleted();
                            return;
                        } else if (es.size() == 1) {
                            this.actual.onError(es.poll());
                            return;
                        } else {
                            this.actual.onError(new CompositeException(es));
                            return;
                        }
                    }
                    this.actual.onCompleted();
                    return;
                }
                this.actual.onCompleted();
            }
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorMerge$MergeProducer.class */
    private static final class MergeProducer<T> implements Producer {
        private final MergeSubscriber<T> ms;
        private volatile long requested = 0;
        static final AtomicLongFieldUpdater<MergeProducer> REQUESTED = AtomicLongFieldUpdater.newUpdater(MergeProducer.class, "requested");

        public MergeProducer(MergeSubscriber<T> ms) {
            this.ms = ms;
        }

        @Override // rx.Producer
        public void request(long n) {
            if (this.requested == Long.MAX_VALUE) {
                return;
            }
            if (n == Long.MAX_VALUE) {
                this.requested = Long.MAX_VALUE;
                return;
            }
            BackpressureUtils.getAndAddRequest(REQUESTED, this, n);
            if (this.ms.drainQueuesIfNeeded()) {
                boolean sendComplete = false;
                synchronized (this.ms) {
                    if (((MergeSubscriber) this.ms).wip == 0 && ((MergeSubscriber) this.ms).scalarValueQueue != null && ((MergeSubscriber) this.ms).scalarValueQueue.isEmpty()) {
                        sendComplete = true;
                    }
                }
                if (sendComplete) {
                    this.ms.drainAndComplete();
                }
            }
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorMerge$InnerSubscriber.class */
    private static final class InnerSubscriber<T> extends Subscriber<T> {
        public int sindex;
        final MergeSubscriber<T> parentSubscriber;
        final MergeProducer<T> producer;
        volatile int terminated;
        static final AtomicIntegerFieldUpdater<InnerSubscriber> ONCE_TERMINATED = AtomicIntegerFieldUpdater.newUpdater(InnerSubscriber.class, "terminated");
        private final RxRingBuffer q = RxRingBuffer.getSpscInstance();

        public InnerSubscriber(MergeSubscriber<T> parent, MergeProducer<T> producer) {
            this.parentSubscriber = parent;
            this.producer = producer;
            add(this.q);
            request(this.q.capacity());
        }

        @Override // rx.Observer
        public void onNext(T t) {
            emit(t, false);
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            if (ONCE_TERMINATED.compareAndSet(this, 0, 1)) {
                this.parentSubscriber.innerError(e, false);
            }
        }

        @Override // rx.Observer
        public void onCompleted() {
            if (ONCE_TERMINATED.compareAndSet(this, 0, 1)) {
                emit(null, true);
            }
        }

        public void requestMore(long n) {
            request(n);
        }

        /* JADX WARN: Finally extract failed */
        private void emit(T t, boolean complete) {
            boolean drain = false;
            boolean enqueue = true;
            if (this.parentSubscriber.getEmitLock()) {
                enqueue = false;
                try {
                    long emitted = 0 + drainQueue();
                    if (this.producer == null) {
                        if (complete) {
                            this.parentSubscriber.completeInner(this);
                        } else {
                            try {
                                this.parentSubscriber.actual.onNext(t);
                            } catch (Throwable e) {
                                onError(OnErrorThrowable.addValueAsLastCause(e, t));
                            }
                            emitted++;
                        }
                    } else if (((MergeProducer) this.producer).requested > 0 && this.q.count() == 0) {
                        if (complete) {
                            this.parentSubscriber.completeInner(this);
                        } else {
                            try {
                                this.parentSubscriber.actual.onNext(t);
                            } catch (Throwable e2) {
                                onError(OnErrorThrowable.addValueAsLastCause(e2, t));
                            }
                            emitted++;
                            MergeProducer.REQUESTED.decrementAndGet(this.producer);
                        }
                    } else {
                        enqueue = true;
                    }
                    drain = this.parentSubscriber.releaseEmitLock();
                    if (emitted > 0) {
                        request(emitted);
                    }
                } catch (Throwable th) {
                    this.parentSubscriber.releaseEmitLock();
                    throw th;
                }
            }
            if (enqueue) {
                enqueue(t, complete);
                drain = true;
            }
            if (drain) {
                this.parentSubscriber.drainQueuesIfNeeded();
            }
        }

        private void enqueue(T t, boolean complete) {
            try {
                if (complete) {
                    this.q.onCompleted();
                } else {
                    this.q.onNext(t);
                }
            } catch (MissingBackpressureException e) {
                onError(e);
            }
        }

        private int drainRequested() {
            Object o;
            int emitted = 0;
            long toEmit = ((MergeProducer) this.producer).requested;
            for (int i = 0; i < toEmit && (o = this.q.poll()) != null; i++) {
                if (this.q.isCompleted(o)) {
                    this.parentSubscriber.completeInner(this);
                } else {
                    try {
                        if (!this.q.accept(o, this.parentSubscriber.actual)) {
                            emitted++;
                        }
                    } catch (Throwable e) {
                        onError(OnErrorThrowable.addValueAsLastCause(e, o));
                    }
                }
            }
            MergeProducer.REQUESTED.getAndAdd(this.producer, -emitted);
            return emitted;
        }

        private int drainAll() {
            int emitted = 0;
            while (true) {
                Object o = this.q.poll();
                if (o != null) {
                    if (this.q.isCompleted(o)) {
                        this.parentSubscriber.completeInner(this);
                    } else {
                        try {
                            if (!this.q.accept(o, this.parentSubscriber.actual)) {
                                emitted++;
                            }
                        } catch (Throwable e) {
                            onError(OnErrorThrowable.addValueAsLastCause(e, o));
                        }
                    }
                } else {
                    return emitted;
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public int drainQueue() {
            if (this.producer != null) {
                return drainRequested();
            }
            return drainAll();
        }
    }
}
