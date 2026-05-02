.class public final Lcom/octo/android/robospice/priority/PriorityThreadPoolExecutor;
.super Lcom/octo/android/robospice/priority/PausableThreadPoolExecutor;
.source "PriorityThreadPoolExecutor.java"


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "poolSize"    # I

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/priority/PausableThreadPoolExecutor;-><init>(I)V

    .line 32
    return-void
.end method

.method public constructor <init>(II)V
    .registers 3
    .param p1, "poolSize"    # I
    .param p2, "threadPriority"    # I

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Lcom/octo/android/robospice/priority/PausableThreadPoolExecutor;-><init>(II)V

    .line 28
    return-void
.end method

.method public constructor <init>(III)V
    .registers 4
    .param p1, "corePoolSize"    # I
    .param p2, "maxPoolSize"    # I
    .param p3, "threadPriority"    # I

    .prologue
    .line 23
    invoke-direct {p0, p1, p2, p3}, Lcom/octo/android/robospice/priority/PausableThreadPoolExecutor;-><init>(III)V

    .line 24
    return-void
.end method

.method public static getPriorityExecutor(I)Lcom/octo/android/robospice/priority/PriorityThreadPoolExecutor;
    .registers 2
    .param p0, "nThreads"    # I

    .prologue
    .line 48
    new-instance v0, Lcom/octo/android/robospice/priority/PriorityThreadPoolExecutor;

    invoke-direct {v0, p0}, Lcom/octo/android/robospice/priority/PriorityThreadPoolExecutor;-><init>(I)V

    return-object v0
.end method

.method public static getPriorityExecutor(II)Lcom/octo/android/robospice/priority/PriorityThreadPoolExecutor;
    .registers 3
    .param p0, "nThreads"    # I
    .param p1, "threadPriority"    # I

    .prologue
    .line 44
    new-instance v0, Lcom/octo/android/robospice/priority/PriorityThreadPoolExecutor;

    invoke-direct {v0, p0, p1}, Lcom/octo/android/robospice/priority/PriorityThreadPoolExecutor;-><init>(II)V

    return-object v0
.end method

.method public static getPriorityExecutor(III)Lcom/octo/android/robospice/priority/PriorityThreadPoolExecutor;
    .registers 4
    .param p0, "nCoreThreads"    # I
    .param p1, "maxPoolSize"    # I
    .param p2, "threadPriority"    # I

    .prologue
    .line 39
    new-instance v0, Lcom/octo/android/robospice/priority/PriorityThreadPoolExecutor;

    invoke-direct {v0, p0, p1, p2}, Lcom/octo/android/robospice/priority/PriorityThreadPoolExecutor;-><init>(III)V

    return-object v0
.end method


# virtual methods
.method protected newTaskFor(Ljava/lang/Runnable;Ljava/lang/Object;)Ljava/util/concurrent/RunnableFuture;
    .registers 5
    .param p1, "runnable"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Runnable;",
            "TT;)",
            "Ljava/util/concurrent/RunnableFuture",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 61
    .local p2, "value":Ljava/lang/Object;, "TT;"
    if-nez p1, :cond_4

    .line 62
    const/4 v0, 0x0

    .line 64
    :goto_3
    return-object v0

    :cond_4
    new-instance v1, Lcom/octo/android/robospice/priority/PriorityFuture;

    move-object v0, p1

    check-cast v0, Lcom/octo/android/robospice/priority/PriorityRunnable;

    invoke-interface {v0}, Lcom/octo/android/robospice/priority/PriorityRunnable;->getPriority()I

    move-result v0

    invoke-direct {v1, p1, v0, p2}, Lcom/octo/android/robospice/priority/PriorityFuture;-><init>(Ljava/lang/Runnable;ILjava/lang/Object;)V

    move-object v0, v1

    goto :goto_3
.end method

.method public submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;
    .registers 4
    .param p1, "task"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            ")",
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 70
    if-nez p1, :cond_8

    .line 71
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-direct {v1}, Ljava/lang/NullPointerException;-><init>()V

    throw v1

    .line 73
    :cond_8
    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1}, Lcom/octo/android/robospice/priority/PriorityThreadPoolExecutor;->newTaskFor(Ljava/lang/Runnable;Ljava/lang/Object;)Ljava/util/concurrent/RunnableFuture;

    move-result-object v0

    .line 74
    .local v0, "ftask":Ljava/util/concurrent/RunnableFuture;, "Ljava/util/concurrent/RunnableFuture<Ljava/lang/Object;>;"
    invoke-virtual {p0, v0}, Lcom/octo/android/robospice/priority/PriorityThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 75
    return-object v0
.end method
