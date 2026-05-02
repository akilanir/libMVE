.class final Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;
.super Ljava/lang/Object;
.source "ExecutionQueue.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/ExecutionQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "RunnableExecutorPair"
.end annotation


# instance fields
.field private final executor:Ljava/util/concurrent/Executor;

.field private hasBeenExecuted:Z
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "lock"
    .end annotation
.end field

.field private final runnable:Ljava/lang/Runnable;

.field final synthetic this$0:Lcom/google/common/util/concurrent/ExecutionQueue;


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/ExecutionQueue;Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V
    .registers 5
    .param p2, "runnable"    # Ljava/lang/Runnable;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 119
    iput-object p1, p0, Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;->this$0:Lcom/google/common/util/concurrent/ExecutionQueue;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;->hasBeenExecuted:Z

    .line 120
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    iput-object v0, p0, Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;->runnable:Ljava/lang/Runnable;

    .line 121
    invoke-static {p3}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Executor;

    iput-object v0, p0, Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;->executor:Ljava/util/concurrent/Executor;

    .line 122
    return-void
.end method

.method static synthetic access$000(Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;)V
    .registers 1
    .param p0, "x0"    # Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;

    .prologue
    .line 109
    invoke-direct {p0}, Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;->submit()V

    return-void
.end method

.method private submit()V
    .registers 7

    .prologue
    const/4 v5, 0x1

    .line 126
    iget-object v1, p0, Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;->this$0:Lcom/google/common/util/concurrent/ExecutionQueue;

    # getter for: Lcom/google/common/util/concurrent/ExecutionQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v1}, Lcom/google/common/util/concurrent/ExecutionQueue;->access$100(Lcom/google/common/util/concurrent/ExecutionQueue;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 128
    :try_start_a
    iget-boolean v1, p0, Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;->hasBeenExecuted:Z
    :try_end_c
    .catchall {:try_start_a .. :try_end_c} :catchall_57

    if-nez v1, :cond_13

    .line 130
    :try_start_e
    iget-object v1, p0, Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;->executor:Ljava/util/concurrent/Executor;

    invoke-interface {v1, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_13} :catch_2b
    .catchall {:try_start_e .. :try_end_13} :catchall_57

    .line 139
    :cond_13
    :goto_13
    iget-object v1, p0, Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;->this$0:Lcom/google/common/util/concurrent/ExecutionQueue;

    # getter for: Lcom/google/common/util/concurrent/ExecutionQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v1}, Lcom/google/common/util/concurrent/ExecutionQueue;->access$100(Lcom/google/common/util/concurrent/ExecutionQueue;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 140
    iput-boolean v5, p0, Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;->hasBeenExecuted:Z

    .line 141
    iget-object v1, p0, Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;->this$0:Lcom/google/common/util/concurrent/ExecutionQueue;

    # getter for: Lcom/google/common/util/concurrent/ExecutionQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v1}, Lcom/google/common/util/concurrent/ExecutionQueue;->access$100(Lcom/google/common/util/concurrent/ExecutionQueue;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 144
    :cond_2a
    return-void

    .line 131
    :catch_2b
    move-exception v0

    .line 132
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2c
    # getter for: Lcom/google/common/util/concurrent/ExecutionQueue;->logger:Ljava/util/logging/Logger;
    invoke-static {}, Lcom/google/common/util/concurrent/ExecutionQueue;->access$200()Ljava/util/logging/Logger;

    move-result-object v1

    sget-object v2, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception while executing listener "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;->runnable:Ljava/lang/Runnable;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " with executor "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;->executor:Ljava/util/concurrent/Executor;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_56
    .catchall {:try_start_2c .. :try_end_56} :catchall_57

    goto :goto_13

    .line 139
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_57
    move-exception v1

    iget-object v2, p0, Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;->this$0:Lcom/google/common/util/concurrent/ExecutionQueue;

    # getter for: Lcom/google/common/util/concurrent/ExecutionQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v2}, Lcom/google/common/util/concurrent/ExecutionQueue;->access$100(Lcom/google/common/util/concurrent/ExecutionQueue;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v2

    if-eqz v2, :cond_6f

    .line 140
    iput-boolean v5, p0, Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;->hasBeenExecuted:Z

    .line 141
    iget-object v2, p0, Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;->this$0:Lcom/google/common/util/concurrent/ExecutionQueue;

    # getter for: Lcom/google/common/util/concurrent/ExecutionQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v2}, Lcom/google/common/util/concurrent/ExecutionQueue;->access$100(Lcom/google/common/util/concurrent/ExecutionQueue;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    :cond_6f
    throw v1
.end method


# virtual methods
.method public final run()V
    .registers 2

    .prologue
    .line 150
    iget-object v0, p0, Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;->this$0:Lcom/google/common/util/concurrent/ExecutionQueue;

    # getter for: Lcom/google/common/util/concurrent/ExecutionQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v0}, Lcom/google/common/util/concurrent/ExecutionQueue;->access$100(Lcom/google/common/util/concurrent/ExecutionQueue;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 151
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;->hasBeenExecuted:Z

    .line 152
    iget-object v0, p0, Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;->this$0:Lcom/google/common/util/concurrent/ExecutionQueue;

    # getter for: Lcom/google/common/util/concurrent/ExecutionQueue;->lock:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {v0}, Lcom/google/common/util/concurrent/ExecutionQueue;->access$100(Lcom/google/common/util/concurrent/ExecutionQueue;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 154
    :cond_18
    iget-object v0, p0, Lcom/google/common/util/concurrent/ExecutionQueue$RunnableExecutorPair;->runnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 155
    return-void
.end method
