package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.base.Ascii;
import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import com.google.common.util.concurrent.Monitor;
import com.google.common.util.concurrent.Service;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;
import javax.annotation.concurrent.Immutable;

@Beta
/* loaded from: guava-15.0.jar:com/google/common/util/concurrent/AbstractService.class */
public abstract class AbstractService implements Service {
    private final Monitor monitor = new Monitor();
    private final Transition startup = new Transition();
    private final Transition shutdown = new Transition();
    private final Monitor.Guard isStartable = new Monitor.Guard(this.monitor) { // from class: com.google.common.util.concurrent.AbstractService.1
        @Override // com.google.common.util.concurrent.Monitor.Guard
        public boolean isSatisfied() {
            return AbstractService.this.state() == Service.State.NEW;
        }
    };
    private final Monitor.Guard isStoppable = new Monitor.Guard(this.monitor) { // from class: com.google.common.util.concurrent.AbstractService.2
        @Override // com.google.common.util.concurrent.Monitor.Guard
        public boolean isSatisfied() {
            return AbstractService.this.state().compareTo(Service.State.RUNNING) <= 0;
        }
    };
    private final Monitor.Guard hasReachedRunning = new Monitor.Guard(this.monitor) { // from class: com.google.common.util.concurrent.AbstractService.3
        @Override // com.google.common.util.concurrent.Monitor.Guard
        public boolean isSatisfied() {
            return AbstractService.this.state().compareTo(Service.State.RUNNING) >= 0;
        }
    };
    private final Monitor.Guard isStopped = new Monitor.Guard(this.monitor) { // from class: com.google.common.util.concurrent.AbstractService.4
        @Override // com.google.common.util.concurrent.Monitor.Guard
        public boolean isSatisfied() {
            return AbstractService.this.state().isTerminal();
        }
    };

    @GuardedBy("monitor")
    private final List<ListenerExecutorPair> listeners = Lists.newArrayList();
    private final ExecutionQueue queuedListeners = new ExecutionQueue();

    @GuardedBy("monitor")
    private volatile StateSnapshot snapshot = new StateSnapshot(Service.State.NEW);

    protected abstract void doStart();

    protected abstract void doStop();

    protected AbstractService() {
        addListener(new Service.Listener() { // from class: com.google.common.util.concurrent.AbstractService.5
            @Override // com.google.common.util.concurrent.Service.Listener
            public void running() {
                AbstractService.this.startup.set(Service.State.RUNNING);
            }

            @Override // com.google.common.util.concurrent.Service.Listener
            public void stopping(Service.State from) {
                if (from == Service.State.STARTING) {
                    AbstractService.this.startup.set(Service.State.STOPPING);
                }
            }

            @Override // com.google.common.util.concurrent.Service.Listener
            public void terminated(Service.State from) {
                if (from == Service.State.NEW) {
                    AbstractService.this.startup.set(Service.State.TERMINATED);
                }
                AbstractService.this.shutdown.set(Service.State.TERMINATED);
            }

            @Override // com.google.common.util.concurrent.Service.Listener
            public void failed(Service.State from, Throwable failure) {
                switch (AnonymousClass11.$SwitchMap$com$google$common$util$concurrent$Service$State[from.ordinal()]) {
                    case Ascii.SOH /* 1 */:
                        AbstractService.this.startup.setException(failure);
                        AbstractService.this.shutdown.setException(new Exception("Service failed to start.", failure));
                        return;
                    case 2:
                        AbstractService.this.shutdown.setException(new Exception("Service failed while running", failure));
                        return;
                    case Ascii.ETX /* 3 */:
                        AbstractService.this.shutdown.setException(failure);
                        return;
                    case 4:
                    case Ascii.ENQ /* 5 */:
                    case Ascii.ACK /* 6 */:
                    default:
                        throw new AssertionError("Unexpected from state: " + from);
                }
            }
        }, MoreExecutors.sameThreadExecutor());
    }

    /* renamed from: com.google.common.util.concurrent.AbstractService$11, reason: invalid class name */
    /* loaded from: guava-15.0.jar:com/google/common/util/concurrent/AbstractService$11.class */
    static /* synthetic */ class AnonymousClass11 {
        static final /* synthetic */ int[] $SwitchMap$com$google$common$util$concurrent$Service$State = new int[Service.State.values().length];

        static {
            try {
                $SwitchMap$com$google$common$util$concurrent$Service$State[Service.State.STARTING.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$google$common$util$concurrent$Service$State[Service.State.RUNNING.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$google$common$util$concurrent$Service$State[Service.State.STOPPING.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$google$common$util$concurrent$Service$State[Service.State.TERMINATED.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$google$common$util$concurrent$Service$State[Service.State.FAILED.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$com$google$common$util$concurrent$Service$State[Service.State.NEW.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
        }
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
            throw new IllegalStateException("Service " + this + " has already been started");
        } catch (Throwable th) {
            this.monitor.leave();
            executeListeners();
            throw th;
        }
    }

    @Override // com.google.common.util.concurrent.Service
    @Deprecated
    public final ListenableFuture<Service.State> start() {
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
            }
            return this.startup;
        } catch (Throwable th) {
            this.monitor.leave();
            executeListeners();
            throw th;
        }
    }

    @Override // com.google.common.util.concurrent.Service
    public final Service stopAsync() {
        stop();
        return this;
    }

    @Override // com.google.common.util.concurrent.Service
    @Deprecated
    public final ListenableFuture<Service.State> stop() {
        try {
            if (this.monitor.enterIf(this.isStoppable)) {
                try {
                    Service.State previous = state();
                    switch (AnonymousClass11.$SwitchMap$com$google$common$util$concurrent$Service$State[previous.ordinal()]) {
                        case Ascii.SOH /* 1 */:
                            this.snapshot = new StateSnapshot(Service.State.STARTING, true, null);
                            stopping(Service.State.STARTING);
                            break;
                        case 2:
                            this.snapshot = new StateSnapshot(Service.State.STOPPING);
                            stopping(Service.State.RUNNING);
                            doStop();
                            break;
                        case Ascii.ETX /* 3 */:
                        case 4:
                        case Ascii.ENQ /* 5 */:
                            throw new AssertionError("isStoppable is incorrectly implemented, saw: " + previous);
                        case Ascii.ACK /* 6 */:
                            this.snapshot = new StateSnapshot(Service.State.TERMINATED);
                            terminated(Service.State.NEW);
                            break;
                        default:
                            throw new AssertionError("Unexpected state: " + previous);
                    }
                    this.monitor.leave();
                    executeListeners();
                } catch (Throwable shutdownFailure) {
                    notifyFailed(shutdownFailure);
                    this.monitor.leave();
                    executeListeners();
                }
            }
            return this.shutdown;
        } catch (Throwable th) {
            this.monitor.leave();
            executeListeners();
            throw th;
        }
    }

    @Override // com.google.common.util.concurrent.Service
    @Deprecated
    public Service.State startAndWait() {
        return (Service.State) Futures.getUnchecked(start());
    }

    @Override // com.google.common.util.concurrent.Service
    @Deprecated
    public Service.State stopAndWait() {
        return (Service.State) Futures.getUnchecked(stop());
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
        throw new TimeoutException("Timed out waiting for " + this + " to reach the RUNNING state. Current state: " + state());
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
                state();
                checkCurrentState(Service.State.TERMINATED);
                this.monitor.leave();
                return;
            } catch (Throwable th) {
                this.monitor.leave();
                throw th;
            }
        }
        throw new TimeoutException("Timed out waiting for " + this + " to reach a terminal state. Current state: " + state());
    }

    @GuardedBy("monitor")
    private void checkCurrentState(Service.State expected) {
        Service.State actual = state();
        if (actual != expected) {
            if (actual == Service.State.FAILED) {
                throw new IllegalStateException("Expected the service to be " + expected + ", but the service has FAILED", failureCause());
            }
            throw new IllegalStateException("Expected the service to be " + expected + ", but was " + actual);
        }
    }

    protected final void notifyStarted() {
        this.monitor.enter();
        try {
            if (this.snapshot.state != Service.State.STARTING) {
                IllegalStateException failure = new IllegalStateException("Cannot notifyStarted() when the service is " + this.snapshot.state);
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
                IllegalStateException failure = new IllegalStateException("Cannot notifyStopped() when the service is " + previous);
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
            switch (AnonymousClass11.$SwitchMap$com$google$common$util$concurrent$Service$State[previous.ordinal()]) {
                case Ascii.SOH /* 1 */:
                case 2:
                case Ascii.ETX /* 3 */:
                    this.snapshot = new StateSnapshot(Service.State.FAILED, false, cause);
                    failed(previous, cause);
                    break;
                case 4:
                case Ascii.ACK /* 6 */:
                    throw new IllegalStateException("Failed while in state:" + previous, cause);
                case Ascii.ENQ /* 5 */:
                    break;
                default:
                    throw new AssertionError("Unexpected state: " + previous);
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
            Service.State currentState = state();
            if (currentState != Service.State.TERMINATED && currentState != Service.State.FAILED) {
                this.listeners.add(new ListenerExecutorPair(listener, executor));
            }
        } finally {
            this.monitor.leave();
        }
    }

    public String toString() {
        return getClass().getSimpleName() + " [" + state() + "]";
    }

    /* loaded from: guava-15.0.jar:com/google/common/util/concurrent/AbstractService$Transition.class */
    private class Transition extends AbstractFuture<Service.State> {
        private Transition() {
        }

        @Override // com.google.common.util.concurrent.AbstractFuture, java.util.concurrent.Future
        public Service.State get(long timeout, TimeUnit unit) throws InterruptedException, TimeoutException, ExecutionException {
            try {
                return (Service.State) super.get(timeout, unit);
            } catch (TimeoutException e) {
                throw new TimeoutException(AbstractService.this.toString());
            }
        }
    }

    private void executeListeners() {
        if (!this.monitor.isOccupiedByCurrentThread()) {
            this.queuedListeners.execute();
        }
    }

    @GuardedBy("monitor")
    private void starting() {
        for (final ListenerExecutorPair pair : this.listeners) {
            this.queuedListeners.add(new Runnable() { // from class: com.google.common.util.concurrent.AbstractService.6
                @Override // java.lang.Runnable
                public void run() {
                    pair.listener.starting();
                }
            }, pair.executor);
        }
    }

    @GuardedBy("monitor")
    private void running() {
        for (final ListenerExecutorPair pair : this.listeners) {
            this.queuedListeners.add(new Runnable() { // from class: com.google.common.util.concurrent.AbstractService.7
                @Override // java.lang.Runnable
                public void run() {
                    pair.listener.running();
                }
            }, pair.executor);
        }
    }

    @GuardedBy("monitor")
    private void stopping(final Service.State from) {
        for (final ListenerExecutorPair pair : this.listeners) {
            this.queuedListeners.add(new Runnable() { // from class: com.google.common.util.concurrent.AbstractService.8
                @Override // java.lang.Runnable
                public void run() {
                    pair.listener.stopping(from);
                }
            }, pair.executor);
        }
    }

    @GuardedBy("monitor")
    private void terminated(final Service.State from) {
        for (final ListenerExecutorPair pair : this.listeners) {
            this.queuedListeners.add(new Runnable() { // from class: com.google.common.util.concurrent.AbstractService.9
                @Override // java.lang.Runnable
                public void run() {
                    pair.listener.terminated(from);
                }
            }, pair.executor);
        }
        this.listeners.clear();
    }

    @GuardedBy("monitor")
    private void failed(final Service.State from, final Throwable cause) {
        for (final ListenerExecutorPair pair : this.listeners) {
            this.queuedListeners.add(new Runnable() { // from class: com.google.common.util.concurrent.AbstractService.10
                @Override // java.lang.Runnable
                public void run() {
                    pair.listener.failed(from, cause);
                }
            }, pair.executor);
        }
        this.listeners.clear();
    }

    /* loaded from: guava-15.0.jar:com/google/common/util/concurrent/AbstractService$ListenerExecutorPair.class */
    private static class ListenerExecutorPair {
        final Service.Listener listener;
        final Executor executor;

        ListenerExecutorPair(Service.Listener listener, Executor executor) {
            this.listener = listener;
            this.executor = executor;
        }
    }

    @Immutable
    /* loaded from: guava-15.0.jar:com/google/common/util/concurrent/AbstractService$StateSnapshot.class */
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
