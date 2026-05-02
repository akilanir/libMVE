.class final Lcom/google/common/util/concurrent/SerializingExecutor;
.super Ljava/lang/Object;
.source "SerializingExecutor.java"

# interfaces
.implements Ljava/util/concurrent/Executor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/util/concurrent/SerializingExecutor$TaskRunner;
    }
.end annotation


# static fields
.field private static final log:Ljava/util/logging/Logger;


# instance fields
.field private final executor:Ljava/util/concurrent/Executor;

.field private final internalLock:Ljava/lang/Object;

.field private isThreadScheduled:Z
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "internalLock"
    .end annotation
.end field

.field private final taskRunner:Lcom/google/common/util/concurrent/SerializingExecutor$TaskRunner;

.field private final waitQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "internalLock"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 47
    const-class v0, Lcom/google/common/util/concurrent/SerializingExecutor;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/google/common/util/concurrent/SerializingExecutor;->log:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;)V
    .registers 4
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/google/common/util/concurrent/SerializingExecutor;->waitQueue:Ljava/util/Queue;

    .line 65
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/common/util/concurrent/SerializingExecutor;->isThreadScheduled:Z

    .line 69
    new-instance v0, Lcom/google/common/util/concurrent/SerializingExecutor$TaskRunner;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/common/util/concurrent/SerializingExecutor$TaskRunner;-><init>(Lcom/google/common/util/concurrent/SerializingExecutor;Lcom/google/common/util/concurrent/SerializingExecutor$1;)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/SerializingExecutor;->taskRunner:Lcom/google/common/util/concurrent/SerializingExecutor$TaskRunner;

    .line 81
    new-instance v0, Lcom/google/common/util/concurrent/SerializingExecutor$1;

    invoke-direct {v0, p0}, Lcom/google/common/util/concurrent/SerializingExecutor$1;-><init>(Lcom/google/common/util/concurrent/SerializingExecutor;)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/SerializingExecutor;->internalLock:Ljava/lang/Object;

    .line 77
    const-string v0, "\'executor\' must not be null."

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    iput-object p1, p0, Lcom/google/common/util/concurrent/SerializingExecutor;->executor:Ljava/util/concurrent/Executor;

    .line 79
    return-void
.end method

.method static synthetic access$100(Lcom/google/common/util/concurrent/SerializingExecutor;)Z
    .registers 2
    .param p0, "x0"    # Lcom/google/common/util/concurrent/SerializingExecutor;

    .prologue
    .line 46
    iget-boolean v0, p0, Lcom/google/common/util/concurrent/SerializingExecutor;->isThreadScheduled:Z

    return v0
.end method

.method static synthetic access$102(Lcom/google/common/util/concurrent/SerializingExecutor;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/google/common/util/concurrent/SerializingExecutor;
    .param p1, "x1"    # Z

    .prologue
    .line 46
    iput-boolean p1, p0, Lcom/google/common/util/concurrent/SerializingExecutor;->isThreadScheduled:Z

    return p1
.end method

.method static synthetic access$200(Lcom/google/common/util/concurrent/SerializingExecutor;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lcom/google/common/util/concurrent/SerializingExecutor;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/google/common/util/concurrent/SerializingExecutor;->internalLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$300(Lcom/google/common/util/concurrent/SerializingExecutor;)Ljava/util/Queue;
    .registers 2
    .param p0, "x0"    # Lcom/google/common/util/concurrent/SerializingExecutor;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/google/common/util/concurrent/SerializingExecutor;->waitQueue:Ljava/util/Queue;

    return-object v0
.end method

.method static synthetic access$400()Ljava/util/logging/Logger;
    .registers 1

    .prologue
    .line 46
    sget-object v0, Lcom/google/common/util/concurrent/SerializingExecutor;->log:Ljava/util/logging/Logger;

    return-object v0
.end method


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .registers 7
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 93
    const-string v2, "\'r\' must not be null."

    invoke-static {p1, v2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    const/4 v0, 0x0

    .line 95
    .local v0, "scheduleTaskRunner":Z
    iget-object v3, p0, Lcom/google/common/util/concurrent/SerializingExecutor;->internalLock:Ljava/lang/Object;

    monitor-enter v3

    .line 96
    :try_start_9
    iget-object v2, p0, Lcom/google/common/util/concurrent/SerializingExecutor;->waitQueue:Ljava/util/Queue;

    invoke-interface {v2, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 98
    iget-boolean v2, p0, Lcom/google/common/util/concurrent/SerializingExecutor;->isThreadScheduled:Z

    if-nez v2, :cond_16

    .line 99
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/google/common/util/concurrent/SerializingExecutor;->isThreadScheduled:Z

    .line 100
    const/4 v0, 0x1

    .line 102
    :cond_16
    monitor-exit v3
    :try_end_17
    .catchall {:try_start_9 .. :try_end_17} :catchall_2c

    .line 103
    if-eqz v0, :cond_2b

    .line 104
    const/4 v1, 0x1

    .line 106
    .local v1, "threw":Z
    :try_start_1a
    iget-object v2, p0, Lcom/google/common/util/concurrent/SerializingExecutor;->executor:Ljava/util/concurrent/Executor;

    iget-object v3, p0, Lcom/google/common/util/concurrent/SerializingExecutor;->taskRunner:Lcom/google/common/util/concurrent/SerializingExecutor$TaskRunner;

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_21
    .catchall {:try_start_1a .. :try_end_21} :catchall_32

    .line 107
    const/4 v1, 0x0

    .line 109
    if-eqz v1, :cond_2b

    .line 110
    iget-object v3, p0, Lcom/google/common/util/concurrent/SerializingExecutor;->internalLock:Ljava/lang/Object;

    monitor-enter v3

    .line 115
    const/4 v2, 0x0

    :try_start_28
    iput-boolean v2, p0, Lcom/google/common/util/concurrent/SerializingExecutor;->isThreadScheduled:Z

    .line 116
    monitor-exit v3
    :try_end_2b
    .catchall {:try_start_28 .. :try_end_2b} :catchall_2f

    .line 120
    .end local v1    # "threw":Z
    :cond_2b
    return-void

    .line 102
    :catchall_2c
    move-exception v2

    :try_start_2d
    monitor-exit v3
    :try_end_2e
    .catchall {:try_start_2d .. :try_end_2e} :catchall_2c

    throw v2

    .line 116
    .restart local v1    # "threw":Z
    :catchall_2f
    move-exception v2

    :try_start_30
    monitor-exit v3
    :try_end_31
    .catchall {:try_start_30 .. :try_end_31} :catchall_2f

    throw v2

    .line 109
    :catchall_32
    move-exception v2

    if-eqz v1, :cond_3c

    .line 110
    iget-object v3, p0, Lcom/google/common/util/concurrent/SerializingExecutor;->internalLock:Ljava/lang/Object;

    monitor-enter v3

    .line 115
    const/4 v4, 0x0

    :try_start_39
    iput-boolean v4, p0, Lcom/google/common/util/concurrent/SerializingExecutor;->isThreadScheduled:Z

    .line 116
    monitor-exit v3
    :try_end_3c
    .catchall {:try_start_39 .. :try_end_3c} :catchall_3d

    :cond_3c
    throw v2

    :catchall_3d
    move-exception v2

    :try_start_3e
    monitor-exit v3
    :try_end_3f
    .catchall {:try_start_3e .. :try_end_3f} :catchall_3d

    throw v2
.end method
