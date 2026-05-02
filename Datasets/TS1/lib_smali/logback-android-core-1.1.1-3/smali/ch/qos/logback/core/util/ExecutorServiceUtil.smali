.class public Lch/qos/logback/core/util/ExecutorServiceUtil;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static newExecutorService()Ljava/util/concurrent/ExecutorService;
    .registers 7

    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget v1, Lch/qos/logback/core/CoreConstants;->CORE_POOL_SIZE:I

    const/16 v2, 0x20

    const-wide/16 v3, 0x0

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/SynchronousQueue;

    invoke-direct {v6}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    invoke-direct/range {v0 .. v6}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    return-object v0
.end method

.method public static shutdown(Ljava/util/concurrent/ExecutorService;)V
    .registers 1

    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    return-void
.end method
