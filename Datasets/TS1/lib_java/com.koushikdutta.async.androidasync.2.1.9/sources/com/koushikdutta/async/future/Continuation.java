package com.koushikdutta.async.future;

import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.callback.ContinuationCallback;
import java.util.LinkedList;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/future/Continuation.class */
public class Continuation extends SimpleCancellable implements ContinuationCallback, Runnable, Cancellable {
    CompletedCallback callback;
    Runnable cancelCallback;
    LinkedList<ContinuationCallback> mCallbacks;
    private boolean inNext;
    private boolean waiting;
    boolean started;

    public CompletedCallback getCallback() {
        return this.callback;
    }

    public void setCallback(CompletedCallback callback) {
        this.callback = callback;
    }

    public Runnable getCancelCallback() {
        return this.cancelCallback;
    }

    public void setCancelCallback(Runnable cancelCallback) {
        this.cancelCallback = cancelCallback;
    }

    public void setCancelCallback(final Cancellable cancel) {
        if (cancel == null) {
            this.cancelCallback = null;
        } else {
            this.cancelCallback = new Runnable() { // from class: com.koushikdutta.async.future.Continuation.1
                @Override // java.lang.Runnable
                public void run() {
                    cancel.cancel();
                }
            };
        }
    }

    public Continuation() {
        this(null);
    }

    public Continuation(CompletedCallback callback) {
        this(callback, null);
    }

    public Continuation(CompletedCallback callback, Runnable cancelCallback) {
        this.mCallbacks = new LinkedList<>();
        this.cancelCallback = cancelCallback;
        this.callback = callback;
    }

    private CompletedCallback wrap() {
        return new CompletedCallback() { // from class: com.koushikdutta.async.future.Continuation.2
            boolean mThisCompleted;
            static final /* synthetic */ boolean $assertionsDisabled;

            static {
                $assertionsDisabled = !Continuation.class.desiredAssertionStatus();
            }

            @Override // com.koushikdutta.async.callback.CompletedCallback
            public void onCompleted(Exception ex) {
                if (this.mThisCompleted) {
                    return;
                }
                this.mThisCompleted = true;
                if (!$assertionsDisabled && !Continuation.this.waiting) {
                    throw new AssertionError();
                }
                Continuation.this.waiting = false;
                if (ex == null) {
                    Continuation.this.next();
                } else {
                    Continuation.this.reportCompleted(ex);
                }
            }
        };
    }

    void reportCompleted(Exception ex) {
        if (setComplete() && this.callback != null) {
            this.callback.onCompleted(ex);
        }
    }

    private ContinuationCallback hook(ContinuationCallback callback) {
        if (callback instanceof DependentCancellable) {
            DependentCancellable child = (DependentCancellable) callback;
            child.setParent(this);
        }
        return callback;
    }

    public Continuation add(ContinuationCallback callback) {
        this.mCallbacks.add(hook(callback));
        return this;
    }

    public Continuation insert(ContinuationCallback callback) {
        this.mCallbacks.add(0, hook(callback));
        return this;
    }

    public Continuation add(final DependentFuture future) {
        future.setParent(this);
        add(new ContinuationCallback() { // from class: com.koushikdutta.async.future.Continuation.3
            @Override // com.koushikdutta.async.callback.ContinuationCallback
            public void onContinue(Continuation continuation, CompletedCallback next) throws Exception {
                future.get();
                next.onCompleted(null);
            }
        });
        return this;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void next() {
        if (this.inNext) {
            return;
        }
        while (this.mCallbacks.size() > 0 && !this.waiting && !isDone() && !isCancelled()) {
            ContinuationCallback cb = this.mCallbacks.remove();
            try {
                this.inNext = true;
                this.waiting = true;
                cb.onContinue(this, wrap());
            } catch (Exception e) {
                reportCompleted(e);
            } finally {
                this.inNext = false;
            }
        }
        if (this.waiting || isDone() || isCancelled()) {
            return;
        }
        reportCompleted(null);
    }

    @Override // com.koushikdutta.async.future.SimpleCancellable, com.koushikdutta.async.future.Cancellable
    public boolean cancel() {
        if (!super.cancel()) {
            return false;
        }
        if (this.cancelCallback != null) {
            this.cancelCallback.run();
            return true;
        }
        return true;
    }

    public Continuation start() {
        if (this.started) {
            throw new IllegalStateException("already started");
        }
        this.started = true;
        next();
        return this;
    }

    @Override // com.koushikdutta.async.callback.ContinuationCallback
    public void onContinue(Continuation continuation, CompletedCallback next) throws Exception {
        setCallback(next);
        start();
    }

    @Override // java.lang.Runnable
    public void run() {
        start();
    }
}
