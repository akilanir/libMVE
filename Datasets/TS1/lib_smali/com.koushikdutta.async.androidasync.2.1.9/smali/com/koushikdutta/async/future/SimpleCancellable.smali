.class public Lcom/koushikdutta/async/future/SimpleCancellable;
.super Ljava/lang/Object;
.source "SimpleCancellable.java"

# interfaces
.implements Lcom/koushikdutta/async/future/DependentCancellable;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final COMPLETED:Lcom/koushikdutta/async/future/Cancellable;


# instance fields
.field cancelled:Z

.field complete:Z

.field private parent:Lcom/koushikdutta/async/future/Cancellable;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 3
    const-class v0, Lcom/koushikdutta/async/future/SimpleCancellable;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_13

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/koushikdutta/async/future/SimpleCancellable;->$assertionsDisabled:Z

    .line 74
    new-instance v0, Lcom/koushikdutta/async/future/SimpleCancellable$1;

    invoke-direct {v0}, Lcom/koushikdutta/async/future/SimpleCancellable$1;-><init>()V

    sput-object v0, Lcom/koushikdutta/async/future/SimpleCancellable;->COMPLETED:Lcom/koushikdutta/async/future/Cancellable;

    return-void

    .line 3
    :cond_13
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancel()Z
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 39
    monitor-enter p0

    .line 40
    :try_start_2
    iget-boolean v2, p0, Lcom/koushikdutta/async/future/SimpleCancellable;->complete:Z

    if-eqz v2, :cond_9

    .line 41
    const/4 v1, 0x0

    monitor-exit p0

    .line 53
    :goto_8
    return v1

    .line 42
    :cond_9
    iget-boolean v2, p0, Lcom/koushikdutta/async/future/SimpleCancellable;->cancelled:Z

    if-eqz v2, :cond_12

    .line 43
    monitor-exit p0

    goto :goto_8

    .line 48
    :catchall_f
    move-exception v1

    monitor-exit p0
    :try_end_11
    .catchall {:try_start_2 .. :try_end_11} :catchall_f

    throw v1

    .line 44
    :cond_12
    const/4 v2, 0x1

    :try_start_13
    iput-boolean v2, p0, Lcom/koushikdutta/async/future/SimpleCancellable;->cancelled:Z

    .line 45
    iget-object v0, p0, Lcom/koushikdutta/async/future/SimpleCancellable;->parent:Lcom/koushikdutta/async/future/Cancellable;

    .line 47
    .local v0, "parent":Lcom/koushikdutta/async/future/Cancellable;
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/koushikdutta/async/future/SimpleCancellable;->parent:Lcom/koushikdutta/async/future/Cancellable;

    .line 48
    monitor-exit p0
    :try_end_1b
    .catchall {:try_start_13 .. :try_end_1b} :catchall_f

    .line 49
    if-eqz v0, :cond_20

    .line 50
    invoke-interface {v0}, Lcom/koushikdutta/async/future/Cancellable;->cancel()Z

    .line 51
    :cond_20
    invoke-virtual {p0}, Lcom/koushikdutta/async/future/SimpleCancellable;->cancelCleanup()V

    .line 52
    invoke-virtual {p0}, Lcom/koushikdutta/async/future/SimpleCancellable;->cleanup()V

    goto :goto_8
.end method

.method protected cancelCleanup()V
    .registers 1

    .prologue
    .line 11
    return-void
.end method

.method protected cleanup()V
    .registers 1

    .prologue
    .line 14
    return-void
.end method

.method protected completeCleanup()V
    .registers 1

    .prologue
    .line 17
    return-void
.end method

.method public isCancelled()Z
    .registers 2

    .prologue
    .line 69
    monitor-enter p0

    .line 70
    :try_start_1
    iget-boolean v0, p0, Lcom/koushikdutta/async/future/SimpleCancellable;->cancelled:Z

    if-nez v0, :cond_11

    iget-object v0, p0, Lcom/koushikdutta/async/future/SimpleCancellable;->parent:Lcom/koushikdutta/async/future/Cancellable;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/koushikdutta/async/future/SimpleCancellable;->parent:Lcom/koushikdutta/async/future/Cancellable;

    invoke-interface {v0}, Lcom/koushikdutta/async/future/Cancellable;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_11
    const/4 v0, 0x1

    :goto_12
    monitor-exit p0

    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_12

    .line 71
    :catchall_16
    move-exception v0

    monitor-exit p0
    :try_end_18
    .catchall {:try_start_1 .. :try_end_18} :catchall_16

    throw v0
.end method

.method public isDone()Z
    .registers 2

    .prologue
    .line 7
    iget-boolean v0, p0, Lcom/koushikdutta/async/future/SimpleCancellable;->complete:Z

    return v0
.end method

.method public reset()Lcom/koushikdutta/async/future/Cancellable;
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 81
    invoke-virtual {p0}, Lcom/koushikdutta/async/future/SimpleCancellable;->cancel()Z

    .line 82
    iput-boolean v0, p0, Lcom/koushikdutta/async/future/SimpleCancellable;->complete:Z

    .line 83
    iput-boolean v0, p0, Lcom/koushikdutta/async/future/SimpleCancellable;->cancelled:Z

    .line 84
    return-object p0
.end method

.method public setComplete()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 20
    monitor-enter p0

    .line 21
    :try_start_2
    iget-boolean v1, p0, Lcom/koushikdutta/async/future/SimpleCancellable;->cancelled:Z

    if-eqz v1, :cond_9

    .line 22
    const/4 v0, 0x0

    monitor-exit p0

    .line 33
    :goto_8
    return v0

    .line 23
    :cond_9
    iget-boolean v1, p0, Lcom/koushikdutta/async/future/SimpleCancellable;->complete:Z

    if-eqz v1, :cond_1c

    .line 25
    sget-boolean v1, Lcom/koushikdutta/async/future/SimpleCancellable;->$assertionsDisabled:Z

    if-nez v1, :cond_1a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 30
    :catchall_17
    move-exception v0

    monitor-exit p0
    :try_end_19
    .catchall {:try_start_2 .. :try_end_19} :catchall_17

    throw v0

    .line 26
    :cond_1a
    :try_start_1a
    monitor-exit p0

    goto :goto_8

    .line 28
    :cond_1c
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/koushikdutta/async/future/SimpleCancellable;->complete:Z

    .line 29
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/koushikdutta/async/future/SimpleCancellable;->parent:Lcom/koushikdutta/async/future/Cancellable;

    .line 30
    monitor-exit p0
    :try_end_23
    .catchall {:try_start_1a .. :try_end_23} :catchall_17

    .line 31
    invoke-virtual {p0}, Lcom/koushikdutta/async/future/SimpleCancellable;->completeCleanup()V

    .line 32
    invoke-virtual {p0}, Lcom/koushikdutta/async/future/SimpleCancellable;->cleanup()V

    goto :goto_8
.end method

.method public bridge synthetic setParent(Lcom/koushikdutta/async/future/Cancellable;)Lcom/koushikdutta/async/future/DependentCancellable;
    .registers 3
    .param p1, "x0"    # Lcom/koushikdutta/async/future/Cancellable;

    .prologue
    .line 3
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/future/SimpleCancellable;->setParent(Lcom/koushikdutta/async/future/Cancellable;)Lcom/koushikdutta/async/future/SimpleCancellable;

    move-result-object v0

    return-object v0
.end method

.method public setParent(Lcom/koushikdutta/async/future/Cancellable;)Lcom/koushikdutta/async/future/SimpleCancellable;
    .registers 3
    .param p1, "parent"    # Lcom/koushikdutta/async/future/Cancellable;

    .prologue
    .line 60
    monitor-enter p0

    .line 61
    :try_start_1
    invoke-virtual {p0}, Lcom/koushikdutta/async/future/SimpleCancellable;->isDone()Z

    move-result v0

    if-nez v0, :cond_9

    .line 62
    iput-object p1, p0, Lcom/koushikdutta/async/future/SimpleCancellable;->parent:Lcom/koushikdutta/async/future/Cancellable;

    .line 63
    :cond_9
    monitor-exit p0

    .line 64
    return-object p0

    .line 63
    :catchall_b
    move-exception v0

    monitor-exit p0
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_b

    throw v0
.end method
