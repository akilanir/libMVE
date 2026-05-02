.class public abstract Lcom/google/common/util/concurrent/ForwardingService;
.super Lcom/google/common/collect/ForwardingObject;
.source "ForwardingService.java"

# interfaces
.implements Lcom/google/common/util/concurrent/Service;


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/google/common/collect/ForwardingObject;-><init>()V

    return-void
.end method


# virtual methods
.method public addListener(Lcom/google/common/util/concurrent/Service$Listener;Ljava/util/concurrent/Executor;)V
    .registers 4
    .param p1, "listener"    # Lcom/google/common/util/concurrent/Service$Listener;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 84
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingService;->delegate()Lcom/google/common/util/concurrent/Service;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/google/common/util/concurrent/Service;->addListener(Lcom/google/common/util/concurrent/Service$Listener;Ljava/util/concurrent/Executor;)V

    .line 85
    return-void
.end method

.method public awaitRunning()V
    .registers 2

    .prologue
    .line 113
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingService;->delegate()Lcom/google/common/util/concurrent/Service;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/util/concurrent/Service;->awaitRunning()V

    .line 114
    return-void
.end method

.method public awaitRunning(JLjava/util/concurrent/TimeUnit;)V
    .registers 5
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 120
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingService;->delegate()Lcom/google/common/util/concurrent/Service;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lcom/google/common/util/concurrent/Service;->awaitRunning(JLjava/util/concurrent/TimeUnit;)V

    .line 121
    return-void
.end method

.method public awaitTerminated()V
    .registers 2

    .prologue
    .line 127
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingService;->delegate()Lcom/google/common/util/concurrent/Service;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/util/concurrent/Service;->awaitTerminated()V

    .line 128
    return-void
.end method

.method public awaitTerminated(JLjava/util/concurrent/TimeUnit;)V
    .registers 5
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 134
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingService;->delegate()Lcom/google/common/util/concurrent/Service;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lcom/google/common/util/concurrent/Service;->awaitTerminated(JLjava/util/concurrent/TimeUnit;)V

    .line 135
    return-void
.end method

.method protected abstract delegate()Lcom/google/common/util/concurrent/Service;
.end method

.method protected bridge synthetic delegate()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 38
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingService;->delegate()Lcom/google/common/util/concurrent/Service;

    move-result-object v0

    return-object v0
.end method

.method public failureCause()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 91
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingService;->delegate()Lcom/google/common/util/concurrent/Service;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/util/concurrent/Service;->failureCause()Ljava/lang/Throwable;

    move-result-object v0

    return-object v0
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 77
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingService;->delegate()Lcom/google/common/util/concurrent/Service;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/util/concurrent/Service;->isRunning()Z

    move-result v0

    return v0
.end method

.method protected standardStartAndWait()Lcom/google/common/util/concurrent/Service$State;
    .registers 2

    .prologue
    .line 144
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingService;->start()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/util/concurrent/Futures;->getUnchecked(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/util/concurrent/Service$State;

    return-object v0
.end method

.method protected standardStopAndWait()Lcom/google/common/util/concurrent/Service$State;
    .registers 2

    .prologue
    .line 154
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingService;->stop()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/util/concurrent/Futures;->getUnchecked(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/util/concurrent/Service$State;

    return-object v0
.end method

.method public start()Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture",
            "<",
            "Lcom/google/common/util/concurrent/Service$State;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 51
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingService;->delegate()Lcom/google/common/util/concurrent/Service;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/util/concurrent/Service;->start()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public startAndWait()Lcom/google/common/util/concurrent/Service$State;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 67
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingService;->delegate()Lcom/google/common/util/concurrent/Service;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/util/concurrent/Service;->startAndWait()Lcom/google/common/util/concurrent/Service$State;

    move-result-object v0

    return-object v0
.end method

.method public startAsync()Lcom/google/common/util/concurrent/Service;
    .registers 2

    .prologue
    .line 98
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingService;->delegate()Lcom/google/common/util/concurrent/Service;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/util/concurrent/Service;->startAsync()Lcom/google/common/util/concurrent/Service;

    .line 99
    return-object p0
.end method

.method public state()Lcom/google/common/util/concurrent/Service$State;
    .registers 2

    .prologue
    .line 55
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingService;->delegate()Lcom/google/common/util/concurrent/Service;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/util/concurrent/Service;->state()Lcom/google/common/util/concurrent/Service$State;

    move-result-object v0

    return-object v0
.end method

.method public stop()Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture",
            "<",
            "Lcom/google/common/util/concurrent/Service$State;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 61
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingService;->delegate()Lcom/google/common/util/concurrent/Service;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/util/concurrent/Service;->stop()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public stopAndWait()Lcom/google/common/util/concurrent/Service$State;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 73
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingService;->delegate()Lcom/google/common/util/concurrent/Service;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/util/concurrent/Service;->stopAndWait()Lcom/google/common/util/concurrent/Service$State;

    move-result-object v0

    return-object v0
.end method

.method public stopAsync()Lcom/google/common/util/concurrent/Service;
    .registers 2

    .prologue
    .line 106
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingService;->delegate()Lcom/google/common/util/concurrent/Service;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/util/concurrent/Service;->stopAsync()Lcom/google/common/util/concurrent/Service;

    .line 107
    return-object p0
.end method
