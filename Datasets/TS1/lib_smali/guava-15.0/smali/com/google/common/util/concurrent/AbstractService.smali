.class public abstract Lcom/google/common/util/concurrent/AbstractService;
.super Ljava/lang/Object;
.source "AbstractService.java"

# interfaces
.implements Lcom/google/common/util/concurrent/Service;


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/util/concurrent/AbstractService$11;,
        Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;,
        Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;,
        Lcom/google/common/util/concurrent/AbstractService$Transition;
    }
.end annotation


# instance fields
.field private final hasReachedRunning:Lcom/google/common/util/concurrent/Monitor$Guard;

.field private final isStartable:Lcom/google/common/util/concurrent/Monitor$Guard;

.field private final isStoppable:Lcom/google/common/util/concurrent/Monitor$Guard;

.field private final isStopped:Lcom/google/common/util/concurrent/Monitor$Guard;

.field private final listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;",
            ">;"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "monitor"
    .end annotation
.end field

.field private final monitor:Lcom/google/common/util/concurrent/Monitor;

.field private final queuedListeners:Lcom/google/common/util/concurrent/ExecutionQueue;

.field private final shutdown:Lcom/google/common/util/concurrent/AbstractService$Transition;

.field private volatile snapshot:Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "monitor"
    .end annotation
.end field

.field private final startup:Lcom/google/common/util/concurrent/AbstractService$Transition;


# direct methods
.method protected constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Lcom/google/common/util/concurrent/Monitor;

    invoke-direct {v0}, Lcom/google/common/util/concurrent/Monitor;-><init>()V

    iput-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    .line 57
    new-instance v0, Lcom/google/common/util/concurrent/AbstractService$Transition;

    invoke-direct {v0, p0, v1}, Lcom/google/common/util/concurrent/AbstractService$Transition;-><init>(Lcom/google/common/util/concurrent/AbstractService;Lcom/google/common/util/concurrent/AbstractService$1;)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->startup:Lcom/google/common/util/concurrent/AbstractService$Transition;

    .line 58
    new-instance v0, Lcom/google/common/util/concurrent/AbstractService$Transition;

    invoke-direct {v0, p0, v1}, Lcom/google/common/util/concurrent/AbstractService$Transition;-><init>(Lcom/google/common/util/concurrent/AbstractService;Lcom/google/common/util/concurrent/AbstractService$1;)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->shutdown:Lcom/google/common/util/concurrent/AbstractService$Transition;

    .line 60
    new-instance v0, Lcom/google/common/util/concurrent/AbstractService$1;

    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-direct {v0, p0, v1}, Lcom/google/common/util/concurrent/AbstractService$1;-><init>(Lcom/google/common/util/concurrent/AbstractService;Lcom/google/common/util/concurrent/Monitor;)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->isStartable:Lcom/google/common/util/concurrent/Monitor$Guard;

    .line 66
    new-instance v0, Lcom/google/common/util/concurrent/AbstractService$2;

    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-direct {v0, p0, v1}, Lcom/google/common/util/concurrent/AbstractService$2;-><init>(Lcom/google/common/util/concurrent/AbstractService;Lcom/google/common/util/concurrent/Monitor;)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->isStoppable:Lcom/google/common/util/concurrent/Monitor$Guard;

    .line 72
    new-instance v0, Lcom/google/common/util/concurrent/AbstractService$3;

    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-direct {v0, p0, v1}, Lcom/google/common/util/concurrent/AbstractService$3;-><init>(Lcom/google/common/util/concurrent/AbstractService;Lcom/google/common/util/concurrent/Monitor;)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->hasReachedRunning:Lcom/google/common/util/concurrent/Monitor$Guard;

    .line 78
    new-instance v0, Lcom/google/common/util/concurrent/AbstractService$4;

    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-direct {v0, p0, v1}, Lcom/google/common/util/concurrent/AbstractService$4;-><init>(Lcom/google/common/util/concurrent/AbstractService;Lcom/google/common/util/concurrent/Monitor;)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->isStopped:Lcom/google/common/util/concurrent/Monitor$Guard;

    .line 87
    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->listeners:Ljava/util/List;

    .line 96
    new-instance v0, Lcom/google/common/util/concurrent/ExecutionQueue;

    invoke-direct {v0}, Lcom/google/common/util/concurrent/ExecutionQueue;-><init>()V

    iput-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->queuedListeners:Lcom/google/common/util/concurrent/ExecutionQueue;

    .line 107
    new-instance v0, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    sget-object v1, Lcom/google/common/util/concurrent/Service$State;->NEW:Lcom/google/common/util/concurrent/Service$State;

    invoke-direct {v0, v1}, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;-><init>(Lcom/google/common/util/concurrent/Service$State;)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->snapshot:Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    .line 114
    new-instance v0, Lcom/google/common/util/concurrent/AbstractService$5;

    invoke-direct {v0, p0}, Lcom/google/common/util/concurrent/AbstractService$5;-><init>(Lcom/google/common/util/concurrent/AbstractService;)V

    invoke-static {}, Lcom/google/common/util/concurrent/MoreExecutors;->sameThreadExecutor()Lcom/google/common/util/concurrent/ListeningExecutorService;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/google/common/util/concurrent/AbstractService;->addListener(Lcom/google/common/util/concurrent/Service$Listener;Ljava/util/concurrent/Executor;)V

    .line 154
    return-void
.end method

.method static synthetic access$100(Lcom/google/common/util/concurrent/AbstractService;)Lcom/google/common/util/concurrent/AbstractService$Transition;
    .registers 2
    .param p0, "x0"    # Lcom/google/common/util/concurrent/AbstractService;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->startup:Lcom/google/common/util/concurrent/AbstractService$Transition;

    return-object v0
.end method

.method static synthetic access$200(Lcom/google/common/util/concurrent/AbstractService;)Lcom/google/common/util/concurrent/AbstractService$Transition;
    .registers 2
    .param p0, "x0"    # Lcom/google/common/util/concurrent/AbstractService;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->shutdown:Lcom/google/common/util/concurrent/AbstractService$Transition;

    return-object v0
.end method

.method private checkCurrentState(Lcom/google/common/util/concurrent/Service$State;)V
    .registers 6
    .param p1, "expected"    # Lcom/google/common/util/concurrent/Service$State;
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "monitor"
    .end annotation

    .prologue
    .line 330
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractService;->state()Lcom/google/common/util/concurrent/Service$State;

    move-result-object v0

    .line 331
    .local v0, "actual":Lcom/google/common/util/concurrent/Service$State;
    if-eq v0, p1, :cond_50

    .line 332
    sget-object v1, Lcom/google/common/util/concurrent/Service$State;->FAILED:Lcom/google/common/util/concurrent/Service$State;

    if-ne v0, v1, :cond_2d

    .line 334
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected the service to be "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", but the service has FAILED"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractService;->failureCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 337
    :cond_2d
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected the service to be "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 340
    :cond_50
    return-void
.end method

.method private executeListeners()V
    .registers 2

    .prologue
    .line 495
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Monitor;->isOccupiedByCurrentThread()Z

    move-result v0

    if-nez v0, :cond_d

    .line 496
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->queuedListeners:Lcom/google/common/util/concurrent/ExecutionQueue;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/ExecutionQueue;->execute()V

    .line 498
    :cond_d
    return-void
.end method

.method private failed(Lcom/google/common/util/concurrent/Service$State;Ljava/lang/Throwable;)V
    .registers 8
    .param p1, "from"    # Lcom/google/common/util/concurrent/Service$State;
    .param p2, "cause"    # Ljava/lang/Throwable;
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "monitor"
    .end annotation

    .prologue
    .line 548
    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->listeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;

    .line 549
    .local v1, "pair":Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;
    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->queuedListeners:Lcom/google/common/util/concurrent/ExecutionQueue;

    new-instance v3, Lcom/google/common/util/concurrent/AbstractService$10;

    invoke-direct {v3, p0, v1, p1, p2}, Lcom/google/common/util/concurrent/AbstractService$10;-><init>(Lcom/google/common/util/concurrent/AbstractService;Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;Lcom/google/common/util/concurrent/Service$State;Ljava/lang/Throwable;)V

    iget-object v4, v1, Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;->executor:Ljava/util/concurrent/Executor;

    invoke-virtual {v2, v3, v4}, Lcom/google/common/util/concurrent/ExecutionQueue;->add(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    goto :goto_6

    .line 556
    .end local v1    # "pair":Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;
    :cond_1f
    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->listeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 557
    return-void
.end method

.method private running()V
    .registers 6
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "monitor"
    .end annotation

    .prologue
    .line 513
    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->listeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;

    .line 514
    .local v1, "pair":Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;
    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->queuedListeners:Lcom/google/common/util/concurrent/ExecutionQueue;

    new-instance v3, Lcom/google/common/util/concurrent/AbstractService$7;

    invoke-direct {v3, p0, v1}, Lcom/google/common/util/concurrent/AbstractService$7;-><init>(Lcom/google/common/util/concurrent/AbstractService;Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;)V

    iget-object v4, v1, Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;->executor:Ljava/util/concurrent/Executor;

    invoke-virtual {v2, v3, v4}, Lcom/google/common/util/concurrent/ExecutionQueue;->add(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    goto :goto_6

    .line 520
    .end local v1    # "pair":Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;
    :cond_1f
    return-void
.end method

.method private starting()V
    .registers 6
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "monitor"
    .end annotation

    .prologue
    .line 502
    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->listeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;

    .line 503
    .local v1, "pair":Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;
    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->queuedListeners:Lcom/google/common/util/concurrent/ExecutionQueue;

    new-instance v3, Lcom/google/common/util/concurrent/AbstractService$6;

    invoke-direct {v3, p0, v1}, Lcom/google/common/util/concurrent/AbstractService$6;-><init>(Lcom/google/common/util/concurrent/AbstractService;Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;)V

    iget-object v4, v1, Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;->executor:Ljava/util/concurrent/Executor;

    invoke-virtual {v2, v3, v4}, Lcom/google/common/util/concurrent/ExecutionQueue;->add(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    goto :goto_6

    .line 509
    .end local v1    # "pair":Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;
    :cond_1f
    return-void
.end method

.method private stopping(Lcom/google/common/util/concurrent/Service$State;)V
    .registers 7
    .param p1, "from"    # Lcom/google/common/util/concurrent/Service$State;
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "monitor"
    .end annotation

    .prologue
    .line 524
    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->listeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;

    .line 525
    .local v1, "pair":Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;
    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->queuedListeners:Lcom/google/common/util/concurrent/ExecutionQueue;

    new-instance v3, Lcom/google/common/util/concurrent/AbstractService$8;

    invoke-direct {v3, p0, v1, p1}, Lcom/google/common/util/concurrent/AbstractService$8;-><init>(Lcom/google/common/util/concurrent/AbstractService;Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;Lcom/google/common/util/concurrent/Service$State;)V

    iget-object v4, v1, Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;->executor:Ljava/util/concurrent/Executor;

    invoke-virtual {v2, v3, v4}, Lcom/google/common/util/concurrent/ExecutionQueue;->add(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    goto :goto_6

    .line 531
    .end local v1    # "pair":Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;
    :cond_1f
    return-void
.end method

.method private terminated(Lcom/google/common/util/concurrent/Service$State;)V
    .registers 7
    .param p1, "from"    # Lcom/google/common/util/concurrent/Service$State;
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "monitor"
    .end annotation

    .prologue
    .line 535
    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->listeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;

    .line 536
    .local v1, "pair":Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;
    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->queuedListeners:Lcom/google/common/util/concurrent/ExecutionQueue;

    new-instance v3, Lcom/google/common/util/concurrent/AbstractService$9;

    invoke-direct {v3, p0, v1, p1}, Lcom/google/common/util/concurrent/AbstractService$9;-><init>(Lcom/google/common/util/concurrent/AbstractService;Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;Lcom/google/common/util/concurrent/Service$State;)V

    iget-object v4, v1, Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;->executor:Ljava/util/concurrent/Executor;

    invoke-virtual {v2, v3, v4}, Lcom/google/common/util/concurrent/ExecutionQueue;->add(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    goto :goto_6

    .line 543
    .end local v1    # "pair":Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;
    :cond_1f
    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->listeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 544
    return-void
.end method


# virtual methods
.method public final addListener(Lcom/google/common/util/concurrent/Service$Listener;Ljava/util/concurrent/Executor;)V
    .registers 6
    .param p1, "listener"    # Lcom/google/common/util/concurrent/Service$Listener;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 458
    const-string v1, "listener"

    invoke-static {p1, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 459
    const-string v1, "executor"

    invoke-static {p2, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 460
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/Monitor;->enter()V

    .line 462
    :try_start_f
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractService;->state()Lcom/google/common/util/concurrent/Service$State;

    move-result-object v0

    .line 463
    .local v0, "currentState":Lcom/google/common/util/concurrent/Service$State;
    sget-object v1, Lcom/google/common/util/concurrent/Service$State;->TERMINATED:Lcom/google/common/util/concurrent/Service$State;

    if-eq v0, v1, :cond_25

    sget-object v1, Lcom/google/common/util/concurrent/Service$State;->FAILED:Lcom/google/common/util/concurrent/Service$State;

    if-eq v0, v1, :cond_25

    .line 464
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->listeners:Ljava/util/List;

    new-instance v2, Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;

    invoke-direct {v2, p1, p2}, Lcom/google/common/util/concurrent/AbstractService$ListenerExecutorPair;-><init>(Lcom/google/common/util/concurrent/Service$Listener;Ljava/util/concurrent/Executor;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_25
    .catchall {:try_start_f .. :try_end_25} :catchall_2b

    .line 467
    :cond_25
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 469
    return-void

    .line 467
    .end local v0    # "currentState":Lcom/google/common/util/concurrent/Service$State;
    :catchall_2b
    move-exception v1

    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v2}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    throw v1
.end method

.method public final awaitRunning()V
    .registers 3

    .prologue
    .line 275
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->hasReachedRunning:Lcom/google/common/util/concurrent/Monitor$Guard;

    invoke-virtual {v0, v1}, Lcom/google/common/util/concurrent/Monitor;->enterWhenUninterruptibly(Lcom/google/common/util/concurrent/Monitor$Guard;)V

    .line 277
    :try_start_7
    sget-object v0, Lcom/google/common/util/concurrent/Service$State;->RUNNING:Lcom/google/common/util/concurrent/Service$State;

    invoke-direct {p0, v0}, Lcom/google/common/util/concurrent/AbstractService;->checkCurrentState(Lcom/google/common/util/concurrent/Service$State;)V
    :try_end_c
    .catchall {:try_start_7 .. :try_end_c} :catchall_12

    .line 279
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 281
    return-void

    .line 279
    :catchall_12
    move-exception v0

    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    throw v0
.end method

.method public final awaitRunning(JLjava/util/concurrent/TimeUnit;)V
    .registers 7
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 284
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->hasReachedRunning:Lcom/google/common/util/concurrent/Monitor$Guard;

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/google/common/util/concurrent/Monitor;->enterWhenUninterruptibly(Lcom/google/common/util/concurrent/Monitor$Guard;JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 286
    :try_start_a
    sget-object v0, Lcom/google/common/util/concurrent/Service$State;->RUNNING:Lcom/google/common/util/concurrent/Service$State;

    invoke-direct {p0, v0}, Lcom/google/common/util/concurrent/AbstractService;->checkCurrentState(Lcom/google/common/util/concurrent/Service$State;)V
    :try_end_f
    .catchall {:try_start_a .. :try_end_f} :catchall_15

    .line 288
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 298
    return-void

    .line 288
    :catchall_15
    move-exception v0

    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    throw v0

    .line 295
    :cond_1c
    new-instance v0, Ljava/util/concurrent/TimeoutException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Timed out waiting for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to reach the RUNNING state. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Current state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractService;->state()Lcom/google/common/util/concurrent/Service$State;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final awaitTerminated()V
    .registers 3

    .prologue
    .line 301
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->isStopped:Lcom/google/common/util/concurrent/Monitor$Guard;

    invoke-virtual {v0, v1}, Lcom/google/common/util/concurrent/Monitor;->enterWhenUninterruptibly(Lcom/google/common/util/concurrent/Monitor$Guard;)V

    .line 303
    :try_start_7
    sget-object v0, Lcom/google/common/util/concurrent/Service$State;->TERMINATED:Lcom/google/common/util/concurrent/Service$State;

    invoke-direct {p0, v0}, Lcom/google/common/util/concurrent/AbstractService;->checkCurrentState(Lcom/google/common/util/concurrent/Service$State;)V
    :try_end_c
    .catchall {:try_start_7 .. :try_end_c} :catchall_12

    .line 305
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 307
    return-void

    .line 305
    :catchall_12
    move-exception v0

    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    throw v0
.end method

.method public final awaitTerminated(JLjava/util/concurrent/TimeUnit;)V
    .registers 8
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 310
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->isStopped:Lcom/google/common/util/concurrent/Monitor$Guard;

    invoke-virtual {v1, v2, p1, p2, p3}, Lcom/google/common/util/concurrent/Monitor;->enterWhenUninterruptibly(Lcom/google/common/util/concurrent/Monitor$Guard;JLjava/util/concurrent/TimeUnit;)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 312
    :try_start_a
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractService;->state()Lcom/google/common/util/concurrent/Service$State;

    move-result-object v0

    .line 313
    .local v0, "state":Lcom/google/common/util/concurrent/Service$State;
    sget-object v1, Lcom/google/common/util/concurrent/Service$State;->TERMINATED:Lcom/google/common/util/concurrent/Service$State;

    invoke-direct {p0, v1}, Lcom/google/common/util/concurrent/AbstractService;->checkCurrentState(Lcom/google/common/util/concurrent/Service$State;)V
    :try_end_13
    .catchall {:try_start_a .. :try_end_13} :catchall_19

    .line 315
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 325
    return-void

    .line 315
    .end local v0    # "state":Lcom/google/common/util/concurrent/Service$State;
    :catchall_19
    move-exception v1

    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v2}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    throw v1

    .line 322
    :cond_20
    new-instance v1, Ljava/util/concurrent/TimeoutException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Timed out waiting for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " to reach a terminal state. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "Current state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractService;->state()Lcom/google/common/util/concurrent/Service$State;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected abstract doStart()V
.end method

.method protected abstract doStop()V
.end method

.method public final failureCause()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 450
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->snapshot:Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->failureCause()Ljava/lang/Throwable;

    move-result-object v0

    return-object v0
.end method

.method public final isRunning()Z
    .registers 3

    .prologue
    .line 437
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractService;->state()Lcom/google/common/util/concurrent/Service$State;

    move-result-object v0

    sget-object v1, Lcom/google/common/util/concurrent/Service$State;->RUNNING:Lcom/google/common/util/concurrent/Service$State;

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected final notifyFailed(Ljava/lang/Throwable;)V
    .registers 6
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 408
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/Monitor;->enter()V

    .line 412
    :try_start_8
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractService;->state()Lcom/google/common/util/concurrent/Service$State;

    move-result-object v0

    .line 413
    .local v0, "previous":Lcom/google/common/util/concurrent/Service$State;
    sget-object v1, Lcom/google/common/util/concurrent/AbstractService$11;->$SwitchMap$com$google$common$util$concurrent$Service$State:[I

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Service$State;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_6a

    .line 427
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
    :try_end_30
    .catchall {:try_start_8 .. :try_end_30} :catchall_30

    .line 430
    .end local v0    # "previous":Lcom/google/common/util/concurrent/Service$State;
    :catchall_30
    move-exception v1

    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v2}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 431
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractService;->executeListeners()V

    throw v1

    .line 416
    .restart local v0    # "previous":Lcom/google/common/util/concurrent/Service$State;
    :pswitch_3a
    :try_start_3a
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed while in state:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 420
    :pswitch_53
    new-instance v1, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    sget-object v2, Lcom/google/common/util/concurrent/Service$State;->FAILED:Lcom/google/common/util/concurrent/Service$State;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p1}, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;-><init>(Lcom/google/common/util/concurrent/Service$State;ZLjava/lang/Throwable;)V

    iput-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->snapshot:Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    .line 421
    invoke-direct {p0, v0, p1}, Lcom/google/common/util/concurrent/AbstractService;->failed(Lcom/google/common/util/concurrent/Service$State;Ljava/lang/Throwable;)V
    :try_end_60
    .catchall {:try_start_3a .. :try_end_60} :catchall_30

    .line 430
    :pswitch_60
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 431
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractService;->executeListeners()V

    .line 433
    return-void

    .line 413
    nop

    :pswitch_data_6a
    .packed-switch 0x1
        :pswitch_53
        :pswitch_53
        :pswitch_53
        :pswitch_3a
        :pswitch_60
        :pswitch_3a
    .end packed-switch
.end method

.method protected final notifyStarted()V
    .registers 4

    .prologue
    .line 349
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/Monitor;->enter()V

    .line 353
    :try_start_5
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->snapshot:Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    iget-object v1, v1, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->state:Lcom/google/common/util/concurrent/Service$State;

    sget-object v2, Lcom/google/common/util/concurrent/Service$State;->STARTING:Lcom/google/common/util/concurrent/Service$State;

    if-eq v1, v2, :cond_37

    .line 354
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot notifyStarted() when the service is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->snapshot:Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    iget-object v2, v2, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->state:Lcom/google/common/util/concurrent/Service$State;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 356
    .local v0, "failure":Ljava/lang/IllegalStateException;
    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/AbstractService;->notifyFailed(Ljava/lang/Throwable;)V

    .line 357
    throw v0
    :try_end_2d
    .catchall {:try_start_5 .. :try_end_2d} :catchall_2d

    .line 370
    .end local v0    # "failure":Ljava/lang/IllegalStateException;
    :catchall_2d
    move-exception v1

    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v2}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 371
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractService;->executeListeners()V

    throw v1

    .line 360
    :cond_37
    :try_start_37
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->snapshot:Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    iget-boolean v1, v1, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->shutdownWhenStartupFinishes:Z

    if-eqz v1, :cond_52

    .line 361
    new-instance v1, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    sget-object v2, Lcom/google/common/util/concurrent/Service$State;->STOPPING:Lcom/google/common/util/concurrent/Service$State;

    invoke-direct {v1, v2}, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;-><init>(Lcom/google/common/util/concurrent/Service$State;)V

    iput-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->snapshot:Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    .line 364
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractService;->doStop()V
    :try_end_49
    .catchall {:try_start_37 .. :try_end_49} :catchall_2d

    .line 370
    :goto_49
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 371
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractService;->executeListeners()V

    .line 373
    return-void

    .line 366
    :cond_52
    :try_start_52
    new-instance v1, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    sget-object v2, Lcom/google/common/util/concurrent/Service$State;->RUNNING:Lcom/google/common/util/concurrent/Service$State;

    invoke-direct {v1, v2}, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;-><init>(Lcom/google/common/util/concurrent/Service$State;)V

    iput-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->snapshot:Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    .line 367
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractService;->running()V
    :try_end_5e
    .catchall {:try_start_52 .. :try_end_5e} :catchall_2d

    goto :goto_49
.end method

.method protected final notifyStopped()V
    .registers 5

    .prologue
    .line 383
    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v2}, Lcom/google/common/util/concurrent/Monitor;->enter()V

    .line 387
    :try_start_5
    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->snapshot:Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    iget-object v1, v2, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->state:Lcom/google/common/util/concurrent/Service$State;

    .line 388
    .local v1, "previous":Lcom/google/common/util/concurrent/Service$State;
    sget-object v2, Lcom/google/common/util/concurrent/Service$State;->STOPPING:Lcom/google/common/util/concurrent/Service$State;

    if-eq v1, v2, :cond_37

    sget-object v2, Lcom/google/common/util/concurrent/Service$State;->RUNNING:Lcom/google/common/util/concurrent/Service$State;

    if-eq v1, v2, :cond_37

    .line 389
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot notifyStopped() when the service is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 391
    .local v0, "failure":Ljava/lang/IllegalStateException;
    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/AbstractService;->notifyFailed(Ljava/lang/Throwable;)V

    .line 392
    throw v0
    :try_end_2d
    .catchall {:try_start_5 .. :try_end_2d} :catchall_2d

    .line 397
    .end local v0    # "failure":Ljava/lang/IllegalStateException;
    .end local v1    # "previous":Lcom/google/common/util/concurrent/Service$State;
    :catchall_2d
    move-exception v2

    iget-object v3, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v3}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 398
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractService;->executeListeners()V

    throw v2

    .line 394
    .restart local v1    # "previous":Lcom/google/common/util/concurrent/Service$State;
    :cond_37
    :try_start_37
    new-instance v2, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    sget-object v3, Lcom/google/common/util/concurrent/Service$State;->TERMINATED:Lcom/google/common/util/concurrent/Service$State;

    invoke-direct {v2, v3}, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;-><init>(Lcom/google/common/util/concurrent/Service$State;)V

    iput-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->snapshot:Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    .line 395
    invoke-direct {p0, v1}, Lcom/google/common/util/concurrent/AbstractService;->terminated(Lcom/google/common/util/concurrent/Service$State;)V
    :try_end_43
    .catchall {:try_start_37 .. :try_end_43} :catchall_2d

    .line 397
    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v2}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 398
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractService;->executeListeners()V

    .line 400
    return-void
.end method

.method public final start()Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 4
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
    .line 202
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->isStartable:Lcom/google/common/util/concurrent/Monitor$Guard;

    invoke-virtual {v1, v2}, Lcom/google/common/util/concurrent/Monitor;->enterIf(Lcom/google/common/util/concurrent/Monitor$Guard;)Z

    move-result v1

    if-eqz v1, :cond_21

    .line 204
    :try_start_a
    new-instance v1, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    sget-object v2, Lcom/google/common/util/concurrent/Service$State;->STARTING:Lcom/google/common/util/concurrent/Service$State;

    invoke-direct {v1, v2}, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;-><init>(Lcom/google/common/util/concurrent/Service$State;)V

    iput-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->snapshot:Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    .line 205
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractService;->starting()V

    .line 206
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractService;->doStart()V
    :try_end_19
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_19} :catch_24
    .catchall {:try_start_a .. :try_end_19} :catchall_31

    .line 210
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 211
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractService;->executeListeners()V

    .line 214
    :cond_21
    :goto_21
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->startup:Lcom/google/common/util/concurrent/AbstractService$Transition;

    return-object v1

    .line 207
    :catch_24
    move-exception v0

    .line 208
    .local v0, "startupFailure":Ljava/lang/Throwable;
    :try_start_25
    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/AbstractService;->notifyFailed(Ljava/lang/Throwable;)V
    :try_end_28
    .catchall {:try_start_25 .. :try_end_28} :catchall_31

    .line 210
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 211
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractService;->executeListeners()V

    goto :goto_21

    .line 210
    .end local v0    # "startupFailure":Ljava/lang/Throwable;
    :catchall_31
    move-exception v1

    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v2}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 211
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractService;->executeListeners()V

    throw v1
.end method

.method public startAndWait()Lcom/google/common/util/concurrent/Service$State;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 265
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractService;->start()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/util/concurrent/Futures;->getUnchecked(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/util/concurrent/Service$State;

    return-object v0
.end method

.method public final startAsync()Lcom/google/common/util/concurrent/Service;
    .registers 5

    .prologue
    .line 181
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->isStartable:Lcom/google/common/util/concurrent/Monitor$Guard;

    invoke-virtual {v1, v2}, Lcom/google/common/util/concurrent/Monitor;->enterIf(Lcom/google/common/util/concurrent/Monitor$Guard;)Z

    move-result v1

    if-eqz v1, :cond_39

    .line 183
    :try_start_a
    new-instance v1, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    sget-object v2, Lcom/google/common/util/concurrent/Service$State;->STARTING:Lcom/google/common/util/concurrent/Service$State;

    invoke-direct {v1, v2}, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;-><init>(Lcom/google/common/util/concurrent/Service$State;)V

    iput-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->snapshot:Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    .line 184
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractService;->starting()V

    .line 185
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractService;->doStart()V
    :try_end_19
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_19} :catch_22
    .catchall {:try_start_a .. :try_end_19} :catchall_2f

    .line 190
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 191
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractService;->executeListeners()V

    .line 196
    :goto_21
    return-object p0

    .line 187
    :catch_22
    move-exception v0

    .line 188
    .local v0, "startupFailure":Ljava/lang/Throwable;
    :try_start_23
    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/AbstractService;->notifyFailed(Ljava/lang/Throwable;)V
    :try_end_26
    .catchall {:try_start_23 .. :try_end_26} :catchall_2f

    .line 190
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 191
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractService;->executeListeners()V

    goto :goto_21

    .line 190
    .end local v0    # "startupFailure":Ljava/lang/Throwable;
    :catchall_2f
    move-exception v1

    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v2}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 191
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractService;->executeListeners()V

    throw v1

    .line 194
    :cond_39
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Service "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " has already been started"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final state()Lcom/google/common/util/concurrent/Service$State;
    .registers 2

    .prologue
    .line 442
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractService;->snapshot:Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->externalState()Lcom/google/common/util/concurrent/Service$State;

    move-result-object v0

    return-object v0
.end method

.method public final stop()Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 7
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
    .line 225
    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    iget-object v3, p0, Lcom/google/common/util/concurrent/AbstractService;->isStoppable:Lcom/google/common/util/concurrent/Monitor$Guard;

    invoke-virtual {v2, v3}, Lcom/google/common/util/concurrent/Monitor;->enterIf(Lcom/google/common/util/concurrent/Monitor$Guard;)Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 227
    :try_start_a
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractService;->state()Lcom/google/common/util/concurrent/Service$State;

    move-result-object v0

    .line 228
    .local v0, "previous":Lcom/google/common/util/concurrent/Service$State;
    sget-object v2, Lcom/google/common/util/concurrent/AbstractService$11;->$SwitchMap$com$google$common$util$concurrent$Service$State:[I

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Service$State;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_9e

    .line 248
    new-instance v2, Ljava/lang/AssertionError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected state: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
    :try_end_32
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_32} :catch_32
    .catchall {:try_start_a .. :try_end_32} :catchall_69

    .line 252
    .end local v0    # "previous":Lcom/google/common/util/concurrent/Service$State;
    :catch_32
    move-exception v1

    .line 253
    .local v1, "shutdownFailure":Ljava/lang/Throwable;
    :try_start_33
    invoke-virtual {p0, v1}, Lcom/google/common/util/concurrent/AbstractService;->notifyFailed(Ljava/lang/Throwable;)V
    :try_end_36
    .catchall {:try_start_33 .. :try_end_36} :catchall_69

    .line 255
    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v2}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 256
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractService;->executeListeners()V

    .line 259
    .end local v1    # "shutdownFailure":Ljava/lang/Throwable;
    :cond_3e
    :goto_3e
    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->shutdown:Lcom/google/common/util/concurrent/AbstractService$Transition;

    return-object v2

    .line 230
    .restart local v0    # "previous":Lcom/google/common/util/concurrent/Service$State;
    :pswitch_41
    :try_start_41
    new-instance v2, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    sget-object v3, Lcom/google/common/util/concurrent/Service$State;->TERMINATED:Lcom/google/common/util/concurrent/Service$State;

    invoke-direct {v2, v3}, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;-><init>(Lcom/google/common/util/concurrent/Service$State;)V

    iput-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->snapshot:Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    .line 231
    sget-object v2, Lcom/google/common/util/concurrent/Service$State;->NEW:Lcom/google/common/util/concurrent/Service$State;

    invoke-direct {p0, v2}, Lcom/google/common/util/concurrent/AbstractService;->terminated(Lcom/google/common/util/concurrent/Service$State;)V
    :try_end_4f
    .catch Ljava/lang/Throwable; {:try_start_41 .. :try_end_4f} :catch_32
    .catchall {:try_start_41 .. :try_end_4f} :catchall_69

    .line 255
    :goto_4f
    iget-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v2}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 256
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractService;->executeListeners()V

    goto :goto_3e

    .line 234
    :pswitch_58
    :try_start_58
    new-instance v2, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    sget-object v3, Lcom/google/common/util/concurrent/Service$State;->STARTING:Lcom/google/common/util/concurrent/Service$State;

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-direct {v2, v3, v4, v5}, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;-><init>(Lcom/google/common/util/concurrent/Service$State;ZLjava/lang/Throwable;)V

    iput-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->snapshot:Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    .line 235
    sget-object v2, Lcom/google/common/util/concurrent/Service$State;->STARTING:Lcom/google/common/util/concurrent/Service$State;

    invoke-direct {p0, v2}, Lcom/google/common/util/concurrent/AbstractService;->stopping(Lcom/google/common/util/concurrent/Service$State;)V
    :try_end_68
    .catch Ljava/lang/Throwable; {:try_start_58 .. :try_end_68} :catch_32
    .catchall {:try_start_58 .. :try_end_68} :catchall_69

    goto :goto_4f

    .line 255
    .end local v0    # "previous":Lcom/google/common/util/concurrent/Service$State;
    :catchall_69
    move-exception v2

    iget-object v3, p0, Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v3}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 256
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractService;->executeListeners()V

    throw v2

    .line 238
    .restart local v0    # "previous":Lcom/google/common/util/concurrent/Service$State;
    :pswitch_73
    :try_start_73
    new-instance v2, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    sget-object v3, Lcom/google/common/util/concurrent/Service$State;->STOPPING:Lcom/google/common/util/concurrent/Service$State;

    invoke-direct {v2, v3}, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;-><init>(Lcom/google/common/util/concurrent/Service$State;)V

    iput-object v2, p0, Lcom/google/common/util/concurrent/AbstractService;->snapshot:Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;

    .line 239
    sget-object v2, Lcom/google/common/util/concurrent/Service$State;->RUNNING:Lcom/google/common/util/concurrent/Service$State;

    invoke-direct {p0, v2}, Lcom/google/common/util/concurrent/AbstractService;->stopping(Lcom/google/common/util/concurrent/Service$State;)V

    .line 240
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractService;->doStop()V

    goto :goto_4f

    .line 246
    :pswitch_85
    new-instance v2, Ljava/lang/AssertionError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isStoppable is incorrectly implemented, saw: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
    :try_end_9e
    .catch Ljava/lang/Throwable; {:try_start_73 .. :try_end_9e} :catch_32
    .catchall {:try_start_73 .. :try_end_9e} :catchall_69

    .line 228
    :pswitch_data_9e
    .packed-switch 0x1
        :pswitch_58
        :pswitch_73
        :pswitch_85
        :pswitch_85
        :pswitch_85
        :pswitch_41
    .end packed-switch
.end method

.method public stopAndWait()Lcom/google/common/util/concurrent/Service$State;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 271
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractService;->stop()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/util/concurrent/Futures;->getUnchecked(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/util/concurrent/Service$State;

    return-object v0
.end method

.method public final stopAsync()Lcom/google/common/util/concurrent/Service;
    .registers 1

    .prologue
    .line 218
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractService;->stop()Lcom/google/common/util/concurrent/ListenableFuture;

    .line 219
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 472
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractService;->state()Lcom/google/common/util/concurrent/Service$State;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
