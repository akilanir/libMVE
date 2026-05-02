.class public Lcom/octo/android/robospice/priority/PausableThreadPoolExecutor;
.super Ljava/util/concurrent/ThreadPoolExecutor;
.source "PausableThreadPoolExecutor.java"


# direct methods
.method public constructor <init>(I)V
    .registers 10
    .param p1, "poolSize"    # I

    .prologue
    .line 50
    const-wide/16 v3, 0x0

    sget-object v5, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;

    invoke-direct {v6}, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;-><init>()V

    new-instance v7, Lcom/octo/android/robospice/priority/CustomizablePriorityThreadFactory;

    invoke-direct {v7}, Lcom/octo/android/robospice/priority/CustomizablePriorityThreadFactory;-><init>()V

    move-object v0, p0

    move v1, p1

    move v2, p1

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 51
    return-void
.end method

.method public constructor <init>(II)V
    .registers 11
    .param p1, "poolSize"    # I
    .param p2, "threadPriority"    # I

    .prologue
    .line 40
    const-wide/16 v3, 0x0

    sget-object v5, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;

    invoke-direct {v6}, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;-><init>()V

    new-instance v7, Lcom/octo/android/robospice/priority/CustomizablePriorityThreadFactory;

    invoke-direct {v7, p2}, Lcom/octo/android/robospice/priority/CustomizablePriorityThreadFactory;-><init>(I)V

    move-object v0, p0

    move v1, p1

    move v2, p1

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 41
    return-void
.end method

.method public constructor <init>(III)V
    .registers 12
    .param p1, "corePoolSize"    # I
    .param p2, "maxPoolSize"    # I
    .param p3, "threadPriority"    # I

    .prologue
    .line 27
    const-wide/16 v3, 0x0

    sget-object v5, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;

    invoke-direct {v6}, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;-><init>()V

    new-instance v7, Lcom/octo/android/robospice/priority/CustomizablePriorityThreadFactory;

    invoke-direct {v7, p3}, Lcom/octo/android/robospice/priority/CustomizablePriorityThreadFactory;-><init>(I)V

    move-object v0, p0

    move v1, p1

    move v2, p2

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 28
    return-void
.end method


# virtual methods
.method public pause()V
    .registers 2

    .prologue
    .line 57
    invoke-virtual {p0}, Lcom/octo/android/robospice/priority/PausableThreadPoolExecutor;->getQueue()Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    check-cast v0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;

    invoke-virtual {v0}, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->pause()V

    .line 58
    return-void
.end method

.method public resume()V
    .registers 2

    .prologue
    .line 61
    invoke-virtual {p0}, Lcom/octo/android/robospice/priority/PausableThreadPoolExecutor;->getQueue()Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    check-cast v0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;

    invoke-virtual {v0}, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->resume()V

    .line 62
    return-void
.end method
