.class Lrx/schedulers/EventLoopsScheduler$EventLoopWorker;
.super Lrx/Scheduler$Worker;
.source "EventLoopsScheduler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/schedulers/EventLoopsScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EventLoopWorker"
.end annotation


# instance fields
.field private final innerSubscription:Lrx/subscriptions/CompositeSubscription;

.field private final poolWorker:Lrx/schedulers/EventLoopsScheduler$PoolWorker;


# direct methods
.method constructor <init>(Lrx/schedulers/EventLoopsScheduler$PoolWorker;)V
    .registers 3
    .param p1, "poolWorker"    # Lrx/schedulers/EventLoopsScheduler$PoolWorker;

    .prologue
    .line 92
    invoke-direct {p0}, Lrx/Scheduler$Worker;-><init>()V

    .line 89
    new-instance v0, Lrx/subscriptions/CompositeSubscription;

    invoke-direct {v0}, Lrx/subscriptions/CompositeSubscription;-><init>()V

    iput-object v0, p0, Lrx/schedulers/EventLoopsScheduler$EventLoopWorker;->innerSubscription:Lrx/subscriptions/CompositeSubscription;

    .line 93
    iput-object p1, p0, Lrx/schedulers/EventLoopsScheduler$EventLoopWorker;->poolWorker:Lrx/schedulers/EventLoopsScheduler$PoolWorker;

    .line 95
    return-void
.end method


# virtual methods
.method public isUnsubscribed()Z
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Lrx/schedulers/EventLoopsScheduler$EventLoopWorker;->innerSubscription:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v0}, Lrx/subscriptions/CompositeSubscription;->isUnsubscribed()Z

    move-result v0

    return v0
.end method

.method public schedule(Lrx/functions/Action0;)Lrx/Subscription;
    .registers 5
    .param p1, "action"    # Lrx/functions/Action0;

    .prologue
    .line 109
    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lrx/schedulers/EventLoopsScheduler$EventLoopWorker;->schedule(Lrx/functions/Action0;JLjava/util/concurrent/TimeUnit;)Lrx/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public schedule(Lrx/functions/Action0;JLjava/util/concurrent/TimeUnit;)Lrx/Subscription;
    .registers 7
    .param p1, "action"    # Lrx/functions/Action0;
    .param p2, "delayTime"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 113
    iget-object v1, p0, Lrx/schedulers/EventLoopsScheduler$EventLoopWorker;->innerSubscription:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v1}, Lrx/subscriptions/CompositeSubscription;->isUnsubscribed()Z

    move-result v1

    if-eqz v1, :cond_d

    .line 115
    invoke-static {}, Lrx/subscriptions/Subscriptions;->unsubscribed()Lrx/Subscription;

    move-result-object v0

    .line 121
    :goto_c
    return-object v0

    .line 118
    :cond_d
    iget-object v1, p0, Lrx/schedulers/EventLoopsScheduler$EventLoopWorker;->poolWorker:Lrx/schedulers/EventLoopsScheduler$PoolWorker;

    invoke-virtual {v1, p1, p2, p3, p4}, Lrx/schedulers/EventLoopsScheduler$PoolWorker;->scheduleActual(Lrx/functions/Action0;JLjava/util/concurrent/TimeUnit;)Lrx/internal/schedulers/ScheduledAction;

    move-result-object v0

    .line 119
    .local v0, "s":Lrx/internal/schedulers/ScheduledAction;
    iget-object v1, p0, Lrx/schedulers/EventLoopsScheduler$EventLoopWorker;->innerSubscription:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v1, v0}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 120
    iget-object v1, p0, Lrx/schedulers/EventLoopsScheduler$EventLoopWorker;->innerSubscription:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v0, v1}, Lrx/internal/schedulers/ScheduledAction;->addParent(Lrx/subscriptions/CompositeSubscription;)V

    goto :goto_c
.end method

.method public unsubscribe()V
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lrx/schedulers/EventLoopsScheduler$EventLoopWorker;->innerSubscription:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v0}, Lrx/subscriptions/CompositeSubscription;->unsubscribe()V

    .line 100
    return-void
.end method
