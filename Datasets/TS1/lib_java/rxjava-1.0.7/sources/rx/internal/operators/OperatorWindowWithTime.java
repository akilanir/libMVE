package rx.internal.operators;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import rx.Observable;
import rx.Observer;
import rx.Scheduler;
import rx.Subscriber;
import rx.functions.Action0;
import rx.observers.SerializedObserver;
import rx.observers.SerializedSubscriber;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorWindowWithTime.class */
public final class OperatorWindowWithTime<T> implements Observable.Operator<Observable<T>, T> {
    final long timespan;
    final long timeshift;
    final TimeUnit unit;
    final Scheduler scheduler;
    final int size;
    static final Object NEXT_SUBJECT = new Object();
    static final NotificationLite<Object> nl = NotificationLite.instance();

    public OperatorWindowWithTime(long timespan, long timeshift, TimeUnit unit, int size, Scheduler scheduler) {
        this.timespan = timespan;
        this.timeshift = timeshift;
        this.unit = unit;
        this.size = size;
        this.scheduler = scheduler;
    }

    @Override // rx.functions.Func1
    public Subscriber<? super T> call(Subscriber<? super Observable<T>> child) {
        Scheduler.Worker worker = this.scheduler.createWorker();
        child.add(worker);
        if (this.timespan == this.timeshift) {
            OperatorWindowWithTime<T>.ExactSubscriber s = new ExactSubscriber(child, worker);
            s.scheduleExact();
            return s;
        }
        OperatorWindowWithTime<T>.InexactSubscriber s2 = new InexactSubscriber(child, worker);
        s2.startNewChunk();
        s2.scheduleChunk();
        return s2;
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorWindowWithTime$State.class */
    static final class State<T> {
        final Observer<T> consumer;
        final Observable<T> producer;
        final int count;
        static final State<Object> EMPTY = new State<>(null, null, 0);

        public State(Observer<T> consumer, Observable<T> producer, int count) {
            this.consumer = consumer;
            this.producer = producer;
            this.count = count;
        }

        public State<T> next() {
            return new State<>(this.consumer, this.producer, this.count + 1);
        }

        public State<T> create(Observer<T> consumer, Observable<T> producer) {
            return new State<>(consumer, producer, 0);
        }

        public State<T> clear() {
            return empty();
        }

        public static <T> State<T> empty() {
            return (State<T>) EMPTY;
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorWindowWithTime$ExactSubscriber.class */
    final class ExactSubscriber extends Subscriber<T> {
        final Subscriber<? super Observable<T>> child;
        final Scheduler.Worker worker;
        final Object guard;
        List<Object> queue;
        boolean emitting;
        volatile State<T> state;

        public ExactSubscriber(Subscriber<? super Observable<T>> child, Scheduler.Worker worker) {
            super(child);
            this.child = new SerializedSubscriber(child);
            this.worker = worker;
            this.guard = new Object();
            this.state = State.empty();
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
                            once = false;
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
                if (o == OperatorWindowWithTime.NEXT_SUBJECT) {
                    replaceSubject();
                } else if (OperatorWindowWithTime.nl.isError(o)) {
                    error(OperatorWindowWithTime.nl.getError(o));
                    return;
                } else {
                    if (OperatorWindowWithTime.nl.isCompleted(o)) {
                        complete();
                        return;
                    }
                    emitValue(o);
                }
            }
        }

        void replaceSubject() {
            Observer<T> s = this.state.consumer;
            if (s != null) {
                s.onCompleted();
            }
            BufferUntilSubscriber<T> bus = BufferUntilSubscriber.create();
            this.state = this.state.create(bus, bus);
            this.child.onNext(bus);
        }

        void emitValue(T t) {
            State<T> s;
            State<T> s2 = this.state;
            if (s2.consumer == null) {
                replaceSubject();
                s2 = this.state;
            }
            s2.consumer.onNext(t);
            if (s2.count == OperatorWindowWithTime.this.size - 1) {
                s2.consumer.onCompleted();
                s = s2.clear();
            } else {
                s = s2.next();
            }
            this.state = s;
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            synchronized (this.guard) {
                if (this.emitting) {
                    this.queue = Collections.singletonList(OperatorWindowWithTime.nl.error(e));
                    return;
                }
                this.queue = null;
                this.emitting = true;
                error(e);
            }
        }

        void error(Throwable e) {
            Observer<T> s = this.state.consumer;
            this.state = this.state.clear();
            if (s != null) {
                s.onError(e);
            }
            this.child.onError(e);
            unsubscribe();
        }

        void complete() {
            Observer<T> s = this.state.consumer;
            this.state = this.state.clear();
            if (s != null) {
                s.onCompleted();
            }
            this.child.onCompleted();
            unsubscribe();
        }

        @Override // rx.Observer
        public void onCompleted() {
            synchronized (this.guard) {
                if (this.emitting) {
                    if (this.queue == null) {
                        this.queue = new ArrayList();
                    }
                    this.queue.add(OperatorWindowWithTime.nl.completed());
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

        void scheduleExact() {
            this.worker.schedulePeriodically(new Action0() { // from class: rx.internal.operators.OperatorWindowWithTime.ExactSubscriber.1
                @Override // rx.functions.Action0
                public void call() {
                    ExactSubscriber.this.nextWindow();
                }
            }, 0L, OperatorWindowWithTime.this.timespan, OperatorWindowWithTime.this.unit);
        }

        void nextWindow() {
            synchronized (this.guard) {
                if (this.emitting) {
                    if (this.queue == null) {
                        this.queue = new ArrayList();
                    }
                    this.queue.add(OperatorWindowWithTime.NEXT_SUBJECT);
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
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorWindowWithTime$CountedSerializedSubject.class */
    static final class CountedSerializedSubject<T> {
        final Observer<T> consumer;
        final Observable<T> producer;
        int count;

        public CountedSerializedSubject(Observer<T> consumer, Observable<T> producer) {
            this.consumer = new SerializedObserver(consumer);
            this.producer = producer;
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorWindowWithTime$InexactSubscriber.class */
    final class InexactSubscriber extends Subscriber<T> {
        final Subscriber<? super Observable<T>> child;
        final Scheduler.Worker worker;
        final Object guard;
        final List<CountedSerializedSubject<T>> chunks;
        boolean done;

        public InexactSubscriber(Subscriber<? super Observable<T>> child, Scheduler.Worker worker) {
            super(child);
            this.child = child;
            this.worker = worker;
            this.guard = new Object();
            this.chunks = new LinkedList();
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
                List<CountedSerializedSubject<T>> list = new ArrayList<>(this.chunks);
                Iterator<CountedSerializedSubject<T>> it = this.chunks.iterator();
                while (it.hasNext()) {
                    CountedSerializedSubject<T> cs = it.next();
                    int i = cs.count + 1;
                    cs.count = i;
                    if (i == OperatorWindowWithTime.this.size) {
                        it.remove();
                    }
                }
                for (CountedSerializedSubject<T> cs2 : list) {
                    cs2.consumer.onNext(t);
                    if (cs2.count == OperatorWindowWithTime.this.size) {
                        cs2.consumer.onCompleted();
                    }
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
                List<CountedSerializedSubject<T>> list = new ArrayList<>(this.chunks);
                this.chunks.clear();
                for (CountedSerializedSubject<T> cs : list) {
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
                List<CountedSerializedSubject<T>> list = new ArrayList<>(this.chunks);
                this.chunks.clear();
                for (CountedSerializedSubject<T> cs : list) {
                    cs.consumer.onCompleted();
                }
                this.child.onCompleted();
            }
        }

        void scheduleChunk() {
            this.worker.schedulePeriodically(new Action0() { // from class: rx.internal.operators.OperatorWindowWithTime.InexactSubscriber.1
                @Override // rx.functions.Action0
                public void call() {
                    InexactSubscriber.this.startNewChunk();
                }
            }, OperatorWindowWithTime.this.timeshift, OperatorWindowWithTime.this.timeshift, OperatorWindowWithTime.this.unit);
        }

        void startNewChunk() {
            final CountedSerializedSubject<T> chunk = createCountedSerializedSubject();
            synchronized (this.guard) {
                if (this.done) {
                    return;
                }
                this.chunks.add(chunk);
                try {
                    this.child.onNext(chunk.producer);
                    this.worker.schedule(new Action0() { // from class: rx.internal.operators.OperatorWindowWithTime.InexactSubscriber.2
                        @Override // rx.functions.Action0
                        public void call() {
                            InexactSubscriber.this.terminateChunk(chunk);
                        }
                    }, OperatorWindowWithTime.this.timespan, OperatorWindowWithTime.this.unit);
                } catch (Throwable e) {
                    onError(e);
                }
            }
        }

        void terminateChunk(CountedSerializedSubject<T> chunk) {
            boolean terminate = false;
            synchronized (this.guard) {
                if (this.done) {
                    return;
                }
                Iterator<CountedSerializedSubject<T>> it = this.chunks.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    CountedSerializedSubject<T> cs = it.next();
                    if (cs == chunk) {
                        terminate = true;
                        it.remove();
                        break;
                    }
                }
                if (terminate) {
                    chunk.consumer.onCompleted();
                }
            }
        }

        CountedSerializedSubject<T> createCountedSerializedSubject() {
            BufferUntilSubscriber<T> bus = BufferUntilSubscriber.create();
            return new CountedSerializedSubject<>(bus, bus);
        }
    }
}
