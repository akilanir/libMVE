.class final Lrx/schedulers/EventLoopsScheduler$FixedSchedulerPool;
.super Ljava/lang/Object;
.source "EventLoopsScheduler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/schedulers/EventLoopsScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FixedSchedulerPool"
.end annotation


# instance fields
.field final cores:I

.field final eventLoops:[Lrx/schedulers/EventLoopsScheduler$PoolWorker;

.field n:J


# direct methods
.method constructor <init>()V
    .registers 5

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    sget v1, Lrx/schedulers/EventLoopsScheduler;->MAX_THREADS:I

    iput v1, p0, Lrx/schedulers/EventLoopsScheduler$FixedSchedulerPool;->cores:I

    .line 61
    iget v1, p0, Lrx/schedulers/EventLoopsScheduler$FixedSchedulerPool;->cores:I

    new-array v1, v1, [Lrx/schedulers/EventLoopsScheduler$PoolWorker;

    iput-object v1, p0, Lrx/schedulers/EventLoopsScheduler$FixedSchedulerPool;->eventLoops:[Lrx/schedulers/EventLoopsScheduler$PoolWorker;

    .line 62
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    iget v1, p0, Lrx/schedulers/EventLoopsScheduler$FixedSchedulerPool;->cores:I

    if-ge v0, v1, :cond_22

    .line 63
    iget-object v1, p0, Lrx/schedulers/EventLoopsScheduler$FixedSchedulerPool;->eventLoops:[Lrx/schedulers/EventLoopsScheduler$PoolWorker;

    new-instance v2, Lrx/schedulers/EventLoopsScheduler$PoolWorker;

    # getter for: Lrx/schedulers/EventLoopsScheduler;->THREAD_FACTORY:Lrx/internal/util/RxThreadFactory;
    invoke-static {}, Lrx/schedulers/EventLoopsScheduler;->access$000()Lrx/internal/util/RxThreadFactory;

    move-result-object v3

    invoke-direct {v2, v3}, Lrx/schedulers/EventLoopsScheduler$PoolWorker;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    aput-object v2, v1, v0

    .line 62
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 65
    :cond_22
    return-void
.end method


# virtual methods
.method public getEventLoop()Lrx/schedulers/EventLoopsScheduler$PoolWorker;
    .registers 6

    .prologue
    .line 69
    iget-object v0, p0, Lrx/schedulers/EventLoopsScheduler$FixedSchedulerPool;->eventLoops:[Lrx/schedulers/EventLoopsScheduler$PoolWorker;

    iget-wide v1, p0, Lrx/schedulers/EventLoopsScheduler$FixedSchedulerPool;->n:J

    const-wide/16 v3, 0x1

    add-long/2addr v3, v1

    iput-wide v3, p0, Lrx/schedulers/EventLoopsScheduler$FixedSchedulerPool;->n:J

    iget v3, p0, Lrx/schedulers/EventLoopsScheduler$FixedSchedulerPool;->cores:I

    int-to-long v3, v3

    rem-long/2addr v1, v3

    long-to-int v1, v1

    aget-object v0, v0, v1

    return-object v0
.end method
