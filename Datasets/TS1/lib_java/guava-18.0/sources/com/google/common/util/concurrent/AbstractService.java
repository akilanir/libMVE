package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.base.Ascii;
import com.google.common.base.Preconditions;
import com.google.common.util.concurrent.ListenerCallQueue;
import com.google.common.util.concurrent.Monitor;
import com.google.common.util.concurrent.Service;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;
import javax.annotation.concurrent.Immutable;

@Beta
/* loaded from: guava-18.0.jar:com/google/common/util/concurrent/AbstractService.class */
public abstract class AbstractService implements Service {
    private static final ListenerCallQueue.Callback<Service.Listener> STARTING_CALLBACK = new ListenerCallQueue.Callback<Service.Listener>("starting()") { // from class: com.google.common.util.concurrent.AbstractService.1
        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // com.google.common.util.concurrent.ListenerCallQueue.Callback
        public void call(Service.Listener listener) {
            listener.starting();
        }
    };
    private static final ListenerCallQueue.Callback<Service.Listener> RUNNING_CALLBACK = new ListenerCallQueue.Callback<Service.Listener>("running()") { // from class: com.google.common.util.concurrent.AbstractService.2
        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // com.google.common.util.concurrent.ListenerCallQueue.Callback
        public void call(Service.Listener listener) {
            listener.running();
        }
    };
    private static final ListenerCallQueue.Callback<Service.Listener> STOPPING_FROM_STARTING_CALLBACK = stoppingCallback(Service.State.STARTING);
    private static final ListenerCallQueue.Callback<Service.Listener> STOPPING_FROM_RUNNING_CALLBACK = stoppingCallback(Service.State.RUNNING);
    private static final ListenerCallQueue.Callback<Service.Listener> TERMINATED_FROM_NEW_CALLBACK = terminatedCallback(Service.State.NEW);
    private static final ListenerCallQueue.Callback<Service.Listener> TERMINATED_FROM_RUNNING_CALLBACK = terminatedCallback(Service.State.RUNNING);
    private static final ListenerCallQueue.Callback<Service.Listener> TERMINATED_FROM_STOPPING_CALLBACK = terminatedCallback(Service.State.STOPPING);
    private final Monitor monitor = new Monitor();
    private final Monitor.Guard isStartable = new Monitor.Guard(this.monitor) { // from class: com.google.common.util.concurrent.AbstractService.5
        @Override // com.google.common.util.concurrent.Monitor.Guard
        public boolean isSatisfied() {
            return AbstractService.this.state() == Service.State.NEW;
        }
    };
    private final Monitor.Guard isStoppable = new Monitor.Guard(this.monitor) { // from class: com.google.common.util.concurrent.AbstractService.6
        @Override // com.google.common.util.concurrent.Monitor.Guard
        public boolean isSatisfied() {
            return AbstractService.this.state().compareTo(Service.State.RUNNING) <= 0;
        }
    };
    private final Monitor.Guard hasReachedRunning = new Monitor.Guard(this.monitor) { // from class: com.google.common.util.concurrent.AbstractService.7
        @Override // com.google.common.util.concurrent.Monitor.Guard
        public boolean isSatisfied() {
            return AbstractService.this.state().compareTo(Service.State.RUNNING) >= 0;
        }
    };
    private final Monitor.Guard isStopped = new Monitor.Guard(this.monitor) { // from class: com.google.common.util.concurrent.AbstractService.8
        @Override // com.google.common.util.concurrent.Monitor.Guard
        public boolean isSatisfied() {
            return AbstractService.this.state().isTerminal();
        }
    };

    @GuardedBy("monitor")
    private final List<ListenerCallQueue<Service.Listener>> listeners = Collections.synchronizedList(new ArrayList());

    @GuardedBy("monitor")
    private volatile StateSnapshot snapshot = new StateSnapshot(Service.State.NEW);

    protected abstract void doStart();

    protected abstract void doStop();

    private static ListenerCallQueue.Callback<Service.Listener> terminatedCallback(final Service.State from) {
        String valueOf = String.valueOf(String.valueOf(from));
        return new ListenerCallQueue.Callback<Service.Listener>(new StringBuilder(21 + valueOf.length()).append("terminated({from = ").append(valueOf).append("})").toString()) { // from class: com.google.common.util.concurrent.AbstractService.3
            /* JADX INFO: Access modifiers changed from: package-private */
            @Override // com.google.common.util.concurrent.ListenerCallQueue.Callback
            public void call(Service.Listener listener) {
                listener.terminated(from);
            }
        };
    }

    private static ListenerCallQueue.Callback<Service.Listener> stoppingCallback(final Service.State from) {
        String valueOf = String.valueOf(String.valueOf(from));
        return new ListenerCallQueue.Callback<Service.Listener>(new StringBuilder(19 + valueOf.length()).append("stopping({from = ").append(valueOf).append("})").toString()) { // from class: com.google.common.util.concurrent.AbstractService.4
            /* JADX INFO: Access modifiers changed from: package-private */
            @Override // com.google.common.util.concurrent.ListenerCallQueue.Callback
            public void call(Service.Listener listener) {
                listener.stopping(from);
            }
        };
    }

    protected AbstractService() {
    }

    @Override // com.google.common.util.concurrent.Service
    public final Service startAsync() {
        try {
            if (this.monitor.enterIf(this.isStartable)) {
                try {
                    this.snapshot = new StateSnapshot(Service.State.STARTING);
                    starting();
                    doStart();
                    this.monitor.leave();
                    executeListeners();
                } catch (Throwable startupFailure) {
                    notifyFailed(startupFailure);
                    this.monitor.leave();
                    executeListeners();
                }
                return this;
            }
            String valueOf = String.valueOf(String.valueOf(this));
            throw new IllegalStateException(new StringBuilder(33 + valueOf.length()).append("Service ").append(valueOf).append(" has already been started").toString());
        } catch (Throwable th) {
            this.monitor.leave();
            executeListeners();
            throw th;
        }
    }

    @Override // com.google.common.util.concurrent.Service
    public final Service stopAsync() {
        try {
            if (this.monitor.enterIf(this.isStoppable)) {
                try {
                    Service.State previous = state();
                    switch (AnonymousClass10.$SwitchMap$com$google$common$util$concurrent$Service$State[previous.ordinal()]) {
                        case Ascii.SOH /* 1 */:
                            this.snapshot = new StateSnapshot(Service.State.TERMINATED);
                            terminated(Service.State.NEW);
                            break;
                        case 2:
                            this.snapshot = new StateSnapshot(Service.State.STARTING, true, null);
                            stopping(Service.State.STARTING);
                            break;
                        case Ascii.ETX /* 3 */:
                            this.snapshot = new StateSnapshot(Service.State.STOPPING);
                            stopping(Service.State.RUNNING);
                            doStop();
                            break;
                        case 4:
                        case Ascii.ENQ /* 5 */:
                        case Ascii.ACK /* 6 */:
                            String valueOf = String.valueOf(String.valueOf(previous));
                            throw new AssertionError(new StringBuilder(45 + valueOf.length()).append("isStoppable is incorrectly implemented, saw: ").append(valueOf).toString());
                        default:
                            String valueOf2 = String.valueOf(String.valueOf(previous));
                            throw new AssertionError(new StringBuilder(18 + valueOf2.length()).append("Unexpected state: ").append(valueOf2).toString());
                    }
                    this.monitor.leave();
                    executeListeners();
                } catch (Throwable shutdownFailure) {
                    notifyFailed(shutdownFailure);
                    this.monitor.leave();
                    executeListeners();
                }
            }
            return this;
        } catch (Throwable th) {
            this.monitor.leave();
            executeListeners();
            throw th;
        }
    }

    /* renamed from: com.google.common.util.concurrent.AbstractService$10, reason: invalid class name */
    /* loaded from: guava-18.0.jar:com/google/common/util/concurrent/AbstractService$10.class */
    static /* synthetic */ class AnonymousClass10 {
        static final /* synthetic */ int[] $SwitchMap$com$google$common$util$concurrent$Service$State = new int[Service.State.values().length];

        static {
            try {
                $SwitchMap$com$google$common$util$concurrent$Service$State[Service.State.NEW.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$google$common$util$concurrent$Service$State[Service.State.STARTING.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$google$common$util$concurrent$Service$State[Service.State.RUNNING.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$google$common$util$concurrent$Service$State[Service.State.STOPPING.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$google$common$util$concurrent$Service$State[Service.State.TERMINATED.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$com$google$common$util$concurrent$Service$State[Service.State.FAILED.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
        }
    }

    @Override // com.google.common.util.concurrent.Service
    public final void awaitRunning() {
        this.monitor.enterWhenUninterruptibly(this.hasReachedRunning);
        try {
            checkCurrentState(Service.State.RUNNING);
            this.monitor.leave();
        } catch (Throwable th) {
            this.monitor.leave();
            throw th;
        }
    }

    @Override // com.google.common.util.concurrent.Service
    public final void awaitRunning(long timeout, TimeUnit unit) throws TimeoutException {
        if (this.monitor.enterWhenUninterruptibly(this.hasReachedRunning, timeout, unit)) {
            try {
                checkCurrentState(Service.State.RUNNING);
                this.monitor.leave();
                return;
            } catch (Throwable th) {
                this.monitor.leave();
                throw th;
            }
        }
        String valueOf = String.valueOf(String.valueOf(this));
        String valueOf2 = String.valueOf(String.valueOf(state()));
        throw new TimeoutException(new StringBuilder(66 + valueOf.length() + valueOf2.length()).append("Timed out waiting for ").append(valueOf).append(" to reach the RUNNING state. ").append("Current state: ").append(valueOf2).toString());
    }

    @Override // com.google.common.util.concurrent.Service
    public final void awaitTerminated() {
        this.monitor.enterWhenUninterruptibly(this.isStopped);
        try {
            checkCurrentState(Service.State.TERMINATED);
            this.monitor.leave();
        } catch (Throwable th) {
            this.monitor.leave();
            throw th;
        }
    }

    @Override // com.google.common.util.concurrent.Service
    public final void awaitTerminated(long timeout, TimeUnit unit) throws TimeoutException {
        if (this.monitor.enterWhenUninterruptibly(this.isStopped, timeout, unit)) {
            try {
                checkCurrentState(Service.State.TERMINATED);
                this.monitor.leave();
                return;
            } catch (Throwable th) {
                this.monitor.leave();
                throw th;
            }
        }
        String valueOf = String.valueOf(String.valueOf(this));
        String valueOf2 = String.valueOf(String.valueOf(state()));
        throw new TimeoutException(new StringBuilder(65 + valueOf.length() + valueOf2.length()).append("Timed out waiting for ").append(valueOf).append(" to reach a terminal state. ").append("Current state: ").append(valueOf2).toString());
    }

    @GuardedBy("monitor")
    private void checkCurrentState(Service.State expected) {
        Service.State actual = state();
        if (actual != expected) {
            if (actual == Service.State.FAILED) {
                String valueOf = String.valueOf(String.valueOf(expected));
                throw new IllegalStateException(new StringBuilder(55 + valueOf.length()).append("Expected the service to be ").append(valueOf).append(", but the service has FAILED").toString(), failureCause());
            }
            String valueOf2 = String.valueOf(String.valueOf(expected));
            String valueOf3 = String.valueOf(String.valueOf(actual));
            throw new IllegalStateException(new StringBuilder(37 + valueOf2.length() + valueOf3.length()).append("Expected the service to be ").append(valueOf2).append(", but was ").append(valueOf3).toString());
        }
    }

    protected final void notifyStarted() {
        this.monitor.enter();
        try {
            if (this.snapshot.state != Service.State.STARTING) {
                String valueOf = String.valueOf(String.valueOf(this.snapshot.state));
                IllegalStateException failure = new IllegalStateException(new StringBuilder(43 + valueOf.length()).append("Cannot notifyStarted() when the service is ").append(valueOf).toString());
                notifyFailed(failure);
                throw failure;
            }
            if (this.snapshot.shutdownWhenStartupFinishes) {
                this.snapshot = new StateSnapshot(Service.State.STOPPING);
                doStop();
            } else {
                this.snapshot = new StateSnapshot(Service.State.RUNNING);
                running();
            }
        } finally {
            this.monitor.leave();
            executeListeners();
        }
    }

    protected final void notifyStopped() {
        this.monitor.enter();
        try {
            Service.State previous = this.snapshot.state;
            if (previous != Service.State.STOPPING && previous != Service.State.RUNNING) {
                String valueOf = String.valueOf(String.valueOf(previous));
                IllegalStateException failure = new IllegalStateException(new StringBuilder(43 + valueOf.length()).append("Cannot notifyStopped() when the service is ").append(valueOf).toString());
                notifyFailed(failure);
                throw failure;
            }
            this.snapshot = new StateSnapshot(Service.State.TERMINATED);
            terminated(previous);
            this.monitor.leave();
            executeListeners();
        } catch (Throwable th) {
            this.monitor.leave();
            executeListeners();
            throw th;
        }
    }

    protected final void notifyFailed(Throwable cause) {
        Preconditions.checkNotNull(cause);
        this.monitor.enter();
        try {
            Service.State previous = state();
            switch (AnonymousClass10.$SwitchMap$com$google$common$util$concurrent$Service$State[previous.ordinal()]) {
                case Ascii.SOH /* 1 */:
                case Ascii.ENQ /* 5 */:
                    String valueOf = String.valueOf(String.valueOf(previous));
                    throw new IllegalStateException(new StringBuilder(22 + valueOf.length()).append("Failed while in state:").append(valueOf).toString(), cause);
                case 2:
                case Ascii.ETX /* 3 */:
                case 4:
                    this.snapshot = new StateSnapshot(Service.State.FAILED, false, cause);
                    failed(previous, cause);
                    break;
                case Ascii.ACK /* 6 */:
                    break;
                default:
                    String valueOf2 = String.valueOf(String.valueOf(previous));
                    throw new AssertionError(new StringBuilder(18 + valueOf2.length()).append("Unexpected state: ").append(valueOf2).toString());
            }
        } finally {
            this.monitor.leave();
            executeListeners();
        }
    }

    @Override // com.google.common.util.concurrent.Service
    public final boolean isRunning() {
        return state() == Service.State.RUNNING;
    }

    @Override // com.google.common.util.concurrent.Service
    public final Service.State state() {
        return this.snapshot.externalState();
    }

    @Override // com.google.common.util.concurrent.Service
    public final Throwable failureCause() {
        return this.snapshot.failureCause();
    }

    @Override // com.google.common.util.concurrent.Service
    public final void addListener(Service.Listener listener, Executor executor) {
        Preconditions.checkNotNull(listener, "listener");
        Preconditions.checkNotNull(executor, "executor");
        this.monitor.enter();
        try {
            if (!state().isTerminal()) {
                this.listeners.add(new ListenerCallQueue<>(listener, executor));
            }
        } finally {
            this.monitor.leave();
        }
    }

    public String toString() {
        String valueOf = String.valueOf(String.valueOf(getClass().getSimpleName()));
        String valueOf2 = String.valueOf(String.valueOf(state()));
        return new StringBuilder(3 + valueOf.length() + valueOf2.length()).append(valueOf).append(" [").append(valueOf2).append("]").toString();
    }

    private void executeListeners() {
        if (!this.monitor.isOccupiedByCurrentThread()) {
            for (int i = 0; i < this.listeners.size(); i++) {
                this.listeners.get(i).execute();
            }
        }
    }

    @GuardedBy("monitor")
    private void starting() {
        STARTING_CALLBACK.enqueueOn(this.listeners);
    }

    @GuardedBy("monitor")
    private void running() {
        RUNNING_CALLBACK.enqueueOn(this.listeners);
    }

    @GuardedBy("monitor")
    private void stopping(Service.State from) {
        if (from == Service.State.STARTING) {
            STOPPING_FROM_STARTING_CALLBACK.enqueueOn(this.listeners);
        } else {
            if (from == Service.State.RUNNING) {
                STOPPING_FROM_RUNNING_CALLBACK.enqueueOn(this.listeners);
                return;
            }
            throw new AssertionError();
        }
    }

    @GuardedBy("monitor")
    private void terminated(Service.State from) {
        switch (AnonymousClass10.$SwitchMap$com$google$common$util$concurrent$Service$State[from.ordinal()]) {
            case Ascii.SOH /* 1 */:
                TERMINATED_FROM_NEW_CALLBACK.enqueueOn(this.listeners);
                return;
            case 2:
            case Ascii.ENQ /* 5 */:
            case Ascii.ACK /* 6 */:
            default:
                throw new AssertionError();
            case Ascii.ETX /* 3 */:
                TERMINATED_FROM_RUNNING_CALLBACK.enqueueOn(this.listeners);
                return;
            case 4:
                TERMINATED_FROM_STOPPING_CALLBACK.enqueueOn(this.listeners);
                return;
        }
    }

    @GuardedBy("monitor")
    private void failed(final Service.State from, final Throwable cause) {
        String valueOf = String.valueOf(String.valueOf(from));
        String valueOf2 = String.valueOf(String.valueOf(cause));
        new ListenerCallQueue.Callback<Service.Listener>(new StringBuilder(27 + valueOf.length() + valueOf2.length()).append("failed({from = ").append(valueOf).append(", cause = ").append(valueOf2).append("})").toString()) { // from class: com.google.common.util.concurrent.AbstractService.9
            /* JADX INFO: Access modifiers changed from: package-private */
            @Override // com.google.common.util.concurrent.ListenerCallQueue.Callback
            public void call(Service.Listener listener) {
                listener.failed(from, cause);
            }
        }.enqueueOn(this.listeners);
    }

    @Immutable
    /* loaded from: guava-18.0.jar:com/google/common/util/concurrent/AbstractService$StateSnapshot.class */
    private static final class StateSnapshot {
        final Service.State state;
        final boolean shutdownWhenStartupFinishes;

        @Nullable
        final Throwable failure;

        StateSnapshot(Service.State internalState) {
            this(internalState, false, null);
        }

        StateSnapshot(Service.State internalState, boolean shutdownWhenStartupFinishes, @Nullable Throwable failure) {
            Preconditions.checkArgument(!shutdownWhenStartupFinishes || internalState == Service.State.STARTING, "shudownWhenStartupFinishes can only be set if state is STARTING. Got %s instead.", internalState);
            Preconditions.checkArgument(!((failure != null) ^ (internalState == Service.State.FAILED)), "A failure cause should be set if and only if the state is failed.  Got %s and %s instead.", internalState, failure);
            this.state = internalState;
            this.shutdownWhenStartupFinishes = shutdownWhenStartupFinishes;
            this.failure = failure;
        }

        Service.State externalState() {
            if (this.shutdownWhenStartupFinishes && this.state == Service.State.STARTING) {
                return Service.State.STOPPING;
            }
            return this.state;
        }

        Throwable failureCause() {
            Preconditions.checkState(this.state == Service.State.FAILED, "failureCause() is only valid if the service has failed, service is %s", this.state);
            return this.failure;
        }
    }
}
