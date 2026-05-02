.class final Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;
.super Lrx/Subscriber;
.source "OperatorObserveOn.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorObserveOn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ObserveOnSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/Subscriber",
        "<TT;>;"
    }
.end annotation


# static fields
.field static final COUNTER_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicLongFieldUpdater",
            "<",
            "Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;",
            ">;"
        }
    .end annotation
.end field

.field static final REQUESTED:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicLongFieldUpdater",
            "<",
            "Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final child:Lrx/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field private completed:Z

.field volatile counter:J

.field private failure:Z

.field final on:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final queue:Lrx/internal/util/RxRingBuffer;

.field private final recursiveScheduler:Lrx/Scheduler$Worker;

.field private volatile requested:J

.field private final scheduledUnsubscribe:Lrx/internal/operators/OperatorObserveOn$ScheduledUnsubscribe;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 78
    const-class v0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;

    const-string v1, "requested"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-result-object v0

    sput-object v0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->REQUESTED:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 83
    const-class v0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;

    const-string v1, "counter"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    move-result-object v0

    sput-object v0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->COUNTER_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    return-void
.end method

.method public constructor <init>(Lrx/Scheduler;Lrx/Subscriber;)V
    .registers 6
    .param p1, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Scheduler;",
            "Lrx/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;, "Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber<TT;>;"
    .local p2, "child":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    const/4 v1, 0x0

    .line 87
    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    .line 69
    invoke-static {}, Lrx/internal/operators/NotificationLite;->instance()Lrx/internal/operators/NotificationLite;

    move-result-object v0

    iput-object v0, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->on:Lrx/internal/operators/NotificationLite;

    .line 71
    invoke-static {}, Lrx/internal/util/RxRingBuffer;->getSpscInstance()Lrx/internal/util/RxRingBuffer;

    move-result-object v0

    iput-object v0, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->queue:Lrx/internal/util/RxRingBuffer;

    .line 72
    iput-boolean v1, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->completed:Z

    .line 73
    iput-boolean v1, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->failure:Z

    .line 75
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->requested:J

    .line 88
    iput-object p2, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->child:Lrx/Subscriber;

    .line 89
    invoke-virtual {p1}, Lrx/Scheduler;->createWorker()Lrx/Scheduler$Worker;

    move-result-object v0

    iput-object v0, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->recursiveScheduler:Lrx/Scheduler$Worker;

    .line 90
    new-instance v0, Lrx/internal/operators/OperatorObserveOn$ScheduledUnsubscribe;

    iget-object v1, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->recursiveScheduler:Lrx/Scheduler$Worker;

    iget-object v2, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->queue:Lrx/internal/util/RxRingBuffer;

    invoke-direct {v0, v1, v2}, Lrx/internal/operators/OperatorObserveOn$ScheduledUnsubscribe;-><init>(Lrx/Scheduler$Worker;Lrx/internal/util/RxRingBuffer;)V

    iput-object v0, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->scheduledUnsubscribe:Lrx/internal/operators/OperatorObserveOn$ScheduledUnsubscribe;

    .line 91
    iget-object v0, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->scheduledUnsubscribe:Lrx/internal/operators/OperatorObserveOn$ScheduledUnsubscribe;

    invoke-virtual {p2, v0}, Lrx/Subscriber;->add(Lrx/Subscription;)V

    .line 92
    new-instance v0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber$1;

    invoke-direct {v0, p0}, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber$1;-><init>(Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;)V

    invoke-virtual {p2, v0}, Lrx/Subscriber;->setProducer(Lrx/Producer;)V

    .line 101
    iget-object v0, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->recursiveScheduler:Lrx/Scheduler$Worker;

    invoke-virtual {p2, v0}, Lrx/Subscriber;->add(Lrx/Subscription;)V

    .line 102
    invoke-virtual {p2, p0}, Lrx/Subscriber;->add(Lrx/Subscription;)V

    .line 103
    return-void
.end method

.method static synthetic access$000(Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;)V
    .registers 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;

    .prologue
    .line 65
    invoke-direct {p0}, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->pollQueue()V

    return-void
.end method

.method private pollQueue()V
    .registers 8

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;, "Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber<TT;>;"
    const-wide/16 v5, 0x0

    .line 164
    const/4 v0, 0x0

    .line 170
    .local v0, "emitted":I
    :cond_3
    sget-object v2, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->COUNTER_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    const-wide/16 v3, 0x1

    invoke-virtual {v2, p0, v3, v4}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->set(Ljava/lang/Object;J)V

    .line 172
    :cond_a
    :goto_a
    iget-object v2, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->scheduledUnsubscribe:Lrx/internal/operators/OperatorObserveOn$ScheduledUnsubscribe;

    invoke-virtual {v2}, Lrx/internal/operators/OperatorObserveOn$ScheduledUnsubscribe;->isUnsubscribed()Z

    move-result v2

    if-nez v2, :cond_43

    .line 173
    iget-boolean v2, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->failure:Z

    if-eqz v2, :cond_2c

    .line 175
    iget-object v2, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->queue:Lrx/internal/util/RxRingBuffer;

    invoke-virtual {v2}, Lrx/internal/util/RxRingBuffer;->poll()Ljava/lang/Object;

    move-result-object v1

    .line 177
    .local v1, "o":Ljava/lang/Object;
    iget-object v2, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->on:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v2, v1}, Lrx/internal/operators/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 179
    iget-object v2, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->on:Lrx/internal/operators/NotificationLite;

    iget-object v3, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v2, v3, v1}, Lrx/internal/operators/NotificationLite;->accept(Lrx/Observer;Ljava/lang/Object;)Z

    .line 209
    .end local v1    # "o":Ljava/lang/Object;
    :cond_2b
    :goto_2b
    return-void

    .line 184
    :cond_2c
    sget-object v2, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->REQUESTED:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndDecrement(Ljava/lang/Object;)J

    move-result-wide v2

    cmp-long v2, v2, v5

    if-eqz v2, :cond_61

    .line 185
    iget-object v2, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->queue:Lrx/internal/util/RxRingBuffer;

    invoke-virtual {v2}, Lrx/internal/util/RxRingBuffer;->poll()Ljava/lang/Object;

    move-result-object v1

    .line 186
    .restart local v1    # "o":Ljava/lang/Object;
    if-nez v1, :cond_54

    .line 188
    sget-object v2, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->REQUESTED:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->incrementAndGet(Ljava/lang/Object;)J

    .line 203
    .end local v1    # "o":Ljava/lang/Object;
    :cond_43
    :goto_43
    sget-object v2, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->COUNTER_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->decrementAndGet(Ljava/lang/Object;)J

    move-result-wide v2

    cmp-long v2, v2, v5

    if-gtz v2, :cond_3

    .line 206
    if-lez v0, :cond_2b

    .line 207
    int-to-long v2, v0

    invoke-virtual {p0, v2, v3}, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->request(J)V

    goto :goto_2b

    .line 191
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_54
    iget-object v2, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->on:Lrx/internal/operators/NotificationLite;

    iget-object v3, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v2, v3, v1}, Lrx/internal/operators/NotificationLite;->accept(Lrx/Observer;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    .line 193
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 198
    .end local v1    # "o":Ljava/lang/Object;
    :cond_61
    sget-object v2, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->REQUESTED:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->incrementAndGet(Ljava/lang/Object;)J

    goto :goto_43
.end method


# virtual methods
.method public onCompleted()V
    .registers 2

    .prologue
    .line 127
    .local p0, "this":Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;, "Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber<TT;>;"
    invoke-virtual {p0}, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->isUnsubscribed()Z

    move-result v0

    if-nez v0, :cond_a

    iget-boolean v0, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->completed:Z

    if-eqz v0, :cond_b

    .line 133
    :cond_a
    :goto_a
    return-void

    .line 130
    :cond_b
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->completed:Z

    .line 131
    iget-object v0, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->queue:Lrx/internal/util/RxRingBuffer;

    invoke-virtual {v0}, Lrx/internal/util/RxRingBuffer;->onCompleted()V

    .line 132
    invoke-virtual {p0}, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->schedule()V

    goto :goto_a
.end method

.method public onError(Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .local p0, "this":Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;, "Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber<TT;>;"
    const/4 v1, 0x1

    .line 137
    invoke-virtual {p0}, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->isUnsubscribed()Z

    move-result v0

    if-nez v0, :cond_b

    iget-boolean v0, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->completed:Z

    if-eqz v0, :cond_c

    .line 147
    :cond_b
    :goto_b
    return-void

    .line 141
    :cond_c
    invoke-virtual {p0}, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->unsubscribe()V

    .line 142
    iput-boolean v1, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->completed:Z

    .line 144
    iput-boolean v1, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->failure:Z

    .line 145
    iget-object v0, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->queue:Lrx/internal/util/RxRingBuffer;

    invoke-virtual {v0, p1}, Lrx/internal/util/RxRingBuffer;->onError(Ljava/lang/Throwable;)V

    .line 146
    invoke-virtual {p0}, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->schedule()V

    goto :goto_b
.end method

.method public onNext(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 113
    .local p0, "this":Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;, "Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0}, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->isUnsubscribed()Z

    move-result v1

    if-nez v1, :cond_a

    iget-boolean v1, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->completed:Z

    if-eqz v1, :cond_b

    .line 123
    :cond_a
    :goto_a
    return-void

    .line 117
    :cond_b
    :try_start_b
    iget-object v1, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->queue:Lrx/internal/util/RxRingBuffer;

    invoke-virtual {v1, p1}, Lrx/internal/util/RxRingBuffer;->onNext(Ljava/lang/Object;)V
    :try_end_10
    .catch Lrx/exceptions/MissingBackpressureException; {:try_start_b .. :try_end_10} :catch_14

    .line 122
    invoke-virtual {p0}, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->schedule()V

    goto :goto_a

    .line 118
    :catch_14
    move-exception v0

    .line 119
    .local v0, "e":Lrx/exceptions/MissingBackpressureException;
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_a
.end method

.method public onStart()V
    .registers 3

    .prologue
    .line 108
    .local p0, "this":Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;, "Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber<TT;>;"
    sget v0, Lrx/internal/util/RxRingBuffer;->SIZE:I

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->request(J)V

    .line 109
    return-void
.end method

.method protected schedule()V
    .registers 5

    .prologue
    .line 150
    .local p0, "this":Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;, "Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber<TT;>;"
    sget-object v0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->COUNTER_UPDATER:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_16

    .line 151
    iget-object v0, p0, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;->recursiveScheduler:Lrx/Scheduler$Worker;

    new-instance v1, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber$2;

    invoke-direct {v1, p0}, Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber$2;-><init>(Lrx/internal/operators/OperatorObserveOn$ObserveOnSubscriber;)V

    invoke-virtual {v0, v1}, Lrx/Scheduler$Worker;->schedule(Lrx/functions/Action0;)Lrx/Subscription;

    .line 160
    :cond_16
    return-void
.end method
