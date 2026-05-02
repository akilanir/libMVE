package de.greenrobot.event.util;

/* loaded from: eventbus-2.4.0.jar:de/greenrobot/event/util/ThrowableFailureEvent.class */
public class ThrowableFailureEvent implements HasExecutionScope {
    protected final Throwable throwable;
    protected final boolean suppressErrorUi;
    private Object executionContext;

    public ThrowableFailureEvent(Throwable throwable) {
        this.throwable = throwable;
        this.suppressErrorUi = false;
    }

    public ThrowableFailureEvent(Throwable throwable, boolean suppressErrorUi) {
        this.throwable = throwable;
        this.suppressErrorUi = suppressErrorUi;
    }

    public Throwable getThrowable() {
        return this.throwable;
    }

    public boolean isSuppressErrorUi() {
        return this.suppressErrorUi;
    }

    @Override // de.greenrobot.event.util.HasExecutionScope
    public Object getExecutionScope() {
        return this.executionContext;
    }

    @Override // de.greenrobot.event.util.HasExecutionScope
    public void setExecutionScope(Object executionContext) {
        this.executionContext = executionContext;
    }
}
