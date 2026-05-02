package com.koushikdutta.async.future;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/future/SimpleCancellable.class */
public class SimpleCancellable implements DependentCancellable {
    boolean complete;
    boolean cancelled;
    private Cancellable parent;
    public static final Cancellable COMPLETED;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !SimpleCancellable.class.desiredAssertionStatus();
        COMPLETED = new SimpleCancellable() { // from class: com.koushikdutta.async.future.SimpleCancellable.1
            {
                setComplete();
            }

            @Override // com.koushikdutta.async.future.SimpleCancellable, com.koushikdutta.async.future.DependentCancellable
            public /* bridge */ /* synthetic */ DependentCancellable setParent(Cancellable x0) {
                return super.setParent(x0);
            }
        };
    }

    @Override // com.koushikdutta.async.future.Cancellable
    public boolean isDone() {
        return this.complete;
    }

    protected void cancelCleanup() {
    }

    protected void cleanup() {
    }

    protected void completeCleanup() {
    }

    public boolean setComplete() {
        synchronized (this) {
            if (this.cancelled) {
                return false;
            }
            if (this.complete) {
                if ($assertionsDisabled) {
                    return true;
                }
                throw new AssertionError();
            }
            this.complete = true;
            this.parent = null;
            completeCleanup();
            cleanup();
            return true;
        }
    }

    @Override // com.koushikdutta.async.future.Cancellable
    public boolean cancel() {
        synchronized (this) {
            if (this.complete) {
                return false;
            }
            if (this.cancelled) {
                return true;
            }
            this.cancelled = true;
            Cancellable parent = this.parent;
            this.parent = null;
            if (parent != null) {
                parent.cancel();
            }
            cancelCleanup();
            cleanup();
            return true;
        }
    }

    @Override // com.koushikdutta.async.future.DependentCancellable
    public SimpleCancellable setParent(Cancellable parent) {
        synchronized (this) {
            if (!isDone()) {
                this.parent = parent;
            }
        }
        return this;
    }

    @Override // com.koushikdutta.async.future.Cancellable
    public boolean isCancelled() {
        boolean z;
        synchronized (this) {
            z = this.cancelled || (this.parent != null && this.parent.isCancelled());
        }
        return z;
    }

    public Cancellable reset() {
        cancel();
        this.complete = false;
        this.cancelled = false;
        return this;
    }
}
