.class final Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;
.super Lrx/Scheduler$Worker;
.source "ExecutorScheduler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/schedulers/ExecutorScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ExecutorSchedulerWorker"
.end annotation


# instance fields
.field final executor:Ljava/util/concurrent/Executor;

.field final queue:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lrx/schedulers/ExecutorScheduler$ExecutorAction;",
            ">;"
        }
    .end annotation
.end field

.field final tasks:Lrx/subscriptions/CompositeSubscription;

.field final wip:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;)V
    .registers 3
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 64
    invoke-direct {p0}, Lrx/Scheduler$Worker;-><init>()V

    .line 65
    iput-object p1, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->executor:Ljava/util/concurrent/Executor;

    .line 66
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 67
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 68
    new-instance v0, Lrx/subscriptions/CompositeSubscription;

    invoke-direct {v0}, Lrx/subscriptions/CompositeSubscription;-><init>()V

    iput-object v0, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->tasks:Lrx/subscriptions/CompositeSubscription;

    .line 69
    return-void
.end method


# virtual methods
.method public isUnsubscribed()Z
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->tasks:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v0}, Lrx/subscriptions/CompositeSubscription;->isUnsubscribed()Z

    move-result v0

    return v0
.end method

.method public run()V
    .registers 2

    .prologue
    .line 99
    :cond_0
    iget-object v0, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/schedulers/ExecutorScheduler$ExecutorAction;

    invoke-virtual {v0}, Lrx/schedulers/ExecutorScheduler$ExecutorAction;->run()V

    .line 100
    iget-object v0, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-gtz v0, :cond_0

    .line 101
    return-void
.end method

.method public schedule(Lrx/functions/Action0;)Lrx/Subscription;
    .registers 5
    .param p1, "action"    # Lrx/functions/Action0;

    .prologue
    .line 73
    invoke-virtual {p0}, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->isUnsubscribed()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 74
    invoke-static {}, Lrx/subscriptions/Subscriptions;->unsubscribed()Lrx/Subscription;

    move-result-object v0

    .line 93
    :cond_a
    :goto_a
    return-object v0

    .line 76
    :cond_b
    new-instance v0, Lrx/schedulers/ExecutorScheduler$ExecutorAction;

    iget-object v2, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->tasks:Lrx/subscriptions/CompositeSubscription;

    invoke-direct {v0, p1, v2}, Lrx/schedulers/ExecutorScheduler$ExecutorAction;-><init>(Lrx/functions/Action0;Lrx/subscriptions/CompositeSubscription;)V

    .line 77
    .local v0, "ea":Lrx/schedulers/ExecutorScheduler$ExecutorAction;
    iget-object v2, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->tasks:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v2, v0}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 78
    iget-object v2, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v2, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->offer(Ljava/lang/Object;)Z

    .line 79
    iget-object v2, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v2

    if-nez v2, :cond_a

    .line 81
    :try_start_24
    iget-object v2, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->executor:Ljava/util/concurrent/Executor;

    invoke-interface {v2, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_29
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_24 .. :try_end_29} :catch_2a

    goto :goto_a

    .line 82
    :catch_2a
    move-exception v1

    .line 84
    .local v1, "t":Ljava/util/concurrent/RejectedExecutionException;
    iget-object v2, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->tasks:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v2, v0}, Lrx/subscriptions/CompositeSubscription;->remove(Lrx/Subscription;)V

    .line 85
    iget-object v2, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 87
    invoke-static {}, Lrx/plugins/RxJavaPlugins;->getInstance()Lrx/plugins/RxJavaPlugins;

    move-result-object v2

    invoke-virtual {v2}, Lrx/plugins/RxJavaPlugins;->getErrorHandler()Lrx/plugins/RxJavaErrorHandler;

    move-result-object v2

    invoke-virtual {v2, v1}, Lrx/plugins/RxJavaErrorHandler;->handleError(Ljava/lang/Throwable;)V

    .line 89
    throw v1
.end method

.method public schedule(Lrx/functions/Action0;JLjava/util/concurrent/TimeUnit;)Lrx/Subscription;
    .registers 11
    .param p1, "action"    # Lrx/functions/Action0;
    .param p2, "delayTime"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 105
    const-wide/16 v4, 0x0

    cmp-long v4, p2, v4

    if-gtz v4, :cond_b

    .line 106
    invoke-virtual {p0, p1}, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->schedule(Lrx/functions/Action0;)Lrx/Subscription;

    move-result-object v1

    .line 139
    :goto_a
    return-object v1

    .line 108
    :cond_b
    invoke-virtual {p0}, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->isUnsubscribed()Z

    move-result v4

    if-eqz v4, :cond_16

    .line 109
    invoke-static {}, Lrx/subscriptions/Subscriptions;->unsubscribed()Lrx/Subscription;

    move-result-object v1

    goto :goto_a

    .line 112
    :cond_16
    iget-object v4, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->executor:Ljava/util/concurrent/Executor;

    instance-of v4, v4, Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v4, :cond_43

    .line 113
    iget-object v2, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->executor:Ljava/util/concurrent/Executor;

    check-cast v2, Ljava/util/concurrent/ScheduledExecutorService;

    .line 118
    .local v2, "service":Ljava/util/concurrent/ScheduledExecutorService;
    :goto_20
    new-instance v1, Lrx/subscriptions/MultipleAssignmentSubscription;

    invoke-direct {v1}, Lrx/subscriptions/MultipleAssignmentSubscription;-><init>()V

    .line 122
    .local v1, "mas":Lrx/subscriptions/MultipleAssignmentSubscription;
    :try_start_25
    new-instance v4, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker$1;

    invoke-direct {v4, p0, v1, p1}, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker$1;-><init>(Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;Lrx/subscriptions/MultipleAssignmentSubscription;Lrx/functions/Action0;)V

    invoke-interface {v2, v4, p2, p3, p4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    .line 132
    .local v0, "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    invoke-static {v0}, Lrx/subscriptions/Subscriptions;->from(Ljava/util/concurrent/Future;)Lrx/Subscription;

    move-result-object v4

    invoke-virtual {v1, v4}, Lrx/subscriptions/MultipleAssignmentSubscription;->set(Lrx/Subscription;)V
    :try_end_35
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_25 .. :try_end_35} :catch_36

    goto :goto_a

    .line 133
    .end local v0    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :catch_36
    move-exception v3

    .line 135
    .local v3, "t":Ljava/util/concurrent/RejectedExecutionException;
    invoke-static {}, Lrx/plugins/RxJavaPlugins;->getInstance()Lrx/plugins/RxJavaPlugins;

    move-result-object v4

    invoke-virtual {v4}, Lrx/plugins/RxJavaPlugins;->getErrorHandler()Lrx/plugins/RxJavaErrorHandler;

    move-result-object v4

    invoke-virtual {v4, v3}, Lrx/plugins/RxJavaErrorHandler;->handleError(Ljava/lang/Throwable;)V

    .line 136
    throw v3

    .line 115
    .end local v1    # "mas":Lrx/subscriptions/MultipleAssignmentSubscription;
    .end local v2    # "service":Ljava/util/concurrent/ScheduledExecutorService;
    .end local v3    # "t":Ljava/util/concurrent/RejectedExecutionException;
    :cond_43
    invoke-static {}, Lrx/schedulers/GenericScheduledExecutorService;->getInstance()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    .restart local v2    # "service":Ljava/util/concurrent/ScheduledExecutorService;
    goto :goto_20
.end method

.method public unsubscribe()V
    .registers 2

    .prologue
    .line 149
    iget-object v0, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->tasks:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v0}, Lrx/subscriptions/CompositeSubscription;->unsubscribe()V

    .line 150
    return-void
.end method
