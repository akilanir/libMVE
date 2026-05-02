package rx.subjects;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import rx.Observable;
import rx.Observer;
import rx.Subscriber;
import rx.functions.Action0;
import rx.functions.Action1;
import rx.functions.Actions;
import rx.internal.operators.NotificationLite;
import rx.subscriptions.Subscriptions;

/* loaded from: rxjava-1.0.7.jar:rx/subjects/SubjectSubscriptionManager.class */
final class SubjectSubscriptionManager<T> implements Observable.OnSubscribe<T> {
    volatile Object latest;
    static final AtomicReferenceFieldUpdater<SubjectSubscriptionManager, State> STATE_UPDATER = AtomicReferenceFieldUpdater.newUpdater(SubjectSubscriptionManager.class, State.class, "state");
    static final AtomicReferenceFieldUpdater<SubjectSubscriptionManager, Object> LATEST_UPDATER = AtomicReferenceFieldUpdater.newUpdater(SubjectSubscriptionManager.class, Object.class, "latest");
    volatile State<T> state = State.EMPTY;
    boolean active = true;
    Action1<SubjectObserver<T>> onStart = Actions.empty();
    Action1<SubjectObserver<T>> onAdded = Actions.empty();
    Action1<SubjectObserver<T>> onTerminated = Actions.empty();
    public final NotificationLite<T> nl = NotificationLite.instance();

    SubjectSubscriptionManager() {
    }

    @Override // rx.functions.Action1
    public void call(Subscriber<? super T> child) {
        SubjectObserver<T> bo = new SubjectObserver<>(child);
        addUnsubscriber(child, bo);
        this.onStart.call(bo);
        if (!child.isUnsubscribed() && add(bo) && child.isUnsubscribed()) {
            remove(bo);
        }
    }

    void addUnsubscriber(Subscriber<? super T> child, final SubjectObserver<T> bo) {
        child.add(Subscriptions.create(new Action0() { // from class: rx.subjects.SubjectSubscriptionManager.1
            @Override // rx.functions.Action0
            public void call() {
                SubjectSubscriptionManager.this.remove(bo);
            }
        }));
    }

    void set(Object value) {
        this.latest = value;
    }

    Object get() {
        return this.latest;
    }

    SubjectObserver<T>[] observers() {
        return this.state.observers;
    }

    boolean add(SubjectObserver<T> o) {
        State oldState;
        State newState;
        do {
            oldState = this.state;
            if (oldState.terminated) {
                this.onTerminated.call(o);
                return false;
            }
            newState = oldState.add(o);
        } while (!STATE_UPDATER.compareAndSet(this, oldState, newState));
        this.onAdded.call(o);
        return true;
    }

    void remove(SubjectObserver<T> o) {
        State oldState;
        State newState;
        do {
            oldState = this.state;
            if (oldState.terminated || (newState = oldState.remove(o)) == oldState) {
                return;
            }
        } while (!STATE_UPDATER.compareAndSet(this, oldState, newState));
    }

    SubjectObserver<T>[] next(Object n) {
        set(n);
        return this.state.observers;
    }

    SubjectObserver<T>[] terminate(Object n) {
        set(n);
        this.active = false;
        State<T> oldState = this.state;
        if (oldState.terminated) {
            return State.NO_OBSERVERS;
        }
        return STATE_UPDATER.getAndSet(this, State.TERMINATED).observers;
    }

    /* loaded from: rxjava-1.0.7.jar:rx/subjects/SubjectSubscriptionManager$State.class */
    protected static final class State<T> {
        final boolean terminated;
        final SubjectObserver[] observers;
        static final SubjectObserver[] NO_OBSERVERS = new SubjectObserver[0];
        static final State TERMINATED = new State(true, NO_OBSERVERS);
        static final State EMPTY = new State(false, NO_OBSERVERS);

        public State(boolean terminated, SubjectObserver[] observers) {
            this.terminated = terminated;
            this.observers = observers;
        }

        public State add(SubjectObserver o) {
            SubjectObserver[] a = this.observers;
            int n = a.length;
            SubjectObserver[] b = new SubjectObserver[n + 1];
            System.arraycopy(this.observers, 0, b, 0, n);
            b[n] = o;
            return new State(this.terminated, b);
        }

        public State remove(SubjectObserver o) {
            SubjectObserver[] a = this.observers;
            int n = a.length;
            if (n == 1 && a[0] == o) {
                return EMPTY;
            }
            if (n == 0) {
                return this;
            }
            SubjectObserver[] b = new SubjectObserver[n - 1];
            int j = 0;
            for (SubjectObserver ai : a) {
                if (ai != o) {
                    if (j == n - 1) {
                        return this;
                    }
                    int i = j;
                    j++;
                    b[i] = ai;
                }
            }
            if (j == 0) {
                return EMPTY;
            }
            if (j < n - 1) {
                SubjectObserver[] c = new SubjectObserver[j];
                System.arraycopy(b, 0, c, 0, j);
                b = c;
            }
            return new State(this.terminated, b);
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/subjects/SubjectSubscriptionManager$SubjectObserver.class */
    protected static final class SubjectObserver<T> implements Observer<T> {
        final Observer<? super T> actual;
        boolean first = true;
        boolean emitting;
        List<Object> queue;
        boolean fastPath;
        protected volatile boolean caughtUp;
        private volatile Object index;

        public SubjectObserver(Observer<? super T> actual) {
            this.actual = actual;
        }

        @Override // rx.Observer
        public void onNext(T t) {
            this.actual.onNext(t);
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            this.actual.onError(e);
        }

        @Override // rx.Observer
        public void onCompleted() {
            this.actual.onCompleted();
        }

        protected void emitNext(Object n, NotificationLite<T> nl) {
            if (!this.fastPath) {
                synchronized (this) {
                    this.first = false;
                    if (this.emitting) {
                        if (this.queue == null) {
                            this.queue = new ArrayList();
                        }
                        this.queue.add(n);
                        return;
                    }
                    this.fastPath = true;
                }
            }
            nl.accept(this.actual, n);
        }

        protected void emitFirst(Object n, NotificationLite<T> nl) {
            synchronized (this) {
                if (!this.first || this.emitting) {
                    return;
                }
                this.first = false;
                this.emitting = n != null;
                if (n != null) {
                    emitLoop(null, n, nl);
                }
            }
        }

        /* JADX WARN: Removed duplicated region for block: B:30:0x0074  */
        /* JADX WARN: Removed duplicated region for block: B:56:0x00b1 A[ORIG_RETURN, RETURN] */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        protected void emitLoop(java.util.List<java.lang.Object> r5, java.lang.Object r6, rx.internal.operators.NotificationLite<T> r7) {
            /*
                r4 = this;
                r0 = 1
                r8 = r0
                r0 = 0
                r9 = r0
            L6:
                r0 = r5
                if (r0 == 0) goto L2f
                r0 = r5
                java.util.Iterator r0 = r0.iterator()     // Catch: java.lang.Throwable -> L8f
                r10 = r0
            L12:
                r0 = r10
                boolean r0 = r0.hasNext()     // Catch: java.lang.Throwable -> L8f
                if (r0 == 0) goto L2f
                r0 = r10
                java.lang.Object r0 = r0.next()     // Catch: java.lang.Throwable -> L8f
                r11 = r0
                r0 = r4
                r1 = r11
                r2 = r7
                r0.accept(r1, r2)     // Catch: java.lang.Throwable -> L8f
                goto L12
            L2f:
                r0 = r8
                if (r0 == 0) goto L3d
                r0 = 0
                r8 = r0
                r0 = r4
                r1 = r6
                r2 = r7
                r0.accept(r1, r2)     // Catch: java.lang.Throwable -> L8f
            L3d:
                r0 = r4
                r1 = r0
                r10 = r1
                monitor-enter(r0)     // Catch: java.lang.Throwable -> L8f
                r0 = r4
                java.util.List<java.lang.Object> r0 = r0.queue     // Catch: java.lang.Throwable -> L64 java.lang.Throwable -> L8f
                r5 = r0
                r0 = r4
                r1 = 0
                r0.queue = r1     // Catch: java.lang.Throwable -> L64 java.lang.Throwable -> L8f
                r0 = r5
                if (r0 != 0) goto L5e
                r0 = r4
                r1 = 0
                r0.emitting = r1     // Catch: java.lang.Throwable -> L64 java.lang.Throwable -> L8f
                r0 = 1
                r9 = r0
                r0 = r10
                monitor-exit(r0)     // Catch: java.lang.Throwable -> L64 java.lang.Throwable -> L8f
                goto L6f
            L5e:
                r0 = r10
                monitor-exit(r0)     // Catch: java.lang.Throwable -> L64 java.lang.Throwable -> L8f
                goto L6c
            L64:
                r12 = move-exception
                r0 = r10
                monitor-exit(r0)     // Catch: java.lang.Throwable -> L64 java.lang.Throwable -> L8f
                r0 = r12
                throw r0     // Catch: java.lang.Throwable -> L8f
            L6c:
                goto L6
            L6f:
                r0 = r9
                if (r0 != 0) goto Lb1
                r0 = r4
                r1 = r0
                r10 = r1
                monitor-enter(r0)
                r0 = r4
                r1 = 0
                r0.emitting = r1     // Catch: java.lang.Throwable -> L84
                r0 = r10
                monitor-exit(r0)     // Catch: java.lang.Throwable -> L84
                goto L8c
            L84:
                r13 = move-exception
                r0 = r10
                monitor-exit(r0)     // Catch: java.lang.Throwable -> L84
                r0 = r13
                throw r0
            L8c:
                goto Lb1
            L8f:
                r14 = move-exception
                r0 = r9
                if (r0 != 0) goto Lae
                r0 = r4
                r1 = r0
                r15 = r1
                monitor-enter(r0)
                r0 = r4
                r1 = 0
                r0.emitting = r1     // Catch: java.lang.Throwable -> La6
                r0 = r15
                monitor-exit(r0)     // Catch: java.lang.Throwable -> La6
                goto Lae
            La6:
                r16 = move-exception
                r0 = r15
                monitor-exit(r0)     // Catch: java.lang.Throwable -> La6
                r0 = r16
                throw r0
            Lae:
                r0 = r14
                throw r0
            Lb1:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: rx.subjects.SubjectSubscriptionManager.SubjectObserver.emitLoop(java.util.List, java.lang.Object, rx.internal.operators.NotificationLite):void");
        }

        protected void accept(Object n, NotificationLite<T> nl) {
            if (n != null) {
                nl.accept(this.actual, n);
            }
        }

        protected Observer<? super T> getActual() {
            return this.actual;
        }

        public <I> I index() {
            return (I) this.index;
        }

        public void index(Object newIndex) {
            this.index = newIndex;
        }
    }
}
