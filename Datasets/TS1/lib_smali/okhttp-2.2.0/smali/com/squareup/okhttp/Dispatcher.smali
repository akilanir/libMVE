.class public final Lcom/squareup/okhttp/Dispatcher;
.super Ljava/lang/Object;
.source "Dispatcher.java"


# instance fields
.field private final executedCalls:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque",
            "<",
            "Lcom/squareup/okhttp/Call;",
            ">;"
        }
    .end annotation
.end field

.field private executorService:Ljava/util/concurrent/ExecutorService;

.field private maxRequests:I

.field private maxRequestsPerHost:I

.field private final readyCalls:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque",
            "<",
            "Lcom/squareup/okhttp/Call$AsyncCall;",
            ">;"
        }
    .end annotation
.end field

.field private final runningCalls:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque",
            "<",
            "Lcom/squareup/okhttp/Call$AsyncCall;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/16 v0, 0x40

    iput v0, p0, Lcom/squareup/okhttp/Dispatcher;->maxRequests:I

    .line 38
    const/4 v0, 0x5

    iput v0, p0, Lcom/squareup/okhttp/Dispatcher;->maxRequestsPerHost:I

    .line 44
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/Dispatcher;->readyCalls:Ljava/util/Deque;

    .line 47
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/Dispatcher;->runningCalls:Ljava/util/Deque;

    .line 50
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/Dispatcher;->executedCalls:Ljava/util/Deque;

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ExecutorService;)V
    .registers 3
    .param p1, "executorService"    # Ljava/util/concurrent/ExecutorService;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/16 v0, 0x40

    iput v0, p0, Lcom/squareup/okhttp/Dispatcher;->maxRequests:I

    .line 38
    const/4 v0, 0x5

    iput v0, p0, Lcom/squareup/okhttp/Dispatcher;->maxRequestsPerHost:I

    .line 44
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/Dispatcher;->readyCalls:Ljava/util/Deque;

    .line 47
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/Dispatcher;->runningCalls:Ljava/util/Deque;

    .line 50
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/Dispatcher;->executedCalls:Ljava/util/Deque;

    .line 53
    iput-object p1, p0, Lcom/squareup/okhttp/Dispatcher;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 54
    return-void
.end method

.method private promoteCalls()V
    .registers 5

    .prologue
    .line 146
    iget-object v2, p0, Lcom/squareup/okhttp/Dispatcher;->runningCalls:Ljava/util/Deque;

    invoke-interface {v2}, Ljava/util/Deque;->size()I

    move-result v2

    iget v3, p0, Lcom/squareup/okhttp/Dispatcher;->maxRequests:I

    if-lt v2, v3, :cond_b

    .line 160
    :cond_a
    :goto_a
    return-void

    .line 147
    :cond_b
    iget-object v2, p0, Lcom/squareup/okhttp/Dispatcher;->readyCalls:Ljava/util/Deque;

    invoke-interface {v2}, Ljava/util/Deque;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_a

    .line 149
    iget-object v2, p0, Lcom/squareup/okhttp/Dispatcher;->readyCalls:Ljava/util/Deque;

    invoke-interface {v2}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/squareup/okhttp/Call$AsyncCall;>;"
    :cond_19
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 150
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/Call$AsyncCall;

    .line 152
    .local v0, "call":Lcom/squareup/okhttp/Call$AsyncCall;
    invoke-direct {p0, v0}, Lcom/squareup/okhttp/Dispatcher;->runningCallsForHost(Lcom/squareup/okhttp/Call$AsyncCall;)I

    move-result v2

    iget v3, p0, Lcom/squareup/okhttp/Dispatcher;->maxRequestsPerHost:I

    if-ge v2, v3, :cond_3c

    .line 153
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 154
    iget-object v2, p0, Lcom/squareup/okhttp/Dispatcher;->runningCalls:Ljava/util/Deque;

    invoke-interface {v2, v0}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 155
    invoke-virtual {p0}, Lcom/squareup/okhttp/Dispatcher;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 158
    :cond_3c
    iget-object v2, p0, Lcom/squareup/okhttp/Dispatcher;->runningCalls:Ljava/util/Deque;

    invoke-interface {v2}, Ljava/util/Deque;->size()I

    move-result v2

    iget v3, p0, Lcom/squareup/okhttp/Dispatcher;->maxRequests:I

    if-lt v2, v3, :cond_19

    goto :goto_a
.end method

.method private runningCallsForHost(Lcom/squareup/okhttp/Call$AsyncCall;)I
    .registers 7
    .param p1, "call"    # Lcom/squareup/okhttp/Call$AsyncCall;

    .prologue
    .line 164
    const/4 v1, 0x0

    .line 165
    .local v1, "result":I
    iget-object v2, p0, Lcom/squareup/okhttp/Dispatcher;->runningCalls:Ljava/util/Deque;

    invoke-interface {v2}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_7
    :goto_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_24

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/Call$AsyncCall;

    .line 166
    .local v0, "c":Lcom/squareup/okhttp/Call$AsyncCall;
    invoke-virtual {v0}, Lcom/squareup/okhttp/Call$AsyncCall;->host()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/squareup/okhttp/Call$AsyncCall;->host()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 168
    .end local v0    # "c":Lcom/squareup/okhttp/Call$AsyncCall;
    :cond_24
    return v1
.end method


# virtual methods
.method public declared-synchronized cancel(Ljava/lang/Object;)V
    .registers 7
    .param p1, "tag"    # Ljava/lang/Object;

    .prologue
    .line 118
    monitor-enter p0

    :try_start_1
    iget-object v2, p0, Lcom/squareup/okhttp/Dispatcher;->readyCalls:Ljava/util/Deque;

    invoke-interface {v2}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_7
    :goto_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_24

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/Call$AsyncCall;

    .line 119
    .local v0, "call":Lcom/squareup/okhttp/Call$AsyncCall;
    invoke-virtual {v0}, Lcom/squareup/okhttp/Call$AsyncCall;->tag()Ljava/lang/Object;

    move-result-object v3

    invoke-static {p1, v3}, Lcom/squareup/okhttp/internal/Util;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 120
    invoke-virtual {v0}, Lcom/squareup/okhttp/Call$AsyncCall;->cancel()V
    :try_end_20
    .catchall {:try_start_1 .. :try_end_20} :catchall_21

    goto :goto_7

    .line 118
    .end local v0    # "call":Lcom/squareup/okhttp/Call$AsyncCall;
    :catchall_21
    move-exception v2

    monitor-exit p0

    throw v2

    .line 124
    :cond_24
    :try_start_24
    iget-object v2, p0, Lcom/squareup/okhttp/Dispatcher;->runningCalls:Ljava/util/Deque;

    invoke-interface {v2}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2a
    :goto_2a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_53

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/Call$AsyncCall;

    .line 125
    .restart local v0    # "call":Lcom/squareup/okhttp/Call$AsyncCall;
    invoke-virtual {v0}, Lcom/squareup/okhttp/Call$AsyncCall;->tag()Ljava/lang/Object;

    move-result-object v3

    invoke-static {p1, v3}, Lcom/squareup/okhttp/internal/Util;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 126
    invoke-virtual {v0}, Lcom/squareup/okhttp/Call$AsyncCall;->get()Lcom/squareup/okhttp/Call;

    move-result-object v3

    const/4 v4, 0x1

    iput-boolean v4, v3, Lcom/squareup/okhttp/Call;->canceled:Z

    .line 127
    invoke-virtual {v0}, Lcom/squareup/okhttp/Call$AsyncCall;->get()Lcom/squareup/okhttp/Call;

    move-result-object v3

    iget-object v1, v3, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    .line 128
    .local v1, "engine":Lcom/squareup/okhttp/internal/http/HttpEngine;
    if-eqz v1, :cond_2a

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->disconnect()V

    goto :goto_2a

    .line 132
    .end local v0    # "call":Lcom/squareup/okhttp/Call$AsyncCall;
    .end local v1    # "engine":Lcom/squareup/okhttp/internal/http/HttpEngine;
    :cond_53
    iget-object v2, p0, Lcom/squareup/okhttp/Dispatcher;->executedCalls:Ljava/util/Deque;

    invoke-interface {v2}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_59
    :goto_59
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_73

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/Call;

    .line 133
    .local v0, "call":Lcom/squareup/okhttp/Call;
    invoke-virtual {v0}, Lcom/squareup/okhttp/Call;->tag()Ljava/lang/Object;

    move-result-object v3

    invoke-static {p1, v3}, Lcom/squareup/okhttp/internal/Util;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_59

    .line 134
    invoke-virtual {v0}, Lcom/squareup/okhttp/Call;->cancel()V
    :try_end_72
    .catchall {:try_start_24 .. :try_end_72} :catchall_21

    goto :goto_59

    .line 137
    .end local v0    # "call":Lcom/squareup/okhttp/Call;
    :cond_73
    monitor-exit p0

    return-void
.end method

.method declared-synchronized enqueue(Lcom/squareup/okhttp/Call$AsyncCall;)V
    .registers 4
    .param p1, "call"    # Lcom/squareup/okhttp/Call$AsyncCall;

    .prologue
    .line 108
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/squareup/okhttp/Dispatcher;->runningCalls:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->size()I

    move-result v0

    iget v1, p0, Lcom/squareup/okhttp/Dispatcher;->maxRequests:I

    if-ge v0, v1, :cond_21

    invoke-direct {p0, p1}, Lcom/squareup/okhttp/Dispatcher;->runningCallsForHost(Lcom/squareup/okhttp/Call$AsyncCall;)I

    move-result v0

    iget v1, p0, Lcom/squareup/okhttp/Dispatcher;->maxRequestsPerHost:I

    if-ge v0, v1, :cond_21

    .line 109
    iget-object v0, p0, Lcom/squareup/okhttp/Dispatcher;->runningCalls:Ljava/util/Deque;

    invoke-interface {v0, p1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 110
    invoke-virtual {p0}, Lcom/squareup/okhttp/Dispatcher;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_1f
    .catchall {:try_start_1 .. :try_end_1f} :catchall_27

    .line 114
    :goto_1f
    monitor-exit p0

    return-void

    .line 112
    :cond_21
    :try_start_21
    iget-object v0, p0, Lcom/squareup/okhttp/Dispatcher;->readyCalls:Ljava/util/Deque;

    invoke-interface {v0, p1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z
    :try_end_26
    .catchall {:try_start_21 .. :try_end_26} :catchall_27

    goto :goto_1f

    .line 108
    :catchall_27
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized executed(Lcom/squareup/okhttp/Call;)V
    .registers 3
    .param p1, "call"    # Lcom/squareup/okhttp/Call;

    .prologue
    .line 173
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/squareup/okhttp/Dispatcher;->executedCalls:Ljava/util/Deque;

    invoke-interface {v0, p1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 174
    monitor-exit p0

    return-void

    .line 173
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized finished(Lcom/squareup/okhttp/Call$AsyncCall;)V
    .registers 4
    .param p1, "call"    # Lcom/squareup/okhttp/Call$AsyncCall;

    .prologue
    .line 141
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/squareup/okhttp/Dispatcher;->runningCalls:Ljava/util/Deque;

    invoke-interface {v0, p1}, Ljava/util/Deque;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "AsyncCall wasn\'t running!"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_11

    :catchall_11
    move-exception v0

    monitor-exit p0

    throw v0

    .line 142
    :cond_14
    :try_start_14
    invoke-direct {p0}, Lcom/squareup/okhttp/Dispatcher;->promoteCalls()V
    :try_end_17
    .catchall {:try_start_14 .. :try_end_17} :catchall_11

    .line 143
    monitor-exit p0

    return-void
.end method

.method declared-synchronized finished(Lcom/squareup/okhttp/Call;)V
    .registers 4
    .param p1, "call"    # Lcom/squareup/okhttp/Call;

    .prologue
    .line 178
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/squareup/okhttp/Dispatcher;->executedCalls:Ljava/util/Deque;

    invoke-interface {v0, p1}, Ljava/util/Deque;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Call wasn\'t in-flight!"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_11

    :catchall_11
    move-exception v0

    monitor-exit p0

    throw v0

    .line 179
    :cond_14
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized getExecutorService()Ljava/util/concurrent/ExecutorService;
    .registers 10

    .prologue
    .line 60
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/squareup/okhttp/Dispatcher;->executorService:Ljava/util/concurrent/ExecutorService;

    if-nez v0, :cond_20

    .line 61
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v1, 0x0

    const v2, 0x7fffffff

    const-wide/16 v3, 0x3c

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v6}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    const-string v7, "OkHttp Dispatcher"

    const/4 v8, 0x0

    .line 62
    invoke-static {v7, v8}, Lcom/squareup/okhttp/internal/Util;->threadFactory(Ljava/lang/String;Z)Ljava/util/concurrent/ThreadFactory;

    move-result-object v7

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    iput-object v0, p0, Lcom/squareup/okhttp/Dispatcher;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 64
    :cond_20
    iget-object v0, p0, Lcom/squareup/okhttp/Dispatcher;->executorService:Ljava/util/concurrent/ExecutorService;
    :try_end_22
    .catchall {:try_start_1 .. :try_end_22} :catchall_24

    monitor-exit p0

    return-object v0

    .line 60
    :catchall_24
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getMaxRequests()I
    .registers 2

    .prologue
    .line 83
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/squareup/okhttp/Dispatcher;->maxRequests:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getMaxRequestsPerHost()I
    .registers 2

    .prologue
    .line 104
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/squareup/okhttp/Dispatcher;->maxRequestsPerHost:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setMaxRequests(I)V
    .registers 5
    .param p1, "maxRequests"    # I

    .prologue
    .line 75
    monitor-enter p0

    const/4 v0, 0x1

    if-ge p1, v0, :cond_20

    .line 76
    :try_start_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "max < 1: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1d
    .catchall {:try_start_4 .. :try_end_1d} :catchall_1d

    .line 75
    :catchall_1d
    move-exception v0

    monitor-exit p0

    throw v0

    .line 78
    :cond_20
    :try_start_20
    iput p1, p0, Lcom/squareup/okhttp/Dispatcher;->maxRequests:I

    .line 79
    invoke-direct {p0}, Lcom/squareup/okhttp/Dispatcher;->promoteCalls()V
    :try_end_25
    .catchall {:try_start_20 .. :try_end_25} :catchall_1d

    .line 80
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setMaxRequestsPerHost(I)V
    .registers 5
    .param p1, "maxRequestsPerHost"    # I

    .prologue
    .line 96
    monitor-enter p0

    const/4 v0, 0x1

    if-ge p1, v0, :cond_20

    .line 97
    :try_start_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "max < 1: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1d
    .catchall {:try_start_4 .. :try_end_1d} :catchall_1d

    .line 96
    :catchall_1d
    move-exception v0

    monitor-exit p0

    throw v0

    .line 99
    :cond_20
    :try_start_20
    iput p1, p0, Lcom/squareup/okhttp/Dispatcher;->maxRequestsPerHost:I

    .line 100
    invoke-direct {p0}, Lcom/squareup/okhttp/Dispatcher;->promoteCalls()V
    :try_end_25
    .catchall {:try_start_20 .. :try_end_25} :catchall_1d

    .line 101
    monitor-exit p0

    return-void
.end method
