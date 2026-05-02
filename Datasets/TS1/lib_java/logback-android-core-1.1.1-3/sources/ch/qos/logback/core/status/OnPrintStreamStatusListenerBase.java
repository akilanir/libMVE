package ch.qos.logback.core.status;

import ch.qos.logback.core.CoreConstants;
import ch.qos.logback.core.spi.ContextAwareBase;
import ch.qos.logback.core.spi.LifeCycle;
import ch.qos.logback.core.util.StatusPrinter;
import java.io.PrintStream;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/status/OnPrintStreamStatusListenerBase.class */
abstract class OnPrintStreamStatusListenerBase extends ContextAwareBase implements StatusListener, LifeCycle {
    static final long DEFAULT_RETROSPECTIVE = 300;
    boolean isStarted = false;
    long retrospective = DEFAULT_RETROSPECTIVE;

    OnPrintStreamStatusListenerBase() {
    }

    protected abstract PrintStream getPrintStream();

    private void print(Status status) {
        StringBuilder sb = new StringBuilder();
        StatusPrinter.buildStr(sb, CoreConstants.EMPTY_STRING, status);
        getPrintStream().print(sb);
    }

    public void addStatusEvent(Status status) {
        if (this.isStarted) {
            print(status);
        }
    }

    private void retrospectivePrint() {
        if (this.context == null) {
            return;
        }
        long currentTimeMillis = System.currentTimeMillis();
        for (Status status : this.context.getStatusManager().getCopyOfStatusList()) {
            if (currentTimeMillis - status.getDate().longValue() < this.retrospective) {
                print(status);
            }
        }
    }

    public void start() {
        this.isStarted = true;
        if (this.retrospective > 0) {
            retrospectivePrint();
        }
    }

    public void setRetrospective(long j) {
        this.retrospective = j;
    }

    public long getRetrospective() {
        return this.retrospective;
    }

    public void stop() {
        this.isStarted = false;
    }

    public boolean isStarted() {
        return this.isStarted;
    }
}
