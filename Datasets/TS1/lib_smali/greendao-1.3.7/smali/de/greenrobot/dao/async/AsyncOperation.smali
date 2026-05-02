.class public Lde/greenrobot/dao/async/AsyncOperation;
.super Ljava/lang/Object;
.source "AsyncOperation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/greenrobot/dao/async/AsyncOperation$OperationType;
    }
.end annotation


# static fields
.field public static final FLAG_MERGE_TX:I = 0x1

.field public static final FLAG_STOP_QUEUE_ON_EXCEPTION:I = 0x2


# instance fields
.field private volatile completed:Z

.field final dao:Lde/greenrobot/dao/AbstractDao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/AbstractDao",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final database:Landroid/database/sqlite/SQLiteDatabase;

.field final flags:I

.field volatile mergedOperationsCount:I

.field final parameter:Ljava/lang/Object;

.field volatile result:Ljava/lang/Object;

.field sequenceNumber:I

.field volatile throwable:Ljava/lang/Throwable;

.field volatile timeCompleted:J

.field volatile timeStarted:J

.field final type:Lde/greenrobot/dao/async/AsyncOperation$OperationType;


# direct methods
.method constructor <init>(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Object;I)V
    .registers 6
    .param p1, "type"    # Lde/greenrobot/dao/async/AsyncOperation$OperationType;
    .param p2, "database"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p3, "parameter"    # Ljava/lang/Object;
    .param p4, "flags"    # I

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iput-object p1, p0, Lde/greenrobot/dao/async/AsyncOperation;->type:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    .line 76
    iput-object p2, p0, Lde/greenrobot/dao/async/AsyncOperation;->database:Landroid/database/sqlite/SQLiteDatabase;

    .line 77
    iput p4, p0, Lde/greenrobot/dao/async/AsyncOperation;->flags:I

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    .line 79
    iput-object p3, p0, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    .line 80
    return-void
.end method

.method constructor <init>(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Lde/greenrobot/dao/AbstractDao;Ljava/lang/Object;I)V
    .registers 6
    .param p1, "type"    # Lde/greenrobot/dao/async/AsyncOperation$OperationType;
    .param p3, "parameter"    # Ljava/lang/Object;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/greenrobot/dao/async/AsyncOperation$OperationType;",
            "Lde/greenrobot/dao/AbstractDao",
            "<**>;",
            "Ljava/lang/Object;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 66
    .local p2, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<**>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Lde/greenrobot/dao/async/AsyncOperation;->type:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    .line 68
    iput p4, p0, Lde/greenrobot/dao/async/AsyncOperation;->flags:I

    .line 69
    iput-object p2, p0, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    .line 70
    const/4 v0, 0x0

    iput-object v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->database:Landroid/database/sqlite/SQLiteDatabase;

    .line 71
    iput-object p3, p0, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    .line 72
    return-void
.end method


# virtual methods
.method getDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .registers 2

    .prologue
    .line 121
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->database:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->database:Landroid/database/sqlite/SQLiteDatabase;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v0}, Lde/greenrobot/dao/AbstractDao;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    goto :goto_6
.end method

.method public getDuration()J
    .registers 5

    .prologue
    .line 141
    iget-wide v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->timeCompleted:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_10

    .line 142
    new-instance v0, Lde/greenrobot/dao/DaoException;

    const-string v1, "This operation did not yet complete"

    invoke-direct {v0, v1}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 144
    :cond_10
    iget-wide v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->timeCompleted:J

    iget-wide v2, p0, Lde/greenrobot/dao/async/AsyncOperation;->timeStarted:J

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public getMergedOperationsCount()I
    .registers 2

    .prologue
    .line 205
    iget v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->mergedOperationsCount:I

    return v0
.end method

.method public getParameter()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    return-object v0
.end method

.method public declared-synchronized getResult()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 106
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->completed:Z

    if-nez v0, :cond_8

    .line 107
    invoke-virtual {p0}, Lde/greenrobot/dao/async/AsyncOperation;->waitForCompletion()Ljava/lang/Object;

    .line 109
    :cond_8
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->throwable:Ljava/lang/Throwable;

    if-eqz v0, :cond_17

    .line 110
    new-instance v0, Lde/greenrobot/dao/async/AsyncDaoException;

    iget-object v1, p0, Lde/greenrobot/dao/async/AsyncOperation;->throwable:Ljava/lang/Throwable;

    invoke-direct {v0, p0, v1}, Lde/greenrobot/dao/async/AsyncDaoException;-><init>(Lde/greenrobot/dao/async/AsyncOperation;Ljava/lang/Throwable;)V

    throw v0
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_14

    .line 106
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0

    .line 112
    :cond_17
    :try_start_17
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->result:Ljava/lang/Object;
    :try_end_19
    .catchall {:try_start_17 .. :try_end_19} :catchall_14

    monitor-exit p0

    return-object v0
.end method

.method public getSequenceNumber()I
    .registers 2

    .prologue
    .line 213
    iget v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->sequenceNumber:I

    return v0
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->throwable:Ljava/lang/Throwable;

    return-object v0
.end method

.method public getTimeCompleted()J
    .registers 3

    .prologue
    .line 137
    iget-wide v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->timeCompleted:J

    return-wide v0
.end method

.method public getTimeStarted()J
    .registers 3

    .prologue
    .line 133
    iget-wide v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->timeStarted:J

    return-wide v0
.end method

.method public getType()Lde/greenrobot/dao/async/AsyncOperation$OperationType;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->type:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    return-object v0
.end method

.method public isCompleted()Z
    .registers 2

    .prologue
    .line 153
    iget-boolean v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->completed:Z

    return v0
.end method

.method public isCompletedSucessfully()Z
    .registers 2

    .prologue
    .line 197
    iget-boolean v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->completed:Z

    if-eqz v0, :cond_a

    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->throwable:Ljava/lang/Throwable;

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isFailed()Z
    .registers 2

    .prologue
    .line 149
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->throwable:Ljava/lang/Throwable;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isMergeTx()Z
    .registers 2

    .prologue
    .line 117
    iget v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method isMergeableWith(Lde/greenrobot/dao/async/AsyncOperation;)Z
    .registers 4
    .param p1, "other"    # Lde/greenrobot/dao/async/AsyncOperation;

    .prologue
    .line 129
    if-eqz p1, :cond_1a

    invoke-virtual {p0}, Lde/greenrobot/dao/async/AsyncOperation;->isMergeTx()Z

    move-result v0

    if-eqz v0, :cond_1a

    invoke-virtual {p1}, Lde/greenrobot/dao/async/AsyncOperation;->isMergeTx()Z

    move-result v0

    if-eqz v0, :cond_1a

    invoke-virtual {p0}, Lde/greenrobot/dao/async/AsyncOperation;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {p1}, Lde/greenrobot/dao/async/AsyncOperation;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    if-ne v0, v1, :cond_1a

    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method reset()V
    .registers 5

    .prologue
    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 218
    iput-wide v2, p0, Lde/greenrobot/dao/async/AsyncOperation;->timeStarted:J

    .line 219
    iput-wide v2, p0, Lde/greenrobot/dao/async/AsyncOperation;->timeCompleted:J

    .line 220
    iput-boolean v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->completed:Z

    .line 221
    iput-object v1, p0, Lde/greenrobot/dao/async/AsyncOperation;->throwable:Ljava/lang/Throwable;

    .line 222
    iput-object v1, p0, Lde/greenrobot/dao/async/AsyncOperation;->result:Ljava/lang/Object;

    .line 223
    iput v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->mergedOperationsCount:I

    .line 224
    return-void
.end method

.method declared-synchronized setCompleted()V
    .registers 2

    .prologue
    .line 192
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lde/greenrobot/dao/async/AsyncOperation;->completed:Z

    .line 193
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_7
    .catchall {:try_start_2 .. :try_end_7} :catchall_9

    .line 194
    monitor-exit p0

    return-void

    .line 192
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setThrowable(Ljava/lang/Throwable;)V
    .registers 2
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 87
    iput-object p1, p0, Lde/greenrobot/dao/async/AsyncOperation;->throwable:Ljava/lang/Throwable;

    .line 88
    return-void
.end method

.method public declared-synchronized waitForCompletion()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 163
    monitor-enter p0

    :goto_1
    :try_start_1
    iget-boolean v1, p0, Lde/greenrobot/dao/async/AsyncOperation;->completed:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_12

    if-nez v1, :cond_15

    .line 165
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_8} :catch_9
    .catchall {:try_start_5 .. :try_end_8} :catchall_12

    goto :goto_1

    .line 166
    :catch_9
    move-exception v0

    .line 167
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_a
    new-instance v1, Lde/greenrobot/dao/DaoException;

    const-string v2, "Interrupted while waiting for operation to complete"

    invoke-direct {v1, v2, v0}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_12
    .catchall {:try_start_a .. :try_end_12} :catchall_12

    .line 163
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_12
    move-exception v1

    monitor-exit p0

    throw v1

    .line 170
    :cond_15
    :try_start_15
    iget-object v1, p0, Lde/greenrobot/dao/async/AsyncOperation;->result:Ljava/lang/Object;
    :try_end_17
    .catchall {:try_start_15 .. :try_end_17} :catchall_12

    monitor-exit p0

    return-object v1
.end method

.method public declared-synchronized waitForCompletion(I)Z
    .registers 5
    .param p1, "maxMillis"    # I

    .prologue
    .line 180
    monitor-enter p0

    :try_start_1
    iget-boolean v1, p0, Lde/greenrobot/dao/async/AsyncOperation;->completed:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_16

    if-nez v1, :cond_9

    .line 182
    int-to-long v1, p1

    :try_start_6
    invoke-virtual {p0, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_9
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_9} :catch_d
    .catchall {:try_start_6 .. :try_end_9} :catchall_16

    .line 187
    :cond_9
    :try_start_9
    iget-boolean v1, p0, Lde/greenrobot/dao/async/AsyncOperation;->completed:Z
    :try_end_b
    .catchall {:try_start_9 .. :try_end_b} :catchall_16

    monitor-exit p0

    return v1

    .line 183
    :catch_d
    move-exception v0

    .line 184
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_e
    new-instance v1, Lde/greenrobot/dao/DaoException;

    const-string v2, "Interrupted while waiting for operation to complete"

    invoke-direct {v1, v2, v0}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_16
    .catchall {:try_start_e .. :try_end_16} :catchall_16

    .line 180
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_16
    move-exception v1

    monitor-exit p0

    throw v1
.end method
