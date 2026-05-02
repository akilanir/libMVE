.class Lcom/google/common/util/concurrent/SerializingExecutor$TaskRunner;
.super Ljava/lang/Object;
.source "SerializingExecutor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/SerializingExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TaskRunner"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/util/concurrent/SerializingExecutor;


# direct methods
.method private constructor <init>(Lcom/google/common/util/concurrent/SerializingExecutor;)V
    .registers 2

    .prologue
    .line 129
    iput-object p1, p0, Lcom/google/common/util/concurrent/SerializingExecutor$TaskRunner;->this$0:Lcom/google/common/util/concurrent/SerializingExecutor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/util/concurrent/SerializingExecutor;Lcom/google/common/util/concurrent/SerializingExecutor$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/google/common/util/concurrent/SerializingExecutor;
    .param p2, "x1"    # Lcom/google/common/util/concurrent/SerializingExecutor$1;

    .prologue
    .line 129
    invoke-direct {p0, p1}, Lcom/google/common/util/concurrent/SerializingExecutor$TaskRunner;-><init>(Lcom/google/common/util/concurrent/SerializingExecutor;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 9

    .prologue
    .line 132
    const/4 v2, 0x1

    .line 135
    .local v2, "stillRunning":Z
    :goto_1
    :try_start_1
    iget-object v3, p0, Lcom/google/common/util/concurrent/SerializingExecutor$TaskRunner;->this$0:Lcom/google/common/util/concurrent/SerializingExecutor;

    # getter for: Lcom/google/common/util/concurrent/SerializingExecutor;->isThreadScheduled:Z
    invoke-static {v3}, Lcom/google/common/util/concurrent/SerializingExecutor;->access$100(Lcom/google/common/util/concurrent/SerializingExecutor;)Z

    move-result v3

    invoke-static {v3}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 137
    iget-object v3, p0, Lcom/google/common/util/concurrent/SerializingExecutor$TaskRunner;->this$0:Lcom/google/common/util/concurrent/SerializingExecutor;

    # getter for: Lcom/google/common/util/concurrent/SerializingExecutor;->internalLock:Ljava/lang/Object;
    invoke-static {v3}, Lcom/google/common/util/concurrent/SerializingExecutor;->access$200(Lcom/google/common/util/concurrent/SerializingExecutor;)Ljava/lang/Object;

    move-result-object v4

    monitor-enter v4
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_69

    .line 138
    :try_start_11
    iget-object v3, p0, Lcom/google/common/util/concurrent/SerializingExecutor$TaskRunner;->this$0:Lcom/google/common/util/concurrent/SerializingExecutor;

    # getter for: Lcom/google/common/util/concurrent/SerializingExecutor;->waitQueue:Ljava/util/Queue;
    invoke-static {v3}, Lcom/google/common/util/concurrent/SerializingExecutor;->access$300(Lcom/google/common/util/concurrent/SerializingExecutor;)Ljava/util/Queue;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    .line 139
    .local v1, "nextToRun":Ljava/lang/Runnable;
    if-nez v1, :cond_38

    .line 140
    iget-object v3, p0, Lcom/google/common/util/concurrent/SerializingExecutor$TaskRunner;->this$0:Lcom/google/common/util/concurrent/SerializingExecutor;

    const/4 v5, 0x0

    # setter for: Lcom/google/common/util/concurrent/SerializingExecutor;->isThreadScheduled:Z
    invoke-static {v3, v5}, Lcom/google/common/util/concurrent/SerializingExecutor;->access$102(Lcom/google/common/util/concurrent/SerializingExecutor;Z)Z

    .line 141
    const/4 v2, 0x0

    .line 142
    monitor-exit v4
    :try_end_27
    .catchall {:try_start_11 .. :try_end_27} :catchall_7b

    .line 156
    if-eqz v2, :cond_37

    .line 160
    iget-object v3, p0, Lcom/google/common/util/concurrent/SerializingExecutor$TaskRunner;->this$0:Lcom/google/common/util/concurrent/SerializingExecutor;

    # getter for: Lcom/google/common/util/concurrent/SerializingExecutor;->internalLock:Ljava/lang/Object;
    invoke-static {v3}, Lcom/google/common/util/concurrent/SerializingExecutor;->access$200(Lcom/google/common/util/concurrent/SerializingExecutor;)Ljava/lang/Object;

    move-result-object v4

    monitor-enter v4

    .line 161
    :try_start_30
    iget-object v3, p0, Lcom/google/common/util/concurrent/SerializingExecutor$TaskRunner;->this$0:Lcom/google/common/util/concurrent/SerializingExecutor;

    const/4 v5, 0x0

    # setter for: Lcom/google/common/util/concurrent/SerializingExecutor;->isThreadScheduled:Z
    invoke-static {v3, v5}, Lcom/google/common/util/concurrent/SerializingExecutor;->access$102(Lcom/google/common/util/concurrent/SerializingExecutor;Z)Z

    .line 162
    monitor-exit v4
    :try_end_37
    .catchall {:try_start_30 .. :try_end_37} :catchall_7e

    .line 165
    :cond_37
    return-void

    .line 144
    :cond_38
    :try_start_38
    monitor-exit v4
    :try_end_39
    .catchall {:try_start_38 .. :try_end_39} :catchall_7b

    .line 148
    :try_start_39
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V
    :try_end_3c
    .catch Ljava/lang/RuntimeException; {:try_start_39 .. :try_end_3c} :catch_3d
    .catchall {:try_start_39 .. :try_end_3c} :catchall_69

    goto :goto_1

    .line 149
    :catch_3d
    move-exception v0

    .line 151
    .local v0, "e":Ljava/lang/RuntimeException;
    :try_start_3e
    # getter for: Lcom/google/common/util/concurrent/SerializingExecutor;->log:Ljava/util/logging/Logger;
    invoke-static {}, Lcom/google/common/util/concurrent/SerializingExecutor;->access$400()Ljava/util/logging/Logger;

    move-result-object v3

    sget-object v4, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, 0x23

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v7, "Exception while executing runnable "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_68
    .catchall {:try_start_3e .. :try_end_68} :catchall_69

    goto :goto_1

    .line 156
    .end local v0    # "e":Ljava/lang/RuntimeException;
    .end local v1    # "nextToRun":Ljava/lang/Runnable;
    :catchall_69
    move-exception v3

    if-eqz v2, :cond_7a

    .line 160
    iget-object v4, p0, Lcom/google/common/util/concurrent/SerializingExecutor$TaskRunner;->this$0:Lcom/google/common/util/concurrent/SerializingExecutor;

    # getter for: Lcom/google/common/util/concurrent/SerializingExecutor;->internalLock:Ljava/lang/Object;
    invoke-static {v4}, Lcom/google/common/util/concurrent/SerializingExecutor;->access$200(Lcom/google/common/util/concurrent/SerializingExecutor;)Ljava/lang/Object;

    move-result-object v4

    monitor-enter v4

    .line 161
    :try_start_73
    iget-object v5, p0, Lcom/google/common/util/concurrent/SerializingExecutor$TaskRunner;->this$0:Lcom/google/common/util/concurrent/SerializingExecutor;

    const/4 v6, 0x0

    # setter for: Lcom/google/common/util/concurrent/SerializingExecutor;->isThreadScheduled:Z
    invoke-static {v5, v6}, Lcom/google/common/util/concurrent/SerializingExecutor;->access$102(Lcom/google/common/util/concurrent/SerializingExecutor;Z)Z

    .line 162
    monitor-exit v4
    :try_end_7a
    .catchall {:try_start_73 .. :try_end_7a} :catchall_81

    :cond_7a
    throw v3

    .line 144
    :catchall_7b
    move-exception v3

    :try_start_7c
    monitor-exit v4
    :try_end_7d
    .catchall {:try_start_7c .. :try_end_7d} :catchall_7b

    :try_start_7d
    throw v3
    :try_end_7e
    .catchall {:try_start_7d .. :try_end_7e} :catchall_69

    .line 162
    .restart local v1    # "nextToRun":Ljava/lang/Runnable;
    :catchall_7e
    move-exception v3

    :try_start_7f
    monitor-exit v4
    :try_end_80
    .catchall {:try_start_7f .. :try_end_80} :catchall_7e

    throw v3

    .end local v1    # "nextToRun":Ljava/lang/Runnable;
    :catchall_81
    move-exception v3

    :try_start_82
    monitor-exit v4
    :try_end_83
    .catchall {:try_start_82 .. :try_end_83} :catchall_81

    throw v3
.end method
