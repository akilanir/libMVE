.class final Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;
.super Ljava/lang/Object;
.source "ServiceManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/ServiceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ServiceManagerState"
.end annotation


# instance fields
.field final awaitHealthGuard:Lcom/google/common/util/concurrent/Monitor$Guard;

.field final listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;",
            ">;"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "monitor"
    .end annotation
.end field

.field final monitor:Lcom/google/common/util/concurrent/Monitor;

.field final numberOfServices:I

.field final queuedListeners:Lcom/google/common/util/concurrent/ExecutionQueue;
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "monitor"
    .end annotation
.end field

.field final stoppedGuard:Lcom/google/common/util/concurrent/Monitor$Guard;

.field unstartedServices:I
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "monitor"
    .end annotation
.end field

.field unstoppedServices:I
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "monitor"
    .end annotation
.end field


# direct methods
.method constructor <init>(I)V
    .registers 4
    .param p1, "numberOfServices"    # I

    .prologue
    .line 453
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 413
    new-instance v0, Lcom/google/common/util/concurrent/Monitor;

    invoke-direct {v0}, Lcom/google/common/util/concurrent/Monitor;-><init>()V

    iput-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    .line 425
    new-instance v0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$1;

    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-direct {v0, p0, v1}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$1;-><init>(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;Lcom/google/common/util/concurrent/Monitor;)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->awaitHealthGuard:Lcom/google/common/util/concurrent/Monitor$Guard;

    .line 434
    new-instance v0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$2;

    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-direct {v0, p0, v1}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$2;-><init>(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;Lcom/google/common/util/concurrent/Monitor;)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->stoppedGuard:Lcom/google/common/util/concurrent/Monitor$Guard;

    .line 440
    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->listeners:Ljava/util/List;

    .line 450
    new-instance v0, Lcom/google/common/util/concurrent/ExecutionQueue;

    invoke-direct {v0}, Lcom/google/common/util/concurrent/ExecutionQueue;-><init>()V

    iput-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->queuedListeners:Lcom/google/common/util/concurrent/ExecutionQueue;

    .line 454
    iput p1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->numberOfServices:I

    .line 455
    iput p1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->unstoppedServices:I

    .line 456
    iput p1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->unstartedServices:I

    .line 457
    return-void
.end method

.method static synthetic access$200(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;)V
    .registers 1
    .param p0, "x0"    # Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    .prologue
    .line 412
    invoke-direct {p0}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->executeListeners()V

    return-void
.end method

.method static synthetic access$400(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;Lcom/google/common/util/concurrent/Service;)V
    .registers 2
    .param p0, "x0"    # Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;
    .param p1, "x1"    # Lcom/google/common/util/concurrent/Service;

    .prologue
    .line 412
    invoke-direct {p0, p1}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->serviceTerminated(Lcom/google/common/util/concurrent/Service;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;Lcom/google/common/util/concurrent/Service;)V
    .registers 2
    .param p0, "x0"    # Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;
    .param p1, "x1"    # Lcom/google/common/util/concurrent/Service;

    .prologue
    .line 412
    invoke-direct {p0, p1}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->serviceFailed(Lcom/google/common/util/concurrent/Service;)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;Lcom/google/common/util/concurrent/Service;Z)V
    .registers 3
    .param p0, "x0"    # Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;
    .param p1, "x1"    # Lcom/google/common/util/concurrent/Service;
    .param p2, "x2"    # Z

    .prologue
    .line 412
    invoke-direct {p0, p1, p2}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->serviceFinishedStarting(Lcom/google/common/util/concurrent/Service;Z)V

    return-void
.end method

.method private executeListeners()V
    .registers 3

    .prologue
    .line 580
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Monitor;->isOccupiedByCurrentThread()Z

    move-result v0

    if-nez v0, :cond_14

    const/4 v0, 0x1

    :goto_9
    const-string v1, "It is incorrect to execute listeners with the monitor held."

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 582
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->queuedListeners:Lcom/google/common/util/concurrent/ExecutionQueue;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/ExecutionQueue;->execute()V

    .line 583
    return-void

    .line 580
    :cond_14
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private serviceFailed(Lcom/google/common/util/concurrent/Service;)V
    .registers 7
    .param p1, "service"    # Lcom/google/common/util/concurrent/Service;
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "monitor"
    .end annotation

    .prologue
    .line 542
    iget-object v2, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->listeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;

    .line 543
    .local v1, "pair":Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;
    iget-object v2, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->queuedListeners:Lcom/google/common/util/concurrent/ExecutionQueue;

    new-instance v3, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$4;

    invoke-direct {v3, p0, v1, p1}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$4;-><init>(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;Lcom/google/common/util/concurrent/Service;)V

    iget-object v4, v1, Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;->executor:Ljava/util/concurrent/Executor;

    invoke-virtual {v2, v3, v4}, Lcom/google/common/util/concurrent/ExecutionQueue;->add(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    goto :goto_6

    .line 549
    .end local v1    # "pair":Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;
    :cond_1f
    invoke-direct {p0, p1}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->serviceStopped(Lcom/google/common/util/concurrent/Service;)V

    .line 550
    return-void
.end method

.method private serviceFinishedStarting(Lcom/google/common/util/concurrent/Service;Z)V
    .registers 9
    .param p1, "service"    # Lcom/google/common/util/concurrent/Service;
    .param p2, "currentlyHealthy"    # Z
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "monitor"
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 507
    iget v2, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->unstartedServices:I

    if-lez v2, :cond_41

    move v2, v3

    :goto_7
    const-string v5, "All services should have already finished starting but %s just finished."

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v4

    invoke-static {v2, v5, v3}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 509
    iget v2, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->unstartedServices:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->unstartedServices:I

    .line 510
    if-eqz p2, :cond_43

    iget v2, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->unstartedServices:I

    if-nez v2, :cond_43

    iget v2, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->unstoppedServices:I

    iget v3, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->numberOfServices:I

    if-ne v2, v3, :cond_43

    .line 519
    iget-object v2, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->listeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_28
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_43

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;

    .line 520
    .local v1, "pair":Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;
    iget-object v2, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->queuedListeners:Lcom/google/common/util/concurrent/ExecutionQueue;

    new-instance v3, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$3;

    invoke-direct {v3, p0, v1}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$3;-><init>(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;)V

    iget-object v4, v1, Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;->executor:Ljava/util/concurrent/Executor;

    invoke-virtual {v2, v3, v4}, Lcom/google/common/util/concurrent/ExecutionQueue;->add(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    goto :goto_28

    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "pair":Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;
    :cond_41
    move v2, v4

    .line 507
    goto :goto_7

    .line 527
    :cond_43
    return-void
.end method

.method private serviceStopped(Lcom/google/common/util/concurrent/Service;)V
    .registers 9
    .param p1, "service"    # Lcom/google/common/util/concurrent/Service;
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "monitor"
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 559
    iget v2, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->unstoppedServices:I

    if-lez v2, :cond_4d

    move v2, v3

    :goto_7
    const-string v5, "All services should have already stopped but %s just stopped."

    new-array v6, v3, [Ljava/lang/Object;

    aput-object p1, v6, v4

    invoke-static {v2, v5, v6}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 561
    iget v2, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->unstoppedServices:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->unstoppedServices:I

    .line 562
    iget v2, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->unstoppedServices:I

    if-nez v2, :cond_56

    .line 563
    iget v2, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->unstartedServices:I

    if-nez v2, :cond_4f

    move v2, v3

    :goto_1f
    const-string v5, "All services are stopped but %d services haven\'t finished starting"

    new-array v3, v3, [Ljava/lang/Object;

    iget v6, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->unstartedServices:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v3, v4

    invoke-static {v2, v5, v3}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 566
    iget-object v2, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->listeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_34
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_51

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;

    .line 567
    .local v1, "pair":Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;
    iget-object v2, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->queuedListeners:Lcom/google/common/util/concurrent/ExecutionQueue;

    new-instance v3, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$5;

    invoke-direct {v3, p0, v1}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$5;-><init>(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;)V

    iget-object v4, v1, Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;->executor:Ljava/util/concurrent/Executor;

    invoke-virtual {v2, v3, v4}, Lcom/google/common/util/concurrent/ExecutionQueue;->add(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    goto :goto_34

    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "pair":Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;
    :cond_4d
    move v2, v4

    .line 559
    goto :goto_7

    :cond_4f
    move v2, v4

    .line 563
    goto :goto_1f

    .line 574
    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_51
    iget-object v2, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->listeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 576
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_56
    return-void
.end method

.method private serviceTerminated(Lcom/google/common/util/concurrent/Service;)V
    .registers 2
    .param p1, "service"    # Lcom/google/common/util/concurrent/Service;
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "monitor"
    .end annotation

    .prologue
    .line 534
    invoke-direct {p0, p1}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->serviceStopped(Lcom/google/common/util/concurrent/Service;)V

    .line 535
    return-void
.end method


# virtual methods
.method addListener(Lcom/google/common/util/concurrent/ServiceManager$Listener;Ljava/util/concurrent/Executor;)V
    .registers 5
    .param p1, "listener"    # Lcom/google/common/util/concurrent/ServiceManager$Listener;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 460
    const-string v0, "listener"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 461
    const-string v0, "executor"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 462
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Monitor;->enter()V

    .line 465
    :try_start_f
    iget v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->unstartedServices:I

    if-gtz v0, :cond_17

    iget v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->unstoppedServices:I

    if-lez v0, :cond_21

    .line 466
    :cond_17
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->listeners:Ljava/util/List;

    new-instance v1, Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;

    invoke-direct {v1, p1, p2}, Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;-><init>(Lcom/google/common/util/concurrent/ServiceManager$Listener;Ljava/util/concurrent/Executor;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_21
    .catchall {:try_start_f .. :try_end_21} :catchall_27

    .line 469
    :cond_21
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 471
    return-void

    .line 469
    :catchall_27
    move-exception v0

    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    throw v0
.end method

.method awaitHealthy()V
    .registers 3

    .prologue
    .line 474
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->awaitHealthGuard:Lcom/google/common/util/concurrent/Monitor$Guard;

    invoke-virtual {v0, v1}, Lcom/google/common/util/concurrent/Monitor;->enterWhenUninterruptibly(Lcom/google/common/util/concurrent/Monitor$Guard;)V

    .line 475
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 476
    return-void
.end method

.method awaitHealthy(JLjava/util/concurrent/TimeUnit;)Z
    .registers 6
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 479
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->awaitHealthGuard:Lcom/google/common/util/concurrent/Monitor$Guard;

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/google/common/util/concurrent/Monitor;->enterWhenUninterruptibly(Lcom/google/common/util/concurrent/Monitor$Guard;JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 480
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 481
    const/4 v0, 0x1

    .line 483
    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method awaitStopped()V
    .registers 3

    .prologue
    .line 487
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->stoppedGuard:Lcom/google/common/util/concurrent/Monitor$Guard;

    invoke-virtual {v0, v1}, Lcom/google/common/util/concurrent/Monitor;->enterWhenUninterruptibly(Lcom/google/common/util/concurrent/Monitor$Guard;)V

    .line 488
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 489
    return-void
.end method

.method awaitStopped(JLjava/util/concurrent/TimeUnit;)Z
    .registers 6
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 492
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    iget-object v1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->stoppedGuard:Lcom/google/common/util/concurrent/Monitor$Guard;

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/google/common/util/concurrent/Monitor;->enterWhenUninterruptibly(Lcom/google/common/util/concurrent/Monitor$Guard;JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 493
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->monitor:Lcom/google/common/util/concurrent/Monitor;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 494
    const/4 v0, 0x1

    .line 496
    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method
