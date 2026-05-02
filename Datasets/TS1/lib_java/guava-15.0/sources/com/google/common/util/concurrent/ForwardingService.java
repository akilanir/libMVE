package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.collect.ForwardingObject;
import com.google.common.util.concurrent.Service;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

@Beta
@Deprecated
/* loaded from: guava-15.0.jar:com/google/common/util/concurrent/ForwardingService.class */
public abstract class ForwardingService extends ForwardingObject implements Service {
    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.common.collect.ForwardingObject
    public abstract Service delegate();

    protected ForwardingService() {
    }

    @Override // com.google.common.util.concurrent.Service
    @Deprecated
    public ListenableFuture<Service.State> start() {
        return delegate().start();
    }

    @Override // com.google.common.util.concurrent.Service
    public Service.State state() {
        return delegate().state();
    }

    @Override // com.google.common.util.concurrent.Service
    @Deprecated
    public ListenableFuture<Service.State> stop() {
        return delegate().stop();
    }

    @Override // com.google.common.util.concurrent.Service
    @Deprecated
    public Service.State startAndWait() {
        return delegate().startAndWait();
    }

    @Override // com.google.common.util.concurrent.Service
    @Deprecated
    public Service.State stopAndWait() {
        return delegate().stopAndWait();
    }

    @Override // com.google.common.util.concurrent.Service
    public boolean isRunning() {
        return delegate().isRunning();
    }

    @Override // com.google.common.util.concurrent.Service
    public void addListener(Service.Listener listener, Executor executor) {
        delegate().addListener(listener, executor);
    }

    @Override // com.google.common.util.concurrent.Service
    public Throwable failureCause() {
        return delegate().failureCause();
    }

    @Override // com.google.common.util.concurrent.Service
    public Service startAsync() {
        delegate().startAsync();
        return this;
    }

    @Override // com.google.common.util.concurrent.Service
    public Service stopAsync() {
        delegate().stopAsync();
        return this;
    }

    @Override // com.google.common.util.concurrent.Service
    public void awaitRunning() {
        delegate().awaitRunning();
    }

    @Override // com.google.common.util.concurrent.Service
    public void awaitRunning(long timeout, TimeUnit unit) throws TimeoutException {
        delegate().awaitRunning(timeout, unit);
    }

    @Override // com.google.common.util.concurrent.Service
    public void awaitTerminated() {
        delegate().awaitTerminated();
    }

    @Override // com.google.common.util.concurrent.Service
    public void awaitTerminated(long timeout, TimeUnit unit) throws TimeoutException {
        delegate().awaitTerminated(timeout, unit);
    }

    protected Service.State standardStartAndWait() {
        return (Service.State) Futures.getUnchecked(start());
    }

    protected Service.State standardStopAndWait() {
        return (Service.State) Futures.getUnchecked(stop());
    }
}
