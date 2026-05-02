package rx.internal.operators;

import java.util.ArrayList;
import java.util.List;
import rx.Observable;
import rx.Producer;
import rx.Subscriber;
import rx.observers.SerializedSubscriber;
import rx.subscriptions.SerialSubscription;

/*  JADX ERROR: NullPointerException in pass: ClassModifier
    java.lang.NullPointerException: Cannot invoke "java.util.List.forEach(java.util.function.Consumer)" because "blocks" is null
    	at jadx.core.utils.BlockUtils.collectAllInsns(BlockUtils.java:1029)
    	at jadx.core.dex.visitors.ClassModifier.removeBridgeMethod(ClassModifier.java:245)
    	at jadx.core.dex.visitors.ClassModifier.removeSyntheticMethods(ClassModifier.java:160)
    	at java.base/java.util.ArrayList.forEach(ArrayList.java:1511)
    	at jadx.core.dex.visitors.ClassModifier.visit(ClassModifier.java:65)
    	at jadx.core.dex.visitors.ClassModifier.visit(ClassModifier.java:58)
    */
/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorSwitch.class */
public final class OperatorSwitch<T> implements Observable.Operator<T, Observable<? extends T>> {
    @Override // rx.functions.Func1
    public /* bridge */ /* synthetic */ Object call(Object x0) {
        return call((Subscriber) x0);
    }

    /* synthetic */ OperatorSwitch(AnonymousClass1 x0) {
        this();
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorSwitch$Holder.class */
    private static final class Holder {
        static final OperatorSwitch<Object> INSTANCE = new OperatorSwitch<>(null);

        private Holder() {
        }
    }

    public static <T> OperatorSwitch<T> instance() {
        return (OperatorSwitch<T>) Holder.INSTANCE;
    }

    private OperatorSwitch() {
    }

    public Subscriber<? super Observable<? extends T>> call(Subscriber<? super T> child) {
        SwitchSubscriber<T> sws = new SwitchSubscriber<>(child);
        child.add(sws);
        return sws;
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorSwitch$SwitchSubscriber.class */
    private static final class SwitchSubscriber<T> extends Subscriber<Observable<? extends T>> {
        final SerializedSubscriber<T> s;
        int index;
        boolean active;
        boolean mainDone;
        List<Object> queue;
        boolean emitting;
        SwitchSubscriber<T>.InnerSubscriber currentSubscriber;
        long initialRequested;
        final Object guard = new Object();
        final NotificationLite<?> nl = NotificationLite.instance();
        volatile boolean infinite = false;
        final SerialSubscription ssub = new SerialSubscription();

        @Override // rx.Observer
        public /* bridge */ /* synthetic */ void onNext(Object x0) {
            onNext((Observable) x0);
        }

        public SwitchSubscriber(Subscriber<? super T> child) {
            this.s = new SerializedSubscriber<>(child);
            child.add(this.ssub);
            child.setProducer(new Producer() { // from class: rx.internal.operators.OperatorSwitch.SwitchSubscriber.1
                /* JADX WARN: Failed to check method for inline after forced processrx.internal.operators.OperatorSwitch.SwitchSubscriber.InnerSubscriber.access$114(rx.internal.operators.OperatorSwitch$SwitchSubscriber$InnerSubscriber, long):long */
                @Override // rx.Producer
                public void request(long n) {
                    SwitchSubscriber<T>.InnerSubscriber localSubscriber;
                    if (SwitchSubscriber.this.infinite) {
                        return;
                    }
                    if (n == Long.MAX_VALUE) {
                        SwitchSubscriber.this.infinite = true;
                    }
                    synchronized (SwitchSubscriber.this.guard) {
                        localSubscriber = SwitchSubscriber.this.currentSubscriber;
                        if (SwitchSubscriber.this.currentSubscriber == null) {
                            SwitchSubscriber.this.initialRequested = n;
                        } else {
                            InnerSubscriber.access$114(SwitchSubscriber.this.currentSubscriber, n);
                        }
                    }
                    if (localSubscriber != null) {
                        localSubscriber.requestMore(n);
                    }
                }
            });
        }

        /* JADX WARN: Failed to check method for inline after forced processrx.internal.operators.OperatorSwitch.SwitchSubscriber.InnerSubscriber.access$102(rx.internal.operators.OperatorSwitch$SwitchSubscriber$InnerSubscriber, long):long */
        public void onNext(Observable<? extends T> t) {
            long remainingRequest;
            synchronized (this.guard) {
                int id = this.index + 1;
                this.index = id;
                this.active = true;
                if (this.infinite) {
                    remainingRequest = Long.MAX_VALUE;
                } else {
                    remainingRequest = this.currentSubscriber == null ? this.initialRequested : ((InnerSubscriber) this.currentSubscriber).requested;
                }
                this.currentSubscriber = new InnerSubscriber(id, remainingRequest);
                InnerSubscriber.access$102(this.currentSubscriber, remainingRequest);
            }
            this.ssub.set(this.currentSubscriber);
            t.unsafeSubscribe(this.currentSubscriber);
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            this.s.onError(e);
            unsubscribe();
        }

        @Override // rx.Observer
        public void onCompleted() {
            synchronized (this.guard) {
                this.mainDone = true;
                if (this.active) {
                    return;
                }
                if (this.emitting) {
                    if (this.queue == null) {
                        this.queue = new ArrayList();
                    }
                    this.queue.add(this.nl.completed());
                } else {
                    List<Object> localQueue = this.queue;
                    this.queue = null;
                    this.emitting = true;
                    drain(localQueue);
                    this.s.onCompleted();
                    unsubscribe();
                }
            }
        }

        /* JADX WARN: Code restructure failed: missing block: B:43:0x00ae, code lost:
        
            r4.emitting = false;
            r10 = true;
         */
        /* JADX WARN: Failed to check method for inline after forced processrx.internal.operators.OperatorSwitch.SwitchSubscriber.InnerSubscriber.access$110(rx.internal.operators.OperatorSwitch$SwitchSubscriber$InnerSubscriber):long */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        void emit(T r5, int r6, rx.internal.operators.OperatorSwitch.SwitchSubscriber<T>.InnerSubscriber r7) {
            /*
                Method dump skipped, instructions count: 285
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: rx.internal.operators.OperatorSwitch.SwitchSubscriber.emit(java.lang.Object, int, rx.internal.operators.OperatorSwitch$SwitchSubscriber$InnerSubscriber):void");
        }

        /* JADX WARN: Multi-variable type inference failed */
        void drain(List<Object> list) {
            if (list == null) {
                return;
            }
            for (Object obj : list) {
                if (this.nl.isCompleted(obj)) {
                    this.s.onCompleted();
                    return;
                } else {
                    if (this.nl.isError(obj)) {
                        this.s.onError(this.nl.getError(obj));
                        return;
                    }
                    this.s.onNext(obj);
                }
            }
        }

        void error(Throwable e, int id) {
            synchronized (this.guard) {
                if (id != this.index) {
                    return;
                }
                if (this.emitting) {
                    if (this.queue == null) {
                        this.queue = new ArrayList();
                    }
                    this.queue.add(this.nl.error(e));
                } else {
                    List<Object> localQueue = this.queue;
                    this.queue = null;
                    this.emitting = true;
                    drain(localQueue);
                    this.s.onError(e);
                    unsubscribe();
                }
            }
        }

        void complete(int id) {
            synchronized (this.guard) {
                if (id != this.index) {
                    return;
                }
                this.active = false;
                if (this.mainDone) {
                    if (this.emitting) {
                        if (this.queue == null) {
                            this.queue = new ArrayList();
                        }
                        this.queue.add(this.nl.completed());
                    } else {
                        List<Object> localQueue = this.queue;
                        this.queue = null;
                        this.emitting = true;
                        drain(localQueue);
                        this.s.onCompleted();
                        unsubscribe();
                    }
                }
            }
        }

        /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber.class */
        final class InnerSubscriber extends Subscriber<T> {
            private long requested = 0;
            private final int id;
            private final long initialRequested;

            /*  JADX ERROR: Failed to decode insn: 0x0007: MOVE_MULTI
                java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[6]
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
                */
            static /* synthetic */ long access$114(rx.internal.operators.OperatorSwitch.SwitchSubscriber.InnerSubscriber r6, long r7) {
                /*
                    r0 = r6
                    r1 = r0
                    long r1 = r1.requested
                    r2 = r7
                    long r1 = r1 + r2
                    // decode failed: arraycopy: source index -1 out of bounds for object array[6]
                    r0.requested = r1
                    return r-1
                */
                throw new UnsupportedOperationException("Method not decompiled: rx.internal.operators.OperatorSwitch.SwitchSubscriber.InnerSubscriber.access$114(rx.internal.operators.OperatorSwitch$SwitchSubscriber$InnerSubscriber, long):long");
            }

            /*  JADX ERROR: Failed to decode insn: 0x0002: MOVE_MULTI
                java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[6]
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
                */
            static /* synthetic */ long access$102(rx.internal.operators.OperatorSwitch.SwitchSubscriber.InnerSubscriber r6, long r7) {
                /*
                    r0 = r6
                    r1 = r7
                    // decode failed: arraycopy: source index -1 out of bounds for object array[6]
                    r0.requested = r1
                    return r-1
                */
                throw new UnsupportedOperationException("Method not decompiled: rx.internal.operators.OperatorSwitch.SwitchSubscriber.InnerSubscriber.access$102(rx.internal.operators.OperatorSwitch$SwitchSubscriber$InnerSubscriber, long):long");
            }

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
                */
            static /* synthetic */ long access$110(rx.internal.operators.OperatorSwitch.SwitchSubscriber.InnerSubscriber r8) {
                /*
                    r0 = r8
                    r1 = r0
                    long r1 = r1.requested
                    // decode failed: arraycopy: source index -1 out of bounds for object array[8]
                    r2 = 1
                    long r1 = r1 - r2
                    r0.requested = r1
                    return r-1
                */
                throw new UnsupportedOperationException("Method not decompiled: rx.internal.operators.OperatorSwitch.SwitchSubscriber.InnerSubscriber.access$110(rx.internal.operators.OperatorSwitch$SwitchSubscriber$InnerSubscriber):long");
            }

            public InnerSubscriber(int id, long initialRequested) {
                this.id = id;
                this.initialRequested = initialRequested;
            }

            @Override // rx.Subscriber
            public void onStart() {
                requestMore(this.initialRequested);
            }

            public void requestMore(long n) {
                request(n);
            }

            @Override // rx.Observer
            public void onNext(T t) {
                SwitchSubscriber.this.emit(t, this.id, this);
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                SwitchSubscriber.this.error(e, this.id);
            }

            @Override // rx.Observer
            public void onCompleted() {
                SwitchSubscriber.this.complete(this.id);
            }
        }
    }
}
