.class public Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;
.super Ljava/util/concurrent/PriorityBlockingQueue;
.source "PausablePriorityBlockingQueue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/PriorityBlockingQueue",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x33b5af8ae162d0caL


# instance fields
.field private isPaused:Z

.field private transient pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

.field private transient unpaused:Ljava/util/concurrent/locks/Condition;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 21
    .local p0, "this":Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;, "Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue<TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/PriorityBlockingQueue;-><init>()V

    .line 17
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 18
    iget-object v0, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->unpaused:Ljava/util/concurrent/locks/Condition;

    .line 22
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 4
    .param p1, "ois"    # Ljava/io/ObjectInputStream;

    .prologue
    .line 91
    .local p0, "this":Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;, "Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue<TT;>;"
    :try_start_0
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 92
    new-instance v1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v1, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 93
    iget-object v1, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_f} :catch_10

    .line 97
    :goto_f
    return-void

    .line 94
    :catch_10
    move-exception v0

    .line 95
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_f
.end method


# virtual methods
.method public pause()V
    .registers 3

    .prologue
    .line 70
    .local p0, "this":Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;, "Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue<TT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 72
    const/4 v0, 0x1

    :try_start_6
    iput-boolean v0, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->isPaused:Z
    :try_end_8
    .catchall {:try_start_6 .. :try_end_8} :catchall_e

    .line 74
    iget-object v0, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 76
    return-void

    .line 74
    :catchall_e
    move-exception v0

    iget-object v1, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method public poll()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 26
    .local p0, "this":Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;, "Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue<TT;>;"
    iget-object v1, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 28
    :goto_5
    :try_start_5
    iget-boolean v1, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->isPaused:Z

    if-eqz v1, :cond_1f

    .line 29
    iget-object v1, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->unpaused:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_e
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_e} :catch_f
    .catchall {:try_start_5 .. :try_end_e} :catchall_18

    goto :goto_5

    .line 31
    :catch_f
    move-exception v0

    .line 32
    .local v0, "ie":Ljava/lang/InterruptedException;
    :try_start_10
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Interrupted while paused."

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_18
    .catchall {:try_start_10 .. :try_end_18} :catchall_18

    .line 34
    .end local v0    # "ie":Ljava/lang/InterruptedException;
    :catchall_18
    move-exception v1

    iget-object v2, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v1

    :cond_1f
    iget-object v1, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 36
    invoke-super {p0}, Ljava/util/concurrent/PriorityBlockingQueue;->poll()Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .registers 7
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;, "Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue<TT;>;"
    iget-object v1, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 43
    :goto_5
    :try_start_5
    iget-boolean v1, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->isPaused:Z

    if-eqz v1, :cond_1f

    .line 44
    iget-object v1, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->unpaused:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_e
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_e} :catch_f
    .catchall {:try_start_5 .. :try_end_e} :catchall_18

    goto :goto_5

    .line 46
    :catch_f
    move-exception v0

    .line 47
    .local v0, "ie":Ljava/lang/InterruptedException;
    :try_start_10
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Interrupted while paused."

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_18
    .catchall {:try_start_10 .. :try_end_18} :catchall_18

    .line 49
    .end local v0    # "ie":Ljava/lang/InterruptedException;
    :catchall_18
    move-exception v1

    iget-object v2, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v1

    :cond_1f
    iget-object v1, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 51
    invoke-super {p0, p1, p2, p3}, Ljava/util/concurrent/PriorityBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public resume()V
    .registers 3

    .prologue
    .line 79
    .local p0, "this":Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;, "Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue<TT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 81
    const/4 v0, 0x0

    :try_start_6
    iput-boolean v0, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->isPaused:Z

    .line 82
    iget-object v0, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->unpaused:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_d
    .catchall {:try_start_6 .. :try_end_d} :catchall_13

    .line 84
    iget-object v0, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 86
    return-void

    .line 84
    :catchall_13
    move-exception v0

    iget-object v1, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method public take()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 56
    .local p0, "this":Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;, "Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue<TT;>;"
    iget-object v1, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 58
    :goto_5
    :try_start_5
    iget-boolean v1, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->isPaused:Z

    if-eqz v1, :cond_1f

    .line 59
    iget-object v1, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->unpaused:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_e
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_e} :catch_f
    .catchall {:try_start_5 .. :try_end_e} :catchall_18

    goto :goto_5

    .line 61
    :catch_f
    move-exception v0

    .line 62
    .local v0, "ie":Ljava/lang/InterruptedException;
    :try_start_10
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Interrupted while paused."

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_18
    .catchall {:try_start_10 .. :try_end_18} :catchall_18

    .line 64
    .end local v0    # "ie":Ljava/lang/InterruptedException;
    :catchall_18
    move-exception v1

    iget-object v2, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v1

    :cond_1f
    iget-object v1, p0, Lcom/octo/android/robospice/priority/PausablePriorityBlockingQueue;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 66
    invoke-super {p0}, Ljava/util/concurrent/PriorityBlockingQueue;->take()Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method
