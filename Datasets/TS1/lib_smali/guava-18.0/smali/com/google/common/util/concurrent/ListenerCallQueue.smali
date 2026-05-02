.class final Lcom/google/common/util/concurrent/ListenerCallQueue;
.super Ljava/lang/Object;
.source "ListenerCallQueue.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/util/concurrent/ListenerCallQueue$Callback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<",
        "L:Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# static fields
.field private static final logger:Ljava/util/logging/Logger;


# instance fields
.field private final executor:Ljava/util/concurrent/Executor;

.field private isThreadScheduled:Z
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private final listener:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "T",
            "L;"
        }
    .end annotation
.end field

.field private final waitQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/google/common/util/concurrent/ListenerCallQueue$Callback",
            "<T",
            "L;",
            ">;>;"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "this"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 40
    const-class v0, Lcom/google/common/util/concurrent/ListenerCallQueue;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/google/common/util/concurrent/ListenerCallQueue;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method constructor <init>(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V
    .registers 4
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(T",
            "L;",
            "Ljava/util/concurrent/Executor;",
            ")V"
        }
    .end annotation

    .prologue
    .line 65
    .local p0, "this":Lcom/google/common/util/concurrent/ListenerCallQueue;, "Lcom/google/common/util/concurrent/ListenerCallQueue<TL;>;"
    .local p1, "listener":Ljava/lang/Object;, "TL;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    invoke-static {}, Lcom/google/common/collect/Queues;->newArrayDeque()Ljava/util/ArrayDeque;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/util/concurrent/ListenerCallQueue;->waitQueue:Ljava/util/Queue;

    .line 66
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/util/concurrent/ListenerCallQueue;->listener:Ljava/lang/Object;

    .line 67
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Executor;

    iput-object v0, p0, Lcom/google/common/util/concurrent/ListenerCallQueue;->executor:Ljava/util/concurrent/Executor;

    .line 68
    return-void
.end method


# virtual methods
.method declared-synchronized add(Lcom/google/common/util/concurrent/ListenerCallQueue$Callback;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/ListenerCallQueue$Callback",
            "<T",
            "L;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 72
    .local p0, "this":Lcom/google/common/util/concurrent/ListenerCallQueue;, "Lcom/google/common/util/concurrent/ListenerCallQueue<TL;>;"
    .local p1, "callback":Lcom/google/common/util/concurrent/ListenerCallQueue$Callback;, "Lcom/google/common/util/concurrent/ListenerCallQueue$Callback<TL;>;"
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/google/common/util/concurrent/ListenerCallQueue;->waitQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 73
    monitor-exit p0

    return-void

    .line 72
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method execute()V
    .registers 10

    .prologue
    .line 77
    .local p0, "this":Lcom/google/common/util/concurrent/ListenerCallQueue;, "Lcom/google/common/util/concurrent/ListenerCallQueue<TL;>;"
    const/4 v1, 0x0

    .line 78
    .local v1, "scheduleTaskRunner":Z
    monitor-enter p0

    .line 79
    :try_start_2
    iget-boolean v2, p0, Lcom/google/common/util/concurrent/ListenerCallQueue;->isThreadScheduled:Z

    if-nez v2, :cond_a

    .line 80
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/google/common/util/concurrent/ListenerCallQueue;->isThreadScheduled:Z

    .line 81
    const/4 v1, 0x1

    .line 83
    :cond_a
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_2 .. :try_end_b} :catchall_13

    .line 84
    if-eqz v1, :cond_12

    .line 86
    :try_start_d
    iget-object v2, p0, Lcom/google/common/util/concurrent/ListenerCallQueue;->executor:Ljava/util/concurrent/Executor;

    invoke-interface {v2, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_12
    .catch Ljava/lang/RuntimeException; {:try_start_d .. :try_end_12} :catch_16

    .line 99
    :cond_12
    return-void

    .line 83
    :catchall_13
    move-exception v2

    :try_start_14
    monitor-exit p0
    :try_end_15
    .catchall {:try_start_14 .. :try_end_15} :catchall_13

    throw v2

    .line 87
    :catch_16
    move-exception v0

    .line 89
    .local v0, "e":Ljava/lang/RuntimeException;
    monitor-enter p0

    .line 90
    const/4 v2, 0x0

    :try_start_19
    iput-boolean v2, p0, Lcom/google/common/util/concurrent/ListenerCallQueue;->isThreadScheduled:Z

    .line 91
    monitor-exit p0
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_60

    .line 93
    sget-object v2, Lcom/google/common/util/concurrent/ListenerCallQueue;->logger:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    iget-object v4, p0, Lcom/google/common/util/concurrent/ListenerCallQueue;->listener:Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/google/common/util/concurrent/ListenerCallQueue;->executor:Ljava/util/concurrent/Executor;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, 0x2a

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v7, v8

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v7, "Exception while running callbacks for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " on "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 96
    throw v0

    .line 91
    :catchall_60
    move-exception v2

    :try_start_61
    monitor-exit p0
    :try_end_62
    .catchall {:try_start_61 .. :try_end_62} :catchall_60

    throw v2
.end method

.method public run()V
    .registers 11

    .prologue
    .line 102
    .local p0, "this":Lcom/google/common/util/concurrent/ListenerCallQueue;, "Lcom/google/common/util/concurrent/ListenerCallQueue<TL;>;"
    const/4 v2, 0x1

    .line 106
    .local v2, "stillRunning":Z
    :goto_1
    :try_start_1
    monitor-enter p0
    :try_end_2
    .catchall {:try_start_1 .. :try_end_2} :catchall_6c

    .line 107
    :try_start_2
    iget-boolean v3, p0, Lcom/google/common/util/concurrent/ListenerCallQueue;->isThreadScheduled:Z

    invoke-static {v3}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 108
    iget-object v3, p0, Lcom/google/common/util/concurrent/ListenerCallQueue;->waitQueue:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/util/concurrent/ListenerCallQueue$Callback;

    .line 109
    .local v1, "nextToRun":Lcom/google/common/util/concurrent/ListenerCallQueue$Callback;, "Lcom/google/common/util/concurrent/ListenerCallQueue$Callback<TL;>;"
    if-nez v1, :cond_1e

    .line 110
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/common/util/concurrent/ListenerCallQueue;->isThreadScheduled:Z

    .line 111
    const/4 v2, 0x0

    .line 112
    monitor-exit p0
    :try_end_16
    .catchall {:try_start_2 .. :try_end_16} :catchall_75

    .line 127
    if-eqz v2, :cond_1d

    .line 131
    monitor-enter p0

    .line 132
    const/4 v3, 0x0

    :try_start_1a
    iput-boolean v3, p0, Lcom/google/common/util/concurrent/ListenerCallQueue;->isThreadScheduled:Z

    .line 133
    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_1a .. :try_end_1d} :catchall_78

    .line 136
    :cond_1d
    return-void

    .line 114
    :cond_1e
    :try_start_1e
    monitor-exit p0
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_75

    .line 118
    :try_start_1f
    iget-object v3, p0, Lcom/google/common/util/concurrent/ListenerCallQueue;->listener:Ljava/lang/Object;

    invoke-virtual {v1, v3}, Lcom/google/common/util/concurrent/ListenerCallQueue$Callback;->call(Ljava/lang/Object;)V
    :try_end_24
    .catch Ljava/lang/RuntimeException; {:try_start_1f .. :try_end_24} :catch_25
    .catchall {:try_start_1f .. :try_end_24} :catchall_6c

    goto :goto_1

    .line 119
    :catch_25
    move-exception v0

    .line 121
    .local v0, "e":Ljava/lang/RuntimeException;
    :try_start_26
    sget-object v3, Lcom/google/common/util/concurrent/ListenerCallQueue;->logger:Ljava/util/logging/Logger;

    sget-object v4, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    iget-object v5, p0, Lcom/google/common/util/concurrent/ListenerCallQueue;->listener:Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    # getter for: Lcom/google/common/util/concurrent/ListenerCallQueue$Callback;->methodCall:Ljava/lang/String;
    invoke-static {v1}, Lcom/google/common/util/concurrent/ListenerCallQueue$Callback;->access$000(Lcom/google/common/util/concurrent/ListenerCallQueue$Callback;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, 0x25

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v9

    add-int/2addr v8, v9

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v8, "Exception while executing callback: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, "."

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6b
    .catchall {:try_start_26 .. :try_end_6b} :catchall_6c

    goto :goto_1

    .line 127
    .end local v0    # "e":Ljava/lang/RuntimeException;
    .end local v1    # "nextToRun":Lcom/google/common/util/concurrent/ListenerCallQueue$Callback;, "Lcom/google/common/util/concurrent/ListenerCallQueue$Callback<TL;>;"
    :catchall_6c
    move-exception v3

    if-eqz v2, :cond_74

    .line 131
    monitor-enter p0

    .line 132
    const/4 v4, 0x0

    :try_start_71
    iput-boolean v4, p0, Lcom/google/common/util/concurrent/ListenerCallQueue;->isThreadScheduled:Z

    .line 133
    monitor-exit p0
    :try_end_74
    .catchall {:try_start_71 .. :try_end_74} :catchall_7b

    :cond_74
    throw v3

    .line 114
    :catchall_75
    move-exception v3

    :try_start_76
    monitor-exit p0
    :try_end_77
    .catchall {:try_start_76 .. :try_end_77} :catchall_75

    :try_start_77
    throw v3
    :try_end_78
    .catchall {:try_start_77 .. :try_end_78} :catchall_6c

    .line 133
    .restart local v1    # "nextToRun":Lcom/google/common/util/concurrent/ListenerCallQueue$Callback;, "Lcom/google/common/util/concurrent/ListenerCallQueue$Callback<TL;>;"
    :catchall_78
    move-exception v3

    :try_start_79
    monitor-exit p0
    :try_end_7a
    .catchall {:try_start_79 .. :try_end_7a} :catchall_78

    throw v3

    .end local v1    # "nextToRun":Lcom/google/common/util/concurrent/ListenerCallQueue$Callback;, "Lcom/google/common/util/concurrent/ListenerCallQueue$Callback<TL;>;"
    :catchall_7b
    move-exception v3

    :try_start_7c
    monitor-exit p0
    :try_end_7d
    .catchall {:try_start_7c .. :try_end_7d} :catchall_7b

    throw v3
.end method
