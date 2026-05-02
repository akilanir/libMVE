.class public abstract Lorg/androidannotations/api/BackgroundExecutor$Task;
.super Ljava/lang/Object;
.source "BackgroundExecutor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/androidannotations/api/BackgroundExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Task"
.end annotation


# instance fields
.field private executionAsked:Z

.field private future:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation
.end field

.field private id:Ljava/lang/String;

.field private managed:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private remainingDelay:I

.field private serial:Ljava/lang/String;

.field private targetTimeMillis:J


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 8
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "delay"    # I
    .param p3, "serial"    # Ljava/lang/String;

    .prologue
    .line 379
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 377
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lorg/androidannotations/api/BackgroundExecutor$Task;->managed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 380
    const-string v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    .line 381
    iput-object p1, p0, Lorg/androidannotations/api/BackgroundExecutor$Task;->id:Ljava/lang/String;

    .line 383
    :cond_14
    if-lez p2, :cond_20

    .line 384
    iput p2, p0, Lorg/androidannotations/api/BackgroundExecutor$Task;->remainingDelay:I

    .line 385
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    int-to-long v2, p2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/androidannotations/api/BackgroundExecutor$Task;->targetTimeMillis:J

    .line 387
    :cond_20
    const-string v0, ""

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2a

    .line 388
    iput-object p3, p0, Lorg/androidannotations/api/BackgroundExecutor$Task;->serial:Ljava/lang/String;

    .line 390
    :cond_2a
    return-void
.end method

.method static synthetic access$000(Lorg/androidannotations/api/BackgroundExecutor$Task;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lorg/androidannotations/api/BackgroundExecutor$Task;

    .prologue
    .line 356
    iget-object v0, p0, Lorg/androidannotations/api/BackgroundExecutor$Task;->serial:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lorg/androidannotations/api/BackgroundExecutor$Task;)Z
    .registers 2
    .param p0, "x0"    # Lorg/androidannotations/api/BackgroundExecutor$Task;

    .prologue
    .line 356
    iget-boolean v0, p0, Lorg/androidannotations/api/BackgroundExecutor$Task;->executionAsked:Z

    return v0
.end method

.method static synthetic access$102(Lorg/androidannotations/api/BackgroundExecutor$Task;Z)Z
    .registers 2
    .param p0, "x0"    # Lorg/androidannotations/api/BackgroundExecutor$Task;
    .param p1, "x1"    # Z

    .prologue
    .line 356
    iput-boolean p1, p0, Lorg/androidannotations/api/BackgroundExecutor$Task;->executionAsked:Z

    return p1
.end method

.method static synthetic access$200(Lorg/androidannotations/api/BackgroundExecutor$Task;)I
    .registers 2
    .param p0, "x0"    # Lorg/androidannotations/api/BackgroundExecutor$Task;

    .prologue
    .line 356
    iget v0, p0, Lorg/androidannotations/api/BackgroundExecutor$Task;->remainingDelay:I

    return v0
.end method

.method static synthetic access$300(Lorg/androidannotations/api/BackgroundExecutor$Task;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lorg/androidannotations/api/BackgroundExecutor$Task;

    .prologue
    .line 356
    iget-object v0, p0, Lorg/androidannotations/api/BackgroundExecutor$Task;->id:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lorg/androidannotations/api/BackgroundExecutor$Task;)Ljava/util/concurrent/Future;
    .registers 2
    .param p0, "x0"    # Lorg/androidannotations/api/BackgroundExecutor$Task;

    .prologue
    .line 356
    iget-object v0, p0, Lorg/androidannotations/api/BackgroundExecutor$Task;->future:Ljava/util/concurrent/Future;

    return-object v0
.end method

.method static synthetic access$402(Lorg/androidannotations/api/BackgroundExecutor$Task;Ljava/util/concurrent/Future;)Ljava/util/concurrent/Future;
    .registers 2
    .param p0, "x0"    # Lorg/androidannotations/api/BackgroundExecutor$Task;
    .param p1, "x1"    # Ljava/util/concurrent/Future;

    .prologue
    .line 356
    iput-object p1, p0, Lorg/androidannotations/api/BackgroundExecutor$Task;->future:Ljava/util/concurrent/Future;

    return-object p1
.end method

.method static synthetic access$500(Lorg/androidannotations/api/BackgroundExecutor$Task;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .registers 2
    .param p0, "x0"    # Lorg/androidannotations/api/BackgroundExecutor$Task;

    .prologue
    .line 356
    iget-object v0, p0, Lorg/androidannotations/api/BackgroundExecutor$Task;->managed:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic access$600(Lorg/androidannotations/api/BackgroundExecutor$Task;)V
    .registers 1
    .param p0, "x0"    # Lorg/androidannotations/api/BackgroundExecutor$Task;

    .prologue
    .line 356
    invoke-direct {p0}, Lorg/androidannotations/api/BackgroundExecutor$Task;->postExecute()V

    return-void
.end method

.method private postExecute()V
    .registers 8

    .prologue
    .line 411
    iget-object v1, p0, Lorg/androidannotations/api/BackgroundExecutor$Task;->id:Ljava/lang/String;

    if-nez v1, :cond_9

    iget-object v1, p0, Lorg/androidannotations/api/BackgroundExecutor$Task;->serial:Ljava/lang/String;

    if-nez v1, :cond_9

    .line 432
    :goto_8
    return-void

    .line 415
    :cond_9
    # getter for: Lorg/androidannotations/api/BackgroundExecutor;->CURRENT_SERIAL:Ljava/lang/ThreadLocal;
    invoke-static {}, Lorg/androidannotations/api/BackgroundExecutor;->access$700()Ljava/lang/ThreadLocal;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 416
    const-class v2, Lorg/androidannotations/api/BackgroundExecutor;

    monitor-enter v2

    .line 418
    :try_start_14
    # getter for: Lorg/androidannotations/api/BackgroundExecutor;->TASKS:Ljava/util/List;
    invoke-static {}, Lorg/androidannotations/api/BackgroundExecutor;->access$800()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 420
    iget-object v1, p0, Lorg/androidannotations/api/BackgroundExecutor$Task;->serial:Ljava/lang/String;

    if-eqz v1, :cond_3d

    .line 421
    iget-object v1, p0, Lorg/androidannotations/api/BackgroundExecutor$Task;->serial:Ljava/lang/String;

    # invokes: Lorg/androidannotations/api/BackgroundExecutor;->take(Ljava/lang/String;)Lorg/androidannotations/api/BackgroundExecutor$Task;
    invoke-static {v1}, Lorg/androidannotations/api/BackgroundExecutor;->access$900(Ljava/lang/String;)Lorg/androidannotations/api/BackgroundExecutor$Task;

    move-result-object v0

    .line 422
    .local v0, "next":Lorg/androidannotations/api/BackgroundExecutor$Task;
    if-eqz v0, :cond_3d

    .line 423
    iget v1, v0, Lorg/androidannotations/api/BackgroundExecutor$Task;->remainingDelay:I

    if-eqz v1, :cond_3a

    .line 425
    const/4 v1, 0x0

    iget-wide v3, p0, Lorg/androidannotations/api/BackgroundExecutor$Task;->targetTimeMillis:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v3, v5

    long-to-int v3, v3

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, v0, Lorg/androidannotations/api/BackgroundExecutor$Task;->remainingDelay:I

    .line 428
    :cond_3a
    invoke-static {v0}, Lorg/androidannotations/api/BackgroundExecutor;->execute(Lorg/androidannotations/api/BackgroundExecutor$Task;)V

    .line 431
    .end local v0    # "next":Lorg/androidannotations/api/BackgroundExecutor$Task;
    :cond_3d
    monitor-exit v2

    goto :goto_8

    :catchall_3f
    move-exception v1

    monitor-exit v2
    :try_end_41
    .catchall {:try_start_14 .. :try_end_41} :catchall_3f

    throw v1
.end method


# virtual methods
.method public abstract execute()V
.end method

.method public run()V
    .registers 3

    .prologue
    .line 394
    iget-object v0, p0, Lorg/androidannotations/api/BackgroundExecutor$Task;->managed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 406
    :goto_9
    return-void

    .line 400
    :cond_a
    :try_start_a
    # getter for: Lorg/androidannotations/api/BackgroundExecutor;->CURRENT_SERIAL:Ljava/lang/ThreadLocal;
    invoke-static {}, Lorg/androidannotations/api/BackgroundExecutor;->access$700()Ljava/lang/ThreadLocal;

    move-result-object v0

    iget-object v1, p0, Lorg/androidannotations/api/BackgroundExecutor$Task;->serial:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 401
    invoke-virtual {p0}, Lorg/androidannotations/api/BackgroundExecutor$Task;->execute()V
    :try_end_16
    .catchall {:try_start_a .. :try_end_16} :catchall_1a

    .line 404
    invoke-direct {p0}, Lorg/androidannotations/api/BackgroundExecutor$Task;->postExecute()V

    goto :goto_9

    :catchall_1a
    move-exception v0

    invoke-direct {p0}, Lorg/androidannotations/api/BackgroundExecutor$Task;->postExecute()V

    throw v0
.end method
