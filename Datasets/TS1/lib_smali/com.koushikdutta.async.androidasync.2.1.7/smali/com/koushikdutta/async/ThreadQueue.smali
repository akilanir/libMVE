.class public Lcom/koushikdutta/async/ThreadQueue;
.super Ljava/util/LinkedList;
.source "ThreadQueue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedList",
        "<",
        "Ljava/lang/Runnable;",
        ">;"
    }
.end annotation


# static fields
.field private static final mThreadQueues:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Ljava/lang/Thread;",
            "Lcom/koushikdutta/async/ThreadQueue;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field queueSemaphore:Ljava/util/concurrent/Semaphore;

.field waiter:Lcom/koushikdutta/async/AsyncSemaphore;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 8
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/koushikdutta/async/ThreadQueue;->mThreadQueues:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/util/LinkedList;-><init>()V

    .line 33
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lcom/koushikdutta/async/ThreadQueue;->queueSemaphore:Ljava/util/concurrent/Semaphore;

    return-void
.end method

.method static getOrCreateThreadQueue(Ljava/lang/Thread;)Lcom/koushikdutta/async/ThreadQueue;
    .registers 4
    .param p0, "thread"    # Ljava/lang/Thread;

    .prologue
    .line 12
    sget-object v2, Lcom/koushikdutta/async/ThreadQueue;->mThreadQueues:Ljava/util/WeakHashMap;

    monitor-enter v2

    .line 13
    :try_start_3
    sget-object v1, Lcom/koushikdutta/async/ThreadQueue;->mThreadQueues:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/ThreadQueue;

    .line 14
    .local v0, "queue":Lcom/koushikdutta/async/ThreadQueue;
    if-nez v0, :cond_17

    .line 15
    new-instance v0, Lcom/koushikdutta/async/ThreadQueue;

    .end local v0    # "queue":Lcom/koushikdutta/async/ThreadQueue;
    invoke-direct {v0}, Lcom/koushikdutta/async/ThreadQueue;-><init>()V

    .line 16
    .restart local v0    # "queue":Lcom/koushikdutta/async/ThreadQueue;
    sget-object v1, Lcom/koushikdutta/async/ThreadQueue;->mThreadQueues:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    :cond_17
    monitor-exit v2

    .line 20
    return-object v0

    .line 18
    .end local v0    # "queue":Lcom/koushikdutta/async/ThreadQueue;
    :catchall_19
    move-exception v1

    monitor-exit v2
    :try_end_1b
    .catchall {:try_start_3 .. :try_end_1b} :catchall_19

    throw v1
.end method

.method static release(Lcom/koushikdutta/async/AsyncSemaphore;)V
    .registers 5
    .param p0, "semaphore"    # Lcom/koushikdutta/async/AsyncSemaphore;

    .prologue
    .line 24
    sget-object v3, Lcom/koushikdutta/async/ThreadQueue;->mThreadQueues:Ljava/util/WeakHashMap;

    monitor-enter v3

    .line 25
    :try_start_3
    sget-object v2, Lcom/koushikdutta/async/ThreadQueue;->mThreadQueues:Ljava/util/WeakHashMap;

    invoke-virtual {v2}, Ljava/util/WeakHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_d
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_26

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/async/ThreadQueue;

    .line 26
    .local v1, "threadQueue":Lcom/koushikdutta/async/ThreadQueue;
    iget-object v2, v1, Lcom/koushikdutta/async/ThreadQueue;->waiter:Lcom/koushikdutta/async/AsyncSemaphore;

    if-ne v2, p0, :cond_d

    .line 27
    iget-object v2, v1, Lcom/koushikdutta/async/ThreadQueue;->queueSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    goto :goto_d

    .line 29
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "threadQueue":Lcom/koushikdutta/async/ThreadQueue;
    :catchall_23
    move-exception v2

    monitor-exit v3
    :try_end_25
    .catchall {:try_start_3 .. :try_end_25} :catchall_23

    throw v2

    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_26
    :try_start_26
    monitor-exit v3
    :try_end_27
    .catchall {:try_start_26 .. :try_end_27} :catchall_23

    .line 30
    return-void
.end method


# virtual methods
.method public bridge synthetic add(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 7
    check-cast p1, Ljava/lang/Runnable;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/ThreadQueue;->add(Ljava/lang/Runnable;)Z

    move-result v0

    return v0
.end method

.method public add(Ljava/lang/Runnable;)Z
    .registers 3
    .param p1, "object"    # Ljava/lang/Runnable;

    .prologue
    .line 37
    monitor-enter p0

    .line 38
    :try_start_1
    invoke-super {p0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit p0

    return v0

    .line 39
    :catchall_7
    move-exception v0

    monitor-exit p0
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public bridge synthetic remove()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 7
    invoke-virtual {p0}, Lcom/koushikdutta/async/ThreadQueue;->remove()Ljava/lang/Runnable;

    move-result-object v0

    return-object v0
.end method

.method public remove()Ljava/lang/Runnable;
    .registers 2

    .prologue
    .line 51
    monitor-enter p0

    .line 52
    :try_start_1
    invoke-virtual {p0}, Lcom/koushikdutta/async/ThreadQueue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 53
    const/4 v0, 0x0

    monitor-exit p0

    .line 54
    :goto_9
    return-object v0

    :cond_a
    invoke-super {p0}, Ljava/util/LinkedList;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    monitor-exit p0

    goto :goto_9

    .line 55
    :catchall_12
    move-exception v0

    monitor-exit p0
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_12

    throw v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 44
    monitor-enter p0

    .line 45
    :try_start_1
    invoke-super {p0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit p0

    return v0

    .line 46
    :catchall_7
    move-exception v0

    monitor-exit p0
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_7

    throw v0
.end method
