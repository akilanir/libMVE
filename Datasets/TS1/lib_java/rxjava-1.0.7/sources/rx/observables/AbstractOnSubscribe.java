package rx.observables;

import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import rx.Observable;
import rx.Producer;
import rx.Subscriber;
import rx.Subscription;
import rx.annotations.Experimental;
import rx.exceptions.CompositeException;
import rx.functions.Action1;
import rx.functions.Actions;
import rx.functions.Func1;

/*  JADX ERROR: NullPointerException in pass: ClassModifier
    java.lang.NullPointerException: Cannot invoke "java.util.List.forEach(java.util.function.Consumer)" because "blocks" is null
    	at jadx.core.utils.BlockUtils.collectAllInsns(BlockUtils.java:1029)
    	at jadx.core.dex.visitors.ClassModifier.removeBridgeMethod(ClassModifier.java:245)
    	at jadx.core.dex.visitors.ClassModifier.removeSyntheticMethods(ClassModifier.java:160)
    	at java.base/java.util.ArrayList.forEach(ArrayList.java:1511)
    	at jadx.core.dex.visitors.ClassModifier.visit(ClassModifier.java:65)
    	at jadx.core.dex.visitors.ClassModifier.visit(ClassModifier.java:58)
    */
@Experimental
/* loaded from: rxjava-1.0.7.jar:rx/observables/AbstractOnSubscribe.class */
public abstract class AbstractOnSubscribe<T, S> implements Observable.OnSubscribe<T> {
    private static final Func1<Object, Object> NULL_FUNC1 = new Func1<Object, Object>() { // from class: rx.observables.AbstractOnSubscribe.1
        @Override // rx.functions.Func1
        public Object call(Object t1) {
            return null;
        }
    };

    protected abstract void next(SubscriptionState<T, S> subscriptionState);

    @Override // rx.functions.Action1
    public /* bridge */ /* synthetic */ void call(Object x0) {
        call((Subscriber) x0);
    }

    public AbstractOnSubscribe() {
    }

    protected S onSubscribe(Subscriber<? super T> subscriber) {
        return null;
    }

    protected void onTerminated(S state) {
    }

    public final void call(Subscriber<? super T> subscriber) {
        S custom = onSubscribe(subscriber);
        SubscriptionState<T, S> state = new SubscriptionState<>(subscriber, custom);
        subscriber.add(new SubscriptionCompleter(state));
        subscriber.setProducer(new SubscriptionProducer(state));
    }

    public final Observable<T> toObservable() {
        return Observable.create(this);
    }

    static {
    }

    public static <T, S> AbstractOnSubscribe<T, S> create(Action1<SubscriptionState<T, S>> next) {
        Func1<? super Subscriber<? super T>, ? extends S> nullFunc = NULL_FUNC1;
        return create(next, nullFunc, Actions.empty());
    }

    public static <T, S> AbstractOnSubscribe<T, S> create(Action1<SubscriptionState<T, S>> next, Func1<? super Subscriber<? super T>, ? extends S> onSubscribe) {
        return create(next, onSubscribe, Actions.empty());
    }

    public static <T, S> AbstractOnSubscribe<T, S> create(Action1<SubscriptionState<T, S>> next, Func1<? super Subscriber<? super T>, ? extends S> onSubscribe, Action1<? super S> onTerminated) {
        return new LambdaOnSubscribe(next, onSubscribe, onTerminated);
    }

    /* loaded from: rxjava-1.0.7.jar:rx/observables/AbstractOnSubscribe$LambdaOnSubscribe.class */
    private static final class LambdaOnSubscribe<T, S> extends AbstractOnSubscribe<T, S> {
        final Action1<SubscriptionState<T, S>> next;
        final Func1<? super Subscriber<? super T>, ? extends S> onSubscribe;
        final Action1<? super S> onTerminated;

        @Override // rx.observables.AbstractOnSubscribe, rx.functions.Action1
        public /* bridge */ /* synthetic */ void call(Object x0) {
            super.call((Subscriber) x0);
        }

        private LambdaOnSubscribe(Action1<SubscriptionState<T, S>> next, Func1<? super Subscriber<? super T>, ? extends S> onSubscribe, Action1<? super S> onTerminated) {
            this.next = next;
            this.onSubscribe = onSubscribe;
            this.onTerminated = onTerminated;
        }

        @Override // rx.observables.AbstractOnSubscribe
        protected S onSubscribe(Subscriber<? super T> subscriber) {
            return this.onSubscribe.call(subscriber);
        }

        @Override // rx.observables.AbstractOnSubscribe
        protected void onTerminated(S state) {
            this.onTerminated.call(state);
        }

        @Override // rx.observables.AbstractOnSubscribe
        protected void next(SubscriptionState<T, S> state) {
            this.next.call(state);
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/observables/AbstractOnSubscribe$SubscriptionCompleter.class */
    private static final class SubscriptionCompleter<T, S> extends AtomicBoolean implements Subscription {
        private static final long serialVersionUID = 7993888274897325004L;
        private final SubscriptionState<T, S> state;

        private SubscriptionCompleter(SubscriptionState<T, S> state) {
            this.state = state;
        }

        @Override // rx.Subscription
        public boolean isUnsubscribed() {
            return get();
        }

        @Override // rx.Subscription
        public void unsubscribe() {
            if (compareAndSet(false, true)) {
                this.state.free();
            }
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/observables/AbstractOnSubscribe$SubscriptionProducer.class */
    private static final class SubscriptionProducer<T, S> implements Producer {
        final SubscriptionState<T, S> state;

        private SubscriptionProducer(SubscriptionState<T, S> state) {
            this.state = state;
        }

        @Override // rx.Producer
        public void request(long n) {
            if (n == Long.MAX_VALUE) {
                while (!((SubscriptionState) this.state).subscriber.isUnsubscribed() && doNext()) {
                }
            } else if (n > 0 && ((SubscriptionState) this.state).requestCount.getAndAdd(n) == 0 && !((SubscriptionState) this.state).subscriber.isUnsubscribed()) {
                while (doNext() && ((SubscriptionState) this.state).requestCount.decrementAndGet() > 0 && !((SubscriptionState) this.state).subscriber.isUnsubscribed()) {
                }
            }
        }

        /* JADX WARN: Failed to check method for inline after forced processrx.observables.AbstractOnSubscribe.SubscriptionState.access$708(rx.observables.AbstractOnSubscribe$SubscriptionState):long */
        protected boolean doNext() {
            try {
                if (this.state.use()) {
                    try {
                        int p = this.state.phase();
                        ((SubscriptionState) this.state).parent.next(this.state);
                        if (!this.state.verify()) {
                            throw new IllegalStateException("No event produced or stop called @ Phase: " + p + " -> " + this.state.phase() + ", Calls: " + this.state.calls());
                        }
                        if (this.state.accept() || this.state.stopRequested()) {
                            this.state.terminate();
                            this.state.free();
                            return false;
                        }
                        SubscriptionState.access$708(this.state);
                        this.state.free();
                        return true;
                    } catch (Throwable t) {
                        this.state.terminate();
                        ((SubscriptionState) this.state).subscriber.onError(t);
                        this.state.free();
                        return false;
                    }
                }
                return false;
            } catch (Throwable th) {
                this.state.free();
                throw th;
            }
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/observables/AbstractOnSubscribe$SubscriptionState.class */
    public static final class SubscriptionState<T, S> {
        private final AbstractOnSubscribe<T, S> parent;
        private final Subscriber<? super T> subscriber;
        private final S state;
        private final AtomicLong requestCount;
        private final AtomicInteger inUse;
        private int phase;
        private long calls;
        private T theValue;
        private boolean hasOnNext;
        private boolean hasCompleted;
        private boolean stopRequested;
        private Throwable theException;

        /*  JADX ERROR: Failed to decode insn: 0x0005: MOVE_MULTI
            java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[8]
            	at java.base/java.lang.System.arraycopy(Native Method)
            	at jadx.plugins.input.java.data.code.StackState.insert(StackState.java:52)
            	at jadx.plugins.input.java.data.code.CodeDecodeState.insert(CodeDecodeState.java:137)
            	at jadx.plugins.input.java.data.code.JavaInsnsRegister.dup2x1(JavaInsnsRegister.java:313)
            	at jadx.plugins.input.java.data.code.JavaInsnData.decode(JavaInsnData.java:46)
            	at jadx.core.dex.instructions.InsnDecoder.lambda$process$0(InsnDecoder.java:50)
            	at jadx.plugins.input.java.data.code.JavaCodeReader.visitInstructions(JavaCodeReader.java:85)
            	at jadx.core.dex.instructions.InsnDecoder.process(InsnDecoder.java:46)
            	at jadx.core.dex.nodes.MethodNode.load(MethodNode.java:157)
            	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:458)
            	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:464)
            	at jadx.core.ProcessClass.process(ProcessClass.java:69)
            	at jadx.core.ProcessClass.generateCode(ProcessClass.java:117)
            	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
            	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
            	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
            */
        static /* synthetic */ long access$708(rx.observables.AbstractOnSubscribe.SubscriptionState r8) {
            /*
                r0 = r8
                r1 = r0
                long r1 = r1.calls
                // decode failed: arraycopy: source index -1 out of bounds for object array[8]
                r2 = 1
                long r1 = r1 + r2
                r0.calls = r1
                return r-1
            */
            throw new UnsupportedOperationException("Method not decompiled: rx.observables.AbstractOnSubscribe.SubscriptionState.access$708(rx.observables.AbstractOnSubscribe$SubscriptionState):long");
        }

        private SubscriptionState(AbstractOnSubscribe<T, S> parent, Subscriber<? super T> subscriber, S state) {
            this.parent = parent;
            this.subscriber = subscriber;
            this.state = state;
            this.requestCount = new AtomicLong();
            this.inUse = new AtomicInteger(1);
        }

        public S state() {
            return this.state;
        }

        public int phase() {
            return this.phase;
        }

        public void phase(int newPhase) {
            this.phase = newPhase;
        }

        public void advancePhase() {
            advancePhaseBy(1);
        }

        public void advancePhaseBy(int amount) {
            this.phase += amount;
        }

        public long calls() {
            return this.calls;
        }

        public void onNext(T value) {
            if (this.hasOnNext) {
                throw new IllegalStateException("onNext not consumed yet!");
            }
            if (this.hasCompleted) {
                throw new IllegalStateException("Already terminated", this.theException);
            }
            this.theValue = value;
            this.hasOnNext = true;
        }

        public void onError(Throwable e) {
            if (e == null) {
                throw new NullPointerException("e != null required");
            }
            if (this.hasCompleted) {
                throw new IllegalStateException("Already terminated", this.theException);
            }
            this.theException = e;
            this.hasCompleted = true;
        }

        public void onCompleted() {
            if (this.hasCompleted) {
                throw new IllegalStateException("Already terminated", this.theException);
            }
            this.hasCompleted = true;
        }

        public void stop() {
            this.stopRequested = true;
        }

        protected boolean accept() {
            if (this.hasOnNext) {
                T value = this.theValue;
                this.theValue = null;
                this.hasOnNext = false;
                try {
                    this.subscriber.onNext(value);
                } catch (Throwable t) {
                    this.hasCompleted = true;
                    Throwable e = this.theException;
                    this.theException = null;
                    if (e == null) {
                        this.subscriber.onError(t);
                        return true;
                    }
                    this.subscriber.onError(new CompositeException(Arrays.asList(t, e)));
                    return true;
                }
            }
            if (this.hasCompleted) {
                Throwable e2 = this.theException;
                this.theException = null;
                if (e2 != null) {
                    this.subscriber.onError(e2);
                    return true;
                }
                this.subscriber.onCompleted();
                return true;
            }
            return false;
        }

        protected boolean verify() {
            return this.hasOnNext || this.hasCompleted || this.stopRequested;
        }

        protected boolean stopRequested() {
            return this.stopRequested;
        }

        protected boolean use() {
            int i = this.inUse.get();
            if (i == 0) {
                return false;
            }
            if (i == 1 && this.inUse.compareAndSet(1, 2)) {
                return true;
            }
            throw new IllegalStateException("This is not reentrant nor threadsafe!");
        }

        protected void free() {
            int i = this.inUse.get();
            if (i > 0 && this.inUse.decrementAndGet() == 0) {
                this.parent.onTerminated(this.state);
            }
        }

        protected void terminate() {
            int i;
            do {
                i = this.inUse.get();
                if (i <= 0) {
                    return;
                }
            } while (!this.inUse.compareAndSet(i, 0));
            this.parent.onTerminated(this.state);
        }
    }
}
