package rx.subjects;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import rx.Observable;
import rx.Observer;
import rx.Scheduler;
import rx.annotations.Experimental;
import rx.exceptions.Exceptions;
import rx.functions.Action1;
import rx.functions.Func1;
import rx.internal.operators.NotificationLite;
import rx.internal.util.UtilityFunctions;
import rx.schedulers.Timestamped;
import rx.subjects.SubjectSubscriptionManager;

/* loaded from: rxjava-1.0.7.jar:rx/subjects/ReplaySubject.class */
public final class ReplaySubject<T> extends Subject<T, T> {
    final ReplayState<T, ?> state;
    final SubjectSubscriptionManager<T> ssm;
    private static final Object[] EMPTY_ARRAY = new Object[0];

    /* loaded from: rxjava-1.0.7.jar:rx/subjects/ReplaySubject$EvictionPolicy.class */
    interface EvictionPolicy {
        boolean test(Object obj, long j);

        void evict(NodeList<Object> nodeList);

        void evictFinal(NodeList<Object> nodeList);
    }

    /* loaded from: rxjava-1.0.7.jar:rx/subjects/ReplaySubject$ReplayState.class */
    interface ReplayState<T, I> {
        boolean terminated();

        boolean replayObserver(SubjectSubscriptionManager.SubjectObserver<? super T> subjectObserver);

        I replayObserverFromIndex(I i, SubjectSubscriptionManager.SubjectObserver<? super T> subjectObserver);

        I replayObserverFromIndexTest(I i, SubjectSubscriptionManager.SubjectObserver<? super T> subjectObserver, long j);

        void next(T t);

        void error(Throwable th);

        void complete();

        int size();

        boolean isEmpty();

        T[] toArray(T[] tArr);
    }

    public static <T> ReplaySubject<T> create() {
        return create(16);
    }

    public static <T> ReplaySubject<T> create(int capacity) {
        final UnboundedReplayState<T> state = new UnboundedReplayState<>(capacity);
        SubjectSubscriptionManager<T> ssm = new SubjectSubscriptionManager<>();
        ssm.onStart = new Action1<SubjectSubscriptionManager.SubjectObserver<T>>() { // from class: rx.subjects.ReplaySubject.1
            @Override // rx.functions.Action1
            public void call(SubjectSubscriptionManager.SubjectObserver<T> o) {
                int lastIndex = state.replayObserverFromIndex((Integer) 0, (SubjectSubscriptionManager.SubjectObserver) o).intValue();
                o.index(Integer.valueOf(lastIndex));
            }
        };
        ssm.onAdded = new Action1<SubjectSubscriptionManager.SubjectObserver<T>>() { // from class: rx.subjects.ReplaySubject.2
            /* JADX WARN: Removed duplicated region for block: B:41:0x008c  */
            /* JADX WARN: Removed duplicated region for block: B:67:0x00c5 A[ORIG_RETURN, RETURN] */
            @Override // rx.functions.Action1
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public void call(rx.subjects.SubjectSubscriptionManager.SubjectObserver<T> r5) {
                /*
                    Method dump skipped, instructions count: 198
                    To view this dump add '--comments-level debug' option
                */
                throw new UnsupportedOperationException("Method not decompiled: rx.subjects.ReplaySubject.AnonymousClass2.call(rx.subjects.SubjectSubscriptionManager$SubjectObserver):void");
            }
        };
        ssm.onTerminated = new Action1<SubjectSubscriptionManager.SubjectObserver<T>>() { // from class: rx.subjects.ReplaySubject.3
            @Override // rx.functions.Action1
            public void call(SubjectSubscriptionManager.SubjectObserver<T> o) {
                Integer idx = (Integer) o.index();
                if (idx == null) {
                    idx = 0;
                }
                state.replayObserverFromIndex(idx, (SubjectSubscriptionManager.SubjectObserver) o);
            }
        };
        return new ReplaySubject<>(ssm, ssm, state);
    }

    static <T> ReplaySubject<T> createUnbounded() {
        BoundedState<T> state = new BoundedState<>(new EmptyEvictionPolicy(), UtilityFunctions.identity(), UtilityFunctions.identity());
        return createWithState(state, new DefaultOnAdd(state));
    }

    public static <T> ReplaySubject<T> createWithSize(int size) {
        BoundedState<T> state = new BoundedState<>(new SizeEvictionPolicy(size), UtilityFunctions.identity(), UtilityFunctions.identity());
        return createWithState(state, new DefaultOnAdd(state));
    }

    public static <T> ReplaySubject<T> createWithTime(long time, TimeUnit unit, Scheduler scheduler) {
        BoundedState<T> state = new BoundedState<>(new TimeEvictionPolicy(unit.toMillis(time), scheduler), new AddTimestamped(scheduler), new RemoveTimestamped());
        return createWithState(state, new TimedOnAdd(state, scheduler));
    }

    public static <T> ReplaySubject<T> createWithTimeAndSize(long time, TimeUnit unit, int size, Scheduler scheduler) {
        BoundedState<T> state = new BoundedState<>(new PairEvictionPolicy(new SizeEvictionPolicy(size), new TimeEvictionPolicy(unit.toMillis(time), scheduler)), new AddTimestamped(scheduler), new RemoveTimestamped());
        return createWithState(state, new TimedOnAdd(state, scheduler));
    }

    static final <T> ReplaySubject<T> createWithState(final BoundedState<T> state, Action1<SubjectSubscriptionManager.SubjectObserver<T>> onStart) {
        SubjectSubscriptionManager<T> ssm = new SubjectSubscriptionManager<>();
        ssm.onStart = onStart;
        ssm.onAdded = new Action1<SubjectSubscriptionManager.SubjectObserver<T>>() { // from class: rx.subjects.ReplaySubject.4
            /* JADX WARN: Removed duplicated region for block: B:41:0x0086  */
            /* JADX WARN: Removed duplicated region for block: B:67:0x00bf A[ORIG_RETURN, RETURN] */
            @Override // rx.functions.Action1
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public void call(rx.subjects.SubjectSubscriptionManager.SubjectObserver<T> r5) {
                /*
                    Method dump skipped, instructions count: 192
                    To view this dump add '--comments-level debug' option
                */
                throw new UnsupportedOperationException("Method not decompiled: rx.subjects.ReplaySubject.AnonymousClass4.call(rx.subjects.SubjectSubscriptionManager$SubjectObserver):void");
            }
        };
        ssm.onTerminated = new Action1<SubjectSubscriptionManager.SubjectObserver<T>>() { // from class: rx.subjects.ReplaySubject.5
            @Override // rx.functions.Action1
            public void call(SubjectSubscriptionManager.SubjectObserver<T> t1) {
                NodeList.Node<Object> l = (NodeList.Node) t1.index();
                if (l == null) {
                    l = state.head();
                }
                state.replayObserverFromIndex(l, (SubjectSubscriptionManager.SubjectObserver) t1);
            }
        };
        return new ReplaySubject<>(ssm, ssm, state);
    }

    ReplaySubject(Observable.OnSubscribe<T> onSubscribe, SubjectSubscriptionManager<T> ssm, ReplayState<T, ?> state) {
        super(onSubscribe);
        this.ssm = ssm;
        this.state = state;
    }

    @Override // rx.Observer
    public void onNext(T t) {
        if (this.ssm.active) {
            this.state.next(t);
            SubjectSubscriptionManager.SubjectObserver[] arr$ = this.ssm.observers();
            for (SubjectSubscriptionManager.SubjectObserver subjectObserver : arr$) {
                if (caughtUp(subjectObserver)) {
                    subjectObserver.onNext(t);
                }
            }
        }
    }

    @Override // rx.Observer
    public void onError(Throwable e) {
        if (this.ssm.active) {
            this.state.error(e);
            List<Throwable> errors = null;
            SubjectSubscriptionManager.SubjectObserver[] arr$ = this.ssm.terminate(NotificationLite.instance().error(e));
            for (SubjectSubscriptionManager.SubjectObserver subjectObserver : arr$) {
                try {
                    if (caughtUp(subjectObserver)) {
                        subjectObserver.onError(e);
                    }
                } catch (Throwable e2) {
                    if (errors == null) {
                        errors = new ArrayList<>();
                    }
                    errors.add(e2);
                }
            }
            Exceptions.throwIfAny(errors);
        }
    }

    @Override // rx.Observer
    public void onCompleted() {
        if (this.ssm.active) {
            this.state.complete();
            SubjectSubscriptionManager.SubjectObserver[] arr$ = this.ssm.terminate(NotificationLite.instance().completed());
            for (SubjectSubscriptionManager.SubjectObserver subjectObserver : arr$) {
                if (caughtUp(subjectObserver)) {
                    subjectObserver.onCompleted();
                }
            }
        }
    }

    int subscriberCount() {
        return this.ssm.state.observers.length;
    }

    @Override // rx.subjects.Subject
    public boolean hasObservers() {
        return this.ssm.observers().length > 0;
    }

    private boolean caughtUp(SubjectSubscriptionManager.SubjectObserver<? super T> o) {
        if (!o.caughtUp) {
            if (this.state.replayObserver(o)) {
                o.caughtUp = true;
                o.index(null);
                return false;
            }
            return false;
        }
        return true;
    }

    /* loaded from: rxjava-1.0.7.jar:rx/subjects/ReplaySubject$UnboundedReplayState.class */
    static final class UnboundedReplayState<T> implements ReplayState<T, Integer> {
        private final NotificationLite<T> nl = NotificationLite.instance();
        private final ArrayList<Object> list;
        private volatile boolean terminated;
        volatile int index;
        static final AtomicIntegerFieldUpdater<UnboundedReplayState> INDEX_UPDATER = AtomicIntegerFieldUpdater.newUpdater(UnboundedReplayState.class, "index");

        public UnboundedReplayState(int initialCapacity) {
            this.list = new ArrayList<>(initialCapacity);
        }

        @Override // rx.subjects.ReplaySubject.ReplayState
        public void next(T n) {
            if (!this.terminated) {
                this.list.add(this.nl.next(n));
                INDEX_UPDATER.getAndIncrement(this);
            }
        }

        public void accept(Observer<? super T> o, int idx) {
            this.nl.accept(o, this.list.get(idx));
        }

        @Override // rx.subjects.ReplaySubject.ReplayState
        public void complete() {
            if (!this.terminated) {
                this.terminated = true;
                this.list.add(this.nl.completed());
                INDEX_UPDATER.getAndIncrement(this);
            }
        }

        @Override // rx.subjects.ReplaySubject.ReplayState
        public void error(Throwable e) {
            if (!this.terminated) {
                this.terminated = true;
                this.list.add(this.nl.error(e));
                INDEX_UPDATER.getAndIncrement(this);
            }
        }

        @Override // rx.subjects.ReplaySubject.ReplayState
        public boolean terminated() {
            return this.terminated;
        }

        @Override // rx.subjects.ReplaySubject.ReplayState
        public boolean replayObserver(SubjectSubscriptionManager.SubjectObserver<? super T> observer) {
            synchronized (observer) {
                observer.first = false;
                if (observer.emitting) {
                    return false;
                }
                Integer lastEmittedLink = (Integer) observer.index();
                if (lastEmittedLink != null) {
                    int l = replayObserverFromIndex(lastEmittedLink, (SubjectSubscriptionManager.SubjectObserver) observer).intValue();
                    observer.index(Integer.valueOf(l));
                    return true;
                }
                throw new IllegalStateException("failed to find lastEmittedLink for: " + observer);
            }
        }

        @Override // rx.subjects.ReplaySubject.ReplayState
        public Integer replayObserverFromIndex(Integer idx, SubjectSubscriptionManager.SubjectObserver<? super T> observer) {
            int i = idx.intValue();
            while (i < this.index) {
                accept(observer, i);
                i++;
            }
            return Integer.valueOf(i);
        }

        @Override // rx.subjects.ReplaySubject.ReplayState
        public Integer replayObserverFromIndexTest(Integer idx, SubjectSubscriptionManager.SubjectObserver<? super T> observer, long now) {
            return replayObserverFromIndex(idx, (SubjectSubscriptionManager.SubjectObserver) observer);
        }

        @Override // rx.subjects.ReplaySubject.ReplayState
        public int size() {
            int idx = this.index;
            if (idx > 0) {
                Object o = this.list.get(idx - 1);
                if (this.nl.isCompleted(o) || this.nl.isError(o)) {
                    return idx - 1;
                }
            }
            return idx;
        }

        @Override // rx.subjects.ReplaySubject.ReplayState
        public boolean isEmpty() {
            return size() == 0;
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v15, types: [java.lang.Object[]] */
        /* JADX WARN: Type inference failed for: r0v9 */
        @Override // rx.subjects.ReplaySubject.ReplayState
        public T[] toArray(T[] a) {
            int s = size();
            if (s > 0) {
                if (s > a.length) {
                    a = (Object[]) Array.newInstance(a.getClass().getComponentType(), s);
                }
                for (int i = 0; i < s; i++) {
                    a[i] = this.list.get(i);
                }
                if (s < a.length - 1) {
                    a[s] = null;
                }
            }
            return a;
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/subjects/ReplaySubject$BoundedState.class */
    static final class BoundedState<T> implements ReplayState<T, NodeList.Node<Object>> {
        final EvictionPolicy evictionPolicy;
        final Func1<Object, Object> enterTransform;
        final Func1<Object, Object> leaveTransform;
        volatile boolean terminated;
        final NotificationLite<T> nl = NotificationLite.instance();
        final NodeList<Object> list = new NodeList<>();
        volatile NodeList.Node<Object> tail = this.list.tail;

        public BoundedState(EvictionPolicy evictionPolicy, Func1<Object, Object> enterTransform, Func1<Object, Object> leaveTransform) {
            this.evictionPolicy = evictionPolicy;
            this.enterTransform = enterTransform;
            this.leaveTransform = leaveTransform;
        }

        @Override // rx.subjects.ReplaySubject.ReplayState
        public void next(T value) {
            if (!this.terminated) {
                this.list.addLast(this.enterTransform.call(this.nl.next(value)));
                this.evictionPolicy.evict(this.list);
                this.tail = this.list.tail;
            }
        }

        @Override // rx.subjects.ReplaySubject.ReplayState
        public void complete() {
            if (!this.terminated) {
                this.terminated = true;
                this.list.addLast(this.enterTransform.call(this.nl.completed()));
                this.evictionPolicy.evictFinal(this.list);
                this.tail = this.list.tail;
            }
        }

        @Override // rx.subjects.ReplaySubject.ReplayState
        public void error(Throwable e) {
            if (!this.terminated) {
                this.terminated = true;
                this.list.addLast(this.enterTransform.call(this.nl.error(e)));
                this.evictionPolicy.evictFinal(this.list);
                this.tail = this.list.tail;
            }
        }

        public void accept(Observer<? super T> o, NodeList.Node<Object> node) {
            this.nl.accept(o, this.leaveTransform.call(node.value));
        }

        public void acceptTest(Observer<? super T> o, NodeList.Node<Object> node, long now) {
            Object v = node.value;
            if (!this.evictionPolicy.test(v, now)) {
                this.nl.accept(o, this.leaveTransform.call(v));
            }
        }

        public NodeList.Node<Object> head() {
            return this.list.head;
        }

        public NodeList.Node<Object> tail() {
            return this.tail;
        }

        @Override // rx.subjects.ReplaySubject.ReplayState
        public boolean replayObserver(SubjectSubscriptionManager.SubjectObserver<? super T> observer) {
            synchronized (observer) {
                observer.first = false;
                if (observer.emitting) {
                    return false;
                }
                NodeList.Node<Object> lastEmittedLink = (NodeList.Node) observer.index();
                NodeList.Node<Object> l = replayObserverFromIndex(lastEmittedLink, (SubjectSubscriptionManager.SubjectObserver) observer);
                observer.index(l);
                return true;
            }
        }

        @Override // rx.subjects.ReplaySubject.ReplayState
        public NodeList.Node<Object> replayObserverFromIndex(NodeList.Node<Object> l, SubjectSubscriptionManager.SubjectObserver<? super T> observer) {
            while (l != tail()) {
                accept(observer, l.next);
                l = l.next;
            }
            return l;
        }

        @Override // rx.subjects.ReplaySubject.ReplayState
        public NodeList.Node<Object> replayObserverFromIndexTest(NodeList.Node<Object> l, SubjectSubscriptionManager.SubjectObserver<? super T> observer, long now) {
            while (l != tail()) {
                acceptTest(observer, l.next, now);
                l = l.next;
            }
            return l;
        }

        @Override // rx.subjects.ReplaySubject.ReplayState
        public boolean terminated() {
            return this.terminated;
        }

        @Override // rx.subjects.ReplaySubject.ReplayState
        public int size() {
            Object value;
            int size = 0;
            NodeList.Node<Object> l = head();
            NodeList.Node<Object> node = l.next;
            while (true) {
                NodeList.Node<Object> next = node;
                if (next == null) {
                    break;
                }
                size++;
                l = next;
                node = next.next;
            }
            if (l.value != null && (value = this.leaveTransform.call(l.value)) != null && (this.nl.isError(value) || this.nl.isCompleted(value))) {
                return size - 1;
            }
            return size;
        }

        @Override // rx.subjects.ReplaySubject.ReplayState
        public boolean isEmpty() {
            NodeList.Node<Object> l = head();
            NodeList.Node<Object> next = l.next;
            if (next == null) {
                return true;
            }
            Object value = this.leaveTransform.call(next.value);
            return this.nl.isError(value) || this.nl.isCompleted(value);
        }

        @Override // rx.subjects.ReplaySubject.ReplayState
        public T[] toArray(T[] tArr) {
            ArrayList arrayList = new ArrayList();
            NodeList.Node node = head().next;
            while (true) {
                NodeList.Node node2 = node;
                if (node2 == null) {
                    break;
                }
                Object call = this.leaveTransform.call(node2.value);
                if (node2.next == null && (this.nl.isError(call) || this.nl.isCompleted(call))) {
                    break;
                }
                arrayList.add(call);
                node = node2.next;
            }
            return (T[]) arrayList.toArray(tArr);
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/subjects/ReplaySubject$SizeEvictionPolicy.class */
    static final class SizeEvictionPolicy implements EvictionPolicy {
        final int maxSize;

        public SizeEvictionPolicy(int maxSize) {
            this.maxSize = maxSize;
        }

        @Override // rx.subjects.ReplaySubject.EvictionPolicy
        public void evict(NodeList<Object> t1) {
            while (t1.size() > this.maxSize) {
                t1.removeFirst();
            }
        }

        @Override // rx.subjects.ReplaySubject.EvictionPolicy
        public boolean test(Object value, long now) {
            return false;
        }

        @Override // rx.subjects.ReplaySubject.EvictionPolicy
        public void evictFinal(NodeList<Object> t1) {
            while (t1.size() > this.maxSize + 1) {
                t1.removeFirst();
            }
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/subjects/ReplaySubject$TimeEvictionPolicy.class */
    static final class TimeEvictionPolicy implements EvictionPolicy {
        final long maxAgeMillis;
        final Scheduler scheduler;

        public TimeEvictionPolicy(long maxAgeMillis, Scheduler scheduler) {
            this.maxAgeMillis = maxAgeMillis;
            this.scheduler = scheduler;
        }

        @Override // rx.subjects.ReplaySubject.EvictionPolicy
        public void evict(NodeList<Object> t1) {
            long now = this.scheduler.now();
            while (!t1.isEmpty()) {
                NodeList.Node<Object> n = t1.head.next;
                if (test(n.value, now)) {
                    t1.removeFirst();
                } else {
                    return;
                }
            }
        }

        @Override // rx.subjects.ReplaySubject.EvictionPolicy
        public void evictFinal(NodeList<Object> t1) {
            long now = this.scheduler.now();
            while (t1.size > 1) {
                NodeList.Node<Object> n = t1.head.next;
                if (test(n.value, now)) {
                    t1.removeFirst();
                } else {
                    return;
                }
            }
        }

        @Override // rx.subjects.ReplaySubject.EvictionPolicy
        public boolean test(Object value, long now) {
            Timestamped<?> ts = (Timestamped) value;
            return ts.getTimestampMillis() <= now - this.maxAgeMillis;
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/subjects/ReplaySubject$PairEvictionPolicy.class */
    static final class PairEvictionPolicy implements EvictionPolicy {
        final EvictionPolicy first;
        final EvictionPolicy second;

        public PairEvictionPolicy(EvictionPolicy first, EvictionPolicy second) {
            this.first = first;
            this.second = second;
        }

        @Override // rx.subjects.ReplaySubject.EvictionPolicy
        public void evict(NodeList<Object> t1) {
            this.first.evict(t1);
            this.second.evict(t1);
        }

        @Override // rx.subjects.ReplaySubject.EvictionPolicy
        public void evictFinal(NodeList<Object> t1) {
            this.first.evictFinal(t1);
            this.second.evictFinal(t1);
        }

        @Override // rx.subjects.ReplaySubject.EvictionPolicy
        public boolean test(Object value, long now) {
            return this.first.test(value, now) || this.second.test(value, now);
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/subjects/ReplaySubject$AddTimestamped.class */
    static final class AddTimestamped implements Func1<Object, Object> {
        final Scheduler scheduler;

        public AddTimestamped(Scheduler scheduler) {
            this.scheduler = scheduler;
        }

        @Override // rx.functions.Func1
        public Object call(Object t1) {
            return new Timestamped(this.scheduler.now(), t1);
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/subjects/ReplaySubject$RemoveTimestamped.class */
    static final class RemoveTimestamped implements Func1<Object, Object> {
        RemoveTimestamped() {
        }

        @Override // rx.functions.Func1
        public Object call(Object t1) {
            return ((Timestamped) t1).getValue();
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/subjects/ReplaySubject$DefaultOnAdd.class */
    static final class DefaultOnAdd<T> implements Action1<SubjectSubscriptionManager.SubjectObserver<T>> {
        final BoundedState<T> state;

        public DefaultOnAdd(BoundedState<T> state) {
            this.state = state;
        }

        @Override // rx.functions.Action1
        public void call(SubjectSubscriptionManager.SubjectObserver<T> t1) {
            NodeList.Node<Object> l = this.state.replayObserverFromIndex(this.state.head(), (SubjectSubscriptionManager.SubjectObserver) t1);
            t1.index(l);
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/subjects/ReplaySubject$TimedOnAdd.class */
    static final class TimedOnAdd<T> implements Action1<SubjectSubscriptionManager.SubjectObserver<T>> {
        final BoundedState<T> state;
        final Scheduler scheduler;

        public TimedOnAdd(BoundedState<T> state, Scheduler scheduler) {
            this.state = state;
            this.scheduler = scheduler;
        }

        @Override // rx.functions.Action1
        public void call(SubjectSubscriptionManager.SubjectObserver<T> t1) {
            NodeList.Node<Object> l;
            if (!this.state.terminated) {
                l = this.state.replayObserverFromIndexTest(this.state.head(), (SubjectSubscriptionManager.SubjectObserver) t1, this.scheduler.now());
            } else {
                l = this.state.replayObserverFromIndex(this.state.head(), (SubjectSubscriptionManager.SubjectObserver) t1);
            }
            t1.index(l);
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/subjects/ReplaySubject$NodeList.class */
    static final class NodeList<T> {
        final Node<T> head = new Node<>(null);
        Node<T> tail = this.head;
        int size;

        NodeList() {
        }

        /* loaded from: rxjava-1.0.7.jar:rx/subjects/ReplaySubject$NodeList$Node.class */
        static final class Node<T> {
            final T value;
            volatile Node<T> next;

            Node(T value) {
                this.value = value;
            }
        }

        public void addLast(T value) {
            Node<T> t = this.tail;
            Node<T> t2 = new Node<>(value);
            t.next = t2;
            this.tail = t2;
            this.size++;
        }

        public T removeFirst() {
            if (this.head.next == null) {
                throw new IllegalStateException("Empty!");
            }
            Node<T> t = this.head.next;
            this.head.next = t.next;
            if (this.head.next == null) {
                this.tail = this.head;
            }
            this.size--;
            return t.value;
        }

        public boolean isEmpty() {
            return this.size == 0;
        }

        public int size() {
            return this.size;
        }

        public void clear() {
            this.tail = this.head;
            this.size = 0;
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/subjects/ReplaySubject$EmptyEvictionPolicy.class */
    static final class EmptyEvictionPolicy implements EvictionPolicy {
        EmptyEvictionPolicy() {
        }

        @Override // rx.subjects.ReplaySubject.EvictionPolicy
        public boolean test(Object value, long now) {
            return true;
        }

        @Override // rx.subjects.ReplaySubject.EvictionPolicy
        public void evict(NodeList<Object> list) {
        }

        @Override // rx.subjects.ReplaySubject.EvictionPolicy
        public void evictFinal(NodeList<Object> list) {
        }
    }

    @Experimental
    public boolean hasThrowable() {
        NotificationLite<T> nl = this.ssm.nl;
        Object o = this.ssm.get();
        return nl.isError(o);
    }

    @Experimental
    public boolean hasCompleted() {
        NotificationLite<T> nl = this.ssm.nl;
        Object o = this.ssm.get();
        return (o == null || nl.isError(o)) ? false : true;
    }

    @Experimental
    public Throwable getThrowable() {
        NotificationLite<T> nl = this.ssm.nl;
        Object o = this.ssm.get();
        if (nl.isError(o)) {
            return nl.getError(o);
        }
        return null;
    }

    @Experimental
    public int size() {
        return this.state.size();
    }

    @Experimental
    public boolean hasAnyValue() {
        return !this.state.isEmpty();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Experimental
    public Object[] getValues() {
        return this.state.toArray(EMPTY_ARRAY);
    }

    @Experimental
    public T[] getValues(T[] a) {
        return this.state.toArray(a);
    }
}
