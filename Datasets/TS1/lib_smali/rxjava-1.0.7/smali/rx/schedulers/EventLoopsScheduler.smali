.class Lrx/schedulers/EventLoopsScheduler;
.super Lrx/Scheduler;
.source "EventLoopsScheduler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/schedulers/EventLoopsScheduler$PoolWorker;,
        Lrx/schedulers/EventLoopsScheduler$EventLoopWorker;,
        Lrx/schedulers/EventLoopsScheduler$FixedSchedulerPool;
    }
.end annotation


# static fields
.field static final KEY_MAX_THREADS:Ljava/lang/String; = "rx.scheduler.max-computation-threads"

.field static final MAX_THREADS:I

.field private static final THREAD_FACTORY:Lrx/internal/util/RxThreadFactory;

.field private static final THREAD_NAME_PREFIX:Ljava/lang/String; = "RxComputationThreadPool-"


# instance fields
.field final pool:Lrx/schedulers/EventLoopsScheduler$FixedSchedulerPool;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    .line 33
    new-instance v3, Lrx/internal/util/RxThreadFactory;

    const-string v4, "RxComputationThreadPool-"

    invoke-direct {v3, v4}, Lrx/internal/util/RxThreadFactory;-><init>(Ljava/lang/String;)V

    sput-object v3, Lrx/schedulers/EventLoopsScheduler;->THREAD_FACTORY:Lrx/internal/util/RxThreadFactory;

    .line 42
    const-string v3, "rx.scheduler.max-computation-threads"

    const/4 v4, 0x0

    invoke-static {v3, v4}, Ljava/lang/Integer;->getInteger(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 43
    .local v1, "maxThreads":I
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v2

    .line 45
    .local v2, "ncpu":I
    if-lez v1, :cond_20

    if-le v1, v2, :cond_24

    .line 46
    :cond_20
    move v0, v2

    .line 50
    .local v0, "max":I
    :goto_21
    sput v0, Lrx/schedulers/EventLoopsScheduler;->MAX_THREADS:I

    .line 51
    return-void

    .line 48
    .end local v0    # "max":I
    :cond_24
    move v0, v1

    .restart local v0    # "max":I
    goto :goto_21
.end method

.method constructor <init>()V
    .registers 2

    .prologue
    .line 79
    invoke-direct {p0}, Lrx/Scheduler;-><init>()V

    .line 80
    new-instance v0, Lrx/schedulers/EventLoopsScheduler$FixedSchedulerPool;

    invoke-direct {v0}, Lrx/schedulers/EventLoopsScheduler$FixedSchedulerPool;-><init>()V

    iput-object v0, p0, Lrx/schedulers/EventLoopsScheduler;->pool:Lrx/schedulers/EventLoopsScheduler$FixedSchedulerPool;

    .line 81
    return-void
.end method

.method static synthetic access$000()Lrx/internal/util/RxThreadFactory;
    .registers 1

    .prologue
    .line 30
    sget-object v0, Lrx/schedulers/EventLoopsScheduler;->THREAD_FACTORY:Lrx/internal/util/RxThreadFactory;

    return-object v0
.end method


# virtual methods
.method public createWorker()Lrx/Scheduler$Worker;
    .registers 3

    .prologue
    .line 85
    new-instance v0, Lrx/schedulers/EventLoopsScheduler$EventLoopWorker;

    iget-object v1, p0, Lrx/schedulers/EventLoopsScheduler;->pool:Lrx/schedulers/EventLoopsScheduler$FixedSchedulerPool;

    invoke-virtual {v1}, Lrx/schedulers/EventLoopsScheduler$FixedSchedulerPool;->getEventLoop()Lrx/schedulers/EventLoopsScheduler$PoolWorker;

    move-result-object v1

    invoke-direct {v0, v1}, Lrx/schedulers/EventLoopsScheduler$EventLoopWorker;-><init>(Lrx/schedulers/EventLoopsScheduler$PoolWorker;)V

    return-object v0
.end method
