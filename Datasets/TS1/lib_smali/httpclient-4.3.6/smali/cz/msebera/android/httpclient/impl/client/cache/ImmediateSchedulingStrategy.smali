.class public Lcz/msebera/android/httpclient/impl/client/cache/ImmediateSchedulingStrategy;
.super Ljava/lang/Object;
.source "ImmediateSchedulingStrategy.java"

# interfaces
.implements Lcz/msebera/android/httpclient/impl/client/cache/SchedulingStrategy;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/ThreadSafe;
.end annotation


# instance fields
.field private final executor:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;)V
    .registers 10
    .param p1, "cacheConfig"    # Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    .prologue
    .line 57
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 58
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;->getAsynchronousWorkersCore()I

    move-result v1

    .line 59
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;->getAsynchronousWorkersMax()I

    move-result v2

    .line 60
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;->getAsynchronousWorkerIdleLifetimeSecs()I

    move-result v3

    int-to-long v3, v3

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/ArrayBlockingQueue;

    .line 62
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;->getRevalidationQueueSize()I

    move-result v7

    invoke-direct {v6, v7}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    invoke-direct/range {v0 .. v6}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    .line 57
    invoke-direct {p0, v0}, Lcz/msebera/android/httpclient/impl/client/cache/ImmediateSchedulingStrategy;-><init>(Ljava/util/concurrent/ExecutorService;)V

    .line 64
    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/ExecutorService;)V
    .registers 2
    .param p1, "executor"    # Ljava/util/concurrent/ExecutorService;

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/cache/ImmediateSchedulingStrategy;->executor:Ljava/util/concurrent/ExecutorService;

    .line 68
    return-void
.end method


# virtual methods
.method awaitTermination(JLjava/util/concurrent/TimeUnit;)V
    .registers 5
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 86
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/ImmediateSchedulingStrategy;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, p1, p2, p3}, Ljava/util/concurrent/ExecutorService;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z

    .line 87
    return-void
.end method

.method public close()V
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/ImmediateSchedulingStrategy;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 80
    return-void
.end method

.method public schedule(Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;)V
    .registers 4
    .param p1, "revalidationRequest"    # Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;

    .prologue
    .line 71
    if-nez p1, :cond_a

    .line 72
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "AsynchronousValidationRequest may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :cond_a
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/ImmediateSchedulingStrategy;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 76
    return-void
.end method
