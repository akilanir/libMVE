.class public final Lcom/google/common/util/concurrent/Monitor;
.super Ljava/lang/Object;
.source "Monitor.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/util/concurrent/Monitor$Guard;
    }
.end annotation


# instance fields
.field private activeGuards:Lcom/google/common/util/concurrent/Monitor$Guard;
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "lock"
    .end annotation
.end field

.field private final fair:Z

.field private final lock:Ljava/util/concurrent/locks/ReentrantLock;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 311
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/common/util/concurrent/Monitor;-><init>(Z)V

    .line 312
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 3
    .param p1, "fair"    # Z

    .prologue
    .line 320
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 303
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->activeGuards:Lcom/google/common/util/concurrent/Monitor$Guard;

    .line 321
    iput-boolean p1, p0, Lcom/google/common/util/concurrent/Monitor;->fair:Z

    .line 322
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0, p1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>(Z)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 323
    return-void
.end method

.method static synthetic access$000(Lcom/google/common/util/concurrent/Monitor;)Ljava/util/concurrent/locks/ReentrantLock;
    .registers 2
    .param p0, "x0"    # Lcom/google/common/util/concurrent/Monitor;

    .prologue
    .line 202
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    return-object v0
.end method

.method private await(Lcom/google/common/util/concurrent/Monitor$Guard;Z)V
    .registers 4
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;
    .param p2, "signalBeforeWaiting"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "lock"
    .end annotation

    .prologue
    .line 957
    if-eqz p2, :cond_5

    .line 958
    invoke-direct {p0}, Lcom/google/common/util/concurrent/Monitor;->signalNextWaiter()V

    .line 960
    :cond_5
    invoke-direct {p0, p1}, Lcom/google/common/util/concurrent/Monitor;->beginWaitingFor(Lcom/google/common/util/concurrent/Monitor$Guard;)V

    .line 963
    :cond_8
    :try_start_8
    iget-object v0, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->condition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->await()V

    .line 964
    invoke-virtual {p1}, Lcom/google/common/util/concurrent/Monitor$Guard;->isSatisfied()Z
    :try_end_10
    .catchall {:try_start_8 .. :try_end_10} :catchall_17

    move-result v0

    if-eqz v0, :cond_8

    .line 966
    invoke-direct {p0, p1}, Lcom/google/common/util/concurrent/Monitor;->endWaitingFor(Lcom/google/common/util/concurrent/Monitor$Guard;)V

    .line 968
    return-void

    .line 966
    :catchall_17
    move-exception v0

    invoke-direct {p0, p1}, Lcom/google/common/util/concurrent/Monitor;->endWaitingFor(Lcom/google/common/util/concurrent/Monitor$Guard;)V

    throw v0
.end method

.method private awaitNanos(Lcom/google/common/util/concurrent/Monitor$Guard;JZ)Z
    .registers 7
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;
    .param p2, "nanos"    # J
    .param p4, "signalBeforeWaiting"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "lock"
    .end annotation

    .prologue
    .line 988
    if-eqz p4, :cond_5

    .line 989
    invoke-direct {p0}, Lcom/google/common/util/concurrent/Monitor;->signalNextWaiter()V

    .line 991
    :cond_5
    invoke-direct {p0, p1}, Lcom/google/common/util/concurrent/Monitor;->beginWaitingFor(Lcom/google/common/util/concurrent/Monitor$Guard;)V

    .line 994
    :cond_8
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-gez v0, :cond_13

    .line 995
    const/4 v0, 0x0

    .line 1001
    invoke-direct {p0, p1}, Lcom/google/common/util/concurrent/Monitor;->endWaitingFor(Lcom/google/common/util/concurrent/Monitor$Guard;)V

    :goto_12
    return v0

    .line 997
    :cond_13
    :try_start_13
    iget-object v0, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->condition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0, p2, p3}, Ljava/util/concurrent/locks/Condition;->awaitNanos(J)J

    move-result-wide p2

    .line 998
    invoke-virtual {p1}, Lcom/google/common/util/concurrent/Monitor$Guard;->isSatisfied()Z
    :try_end_1c
    .catchall {:try_start_13 .. :try_end_1c} :catchall_24

    move-result v0

    if-eqz v0, :cond_8

    .line 999
    const/4 v0, 0x1

    .line 1001
    invoke-direct {p0, p1}, Lcom/google/common/util/concurrent/Monitor;->endWaitingFor(Lcom/google/common/util/concurrent/Monitor$Guard;)V

    goto :goto_12

    :catchall_24
    move-exception v0

    invoke-direct {p0, p1}, Lcom/google/common/util/concurrent/Monitor;->endWaitingFor(Lcom/google/common/util/concurrent/Monitor$Guard;)V

    throw v0
.end method

.method private awaitUninterruptibly(Lcom/google/common/util/concurrent/Monitor$Guard;Z)V
    .registers 4
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;
    .param p2, "signalBeforeWaiting"    # Z
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "lock"
    .end annotation

    .prologue
    .line 972
    if-eqz p2, :cond_5

    .line 973
    invoke-direct {p0}, Lcom/google/common/util/concurrent/Monitor;->signalNextWaiter()V

    .line 975
    :cond_5
    invoke-direct {p0, p1}, Lcom/google/common/util/concurrent/Monitor;->beginWaitingFor(Lcom/google/common/util/concurrent/Monitor$Guard;)V

    .line 978
    :cond_8
    :try_start_8
    iget-object v0, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->condition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->awaitUninterruptibly()V

    .line 979
    invoke-virtual {p1}, Lcom/google/common/util/concurrent/Monitor$Guard;->isSatisfied()Z
    :try_end_10
    .catchall {:try_start_8 .. :try_end_10} :catchall_17

    move-result v0

    if-eqz v0, :cond_8

    .line 981
    invoke-direct {p0, p1}, Lcom/google/common/util/concurrent/Monitor;->endWaitingFor(Lcom/google/common/util/concurrent/Monitor$Guard;)V

    .line 983
    return-void

    .line 981
    :catchall_17
    move-exception v0

    invoke-direct {p0, p1}, Lcom/google/common/util/concurrent/Monitor;->endWaitingFor(Lcom/google/common/util/concurrent/Monitor$Guard;)V

    throw v0
.end method

.method private beginWaitingFor(Lcom/google/common/util/concurrent/Monitor$Guard;)V
    .registers 4
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "lock"
    .end annotation

    .prologue
    .line 918
    iget v0, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->waiterCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->waiterCount:I

    .line 919
    .local v0, "waiters":I
    if-nez v0, :cond_e

    .line 921
    iget-object v1, p0, Lcom/google/common/util/concurrent/Monitor;->activeGuards:Lcom/google/common/util/concurrent/Monitor$Guard;

    iput-object v1, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->next:Lcom/google/common/util/concurrent/Monitor$Guard;

    .line 922
    iput-object p1, p0, Lcom/google/common/util/concurrent/Monitor;->activeGuards:Lcom/google/common/util/concurrent/Monitor$Guard;

    .line 924
    :cond_e
    return-void
.end method

.method private endWaitingFor(Lcom/google/common/util/concurrent/Monitor$Guard;)V
    .registers 6
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "lock"
    .end annotation

    .prologue
    .line 931
    iget v3, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->waiterCount:I

    add-int/lit8 v2, v3, -0x1

    iput v2, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->waiterCount:I

    .line 932
    .local v2, "waiters":I
    if-nez v2, :cond_16

    .line 934
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->activeGuards:Lcom/google/common/util/concurrent/Monitor$Guard;

    .local v0, "p":Lcom/google/common/util/concurrent/Monitor$Guard;
    const/4 v1, 0x0

    .line 935
    .local v1, "pred":Lcom/google/common/util/concurrent/Monitor$Guard;
    :goto_b
    if-ne v0, p1, :cond_1c

    .line 936
    if-nez v1, :cond_17

    .line 937
    iget-object v3, v0, Lcom/google/common/util/concurrent/Monitor$Guard;->next:Lcom/google/common/util/concurrent/Monitor$Guard;

    iput-object v3, p0, Lcom/google/common/util/concurrent/Monitor;->activeGuards:Lcom/google/common/util/concurrent/Monitor$Guard;

    .line 941
    :goto_13
    const/4 v3, 0x0

    iput-object v3, v0, Lcom/google/common/util/concurrent/Monitor$Guard;->next:Lcom/google/common/util/concurrent/Monitor$Guard;

    .line 946
    .end local v0    # "p":Lcom/google/common/util/concurrent/Monitor$Guard;
    .end local v1    # "pred":Lcom/google/common/util/concurrent/Monitor$Guard;
    :cond_16
    return-void

    .line 939
    .restart local v0    # "p":Lcom/google/common/util/concurrent/Monitor$Guard;
    .restart local v1    # "pred":Lcom/google/common/util/concurrent/Monitor$Guard;
    :cond_17
    iget-object v3, v0, Lcom/google/common/util/concurrent/Monitor$Guard;->next:Lcom/google/common/util/concurrent/Monitor$Guard;

    iput-object v3, v1, Lcom/google/common/util/concurrent/Monitor$Guard;->next:Lcom/google/common/util/concurrent/Monitor$Guard;

    goto :goto_13

    .line 934
    :cond_1c
    move-object v1, v0

    iget-object v0, v0, Lcom/google/common/util/concurrent/Monitor$Guard;->next:Lcom/google/common/util/concurrent/Monitor$Guard;

    goto :goto_b
.end method

.method private isSatisfied(Lcom/google/common/util/concurrent/Monitor$Guard;)Z
    .registers 4
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "lock"
    .end annotation

    .prologue
    .line 896
    :try_start_0
    invoke-virtual {p1}, Lcom/google/common/util/concurrent/Monitor$Guard;->isSatisfied()Z
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_3} :catch_5

    move-result v1

    return v1

    .line 897
    :catch_5
    move-exception v0

    .line 898
    .local v0, "throwable":Ljava/lang/Throwable;
    invoke-direct {p0}, Lcom/google/common/util/concurrent/Monitor;->signalAllWaiters()V

    .line 899
    invoke-static {v0}, Lcom/google/common/base/Throwables;->propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method private signalAllWaiters()V
    .registers 3
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "lock"
    .end annotation

    .prologue
    .line 908
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->activeGuards:Lcom/google/common/util/concurrent/Monitor$Guard;

    .local v0, "guard":Lcom/google/common/util/concurrent/Monitor$Guard;
    :goto_2
    if-eqz v0, :cond_c

    .line 909
    iget-object v1, v0, Lcom/google/common/util/concurrent/Monitor$Guard;->condition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 908
    iget-object v0, v0, Lcom/google/common/util/concurrent/Monitor$Guard;->next:Lcom/google/common/util/concurrent/Monitor$Guard;

    goto :goto_2

    .line 911
    :cond_c
    return-void
.end method

.method private signalNextWaiter()V
    .registers 3
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "lock"
    .end annotation

    .prologue
    .line 863
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->activeGuards:Lcom/google/common/util/concurrent/Monitor$Guard;

    .local v0, "guard":Lcom/google/common/util/concurrent/Monitor$Guard;
    :goto_2
    if-eqz v0, :cond_f

    .line 864
    invoke-direct {p0, v0}, Lcom/google/common/util/concurrent/Monitor;->isSatisfied(Lcom/google/common/util/concurrent/Monitor$Guard;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 865
    iget-object v1, v0, Lcom/google/common/util/concurrent/Monitor$Guard;->condition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->signal()V

    .line 869
    :cond_f
    return-void

    .line 863
    :cond_10
    iget-object v0, v0, Lcom/google/common/util/concurrent/Monitor$Guard;->next:Lcom/google/common/util/concurrent/Monitor$Guard;

    goto :goto_2
.end method


# virtual methods
.method public enter()V
    .registers 2

    .prologue
    .line 329
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 330
    return-void
.end method

.method public enter(JLjava/util/concurrent/TimeUnit;)Z
    .registers 13
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 345
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v5

    .line 346
    .local v5, "timeoutNanos":J
    iget-object v4, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 347
    .local v4, "lock":Ljava/util/concurrent/locks/ReentrantLock;
    iget-boolean v7, p0, Lcom/google/common/util/concurrent/Monitor;->fair:Z

    if-nez v7, :cond_12

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->tryLock()Z

    move-result v7

    if-eqz v7, :cond_12

    .line 348
    const/4 v7, 0x1

    .line 363
    :cond_11
    :goto_11
    return v7

    .line 350
    :cond_12
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v7

    add-long v0, v7, v5

    .line 351
    .local v0, "deadline":J
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v3

    .line 355
    .local v3, "interrupted":Z
    :goto_1c
    :try_start_1c
    sget-object v7, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v5, v6, v7}, Ljava/util/concurrent/locks/ReentrantLock;->tryLock(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_21
    .catch Ljava/lang/InterruptedException; {:try_start_1c .. :try_end_21} :catch_2c
    .catchall {:try_start_1c .. :try_end_21} :catchall_35

    move-result v7

    .line 362
    if-eqz v3, :cond_11

    .line 363
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Thread;->interrupt()V

    goto :goto_11

    .line 356
    :catch_2c
    move-exception v2

    .line 357
    .local v2, "interrupt":Ljava/lang/InterruptedException;
    const/4 v3, 0x1

    .line 358
    :try_start_2e
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_31
    .catchall {:try_start_2e .. :try_end_31} :catchall_35

    move-result-wide v7

    sub-long v5, v0, v7

    .line 359
    goto :goto_1c

    .line 362
    .end local v2    # "interrupt":Ljava/lang/InterruptedException;
    :catchall_35
    move-exception v7

    if-eqz v3, :cond_3f

    .line 363
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Thread;->interrupt()V

    :cond_3f
    throw v7
.end method

.method public enterIf(Lcom/google/common/util/concurrent/Monitor$Guard;)Z
    .registers 5
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;

    .prologue
    .line 540
    iget-object v2, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->monitor:Lcom/google/common/util/concurrent/Monitor;

    if-eq v2, p0, :cond_a

    .line 541
    new-instance v2, Ljava/lang/IllegalMonitorStateException;

    invoke-direct {v2}, Ljava/lang/IllegalMonitorStateException;-><init>()V

    throw v2

    .line 543
    :cond_a
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 544
    .local v0, "lock":Ljava/util/concurrent/locks/ReentrantLock;
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 546
    const/4 v1, 0x0

    .line 548
    .local v1, "satisfied":Z
    :try_start_10
    invoke-virtual {p1}, Lcom/google/common/util/concurrent/Monitor$Guard;->isSatisfied()Z
    :try_end_13
    .catchall {:try_start_10 .. :try_end_13} :catchall_1a

    move-result v1

    .line 550
    if-nez v1, :cond_19

    .line 551
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    :cond_19
    return v1

    .line 550
    :catchall_1a
    move-exception v2

    if-nez v1, :cond_20

    .line 551
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    :cond_20
    throw v2
.end method

.method public enterIf(Lcom/google/common/util/concurrent/Monitor$Guard;JLjava/util/concurrent/TimeUnit;)Z
    .registers 8
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 586
    iget-object v1, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->monitor:Lcom/google/common/util/concurrent/Monitor;

    if-eq v1, p0, :cond_a

    .line 587
    new-instance v1, Ljava/lang/IllegalMonitorStateException;

    invoke-direct {v1}, Ljava/lang/IllegalMonitorStateException;-><init>()V

    throw v1

    .line 589
    :cond_a
    invoke-virtual {p0, p2, p3, p4}, Lcom/google/common/util/concurrent/Monitor;->enter(JLjava/util/concurrent/TimeUnit;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 590
    const/4 v0, 0x0

    .line 598
    :cond_11
    :goto_11
    return v0

    .line 593
    :cond_12
    const/4 v0, 0x0

    .line 595
    .local v0, "satisfied":Z
    :try_start_13
    invoke-virtual {p1}, Lcom/google/common/util/concurrent/Monitor$Guard;->isSatisfied()Z
    :try_end_16
    .catchall {:try_start_13 .. :try_end_16} :catchall_1f

    move-result v0

    .line 597
    if-nez v0, :cond_11

    .line 598
    iget-object v1, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_11

    .line 597
    :catchall_1f
    move-exception v1

    if-nez v0, :cond_27

    .line 598
    iget-object v2, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    :cond_27
    throw v1
.end method

.method public enterIfInterruptibly(Lcom/google/common/util/concurrent/Monitor$Guard;)Z
    .registers 5
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 563
    iget-object v2, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->monitor:Lcom/google/common/util/concurrent/Monitor;

    if-eq v2, p0, :cond_a

    .line 564
    new-instance v2, Ljava/lang/IllegalMonitorStateException;

    invoke-direct {v2}, Ljava/lang/IllegalMonitorStateException;-><init>()V

    throw v2

    .line 566
    :cond_a
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 567
    .local v0, "lock":Ljava/util/concurrent/locks/ReentrantLock;
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lockInterruptibly()V

    .line 569
    const/4 v1, 0x0

    .line 571
    .local v1, "satisfied":Z
    :try_start_10
    invoke-virtual {p1}, Lcom/google/common/util/concurrent/Monitor$Guard;->isSatisfied()Z
    :try_end_13
    .catchall {:try_start_10 .. :try_end_13} :catchall_1a

    move-result v1

    .line 573
    if-nez v1, :cond_19

    .line 574
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    :cond_19
    return v1

    .line 573
    :catchall_1a
    move-exception v2

    if-nez v1, :cond_20

    .line 574
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    :cond_20
    throw v2
.end method

.method public enterIfInterruptibly(Lcom/google/common/util/concurrent/Monitor$Guard;JLjava/util/concurrent/TimeUnit;)Z
    .registers 8
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 611
    iget-object v2, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->monitor:Lcom/google/common/util/concurrent/Monitor;

    if-eq v2, p0, :cond_a

    .line 612
    new-instance v2, Ljava/lang/IllegalMonitorStateException;

    invoke-direct {v2}, Ljava/lang/IllegalMonitorStateException;-><init>()V

    throw v2

    .line 614
    :cond_a
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 615
    .local v0, "lock":Ljava/util/concurrent/locks/ReentrantLock;
    invoke-virtual {v0, p2, p3, p4}, Ljava/util/concurrent/locks/ReentrantLock;->tryLock(JLjava/util/concurrent/TimeUnit;)Z

    move-result v2

    if-nez v2, :cond_14

    .line 616
    const/4 v1, 0x0

    .line 624
    :cond_13
    :goto_13
    return v1

    .line 619
    :cond_14
    const/4 v1, 0x0

    .line 621
    .local v1, "satisfied":Z
    :try_start_15
    invoke-virtual {p1}, Lcom/google/common/util/concurrent/Monitor$Guard;->isSatisfied()Z
    :try_end_18
    .catchall {:try_start_15 .. :try_end_18} :catchall_1f

    move-result v1

    .line 623
    if-nez v1, :cond_13

    .line 624
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_13

    .line 623
    :catchall_1f
    move-exception v2

    if-nez v1, :cond_25

    .line 624
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    :cond_25
    throw v2
.end method

.method public enterInterruptibly()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 336
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lockInterruptibly()V

    .line 337
    return-void
.end method

.method public enterInterruptibly(JLjava/util/concurrent/TimeUnit;)Z
    .registers 5
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 374
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/locks/ReentrantLock;->tryLock(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    return v0
.end method

.method public enterWhen(Lcom/google/common/util/concurrent/Monitor$Guard;)V
    .registers 6
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 392
    iget-object v3, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->monitor:Lcom/google/common/util/concurrent/Monitor;

    if-eq v3, p0, :cond_a

    .line 393
    new-instance v3, Ljava/lang/IllegalMonitorStateException;

    invoke-direct {v3}, Ljava/lang/IllegalMonitorStateException;-><init>()V

    throw v3

    .line 395
    :cond_a
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 396
    .local v0, "lock":Ljava/util/concurrent/locks/ReentrantLock;
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v2

    .line 397
    .local v2, "signalBeforeWaiting":Z
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lockInterruptibly()V

    .line 399
    const/4 v1, 0x0

    .line 401
    .local v1, "satisfied":Z
    :try_start_14
    invoke-virtual {p1}, Lcom/google/common/util/concurrent/Monitor$Guard;->isSatisfied()Z

    move-result v3

    if-nez v3, :cond_1d

    .line 402
    invoke-direct {p0, p1, v2}, Lcom/google/common/util/concurrent/Monitor;->await(Lcom/google/common/util/concurrent/Monitor$Guard;Z)V
    :try_end_1d
    .catchall {:try_start_14 .. :try_end_1d} :catchall_24

    .line 404
    :cond_1d
    const/4 v1, 0x1

    .line 406
    if-nez v1, :cond_23

    .line 407
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 410
    :cond_23
    return-void

    .line 406
    :catchall_24
    move-exception v3

    if-nez v1, :cond_2a

    .line 407
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    :cond_2a
    throw v3
.end method

.method public enterWhen(Lcom/google/common/util/concurrent/Monitor$Guard;JLjava/util/concurrent/TimeUnit;)Z
    .registers 16
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 444
    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v6

    .line 445
    .local v6, "timeoutNanos":J
    iget-object v9, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->monitor:Lcom/google/common/util/concurrent/Monitor;

    if-eq v9, p0, :cond_f

    .line 446
    new-instance v8, Ljava/lang/IllegalMonitorStateException;

    invoke-direct {v8}, Ljava/lang/IllegalMonitorStateException;-><init>()V

    throw v8

    .line 448
    :cond_f
    iget-object v2, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 449
    .local v2, "lock":Ljava/util/concurrent/locks/ReentrantLock;
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v3

    .line 450
    .local v3, "reentrant":Z
    iget-boolean v9, p0, Lcom/google/common/util/concurrent/Monitor;->fair:Z

    if-nez v9, :cond_1f

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->tryLock()Z

    move-result v9

    if-nez v9, :cond_32

    .line 451
    :cond_1f
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v9

    add-long v0, v9, v6

    .line 452
    .local v0, "deadline":J
    invoke-virtual {v2, p2, p3, p4}, Ljava/util/concurrent/locks/ReentrantLock;->tryLock(JLjava/util/concurrent/TimeUnit;)Z

    move-result v9

    if-nez v9, :cond_2c

    .line 472
    .end local v0    # "deadline":J
    :goto_2b
    return v8

    .line 455
    .restart local v0    # "deadline":J
    :cond_2c
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v9

    sub-long v6, v0, v9

    .line 458
    .end local v0    # "deadline":J
    :cond_32
    const/4 v4, 0x0

    .line 459
    .local v4, "satisfied":Z
    const/4 v5, 0x1

    .line 461
    .local v5, "threw":Z
    :try_start_34
    invoke-virtual {p1}, Lcom/google/common/util/concurrent/Monitor$Guard;->isSatisfied()Z

    move-result v9

    if-nez v9, :cond_40

    invoke-direct {p0, p1, v6, v7, v3}, Lcom/google/common/util/concurrent/Monitor;->awaitNanos(Lcom/google/common/util/concurrent/Monitor$Guard;JZ)Z
    :try_end_3d
    .catchall {:try_start_34 .. :try_end_3d} :catchall_57

    move-result v9

    if-eqz v9, :cond_50

    :cond_40
    const/4 v4, 0x1

    .line 462
    :goto_41
    const/4 v5, 0x0

    .line 465
    if-nez v4, :cond_4e

    .line 468
    if-eqz v5, :cond_4b

    if-nez v3, :cond_4b

    .line 469
    :try_start_48
    invoke-direct {p0}, Lcom/google/common/util/concurrent/Monitor;->signalNextWaiter()V
    :try_end_4b
    .catchall {:try_start_48 .. :try_end_4b} :catchall_52

    .line 472
    :cond_4b
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    :cond_4e
    move v8, v4

    goto :goto_2b

    :cond_50
    move v4, v8

    .line 461
    goto :goto_41

    .line 472
    :catchall_52
    move-exception v8

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v8

    .line 465
    :catchall_57
    move-exception v8

    if-nez v4, :cond_64

    .line 468
    if-eqz v5, :cond_61

    if-nez v3, :cond_61

    .line 469
    :try_start_5e
    invoke-direct {p0}, Lcom/google/common/util/concurrent/Monitor;->signalNextWaiter()V
    :try_end_61
    .catchall {:try_start_5e .. :try_end_61} :catchall_65

    .line 472
    :cond_61
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    :cond_64
    throw v8

    :catchall_65
    move-exception v8

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v8
.end method

.method public enterWhenUninterruptibly(Lcom/google/common/util/concurrent/Monitor$Guard;)V
    .registers 6
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;

    .prologue
    .line 416
    iget-object v3, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->monitor:Lcom/google/common/util/concurrent/Monitor;

    if-eq v3, p0, :cond_a

    .line 417
    new-instance v3, Ljava/lang/IllegalMonitorStateException;

    invoke-direct {v3}, Ljava/lang/IllegalMonitorStateException;-><init>()V

    throw v3

    .line 419
    :cond_a
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 420
    .local v0, "lock":Ljava/util/concurrent/locks/ReentrantLock;
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v2

    .line 421
    .local v2, "signalBeforeWaiting":Z
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 423
    const/4 v1, 0x0

    .line 425
    .local v1, "satisfied":Z
    :try_start_14
    invoke-virtual {p1}, Lcom/google/common/util/concurrent/Monitor$Guard;->isSatisfied()Z

    move-result v3

    if-nez v3, :cond_1d

    .line 426
    invoke-direct {p0, p1, v2}, Lcom/google/common/util/concurrent/Monitor;->awaitUninterruptibly(Lcom/google/common/util/concurrent/Monitor$Guard;Z)V
    :try_end_1d
    .catchall {:try_start_14 .. :try_end_1d} :catchall_24

    .line 428
    :cond_1d
    const/4 v1, 0x1

    .line 430
    if-nez v1, :cond_23

    .line 431
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    .line 434
    :cond_23
    return-void

    .line 430
    :catchall_24
    move-exception v3

    if-nez v1, :cond_2a

    .line 431
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/Monitor;->leave()V

    :cond_2a
    throw v3
.end method

.method public enterWhenUninterruptibly(Lcom/google/common/util/concurrent/Monitor$Guard;JLjava/util/concurrent/TimeUnit;)Z
    .registers 20
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 485
    move-object/from16 v0, p4

    move-wide/from16 v1, p2

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v11

    .line 486
    .local v11, "timeoutNanos":J
    move-object/from16 v0, p1

    iget-object v13, v0, Lcom/google/common/util/concurrent/Monitor$Guard;->monitor:Lcom/google/common/util/concurrent/Monitor;

    if-eq v13, p0, :cond_14

    .line 487
    new-instance v13, Ljava/lang/IllegalMonitorStateException;

    invoke-direct {v13}, Ljava/lang/IllegalMonitorStateException;-><init>()V

    throw v13

    .line 489
    :cond_14
    iget-object v7, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 490
    .local v7, "lock":Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v13

    add-long v3, v13, v11

    .line 491
    .local v3, "deadline":J
    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v10

    .line 492
    .local v10, "signalBeforeWaiting":Z
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v6

    .line 494
    .local v6, "interrupted":Z
    :try_start_24
    iget-boolean v13, p0, Lcom/google/common/util/concurrent/Monitor;->fair:Z

    if-nez v13, :cond_2e

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantLock;->tryLock()Z
    :try_end_2b
    .catchall {:try_start_24 .. :try_end_2b} :catchall_7e

    move-result v13

    if-nez v13, :cond_4c

    .line 495
    :cond_2e
    const/4 v8, 0x0

    .line 498
    .local v8, "locked":Z
    :cond_2f
    :try_start_2f
    sget-object v13, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v7, v11, v12, v13}, Ljava/util/concurrent/locks/ReentrantLock;->tryLock(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_34
    .catch Ljava/lang/InterruptedException; {:try_start_2f .. :try_end_34} :catch_42
    .catchall {:try_start_2f .. :try_end_34} :catchall_7e

    move-result v8

    .line 499
    if-nez v8, :cond_44

    .line 500
    const/4 v9, 0x0

    .line 527
    if-eqz v6, :cond_41

    .line 528
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Thread;->interrupt()V

    .end local v8    # "locked":Z
    :cond_41
    :goto_41
    return v9

    .line 502
    .restart local v8    # "locked":Z
    :catch_42
    move-exception v5

    .line 503
    .local v5, "interrupt":Ljava/lang/InterruptedException;
    const/4 v6, 0x1

    .line 505
    .end local v5    # "interrupt":Ljava/lang/InterruptedException;
    :cond_44
    :try_start_44
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_47
    .catchall {:try_start_44 .. :try_end_47} :catchall_7e

    move-result-wide v13

    sub-long v11, v3, v13

    .line 506
    if-eqz v8, :cond_2f

    .line 509
    .end local v8    # "locked":Z
    :cond_4c
    const/4 v9, 0x0

    .line 513
    .local v9, "satisfied":Z
    :goto_4d
    :try_start_4d
    invoke-virtual/range {p1 .. p1}, Lcom/google/common/util/concurrent/Monitor$Guard;->isSatisfied()Z

    move-result v13

    if-nez v13, :cond_5b

    move-object/from16 v0, p1

    invoke-direct {p0, v0, v11, v12, v10}, Lcom/google/common/util/concurrent/Monitor;->awaitNanos(Lcom/google/common/util/concurrent/Monitor$Guard;JZ)Z
    :try_end_58
    .catch Ljava/lang/InterruptedException; {:try_start_4d .. :try_end_58} :catch_6d
    .catchall {:try_start_4d .. :try_end_58} :catchall_77

    move-result v13

    if-eqz v13, :cond_6b

    :cond_5b
    const/4 v9, 0x1

    .line 522
    :goto_5c
    if-nez v9, :cond_61

    .line 523
    :try_start_5e
    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
    :try_end_61
    .catchall {:try_start_5e .. :try_end_61} :catchall_7e

    .line 527
    :cond_61
    if-eqz v6, :cond_41

    .line 528
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Thread;->interrupt()V

    goto :goto_41

    .line 513
    :cond_6b
    const/4 v9, 0x0

    goto :goto_5c

    .line 515
    :catch_6d
    move-exception v5

    .line 516
    .restart local v5    # "interrupt":Ljava/lang/InterruptedException;
    const/4 v6, 0x1

    .line 517
    const/4 v10, 0x0

    .line 518
    :try_start_70
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_73
    .catchall {:try_start_70 .. :try_end_73} :catchall_77

    move-result-wide v13

    sub-long v11, v3, v13

    .line 519
    goto :goto_4d

    .line 522
    .end local v5    # "interrupt":Ljava/lang/InterruptedException;
    :catchall_77
    move-exception v13

    if-nez v9, :cond_7d

    .line 523
    :try_start_7a
    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    :cond_7d
    throw v13
    :try_end_7e
    .catchall {:try_start_7a .. :try_end_7e} :catchall_7e

    .line 527
    .end local v9    # "satisfied":Z
    :catchall_7e
    move-exception v13

    if-eqz v6, :cond_88

    .line 528
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Thread;->interrupt()V

    :cond_88
    throw v13
.end method

.method public getOccupiedDepth()I
    .registers 2

    .prologue
    .line 776
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->getHoldCount()I

    move-result v0

    return v0
.end method

.method public getQueueLength()I
    .registers 2

    .prologue
    .line 786
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->getQueueLength()I

    move-result v0

    return v0
.end method

.method public getWaitQueueLength(Lcom/google/common/util/concurrent/Monitor$Guard;)I
    .registers 4
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;

    .prologue
    .line 826
    iget-object v0, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->monitor:Lcom/google/common/util/concurrent/Monitor;

    if-eq v0, p0, :cond_a

    .line 827
    new-instance v0, Ljava/lang/IllegalMonitorStateException;

    invoke-direct {v0}, Ljava/lang/IllegalMonitorStateException;-><init>()V

    throw v0

    .line 829
    :cond_a
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 831
    :try_start_f
    iget v0, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->waiterCount:I
    :try_end_11
    .catchall {:try_start_f .. :try_end_11} :catchall_17

    .line 833
    iget-object v1, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return v0

    :catchall_17
    move-exception v0

    iget-object v1, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method public hasQueuedThread(Ljava/lang/Thread;)Z
    .registers 3
    .param p1, "thread"    # Ljava/lang/Thread;

    .prologue
    .line 806
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/locks/ReentrantLock;->hasQueuedThread(Ljava/lang/Thread;)Z

    move-result v0

    return v0
.end method

.method public hasQueuedThreads()Z
    .registers 2

    .prologue
    .line 796
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->hasQueuedThreads()Z

    move-result v0

    return v0
.end method

.method public hasWaiters(Lcom/google/common/util/concurrent/Monitor$Guard;)Z
    .registers 3
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;

    .prologue
    .line 816
    invoke-virtual {p0, p1}, Lcom/google/common/util/concurrent/Monitor;->getWaitQueueLength(Lcom/google/common/util/concurrent/Monitor$Guard;)I

    move-result v0

    if-lez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isFair()Z
    .registers 2

    .prologue
    .line 752
    iget-boolean v0, p0, Lcom/google/common/util/concurrent/Monitor;->fair:Z

    return v0
.end method

.method public isOccupied()Z
    .registers 2

    .prologue
    .line 760
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->isLocked()Z

    move-result v0

    return v0
.end method

.method public isOccupiedByCurrentThread()Z
    .registers 2

    .prologue
    .line 768
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v0

    return v0
.end method

.method public leave()V
    .registers 4

    .prologue
    .line 737
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 740
    .local v0, "lock":Ljava/util/concurrent/locks/ReentrantLock;
    :try_start_2
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->getHoldCount()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_c

    .line 741
    invoke-direct {p0}, Lcom/google/common/util/concurrent/Monitor;->signalNextWaiter()V
    :try_end_c
    .catchall {:try_start_2 .. :try_end_c} :catchall_10

    .line 744
    :cond_c
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 746
    return-void

    .line 744
    :catchall_10
    move-exception v1

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v1
.end method

.method public tryEnter()Z
    .registers 2

    .prologue
    .line 385
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->tryLock()Z

    move-result v0

    return v0
.end method

.method public tryEnterIf(Lcom/google/common/util/concurrent/Monitor$Guard;)Z
    .registers 5
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;

    .prologue
    .line 638
    iget-object v2, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->monitor:Lcom/google/common/util/concurrent/Monitor;

    if-eq v2, p0, :cond_a

    .line 639
    new-instance v2, Ljava/lang/IllegalMonitorStateException;

    invoke-direct {v2}, Ljava/lang/IllegalMonitorStateException;-><init>()V

    throw v2

    .line 641
    :cond_a
    iget-object v0, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 642
    .local v0, "lock":Ljava/util/concurrent/locks/ReentrantLock;
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->tryLock()Z

    move-result v2

    if-nez v2, :cond_14

    .line 643
    const/4 v1, 0x0

    .line 651
    :cond_13
    :goto_13
    return v1

    .line 646
    :cond_14
    const/4 v1, 0x0

    .line 648
    .local v1, "satisfied":Z
    :try_start_15
    invoke-virtual {p1}, Lcom/google/common/util/concurrent/Monitor$Guard;->isSatisfied()Z
    :try_end_18
    .catchall {:try_start_15 .. :try_end_18} :catchall_1f

    move-result v1

    .line 650
    if-nez v1, :cond_13

    .line 651
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_13

    .line 650
    :catchall_1f
    move-exception v2

    if-nez v1, :cond_25

    .line 651
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    :cond_25
    throw v2
.end method

.method public waitFor(Lcom/google/common/util/concurrent/Monitor$Guard;)V
    .registers 5
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 661
    iget-object v0, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->monitor:Lcom/google/common/util/concurrent/Monitor;

    if-ne v0, p0, :cond_15

    move v0, v1

    :goto_6
    iget-object v2, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v2

    and-int/2addr v0, v2

    if-nez v0, :cond_17

    .line 662
    new-instance v0, Ljava/lang/IllegalMonitorStateException;

    invoke-direct {v0}, Ljava/lang/IllegalMonitorStateException;-><init>()V

    throw v0

    .line 661
    :cond_15
    const/4 v0, 0x0

    goto :goto_6

    .line 664
    :cond_17
    invoke-virtual {p1}, Lcom/google/common/util/concurrent/Monitor$Guard;->isSatisfied()Z

    move-result v0

    if-nez v0, :cond_20

    .line 665
    invoke-direct {p0, p1, v1}, Lcom/google/common/util/concurrent/Monitor;->await(Lcom/google/common/util/concurrent/Monitor$Guard;Z)V

    .line 667
    :cond_20
    return-void
.end method

.method public waitFor(Lcom/google/common/util/concurrent/Monitor$Guard;JLjava/util/concurrent/TimeUnit;)Z
    .registers 11
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 689
    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    .line 690
    .local v0, "timeoutNanos":J
    iget-object v2, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->monitor:Lcom/google/common/util/concurrent/Monitor;

    if-ne v2, p0, :cond_1a

    move v2, v3

    :goto_b
    iget-object v5, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v5

    and-int/2addr v2, v5

    if-nez v2, :cond_1c

    .line 691
    new-instance v2, Ljava/lang/IllegalMonitorStateException;

    invoke-direct {v2}, Ljava/lang/IllegalMonitorStateException;-><init>()V

    throw v2

    :cond_1a
    move v2, v4

    .line 690
    goto :goto_b

    .line 693
    :cond_1c
    invoke-virtual {p1}, Lcom/google/common/util/concurrent/Monitor$Guard;->isSatisfied()Z

    move-result v2

    if-nez v2, :cond_28

    invoke-direct {p0, p1, v0, v1, v3}, Lcom/google/common/util/concurrent/Monitor;->awaitNanos(Lcom/google/common/util/concurrent/Monitor$Guard;JZ)Z

    move-result v2

    if-eqz v2, :cond_29

    :cond_28
    move v4, v3

    :cond_29
    return v4
.end method

.method public waitForUninterruptibly(Lcom/google/common/util/concurrent/Monitor$Guard;)V
    .registers 5
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;

    .prologue
    const/4 v1, 0x1

    .line 674
    iget-object v0, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->monitor:Lcom/google/common/util/concurrent/Monitor;

    if-ne v0, p0, :cond_15

    move v0, v1

    :goto_6
    iget-object v2, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v2

    and-int/2addr v0, v2

    if-nez v0, :cond_17

    .line 675
    new-instance v0, Ljava/lang/IllegalMonitorStateException;

    invoke-direct {v0}, Ljava/lang/IllegalMonitorStateException;-><init>()V

    throw v0

    .line 674
    :cond_15
    const/4 v0, 0x0

    goto :goto_6

    .line 677
    :cond_17
    invoke-virtual {p1}, Lcom/google/common/util/concurrent/Monitor$Guard;->isSatisfied()Z

    move-result v0

    if-nez v0, :cond_20

    .line 678
    invoke-direct {p0, p1, v1}, Lcom/google/common/util/concurrent/Monitor;->awaitUninterruptibly(Lcom/google/common/util/concurrent/Monitor$Guard;Z)V

    .line 680
    :cond_20
    return-void
.end method

.method public waitForUninterruptibly(Lcom/google/common/util/concurrent/Monitor$Guard;JLjava/util/concurrent/TimeUnit;)Z
    .registers 16
    .param p1, "guard"    # Lcom/google/common/util/concurrent/Monitor$Guard;
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    const/4 v8, 0x1

    .line 703
    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v5

    .line 704
    .local v5, "timeoutNanos":J
    iget-object v7, p1, Lcom/google/common/util/concurrent/Monitor$Guard;->monitor:Lcom/google/common/util/concurrent/Monitor;

    if-ne v7, p0, :cond_19

    move v7, v8

    :goto_a
    iget-object v9, p0, Lcom/google/common/util/concurrent/Monitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v9}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v9

    and-int/2addr v7, v9

    if-nez v7, :cond_1b

    .line 705
    new-instance v7, Ljava/lang/IllegalMonitorStateException;

    invoke-direct {v7}, Ljava/lang/IllegalMonitorStateException;-><init>()V

    throw v7

    .line 704
    :cond_19
    const/4 v7, 0x0

    goto :goto_a

    .line 707
    :cond_1b
    invoke-virtual {p1}, Lcom/google/common/util/concurrent/Monitor$Guard;->isSatisfied()Z

    move-result v7

    if-eqz v7, :cond_22

    .line 728
    :cond_21
    :goto_21
    return v8

    .line 710
    :cond_22
    const/4 v4, 0x1

    .line 711
    .local v4, "signalBeforeWaiting":Z
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v9

    add-long v0, v9, v5

    .line 712
    .local v0, "deadline":J
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v3

    .line 716
    .local v3, "interrupted":Z
    :goto_2d
    :try_start_2d
    invoke-direct {p0, p1, v5, v6, v4}, Lcom/google/common/util/concurrent/Monitor;->awaitNanos(Lcom/google/common/util/concurrent/Monitor$Guard;JZ)Z
    :try_end_30
    .catch Ljava/lang/InterruptedException; {:try_start_2d .. :try_end_30} :catch_3b
    .catchall {:try_start_2d .. :try_end_30} :catchall_55

    move-result v8

    .line 727
    if-eqz v3, :cond_21

    .line 728
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->interrupt()V

    goto :goto_21

    .line 717
    :catch_3b
    move-exception v2

    .line 718
    .local v2, "interrupt":Ljava/lang/InterruptedException;
    const/4 v3, 0x1

    .line 719
    :try_start_3d
    invoke-virtual {p1}, Lcom/google/common/util/concurrent/Monitor$Guard;->isSatisfied()Z
    :try_end_40
    .catchall {:try_start_3d .. :try_end_40} :catchall_55

    move-result v7

    if-eqz v7, :cond_4d

    .line 727
    if-eqz v3, :cond_21

    .line 728
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->interrupt()V

    goto :goto_21

    .line 722
    :cond_4d
    const/4 v4, 0x0

    .line 723
    :try_start_4e
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_51
    .catchall {:try_start_4e .. :try_end_51} :catchall_55

    move-result-wide v9

    sub-long v5, v0, v9

    .line 724
    goto :goto_2d

    .line 727
    .end local v2    # "interrupt":Ljava/lang/InterruptedException;
    :catchall_55
    move-exception v7

    if-eqz v3, :cond_5f

    .line 728
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Thread;->interrupt()V

    :cond_5f
    throw v7
.end method
