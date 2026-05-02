.class final Lrx/internal/operators/TakeLastQueueProducer;
.super Ljava/lang/Object;
.source "TakeLastQueueProducer.java"

# interfaces
.implements Lrx/Producer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/Producer;"
    }
.end annotation


# static fields
.field private static final REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicLongFieldUpdater",
            "<",
            "Lrx/internal/operators/TakeLastQueueProducer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final deque:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private volatile emittingStarted:Z

.field private final notification:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite",
            "<TT;>;"
        }
    .end annotation
.end field

.field private volatile requested:J

.field private final subscriber:Lrx/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 40
    const-class v0, Lrx/internal/operators/TakeLastQueueProducer;

    const-string v1, "requested"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-result-object v0

    sput-object v0, Lrx/internal/operators/TakeLastQueueProducer;->REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    return-void
.end method

.method public constructor <init>(Lrx/internal/operators/NotificationLite;Ljava/util/Deque;Lrx/Subscriber;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/NotificationLite",
            "<TT;>;",
            "Ljava/util/Deque",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Lrx/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p0, "this":Lrx/internal/operators/TakeLastQueueProducer;, "Lrx/internal/operators/TakeLastQueueProducer<TT;>;"
    .local p1, "n":Lrx/internal/operators/NotificationLite;, "Lrx/internal/operators/NotificationLite<TT;>;"
    .local p2, "q":Ljava/util/Deque;, "Ljava/util/Deque<Ljava/lang/Object;>;"
    .local p3, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lrx/internal/operators/TakeLastQueueProducer;->emittingStarted:Z

    .line 38
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lrx/internal/operators/TakeLastQueueProducer;->requested:J

    .line 33
    iput-object p1, p0, Lrx/internal/operators/TakeLastQueueProducer;->notification:Lrx/internal/operators/NotificationLite;

    .line 34
    iput-object p2, p0, Lrx/internal/operators/TakeLastQueueProducer;->deque:Ljava/util/Deque;

    .line 35
    iput-object p3, p0, Lrx/internal/operators/TakeLastQueueProducer;->subscriber:Lrx/Subscriber;

    .line 36
    return-void
.end method


# virtual methods
.method emit(J)V
    .registers 18
    .param p1, "previousRequested"    # J

    .prologue
    .line 68
    .local p0, "this":Lrx/internal/operators/TakeLastQueueProducer;, "Lrx/internal/operators/TakeLastQueueProducer<TT;>;"
    iget-wide v0, p0, Lrx/internal/operators/TakeLastQueueProducer;->requested:J

    const-wide v13, 0x7fffffffffffffffL

    cmp-long v0, v0, v13

    if-nez v0, :cond_50

    .line 70
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-nez v0, :cond_2e

    .line 72
    :try_start_11
    iget-object v0, p0, Lrx/internal/operators/TakeLastQueueProducer;->deque:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_17
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_43

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    .line 73
    .local v12, "value":Ljava/lang/Object;
    iget-object v0, p0, Lrx/internal/operators/TakeLastQueueProducer;->subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->isUnsubscribed()Z
    :try_end_26
    .catch Ljava/lang/Throwable; {:try_start_11 .. :try_end_26} :catch_37
    .catchall {:try_start_11 .. :try_end_26} :catchall_49

    move-result v0

    if-eqz v0, :cond_2f

    .line 80
    iget-object v0, p0, Lrx/internal/operators/TakeLastQueueProducer;->deque:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->clear()V

    .line 126
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v12    # "value":Ljava/lang/Object;
    :cond_2e
    :goto_2e
    return-void

    .line 75
    .restart local v8    # "i$":Ljava/util/Iterator;
    .restart local v12    # "value":Ljava/lang/Object;
    :cond_2f
    :try_start_2f
    iget-object v0, p0, Lrx/internal/operators/TakeLastQueueProducer;->notification:Lrx/internal/operators/NotificationLite;

    iget-object v1, p0, Lrx/internal/operators/TakeLastQueueProducer;->subscriber:Lrx/Subscriber;

    invoke-virtual {v0, v1, v12}, Lrx/internal/operators/NotificationLite;->accept(Lrx/Observer;Ljava/lang/Object;)Z
    :try_end_36
    .catch Ljava/lang/Throwable; {:try_start_2f .. :try_end_36} :catch_37
    .catchall {:try_start_2f .. :try_end_36} :catchall_49

    goto :goto_17

    .line 77
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v12    # "value":Ljava/lang/Object;
    :catch_37
    move-exception v6

    .line 78
    .local v6, "e":Ljava/lang/Throwable;
    :try_start_38
    iget-object v0, p0, Lrx/internal/operators/TakeLastQueueProducer;->subscriber:Lrx/Subscriber;

    invoke-virtual {v0, v6}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V
    :try_end_3d
    .catchall {:try_start_38 .. :try_end_3d} :catchall_49

    .line 80
    iget-object v0, p0, Lrx/internal/operators/TakeLastQueueProducer;->deque:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->clear()V

    goto :goto_2e

    .end local v6    # "e":Ljava/lang/Throwable;
    .restart local v8    # "i$":Ljava/util/Iterator;
    :cond_43
    iget-object v0, p0, Lrx/internal/operators/TakeLastQueueProducer;->deque:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->clear()V

    goto :goto_2e

    .end local v8    # "i$":Ljava/util/Iterator;
    :catchall_49
    move-exception v0

    iget-object v1, p0, Lrx/internal/operators/TakeLastQueueProducer;->deque:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->clear()V

    throw v0

    .line 87
    :cond_50
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-nez v0, :cond_2e

    .line 93
    :cond_56
    iget-wide v9, p0, Lrx/internal/operators/TakeLastQueueProducer;->requested:J

    .line 94
    .local v9, "numToEmit":J
    const/4 v7, 0x0

    .line 96
    .local v7, "emitted":I
    :goto_59
    const-wide/16 v0, 0x1

    sub-long/2addr v9, v0

    const-wide/16 v0, 0x0

    cmp-long v0, v9, v0

    if-ltz v0, :cond_7f

    iget-object v0, p0, Lrx/internal/operators/TakeLastQueueProducer;->deque:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->poll()Ljava/lang/Object;

    move-result-object v11

    .local v11, "o":Ljava/lang/Object;
    if-eqz v11, :cond_7f

    .line 97
    iget-object v0, p0, Lrx/internal/operators/TakeLastQueueProducer;->subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v0

    if-nez v0, :cond_2e

    .line 100
    iget-object v0, p0, Lrx/internal/operators/TakeLastQueueProducer;->notification:Lrx/internal/operators/NotificationLite;

    iget-object v1, p0, Lrx/internal/operators/TakeLastQueueProducer;->subscriber:Lrx/Subscriber;

    invoke-virtual {v0, v1, v11}, Lrx/internal/operators/NotificationLite;->accept(Lrx/Observer;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2e

    .line 104
    add-int/lit8 v7, v7, 0x1

    goto :goto_59

    .line 108
    .end local v11    # "o":Ljava/lang/Object;
    :cond_7f
    iget-wide v2, p0, Lrx/internal/operators/TakeLastQueueProducer;->requested:J

    .line 109
    .local v2, "oldRequested":J
    int-to-long v0, v7

    sub-long v4, v2, v0

    .line 110
    .local v4, "newRequested":J
    const-wide v0, 0x7fffffffffffffffL

    cmp-long v0, v2, v0

    if-eqz v0, :cond_56

    .line 115
    sget-object v0, Lrx/internal/operators/TakeLastQueueProducer;->REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-object v1, p0

    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    move-result v0

    if-eqz v0, :cond_7f

    .line 116
    const-wide/16 v0, 0x0

    cmp-long v0, v4, v0

    if-nez v0, :cond_56

    goto :goto_2e
.end method

.method public request(J)V
    .registers 9
    .param p1, "n"    # J

    .prologue
    .local p0, "this":Lrx/internal/operators/TakeLastQueueProducer;, "Lrx/internal/operators/TakeLastQueueProducer<TT;>;"
    const-wide v4, 0x7fffffffffffffffL

    .line 51
    iget-wide v2, p0, Lrx/internal/operators/TakeLastQueueProducer;->requested:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_c

    .line 65
    :cond_b
    :goto_b
    return-void

    .line 55
    :cond_c
    cmp-long v2, p1, v4

    if-nez v2, :cond_1e

    .line 56
    sget-object v2, Lrx/internal/operators/TakeLastQueueProducer;->REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v2, p0, v4, v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndSet(Ljava/lang/Object;J)J

    move-result-wide v0

    .line 60
    .local v0, "_c":J
    :goto_16
    iget-boolean v2, p0, Lrx/internal/operators/TakeLastQueueProducer;->emittingStarted:Z

    if-eqz v2, :cond_b

    .line 64
    invoke-virtual {p0, v0, v1}, Lrx/internal/operators/TakeLastQueueProducer;->emit(J)V

    goto :goto_b

    .line 58
    .end local v0    # "_c":J
    :cond_1e
    sget-object v2, Lrx/internal/operators/TakeLastQueueProducer;->REQUESTED_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v2, p0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndAdd(Ljava/lang/Object;J)J

    move-result-wide v0

    .restart local v0    # "_c":J
    goto :goto_16
.end method

.method startEmitting()V
    .registers 3

    .prologue
    .line 43
    .local p0, "this":Lrx/internal/operators/TakeLastQueueProducer;, "Lrx/internal/operators/TakeLastQueueProducer<TT;>;"
    iget-boolean v0, p0, Lrx/internal/operators/TakeLastQueueProducer;->emittingStarted:Z

    if-nez v0, :cond_c

    .line 44
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrx/internal/operators/TakeLastQueueProducer;->emittingStarted:Z

    .line 45
    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lrx/internal/operators/TakeLastQueueProducer;->emit(J)V

    .line 47
    :cond_c
    return-void
.end method
