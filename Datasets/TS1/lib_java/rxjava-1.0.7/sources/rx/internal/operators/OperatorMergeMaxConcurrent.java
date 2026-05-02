package rx.internal.operators;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Queue;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Observable;
import rx.Producer;
import rx.Subscriber;
import rx.exceptions.MissingBackpressureException;
import rx.internal.util.RxRingBuffer;
import rx.observers.SerializedSubscriber;
import rx.subscriptions.CompositeSubscription;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorMergeMaxConcurrent.class */
public final class OperatorMergeMaxConcurrent<T> implements Observable.Operator<T, Observable<? extends T>> {
    final int maxConcurrency;

    public OperatorMergeMaxConcurrent(int maxConcurrency) {
        this.maxConcurrency = maxConcurrency;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super Observable<? extends T>> call(Subscriber<? super T> child) {
        SerializedSubscriber<T> s = new SerializedSubscriber<>(child);
        CompositeSubscription csub = new CompositeSubscription();
        child.add(csub);
        SourceSubscriber<T> ssub = new SourceSubscriber<>(this.maxConcurrency, s, csub);
        child.setProducer(new MergeMaxConcurrentProducer(ssub));
        return ssub;
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorMergeMaxConcurrent$MergeMaxConcurrentProducer.class */
    static final class MergeMaxConcurrentProducer<T> implements Producer {
        final SourceSubscriber<T> ssub;

        public MergeMaxConcurrentProducer(SourceSubscriber<T> ssub) {
            this.ssub = ssub;
        }

        @Override // rx.Producer
        public void request(long n) {
            this.ssub.downstreamRequest(n);
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber.class */
    static final class SourceSubscriber<T> extends Subscriber<Observable<? extends T>> {
        final NotificationLite<T> nl;
        final int maxConcurrency;
        final Subscriber<T> s;
        final CompositeSubscription csub;
        final Object guard;
        volatile int wip;
        volatile int sourceIndex;
        int active;
        final Queue<Observable<? extends T>> queue;
        boolean emitting;
        int missedEmitting;
        int lastIndex;
        final List<SourceSubscriber<T>.MergeItemSubscriber> subscribers;
        volatile long requested;
        static final AtomicIntegerFieldUpdater<SourceSubscriber> WIP = AtomicIntegerFieldUpdater.newUpdater(SourceSubscriber.class, "wip");
        static final AtomicIntegerFieldUpdater<SourceSubscriber> SOURCE_INDEX = AtomicIntegerFieldUpdater.newUpdater(SourceSubscriber.class, "sourceIndex");
        static final AtomicLongFieldUpdater<SourceSubscriber> REQUESTED = AtomicLongFieldUpdater.newUpdater(SourceSubscriber.class, "requested");

        public SourceSubscriber(int maxConcurrency, Subscriber<T> s, CompositeSubscription csub) {
            super(s);
            this.nl = NotificationLite.instance();
            this.maxConcurrency = maxConcurrency;
            this.s = s;
            this.csub = csub;
            this.guard = new Object();
            this.queue = new ArrayDeque(maxConcurrency);
            this.subscribers = Collections.synchronizedList(new ArrayList());
            this.wip = 1;
        }

        @Override // rx.Subscriber
        public void onStart() {
            request(this.maxConcurrency);
        }

        @Override // rx.Observer
        public void onNext(Observable<? extends T> t) {
            synchronized (this.guard) {
                this.queue.add(t);
            }
            subscribeNext();
        }

        void subscribeNext() {
            synchronized (this.guard) {
                Observable<? extends T> t = this.queue.peek();
                if (t == null || this.active >= this.maxConcurrency) {
                    return;
                }
                this.active++;
                this.queue.poll();
                SourceSubscriber<T>.MergeItemSubscriber itemSub = new MergeItemSubscriber(SOURCE_INDEX.getAndIncrement(this));
                this.subscribers.add(itemSub);
                this.csub.add(itemSub);
                WIP.incrementAndGet(this);
                t.unsafeSubscribe(itemSub);
                request(1L);
            }
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            Object[] active;
            synchronized (this.subscribers) {
                active = this.subscribers.toArray();
                this.subscribers.clear();
            }
            try {
                this.s.onError(e);
                unsubscribe();
                for (Object o : active) {
                    SourceSubscriber<T>.MergeItemSubscriber a = (MergeItemSubscriber) o;
                    a.release();
                }
            } catch (Throwable th) {
                for (Object o2 : active) {
                    SourceSubscriber<T>.MergeItemSubscriber a2 = (MergeItemSubscriber) o2;
                    a2.release();
                }
                throw th;
            }
        }

        @Override // rx.Observer
        public void onCompleted() {
            WIP.decrementAndGet(this);
            drain();
        }

        protected void downstreamRequest(long n) {
            long r;
            long u;
            do {
                r = this.requested;
                if ((r != Long.MAX_VALUE && n == Long.MAX_VALUE) || r + n < 0) {
                    u = Long.MAX_VALUE;
                } else {
                    u = r + n;
                }
            } while (!REQUESTED.compareAndSet(this, r, u));
            drain();
        }

        /* JADX WARN: Code restructure failed: missing block: B:48:0x0102, code lost:
        
            r0.remove(r0);
            r0 = r5.guard;
         */
        /* JADX WARN: Code restructure failed: missing block: B:49:0x0112, code lost:
        
            monitor-enter(r0);
         */
        /* JADX WARN: Code restructure failed: missing block: B:50:0x0113, code lost:
        
            r5.active--;
         */
        /* JADX WARN: Code restructure failed: missing block: B:51:0x011f, code lost:
        
            monitor-exit(r0);
         */
        /* JADX WARN: Code restructure failed: missing block: B:58:0x012b, code lost:
        
            r5.csub.remove(r0);
            r0.release();
            subscribeNext();
            rx.internal.operators.OperatorMergeMaxConcurrent.SourceSubscriber.WIP.decrementAndGet(r5);
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        protected void drain() {
            /*
                Method dump skipped, instructions count: 502
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: rx.internal.operators.OperatorMergeMaxConcurrent.SourceSubscriber.drain():void");
        }

        /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber.class */
        final class MergeItemSubscriber extends Subscriber<T> {
            final int index;
            volatile boolean once = true;
            final RxRingBuffer buffer = RxRingBuffer.getSpmcInstance();

            public MergeItemSubscriber(int index) {
                this.index = index;
            }

            @Override // rx.Subscriber
            public void onStart() {
                request(RxRingBuffer.SIZE);
            }

            @Override // rx.Observer
            public void onNext(T t) {
                try {
                    this.buffer.onNext(t);
                    SourceSubscriber.this.drain();
                } catch (MissingBackpressureException ex) {
                    onError(ex);
                }
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                SourceSubscriber.this.onError(e);
            }

            @Override // rx.Observer
            public void onCompleted() {
                if (this.once) {
                    this.once = false;
                    SourceSubscriber.this.drain();
                }
            }

            void requestMore(long n) {
                request(n);
            }

            void release() {
                this.buffer.release();
            }
        }
    }
}
