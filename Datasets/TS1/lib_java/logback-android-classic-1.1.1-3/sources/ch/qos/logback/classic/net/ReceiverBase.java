package ch.qos.logback.classic.net;

import ch.qos.logback.core.spi.ContextAwareBase;
import ch.qos.logback.core.spi.LifeCycle;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/net/ReceiverBase.class */
public abstract class ReceiverBase extends ContextAwareBase implements LifeCycle {
    private boolean started;

    public final void start() {
        if (isStarted()) {
            return;
        }
        if (getContext() == null) {
            throw new IllegalStateException("context not set");
        }
        if (shouldStart()) {
            getContext().getExecutorService().execute(getRunnableTask());
            this.started = true;
        }
    }

    public final void stop() {
        if (isStarted()) {
            try {
                onStop();
            } catch (RuntimeException e) {
                addError("on stop: " + e, e);
            }
            this.started = false;
        }
    }

    public final boolean isStarted() {
        return this.started;
    }

    protected abstract boolean shouldStart();

    protected abstract void onStop();

    protected abstract Runnable getRunnableTask();
}
