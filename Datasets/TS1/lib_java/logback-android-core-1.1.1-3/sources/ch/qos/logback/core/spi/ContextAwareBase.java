package ch.qos.logback.core.spi;

import ch.qos.logback.core.Context;
import ch.qos.logback.core.status.ErrorStatus;
import ch.qos.logback.core.status.InfoStatus;
import ch.qos.logback.core.status.Status;
import ch.qos.logback.core.status.StatusManager;
import ch.qos.logback.core.status.WarnStatus;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/spi/ContextAwareBase.class */
public class ContextAwareBase implements ContextAware {
    private int noContextWarning;
    protected Context context;
    final Object declaredOrigin;

    public ContextAwareBase() {
        this.noContextWarning = 0;
        this.declaredOrigin = this;
    }

    public ContextAwareBase(ContextAware contextAware) {
        this.noContextWarning = 0;
        this.declaredOrigin = contextAware;
    }

    @Override // ch.qos.logback.core.spi.ContextAware
    public void setContext(Context context) {
        if (this.context == null) {
            this.context = context;
        } else if (this.context != context) {
            throw new IllegalStateException("Context has been already set");
        }
    }

    @Override // ch.qos.logback.core.spi.ContextAware
    public Context getContext() {
        return this.context;
    }

    public StatusManager getStatusManager() {
        if (this.context == null) {
            return null;
        }
        return this.context.getStatusManager();
    }

    protected Object getDeclaredOrigin() {
        return this.declaredOrigin;
    }

    @Override // ch.qos.logback.core.spi.ContextAware
    public void addStatus(Status status) {
        if (this.context != null) {
            StatusManager statusManager = this.context.getStatusManager();
            if (statusManager != null) {
                statusManager.add(status);
                return;
            }
            return;
        }
        int i = this.noContextWarning;
        this.noContextWarning = i + 1;
        if (i == 0) {
            System.out.println("LOGBACK: No context given for " + this);
        }
    }

    @Override // ch.qos.logback.core.spi.ContextAware
    public void addInfo(String str) {
        addStatus(new InfoStatus(str, getDeclaredOrigin()));
    }

    @Override // ch.qos.logback.core.spi.ContextAware
    public void addInfo(String str, Throwable th) {
        addStatus(new InfoStatus(str, getDeclaredOrigin(), th));
    }

    @Override // ch.qos.logback.core.spi.ContextAware
    public void addWarn(String str) {
        addStatus(new WarnStatus(str, getDeclaredOrigin()));
    }

    @Override // ch.qos.logback.core.spi.ContextAware
    public void addWarn(String str, Throwable th) {
        addStatus(new WarnStatus(str, getDeclaredOrigin(), th));
    }

    @Override // ch.qos.logback.core.spi.ContextAware
    public void addError(String str) {
        addStatus(new ErrorStatus(str, getDeclaredOrigin()));
    }

    @Override // ch.qos.logback.core.spi.ContextAware
    public void addError(String str, Throwable th) {
        addStatus(new ErrorStatus(str, getDeclaredOrigin(), th));
    }
}
