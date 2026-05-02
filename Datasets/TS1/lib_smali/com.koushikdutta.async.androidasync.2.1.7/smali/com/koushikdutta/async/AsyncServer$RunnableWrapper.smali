.class Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;
.super Ljava/lang/Object;
.source "AsyncServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/async/AsyncServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RunnableWrapper"
.end annotation


# instance fields
.field handler:Landroid/os/Handler;

.field hasRun:Z

.field runnable:Ljava/lang/Runnable;

.field threadQueue:Lcom/koushikdutta/async/ThreadQueue;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/koushikdutta/async/AsyncServer$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/koushikdutta/async/AsyncServer$1;

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 51
    monitor-enter p0

    .line 52
    :try_start_2
    iget-boolean v0, p0, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;->hasRun:Z

    if-eqz v0, :cond_8

    .line 53
    monitor-exit p0

    .line 67
    :goto_7
    return-void

    .line 54
    :cond_8
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;->hasRun:Z

    .line 55
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_2 .. :try_end_c} :catchall_22

    .line 57
    :try_start_c
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;->runnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_11
    .catchall {:try_start_c .. :try_end_11} :catchall_25

    .line 60
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;->threadQueue:Lcom/koushikdutta/async/ThreadQueue;

    invoke-virtual {v0, p0}, Lcom/koushikdutta/async/ThreadQueue;->remove(Ljava/lang/Object;)Z

    .line 61
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 63
    iput-object v2, p0, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;->threadQueue:Lcom/koushikdutta/async/ThreadQueue;

    .line 64
    iput-object v2, p0, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;->handler:Landroid/os/Handler;

    .line 65
    iput-object v2, p0, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;->runnable:Ljava/lang/Runnable;

    goto :goto_7

    .line 55
    :catchall_22
    move-exception v0

    :try_start_23
    monitor-exit p0
    :try_end_24
    .catchall {:try_start_23 .. :try_end_24} :catchall_22

    throw v0

    .line 60
    :catchall_25
    move-exception v0

    iget-object v1, p0, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;->threadQueue:Lcom/koushikdutta/async/ThreadQueue;

    invoke-virtual {v1, p0}, Lcom/koushikdutta/async/ThreadQueue;->remove(Ljava/lang/Object;)Z

    .line 61
    iget-object v1, p0, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;->handler:Landroid/os/Handler;

    invoke-virtual {v1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 63
    iput-object v2, p0, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;->threadQueue:Lcom/koushikdutta/async/ThreadQueue;

    .line 64
    iput-object v2, p0, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;->handler:Landroid/os/Handler;

    .line 65
    iput-object v2, p0, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;->runnable:Ljava/lang/Runnable;

    throw v0
.end method
