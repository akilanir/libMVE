.class Lde/greenrobot/dao/async/AsyncOperationExecutor;
.super Ljava/lang/Object;
.source "AsyncOperationExecutor.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/greenrobot/dao/async/AsyncOperationExecutor$1;
    }
.end annotation


# static fields
.field private static executorService:Ljava/util/concurrent/ExecutorService;


# instance fields
.field private countOperationsCompleted:I

.field private countOperationsEnqueued:I

.field private volatile executorRunning:Z

.field private handlerMainThread:Landroid/os/Handler;

.field private lastSequenceNumber:I

.field private volatile listener:Lde/greenrobot/dao/async/AsyncOperationListener;

.field private volatile listenerMainThread:Lde/greenrobot/dao/async/AsyncOperationListener;

.field private volatile maxOperationCountToMerge:I

.field private final queue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Lde/greenrobot/dao/async/AsyncOperation;",
            ">;"
        }
    .end annotation
.end field

.field private volatile waitForMergeMillis:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->executorService:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method constructor <init>()V
    .registers 3

    .prologue
    const/16 v1, 0x32

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->queue:Ljava/util/concurrent/BlockingQueue;

    .line 53
    iput v1, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->maxOperationCountToMerge:I

    .line 54
    iput v1, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->waitForMergeMillis:I

    .line 55
    return-void
.end method

.method private executeOperation(Lde/greenrobot/dao/async/AsyncOperation;)V
    .registers 6
    .param p1, "operation"    # Lde/greenrobot/dao/async/AsyncOperation;

    .prologue
    .line 265
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->timeStarted:J

    .line 267
    :try_start_6
    sget-object v1, Lde/greenrobot/dao/async/AsyncOperationExecutor$1;->$SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType:[I

    iget-object v2, p1, Lde/greenrobot/dao/async/AsyncOperation;->type:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-virtual {v2}, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_110

    .line 335
    new-instance v1, Lde/greenrobot/dao/DaoException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unsupported operation: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p1, Lde/greenrobot/dao/async/AsyncOperation;->type:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2e
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_2e} :catch_2e

    .line 337
    :catch_2e
    move-exception v0

    .line 338
    .local v0, "th":Ljava/lang/Throwable;
    iput-object v0, p1, Lde/greenrobot/dao/async/AsyncOperation;->throwable:Ljava/lang/Throwable;

    .line 340
    .end local v0    # "th":Ljava/lang/Throwable;
    :goto_31
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->timeCompleted:J

    .line 342
    return-void

    .line 269
    :pswitch_38
    :try_start_38
    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    iget-object v2, p1, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lde/greenrobot/dao/AbstractDao;->delete(Ljava/lang/Object;)V

    goto :goto_31

    .line 272
    :pswitch_40
    iget-object v2, p1, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Iterable;

    invoke-virtual {v2, v1}, Lde/greenrobot/dao/AbstractDao;->deleteInTx(Ljava/lang/Iterable;)V

    goto :goto_31

    .line 275
    :pswitch_4a
    iget-object v2, p1, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    invoke-virtual {v2, v1}, Lde/greenrobot/dao/AbstractDao;->deleteInTx([Ljava/lang/Object;)V

    goto :goto_31

    .line 278
    :pswitch_56
    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    iget-object v2, p1, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lde/greenrobot/dao/AbstractDao;->insert(Ljava/lang/Object;)J

    goto :goto_31

    .line 281
    :pswitch_5e
    iget-object v2, p1, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Iterable;

    invoke-virtual {v2, v1}, Lde/greenrobot/dao/AbstractDao;->insertInTx(Ljava/lang/Iterable;)V

    goto :goto_31

    .line 284
    :pswitch_68
    iget-object v2, p1, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    invoke-virtual {v2, v1}, Lde/greenrobot/dao/AbstractDao;->insertInTx([Ljava/lang/Object;)V

    goto :goto_31

    .line 287
    :pswitch_74
    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    iget-object v2, p1, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lde/greenrobot/dao/AbstractDao;->insertOrReplace(Ljava/lang/Object;)J

    goto :goto_31

    .line 290
    :pswitch_7c
    iget-object v2, p1, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Iterable;

    invoke-virtual {v2, v1}, Lde/greenrobot/dao/AbstractDao;->insertOrReplaceInTx(Ljava/lang/Iterable;)V

    goto :goto_31

    .line 293
    :pswitch_86
    iget-object v2, p1, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    invoke-virtual {v2, v1}, Lde/greenrobot/dao/AbstractDao;->insertOrReplaceInTx([Ljava/lang/Object;)V

    goto :goto_31

    .line 296
    :pswitch_92
    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    iget-object v2, p1, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lde/greenrobot/dao/AbstractDao;->update(Ljava/lang/Object;)V

    goto :goto_31

    .line 299
    :pswitch_9a
    iget-object v2, p1, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Iterable;

    invoke-virtual {v2, v1}, Lde/greenrobot/dao/AbstractDao;->updateInTx(Ljava/lang/Iterable;)V

    goto :goto_31

    .line 302
    :pswitch_a4
    iget-object v2, p1, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    invoke-virtual {v2, v1}, Lde/greenrobot/dao/AbstractDao;->updateInTx([Ljava/lang/Object;)V

    goto :goto_31

    .line 305
    :pswitch_b0
    invoke-direct {p0, p1}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->executeTransactionRunnable(Lde/greenrobot/dao/async/AsyncOperation;)V

    goto/16 :goto_31

    .line 308
    :pswitch_b5
    invoke-direct {p0, p1}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->executeTransactionCallable(Lde/greenrobot/dao/async/AsyncOperation;)V

    goto/16 :goto_31

    .line 311
    :pswitch_ba
    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    check-cast v1, Lde/greenrobot/dao/query/Query;

    invoke-virtual {v1}, Lde/greenrobot/dao/query/Query;->list()Ljava/util/List;

    move-result-object v1

    iput-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->result:Ljava/lang/Object;

    goto/16 :goto_31

    .line 314
    :pswitch_c6
    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    check-cast v1, Lde/greenrobot/dao/query/Query;

    invoke-virtual {v1}, Lde/greenrobot/dao/query/Query;->unique()Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->result:Ljava/lang/Object;

    goto/16 :goto_31

    .line 317
    :pswitch_d2
    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    iget-object v2, p1, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lde/greenrobot/dao/AbstractDao;->deleteByKey(Ljava/lang/Object;)V

    goto/16 :goto_31

    .line 320
    :pswitch_db
    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v1}, Lde/greenrobot/dao/AbstractDao;->deleteAll()V

    goto/16 :goto_31

    .line 323
    :pswitch_e2
    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    iget-object v2, p1, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lde/greenrobot/dao/AbstractDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->result:Ljava/lang/Object;

    goto/16 :goto_31

    .line 326
    :pswitch_ee
    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v1}, Lde/greenrobot/dao/AbstractDao;->loadAll()Ljava/util/List;

    move-result-object v1

    iput-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->result:Ljava/lang/Object;

    goto/16 :goto_31

    .line 329
    :pswitch_f8
    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v1}, Lde/greenrobot/dao/AbstractDao;->count()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->result:Ljava/lang/Object;

    goto/16 :goto_31

    .line 332
    :pswitch_106
    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->dao:Lde/greenrobot/dao/AbstractDao;

    iget-object v2, p1, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lde/greenrobot/dao/AbstractDao;->refresh(Ljava/lang/Object;)V
    :try_end_10d
    .catch Ljava/lang/Throwable; {:try_start_38 .. :try_end_10d} :catch_2e

    goto/16 :goto_31

    .line 267
    nop

    :pswitch_data_110
    .packed-switch 0x1
        :pswitch_38
        :pswitch_40
        :pswitch_4a
        :pswitch_56
        :pswitch_5e
        :pswitch_68
        :pswitch_74
        :pswitch_7c
        :pswitch_86
        :pswitch_92
        :pswitch_9a
        :pswitch_a4
        :pswitch_b0
        :pswitch_b5
        :pswitch_ba
        :pswitch_c6
        :pswitch_d2
        :pswitch_db
        :pswitch_e2
        :pswitch_ee
        :pswitch_f8
        :pswitch_106
    .end packed-switch
.end method

.method private executeOperationAndPostCompleted(Lde/greenrobot/dao/async/AsyncOperation;)V
    .registers 2
    .param p1, "operation"    # Lde/greenrobot/dao/async/AsyncOperation;

    .prologue
    .line 259
    invoke-direct {p0, p1}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->executeOperation(Lde/greenrobot/dao/async/AsyncOperation;)V

    .line 260
    invoke-direct {p0, p1}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->handleOperationCompleted(Lde/greenrobot/dao/async/AsyncOperation;)V

    .line 261
    return-void
.end method

.method private executeTransactionCallable(Lde/greenrobot/dao/async/AsyncOperation;)V
    .registers 4
    .param p1, "operation"    # Lde/greenrobot/dao/async/AsyncOperation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 357
    invoke-virtual {p1}, Lde/greenrobot/dao/async/AsyncOperation;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 358
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 360
    :try_start_7
    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/Callable;

    invoke-interface {v1}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->result:Ljava/lang/Object;

    .line 361
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_14
    .catchall {:try_start_7 .. :try_end_14} :catchall_18

    .line 363
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 365
    return-void

    .line 363
    :catchall_18
    move-exception v1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v1
.end method

.method private executeTransactionRunnable(Lde/greenrobot/dao/async/AsyncOperation;)V
    .registers 4
    .param p1, "operation"    # Lde/greenrobot/dao/async/AsyncOperation;

    .prologue
    .line 345
    invoke-virtual {p1}, Lde/greenrobot/dao/async/AsyncOperation;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 346
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 348
    :try_start_7
    iget-object v1, p1, Lde/greenrobot/dao/async/AsyncOperation;->parameter:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 349
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_11
    .catchall {:try_start_7 .. :try_end_11} :catchall_15

    .line 351
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 353
    return-void

    .line 351
    :catchall_15
    move-exception v1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v1
.end method

.method private handleOperationCompleted(Lde/greenrobot/dao/async/AsyncOperation;)V
    .registers 6
    .param p1, "operation"    # Lde/greenrobot/dao/async/AsyncOperation;

    .prologue
    .line 237
    invoke-virtual {p1}, Lde/greenrobot/dao/async/AsyncOperation;->setCompleted()V

    .line 239
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->listener:Lde/greenrobot/dao/async/AsyncOperationListener;

    .line 240
    .local v0, "listenerToCall":Lde/greenrobot/dao/async/AsyncOperationListener;
    if-eqz v0, :cond_a

    .line 241
    invoke-interface {v0, p1}, Lde/greenrobot/dao/async/AsyncOperationListener;->onAsyncOperationCompleted(Lde/greenrobot/dao/async/AsyncOperation;)V

    .line 243
    :cond_a
    iget-object v2, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->listenerMainThread:Lde/greenrobot/dao/async/AsyncOperationListener;

    if-eqz v2, :cond_29

    .line 244
    iget-object v2, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->handlerMainThread:Landroid/os/Handler;

    if-nez v2, :cond_1d

    .line 245
    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v2, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->handlerMainThread:Landroid/os/Handler;

    .line 247
    :cond_1d
    iget-object v2, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->handlerMainThread:Landroid/os/Handler;

    const/4 v3, 0x1

    invoke-virtual {v2, v3, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    .line 248
    .local v1, "msg":Landroid/os/Message;
    iget-object v2, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->handlerMainThread:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 250
    .end local v1    # "msg":Landroid/os/Message;
    :cond_29
    monitor-enter p0

    .line 251
    :try_start_2a
    iget v2, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->countOperationsCompleted:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->countOperationsCompleted:I

    .line 252
    iget v2, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->countOperationsCompleted:I

    iget v3, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->countOperationsEnqueued:I

    if-ne v2, v3, :cond_39

    .line 253
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 255
    :cond_39
    monitor-exit p0

    .line 256
    return-void

    .line 255
    :catchall_3b
    move-exception v2

    monitor-exit p0
    :try_end_3d
    .catchall {:try_start_2a .. :try_end_3d} :catchall_3b

    throw v2
.end method

.method private mergeTxAndExecute(Lde/greenrobot/dao/async/AsyncOperation;Lde/greenrobot/dao/async/AsyncOperation;)V
    .registers 18
    .param p1, "operation1"    # Lde/greenrobot/dao/async/AsyncOperation;
    .param p2, "operation2"    # Lde/greenrobot/dao/async/AsyncOperation;

    .prologue
    .line 180
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 181
    .local v7, "mergedOps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lde/greenrobot/dao/async/AsyncOperation;>;"
    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 182
    move-object/from16 v0, p2

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 184
    invoke-virtual/range {p1 .. p1}, Lde/greenrobot/dao/async/AsyncOperation;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 185
    .local v2, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 186
    const/4 v11, 0x0

    .line 188
    .local v11, "success":Z
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_18
    :try_start_18
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-ge v4, v12, :cond_2d

    .line 189
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lde/greenrobot/dao/async/AsyncOperation;

    .line 190
    .local v8, "operation":Lde/greenrobot/dao/async/AsyncOperation;
    invoke-direct {p0, v8}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->executeOperation(Lde/greenrobot/dao/async/AsyncOperation;)V

    .line 191
    invoke-virtual {v8}, Lde/greenrobot/dao/async/AsyncOperation;->isFailed()Z
    :try_end_2a
    .catchall {:try_start_18 .. :try_end_2a} :catchall_78

    move-result v12

    if-eqz v12, :cond_4c

    .line 214
    .end local v8    # "operation":Lde/greenrobot/dao/async/AsyncOperation;
    :cond_2d
    :goto_2d
    :try_start_2d
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_30
    .catch Ljava/lang/RuntimeException; {:try_start_2d .. :try_end_30} :catch_88

    .line 220
    :goto_30
    if-eqz v11, :cond_ba

    .line 221
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 222
    .local v6, "mergedCount":I
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_3a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_d6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lde/greenrobot/dao/async/AsyncOperation;

    .line 223
    .local v1, "asyncOperation":Lde/greenrobot/dao/async/AsyncOperation;
    iput v6, v1, Lde/greenrobot/dao/async/AsyncOperation;->mergedOperationsCount:I

    .line 224
    invoke-direct {p0, v1}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->handleOperationCompleted(Lde/greenrobot/dao/async/AsyncOperation;)V

    goto :goto_3a

    .line 195
    .end local v1    # "asyncOperation":Lde/greenrobot/dao/async/AsyncOperation;
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v6    # "mergedCount":I
    .restart local v8    # "operation":Lde/greenrobot/dao/async/AsyncOperation;
    :cond_4c
    :try_start_4c
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    if-ne v4, v12, :cond_80

    .line 196
    iget-object v12, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->queue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v12}, Ljava/util/concurrent/BlockingQueue;->peek()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lde/greenrobot/dao/async/AsyncOperation;

    .line 197
    .local v9, "peekedOp":Lde/greenrobot/dao/async/AsyncOperation;
    iget v12, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->maxOperationCountToMerge:I

    if-ge v4, v12, :cond_83

    invoke-virtual {v8, v9}, Lde/greenrobot/dao/async/AsyncOperation;->isMergeableWith(Lde/greenrobot/dao/async/AsyncOperation;)Z

    move-result v12

    if-eqz v12, :cond_83

    .line 198
    iget-object v12, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->queue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v12}, Ljava/util/concurrent/BlockingQueue;->remove()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lde/greenrobot/dao/async/AsyncOperation;

    .line 199
    .local v10, "removedOp":Lde/greenrobot/dao/async/AsyncOperation;
    if-eq v10, v9, :cond_7d

    .line 201
    new-instance v12, Lde/greenrobot/dao/DaoException;

    const-string v13, "Internal error: peeked op did not match removed op"

    invoke-direct {v12, v13}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;)V

    throw v12
    :try_end_78
    .catchall {:try_start_4c .. :try_end_78} :catchall_78

    .line 213
    .end local v8    # "operation":Lde/greenrobot/dao/async/AsyncOperation;
    .end local v9    # "peekedOp":Lde/greenrobot/dao/async/AsyncOperation;
    .end local v10    # "removedOp":Lde/greenrobot/dao/async/AsyncOperation;
    :catchall_78
    move-exception v12

    .line 214
    :try_start_79
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_7c
    .catch Ljava/lang/RuntimeException; {:try_start_79 .. :try_end_7c} :catch_a1

    .line 218
    :goto_7c
    throw v12

    .line 203
    .restart local v8    # "operation":Lde/greenrobot/dao/async/AsyncOperation;
    .restart local v9    # "peekedOp":Lde/greenrobot/dao/async/AsyncOperation;
    .restart local v10    # "removedOp":Lde/greenrobot/dao/async/AsyncOperation;
    :cond_7d
    :try_start_7d
    invoke-virtual {v7, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 188
    .end local v9    # "peekedOp":Lde/greenrobot/dao/async/AsyncOperation;
    .end local v10    # "removedOp":Lde/greenrobot/dao/async/AsyncOperation;
    :cond_80
    add-int/lit8 v4, v4, 0x1

    goto :goto_18

    .line 206
    .restart local v9    # "peekedOp":Lde/greenrobot/dao/async/AsyncOperation;
    :cond_83
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_86
    .catchall {:try_start_7d .. :try_end_86} :catchall_78

    .line 207
    const/4 v11, 0x1

    .line 208
    goto :goto_2d

    .line 215
    .end local v8    # "operation":Lde/greenrobot/dao/async/AsyncOperation;
    .end local v9    # "peekedOp":Lde/greenrobot/dao/async/AsyncOperation;
    :catch_88
    move-exception v3

    .line 216
    .local v3, "e":Ljava/lang/RuntimeException;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Async transaction could not be ended, success so far was: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12, v3}, Lde/greenrobot/dao/DaoLog;->i(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 217
    const/4 v11, 0x0

    .line 219
    goto :goto_30

    .line 215
    .end local v3    # "e":Ljava/lang/RuntimeException;
    :catch_a1
    move-exception v3

    .line 216
    .restart local v3    # "e":Ljava/lang/RuntimeException;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Async transaction could not be ended, success so far was: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13, v3}, Lde/greenrobot/dao/DaoLog;->i(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 217
    const/4 v11, 0x0

    goto :goto_7c

    .line 227
    .end local v3    # "e":Ljava/lang/RuntimeException;
    :cond_ba
    const-string v12, "Reverted merged transaction because one of the operations failed. Executing operations one by one instead..."

    invoke-static {v12}, Lde/greenrobot/dao/DaoLog;->i(Ljava/lang/String;)I

    .line 229
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .restart local v5    # "i$":Ljava/util/Iterator;
    :goto_c3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_d6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lde/greenrobot/dao/async/AsyncOperation;

    .line 230
    .restart local v1    # "asyncOperation":Lde/greenrobot/dao/async/AsyncOperation;
    invoke-virtual {v1}, Lde/greenrobot/dao/async/AsyncOperation;->reset()V

    .line 231
    invoke-direct {p0, v1}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->executeOperationAndPostCompleted(Lde/greenrobot/dao/async/AsyncOperation;)V

    goto :goto_c3

    .line 234
    .end local v1    # "asyncOperation":Lde/greenrobot/dao/async/AsyncOperation;
    :cond_d6
    return-void
.end method


# virtual methods
.method public enqueue(Lde/greenrobot/dao/async/AsyncOperation;)V
    .registers 3
    .param p1, "operation"    # Lde/greenrobot/dao/async/AsyncOperation;

    .prologue
    .line 58
    monitor-enter p0

    .line 59
    :try_start_1
    iget v0, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->lastSequenceNumber:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->lastSequenceNumber:I

    iput v0, p1, Lde/greenrobot/dao/async/AsyncOperation;->sequenceNumber:I

    .line 60
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->queue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0, p1}, Ljava/util/concurrent/BlockingQueue;->add(Ljava/lang/Object;)Z

    .line 61
    iget v0, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->countOperationsEnqueued:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->countOperationsEnqueued:I

    .line 62
    iget-boolean v0, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->executorRunning:Z

    if-nez v0, :cond_20

    .line 63
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->executorRunning:Z

    .line 64
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, p0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 66
    :cond_20
    monitor-exit p0

    .line 67
    return-void

    .line 66
    :catchall_22
    move-exception v0

    monitor-exit p0
    :try_end_24
    .catchall {:try_start_1 .. :try_end_24} :catchall_22

    throw v0
.end method

.method public getListener()Lde/greenrobot/dao/async/AsyncOperationListener;
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->listener:Lde/greenrobot/dao/async/AsyncOperationListener;

    return-object v0
.end method

.method public getListenerMainThread()Lde/greenrobot/dao/async/AsyncOperationListener;
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->listenerMainThread:Lde/greenrobot/dao/async/AsyncOperationListener;

    return-object v0
.end method

.method public getMaxOperationCountToMerge()I
    .registers 2

    .prologue
    .line 70
    iget v0, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->maxOperationCountToMerge:I

    return v0
.end method

.method public getWaitForMergeMillis()I
    .registers 2

    .prologue
    .line 78
    iget v0, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->waitForMergeMillis:I

    return v0
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .registers 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 369
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->listenerMainThread:Lde/greenrobot/dao/async/AsyncOperationListener;

    .line 370
    .local v0, "listenerToCall":Lde/greenrobot/dao/async/AsyncOperationListener;
    if-eqz v0, :cond_b

    .line 371
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lde/greenrobot/dao/async/AsyncOperation;

    invoke-interface {v0, v1}, Lde/greenrobot/dao/async/AsyncOperationListener;->onAsyncOperationCompleted(Lde/greenrobot/dao/async/AsyncOperation;)V

    .line 373
    :cond_b
    const/4 v1, 0x0

    return v1
.end method

.method public declared-synchronized isCompleted()Z
    .registers 3

    .prologue
    .line 102
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->countOperationsEnqueued:I

    iget v1, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->countOperationsCompleted:I
    :try_end_5
    .catchall {:try_start_1 .. :try_end_5} :catchall_c

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_8
    monitor-exit p0

    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_8

    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public run()V
    .registers 10

    .prologue
    const/4 v8, 0x0

    .line 141
    :goto_1
    :try_start_1
    iget-object v4, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->queue:Ljava/util/concurrent/BlockingQueue;

    const-wide/16 v5, 0x1

    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v4, v5, v6, v7}, Ljava/util/concurrent/BlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lde/greenrobot/dao/async/AsyncOperation;

    .line 142
    .local v2, "operation":Lde/greenrobot/dao/async/AsyncOperation;
    if-nez v2, :cond_24

    .line 143
    monitor-enter p0
    :try_end_10
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_10} :catch_43
    .catchall {:try_start_1 .. :try_end_10} :catchall_68

    .line 145
    :try_start_10
    iget-object v4, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->queue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v4}, Ljava/util/concurrent/BlockingQueue;->poll()Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lde/greenrobot/dao/async/AsyncOperation;

    move-object v2, v0

    .line 146
    if-nez v2, :cond_23

    .line 148
    const/4 v4, 0x0

    iput-boolean v4, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->executorRunning:Z

    .line 149
    monitor-exit p0
    :try_end_20
    .catchall {:try_start_10 .. :try_end_20} :catchall_65

    .line 173
    iput-boolean v8, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->executorRunning:Z

    .line 175
    .end local v2    # "operation":Lde/greenrobot/dao/async/AsyncOperation;
    :goto_22
    return-void

    .line 151
    .restart local v2    # "operation":Lde/greenrobot/dao/async/AsyncOperation;
    :cond_23
    :try_start_23
    monitor-exit p0
    :try_end_24
    .catchall {:try_start_23 .. :try_end_24} :catchall_65

    .line 153
    :cond_24
    :try_start_24
    invoke-virtual {v2}, Lde/greenrobot/dao/async/AsyncOperation;->isMergeTx()Z

    move-result v4

    if-eqz v4, :cond_73

    .line 155
    iget-object v4, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->queue:Ljava/util/concurrent/BlockingQueue;

    iget v5, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->waitForMergeMillis:I

    int-to-long v5, v5

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v4, v5, v6, v7}, Ljava/util/concurrent/BlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lde/greenrobot/dao/async/AsyncOperation;

    .line 156
    .local v3, "operation2":Lde/greenrobot/dao/async/AsyncOperation;
    if-eqz v3, :cond_73

    .line 157
    invoke-virtual {v2, v3}, Lde/greenrobot/dao/async/AsyncOperation;->isMergeableWith(Lde/greenrobot/dao/async/AsyncOperation;)Z

    move-result v4

    if-eqz v4, :cond_6c

    .line 158
    invoke-direct {p0, v2, v3}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->mergeTxAndExecute(Lde/greenrobot/dao/async/AsyncOperation;Lde/greenrobot/dao/async/AsyncOperation;)V
    :try_end_42
    .catch Ljava/lang/InterruptedException; {:try_start_24 .. :try_end_42} :catch_43
    .catchall {:try_start_24 .. :try_end_42} :catchall_68

    goto :goto_1

    .line 169
    .end local v2    # "operation":Lde/greenrobot/dao/async/AsyncOperation;
    .end local v3    # "operation2":Lde/greenrobot/dao/async/AsyncOperation;
    :catch_43
    move-exception v1

    .line 170
    .local v1, "e":Ljava/lang/InterruptedException;
    :try_start_44
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " was interruppted"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v1}, Lde/greenrobot/dao/DaoLog;->w(Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_62
    .catchall {:try_start_44 .. :try_end_62} :catchall_68

    .line 173
    iput-boolean v8, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->executorRunning:Z

    goto :goto_22

    .line 151
    .end local v1    # "e":Ljava/lang/InterruptedException;
    .restart local v2    # "operation":Lde/greenrobot/dao/async/AsyncOperation;
    :catchall_65
    move-exception v4

    :try_start_66
    monitor-exit p0
    :try_end_67
    .catchall {:try_start_66 .. :try_end_67} :catchall_65

    :try_start_67
    throw v4
    :try_end_68
    .catch Ljava/lang/InterruptedException; {:try_start_67 .. :try_end_68} :catch_43
    .catchall {:try_start_67 .. :try_end_68} :catchall_68

    .line 173
    .end local v2    # "operation":Lde/greenrobot/dao/async/AsyncOperation;
    :catchall_68
    move-exception v4

    iput-boolean v8, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->executorRunning:Z

    throw v4

    .line 161
    .restart local v2    # "operation":Lde/greenrobot/dao/async/AsyncOperation;
    .restart local v3    # "operation2":Lde/greenrobot/dao/async/AsyncOperation;
    :cond_6c
    :try_start_6c
    invoke-direct {p0, v2}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->executeOperationAndPostCompleted(Lde/greenrobot/dao/async/AsyncOperation;)V

    .line 162
    invoke-direct {p0, v3}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->executeOperationAndPostCompleted(Lde/greenrobot/dao/async/AsyncOperation;)V

    goto :goto_1

    .line 167
    .end local v3    # "operation2":Lde/greenrobot/dao/async/AsyncOperation;
    :cond_73
    invoke-direct {p0, v2}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->executeOperationAndPostCompleted(Lde/greenrobot/dao/async/AsyncOperation;)V
    :try_end_76
    .catch Ljava/lang/InterruptedException; {:try_start_6c .. :try_end_76} :catch_43
    .catchall {:try_start_6c .. :try_end_76} :catchall_68

    goto :goto_1
.end method

.method public setListener(Lde/greenrobot/dao/async/AsyncOperationListener;)V
    .registers 2
    .param p1, "listener"    # Lde/greenrobot/dao/async/AsyncOperationListener;

    .prologue
    .line 90
    iput-object p1, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->listener:Lde/greenrobot/dao/async/AsyncOperationListener;

    .line 91
    return-void
.end method

.method public setListenerMainThread(Lde/greenrobot/dao/async/AsyncOperationListener;)V
    .registers 2
    .param p1, "listenerMainThread"    # Lde/greenrobot/dao/async/AsyncOperationListener;

    .prologue
    .line 98
    iput-object p1, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->listenerMainThread:Lde/greenrobot/dao/async/AsyncOperationListener;

    .line 99
    return-void
.end method

.method public setMaxOperationCountToMerge(I)V
    .registers 2
    .param p1, "maxOperationCountToMerge"    # I

    .prologue
    .line 74
    iput p1, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->maxOperationCountToMerge:I

    .line 75
    return-void
.end method

.method public setWaitForMergeMillis(I)V
    .registers 2
    .param p1, "waitForMergeMillis"    # I

    .prologue
    .line 82
    iput p1, p0, Lde/greenrobot/dao/async/AsyncOperationExecutor;->waitForMergeMillis:I

    .line 83
    return-void
.end method

.method public declared-synchronized waitForCompletion()V
    .registers 4

    .prologue
    .line 110
    monitor-enter p0

    :goto_1
    :try_start_1
    invoke-virtual {p0}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->isCompleted()Z
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_14

    move-result v1

    if-nez v1, :cond_17

    .line 112
    :try_start_7
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_a
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_a} :catch_b
    .catchall {:try_start_7 .. :try_end_a} :catchall_14

    goto :goto_1

    .line 113
    :catch_b
    move-exception v0

    .line 114
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_c
    new-instance v1, Lde/greenrobot/dao/DaoException;

    const-string v2, "Interrupted while waiting for all operations to complete"

    invoke-direct {v1, v2, v0}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_14
    .catchall {:try_start_c .. :try_end_14} :catchall_14

    .line 110
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_14
    move-exception v1

    monitor-exit p0

    throw v1

    .line 117
    :cond_17
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized waitForCompletion(I)Z
    .registers 5
    .param p1, "maxMillis"    # I

    .prologue
    .line 126
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->isCompleted()Z
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_1a

    move-result v1

    if-nez v1, :cond_b

    .line 128
    int-to-long v1, p1

    :try_start_8
    invoke-virtual {p0, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_b
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_b} :catch_11
    .catchall {:try_start_8 .. :try_end_b} :catchall_1a

    .line 133
    :cond_b
    :try_start_b
    invoke-virtual {p0}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->isCompleted()Z
    :try_end_e
    .catchall {:try_start_b .. :try_end_e} :catchall_1a

    move-result v1

    monitor-exit p0

    return v1

    .line 129
    :catch_11
    move-exception v0

    .line 130
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_12
    new-instance v1, Lde/greenrobot/dao/DaoException;

    const-string v2, "Interrupted while waiting for all operations to complete"

    invoke-direct {v1, v2, v0}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_1a
    .catchall {:try_start_12 .. :try_end_1a} :catchall_1a

    .line 126
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_1a
    move-exception v1

    monitor-exit p0

    throw v1
.end method
