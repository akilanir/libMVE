package rx.internal.util;

import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Producer;
import rx.annotations.Experimental;

@Experimental
/* loaded from: rxjava-1.0.7.jar:rx/internal/util/BackpressureDrainManager.class */
public final class BackpressureDrainManager implements Producer {
    protected volatile long requestedCount;
    protected static final AtomicLongFieldUpdater<BackpressureDrainManager> REQUESTED_COUNT = AtomicLongFieldUpdater.newUpdater(BackpressureDrainManager.class, "requestedCount");
    protected boolean emitting;
    protected volatile boolean terminated;
    protected Throwable exception;
    protected final BackpressureQueueCallback actual;

    /* loaded from: rxjava-1.0.7.jar:rx/internal/util/BackpressureDrainManager$BackpressureQueueCallback.class */
    public interface BackpressureQueueCallback {
        Object peek();

        Object poll();

        boolean accept(Object obj);

        void complete(Throwable th);
    }

    public BackpressureDrainManager(BackpressureQueueCallback actual) {
        this.actual = actual;
    }

    public final boolean isTerminated() {
        return this.terminated;
    }

    public final void terminate() {
        this.terminated = true;
    }

    public final void terminate(Throwable error) {
        if (!this.terminated) {
            this.exception = error;
            this.terminated = true;
        }
    }

    public final void terminateAndDrain() {
        this.terminated = true;
        drain();
    }

    public final void terminateAndDrain(Throwable error) {
        if (!this.terminated) {
            this.exception = error;
            this.terminated = true;
            drain();
        }
    }

    @Override // rx.Producer
    public final void request(long n) {
        long r;
        boolean mayDrain;
        long u;
        if (n == 0) {
            return;
        }
        do {
            r = this.requestedCount;
            mayDrain = r == 0;
            if (r == Long.MAX_VALUE) {
                break;
            }
            if (n == Long.MAX_VALUE) {
                u = n;
                mayDrain = true;
            } else if (r > Long.MAX_VALUE - n) {
                u = Long.MAX_VALUE;
            } else {
                u = r + n;
            }
        } while (!REQUESTED_COUNT.compareAndSet(this, r, u));
        if (mayDrain) {
            drain();
        }
    }

    /*  JADX ERROR: NullPointerException in pass: AttachTryCatchVisitor
        java.lang.NullPointerException: Cannot invoke "String.charAt(int)" because "obj" is null
        	at jadx.core.utils.Utils.cleanObjectName(Utils.java:38)
        	at jadx.core.dex.instructions.args.ArgType.object(ArgType.java:86)
        	at jadx.core.dex.info.ClassInfo.fromName(ClassInfo.java:42)
        	at jadx.core.dex.visitors.AttachTryCatchVisitor.convertToHandlers(AttachTryCatchVisitor.java:113)
        	at jadx.core.dex.visitors.AttachTryCatchVisitor.initTryCatches(AttachTryCatchVisitor.java:54)
        	at jadx.core.dex.visitors.AttachTryCatchVisitor.visit(AttachTryCatchVisitor.java:42)
        */
    public final void drain() {
        /*
            Method dump skipped, instructions count: 433
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: rx.internal.util.BackpressureDrainManager.drain():void");
    }
}
