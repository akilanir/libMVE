.class public final Lrx/internal/schedulers/ScheduledAction;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "ScheduledAction.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lrx/Subscription;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/schedulers/ScheduledAction$1;,
        Lrx/internal/schedulers/ScheduledAction$Remover;,
        Lrx/internal/schedulers/ScheduledAction$FutureCompleter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<",
        "Ljava/lang/Thread;",
        ">;",
        "Ljava/lang/Runnable;",
        "Lrx/Subscription;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x36fd4556f787c9b1L


# instance fields
.field final action:Lrx/functions/Action0;

.field final cancel:Lrx/subscriptions/CompositeSubscription;


# direct methods
.method public constructor <init>(Lrx/functions/Action0;)V
    .registers 3
    .param p1, "action"    # Lrx/functions/Action0;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 39
    iput-object p1, p0, Lrx/internal/schedulers/ScheduledAction;->action:Lrx/functions/Action0;

    .line 40
    new-instance v0, Lrx/subscriptions/CompositeSubscription;

    invoke-direct {v0}, Lrx/subscriptions/CompositeSubscription;-><init>()V

    iput-object v0, p0, Lrx/internal/schedulers/ScheduledAction;->cancel:Lrx/subscriptions/CompositeSubscription;

    .line 41
    return-void
.end method


# virtual methods
.method public add(Ljava/util/concurrent/Future;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 92
    .local p1, "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    iget-object v0, p0, Lrx/internal/schedulers/ScheduledAction;->cancel:Lrx/subscriptions/CompositeSubscription;

    new-instance v1, Lrx/internal/schedulers/ScheduledAction$FutureCompleter;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lrx/internal/schedulers/ScheduledAction$FutureCompleter;-><init>(Lrx/internal/schedulers/ScheduledAction;Ljava/util/concurrent/Future;Lrx/internal/schedulers/ScheduledAction$1;)V

    invoke-virtual {v0, v1}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 93
    return-void
.end method

.method public add(Lrx/Subscription;)V
    .registers 3
    .param p1, "s"    # Lrx/Subscription;

    .prologue
    .line 83
    iget-object v0, p0, Lrx/internal/schedulers/ScheduledAction;->cancel:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v0, p1}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 84
    return-void
.end method

.method public addParent(Lrx/subscriptions/CompositeSubscription;)V
    .registers 4
    .param p1, "parent"    # Lrx/subscriptions/CompositeSubscription;

    .prologue
    .line 103
    iget-object v0, p0, Lrx/internal/schedulers/ScheduledAction;->cancel:Lrx/subscriptions/CompositeSubscription;

    new-instance v1, Lrx/internal/schedulers/ScheduledAction$Remover;

    invoke-direct {v1, p0, p1}, Lrx/internal/schedulers/ScheduledAction$Remover;-><init>(Lrx/Subscription;Lrx/subscriptions/CompositeSubscription;)V

    invoke-virtual {v0, v1}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 104
    return-void
.end method

.method public isUnsubscribed()Z
    .registers 2

    .prologue
    .line 66
    iget-object v0, p0, Lrx/internal/schedulers/ScheduledAction;->cancel:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v0}, Lrx/subscriptions/CompositeSubscription;->isUnsubscribed()Z

    move-result v0

    return v0
.end method

.method public run()V
    .registers 5

    .prologue
    .line 46
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {p0, v3}, Lrx/internal/schedulers/ScheduledAction;->lazySet(Ljava/lang/Object;)V

    .line 47
    iget-object v3, p0, Lrx/internal/schedulers/ScheduledAction;->action:Lrx/functions/Action0;

    invoke-interface {v3}, Lrx/functions/Action0;->call()V
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_c} :catch_10
    .catchall {:try_start_0 .. :try_end_c} :catchall_3f

    .line 60
    invoke-virtual {p0}, Lrx/internal/schedulers/ScheduledAction;->unsubscribe()V

    .line 62
    :goto_f
    return-void

    .line 48
    :catch_10
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/Throwable;
    const/4 v1, 0x0

    .line 51
    .local v1, "ie":Ljava/lang/IllegalStateException;
    :try_start_12
    instance-of v3, v0, Lrx/exceptions/OnErrorNotImplementedException;

    if-eqz v3, :cond_37

    .line 52
    new-instance v1, Ljava/lang/IllegalStateException;

    .end local v1    # "ie":Ljava/lang/IllegalStateException;
    const-string v3, "Exception thrown on Scheduler.Worker thread. Add `onError` handling."

    invoke-direct {v1, v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 56
    .restart local v1    # "ie":Ljava/lang/IllegalStateException;
    :goto_1d
    invoke-static {}, Lrx/plugins/RxJavaPlugins;->getInstance()Lrx/plugins/RxJavaPlugins;

    move-result-object v3

    invoke-virtual {v3}, Lrx/plugins/RxJavaPlugins;->getErrorHandler()Lrx/plugins/RxJavaErrorHandler;

    move-result-object v3

    invoke-virtual {v3, v1}, Lrx/plugins/RxJavaErrorHandler;->handleError(Ljava/lang/Throwable;)V

    .line 57
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    .line 58
    .local v2, "thread":Ljava/lang/Thread;
    invoke-virtual {v2}, Ljava/lang/Thread;->getUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v3

    invoke-interface {v3, v2, v1}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    :try_end_33
    .catchall {:try_start_12 .. :try_end_33} :catchall_3f

    .line 60
    invoke-virtual {p0}, Lrx/internal/schedulers/ScheduledAction;->unsubscribe()V

    goto :goto_f

    .line 54
    .end local v2    # "thread":Ljava/lang/Thread;
    :cond_37
    :try_start_37
    new-instance v1, Ljava/lang/IllegalStateException;

    .end local v1    # "ie":Ljava/lang/IllegalStateException;
    const-string v3, "Fatal Exception thrown on Scheduler.Worker thread."

    invoke-direct {v1, v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3e
    .catchall {:try_start_37 .. :try_end_3e} :catchall_3f

    .restart local v1    # "ie":Ljava/lang/IllegalStateException;
    goto :goto_1d

    .line 60
    .end local v0    # "e":Ljava/lang/Throwable;
    .end local v1    # "ie":Ljava/lang/IllegalStateException;
    :catchall_3f
    move-exception v3

    invoke-virtual {p0}, Lrx/internal/schedulers/ScheduledAction;->unsubscribe()V

    throw v3
.end method

.method public unsubscribe()V
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lrx/internal/schedulers/ScheduledAction;->cancel:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v0}, Lrx/subscriptions/CompositeSubscription;->isUnsubscribed()Z

    move-result v0

    if-nez v0, :cond_d

    .line 72
    iget-object v0, p0, Lrx/internal/schedulers/ScheduledAction;->cancel:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v0}, Lrx/subscriptions/CompositeSubscription;->unsubscribe()V

    .line 74
    :cond_d
    return-void
.end method
