.class public Lde/greenrobot/dao/async/AsyncSession;
.super Ljava/lang/Object;
.source "AsyncSession.java"


# instance fields
.field private final daoSession:Lde/greenrobot/dao/AbstractDaoSession;

.field private final executor:Lde/greenrobot/dao/async/AsyncOperationExecutor;

.field private sessionFlags:I


# direct methods
.method public constructor <init>(Lde/greenrobot/dao/AbstractDaoSession;)V
    .registers 3
    .param p1, "daoSession"    # Lde/greenrobot/dao/AbstractDaoSession;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lde/greenrobot/dao/async/AsyncSession;->daoSession:Lde/greenrobot/dao/AbstractDaoSession;

    .line 30
    new-instance v0, Lde/greenrobot/dao/async/AsyncOperationExecutor;

    invoke-direct {v0}, Lde/greenrobot/dao/async/AsyncOperationExecutor;-><init>()V

    iput-object v0, p0, Lde/greenrobot/dao/async/AsyncSession;->executor:Lde/greenrobot/dao/async/AsyncOperationExecutor;

    .line 31
    return-void
.end method

.method private enqueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Class;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 11
    .param p1, "type"    # Lde/greenrobot/dao/async/AsyncOperation$OperationType;
    .param p3, "param"    # Ljava/lang/Object;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Lde/greenrobot/dao/async/AsyncOperation$OperationType;",
            "Ljava/lang/Class",
            "<TE;>;",
            "Ljava/lang/Object;",
            "I)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 319
    .local p2, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    iget-object v1, p0, Lde/greenrobot/dao/async/AsyncSession;->daoSession:Lde/greenrobot/dao/AbstractDaoSession;

    invoke-virtual {v1, p2}, Lde/greenrobot/dao/AbstractDaoSession;->getDao(Ljava/lang/Class;)Lde/greenrobot/dao/AbstractDao;

    move-result-object v2

    .line 320
    .local v2, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<**>;"
    new-instance v0, Lde/greenrobot/dao/async/AsyncOperation;

    const/4 v3, 0x0

    iget v1, p0, Lde/greenrobot/dao/async/AsyncSession;->sessionFlags:I

    or-int v5, p4, v1

    move-object v1, p1

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lde/greenrobot/dao/async/AsyncOperation;-><init>(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Lde/greenrobot/dao/AbstractDao;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Object;I)V

    .line 321
    .local v0, "operation":Lde/greenrobot/dao/async/AsyncOperation;
    iget-object v1, p0, Lde/greenrobot/dao/async/AsyncSession;->executor:Lde/greenrobot/dao/async/AsyncOperationExecutor;

    invoke-virtual {v1, v0}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->enqueue(Lde/greenrobot/dao/async/AsyncOperation;)V

    .line 322
    return-object v0
.end method

.method private enqueueDatabaseOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 10
    .param p1, "type"    # Lde/greenrobot/dao/async/AsyncOperation$OperationType;
    .param p2, "param"    # Ljava/lang/Object;
    .param p3, "flags"    # I

    .prologue
    .line 308
    iget-object v1, p0, Lde/greenrobot/dao/async/AsyncSession;->daoSession:Lde/greenrobot/dao/AbstractDaoSession;

    invoke-virtual {v1}, Lde/greenrobot/dao/AbstractDaoSession;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 309
    .local v3, "database":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v0, Lde/greenrobot/dao/async/AsyncOperation;

    const/4 v2, 0x0

    iget v1, p0, Lde/greenrobot/dao/async/AsyncSession;->sessionFlags:I

    or-int v5, p3, v1

    move-object v1, p1

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lde/greenrobot/dao/async/AsyncOperation;-><init>(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Lde/greenrobot/dao/AbstractDao;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Object;I)V

    .line 310
    .local v0, "operation":Lde/greenrobot/dao/async/AsyncOperation;
    iget-object v1, p0, Lde/greenrobot/dao/async/AsyncSession;->executor:Lde/greenrobot/dao/async/AsyncOperationExecutor;

    invoke-virtual {v1, v0}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->enqueue(Lde/greenrobot/dao/async/AsyncOperation;)V

    .line 311
    return-object v0
.end method

.method private enqueueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 5
    .param p1, "type"    # Lde/greenrobot/dao/async/AsyncOperation$OperationType;
    .param p2, "entity"    # Ljava/lang/Object;
    .param p3, "flags"    # I

    .prologue
    .line 315
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2, p3}, Lde/greenrobot/dao/async/AsyncSession;->enqueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Class;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public callInTx(Ljava/util/concurrent/Callable;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<*>;)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 239
    .local p1, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<*>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lde/greenrobot/dao/async/AsyncSession;->callInTx(Ljava/util/concurrent/Callable;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public callInTx(Ljava/util/concurrent/Callable;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 4
    .param p2, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<*>;I)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 244
    .local p1, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<*>;"
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->TransactionCallable:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-direct {p0, v0, p1, p2}, Lde/greenrobot/dao/async/AsyncSession;->enqueueDatabaseOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public count(Ljava/lang/Class;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 289
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lde/greenrobot/dao/async/AsyncSession;->count(Ljava/lang/Class;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public count(Ljava/lang/Class;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 5
    .param p2, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;I)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 294
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->Count:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1, p2}, Lde/greenrobot/dao/async/AsyncSession;->enqueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Class;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public delete(Ljava/lang/Object;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 3
    .param p1, "entity"    # Ljava/lang/Object;

    .prologue
    .line 179
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lde/greenrobot/dao/async/AsyncSession;->delete(Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public delete(Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 4
    .param p1, "entity"    # Ljava/lang/Object;
    .param p2, "flags"    # I

    .prologue
    .line 184
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->Delete:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-direct {p0, v0, p1, p2}, Lde/greenrobot/dao/async/AsyncSession;->enqueueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public deleteAll(Ljava/lang/Class;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TE;>;)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 219
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lde/greenrobot/dao/async/AsyncSession;->deleteAll(Ljava/lang/Class;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public deleteAll(Ljava/lang/Class;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 5
    .param p2, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TE;>;I)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 224
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->DeleteAll:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1, p2}, Lde/greenrobot/dao/async/AsyncSession;->enqueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Class;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public deleteByKey(Ljava/lang/Object;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 189
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lde/greenrobot/dao/async/AsyncSession;->deleteByKey(Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public deleteByKey(Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "flags"    # I

    .prologue
    .line 194
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->DeleteByKey:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-direct {p0, v0, p1, p2}, Lde/greenrobot/dao/async/AsyncSession;->enqueueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public varargs deleteInTx(Ljava/lang/Class;I[Ljava/lang/Object;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 5
    .param p2, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TE;>;I[TE;)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 204
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    .local p3, "entities":[Ljava/lang/Object;, "[TE;"
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->DeleteInTxArray:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-direct {p0, v0, p1, p3, p2}, Lde/greenrobot/dao/async/AsyncSession;->enqueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Class;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public deleteInTx(Ljava/lang/Class;Ljava/lang/Iterable;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TE;>;",
            "Ljava/lang/Iterable",
            "<TE;>;)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 209
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    .local p2, "entities":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TE;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lde/greenrobot/dao/async/AsyncSession;->deleteInTx(Ljava/lang/Class;Ljava/lang/Iterable;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public deleteInTx(Ljava/lang/Class;Ljava/lang/Iterable;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 5
    .param p3, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TE;>;",
            "Ljava/lang/Iterable",
            "<TE;>;I)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 214
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    .local p2, "entities":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TE;>;"
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->DeleteInTxIterable:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-direct {p0, v0, p1, p2, p3}, Lde/greenrobot/dao/async/AsyncSession;->enqueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Class;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public varargs deleteInTx(Ljava/lang/Class;[Ljava/lang/Object;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TE;>;[TE;)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 199
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    .local p2, "entities":[Ljava/lang/Object;, "[TE;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lde/greenrobot/dao/async/AsyncSession;->deleteInTx(Ljava/lang/Class;I[Ljava/lang/Object;)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public getListener()Lde/greenrobot/dao/async/AsyncOperationListener;
    .registers 2

    .prologue
    .line 50
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncSession;->executor:Lde/greenrobot/dao/async/AsyncOperationExecutor;

    invoke-virtual {v0}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->getListener()Lde/greenrobot/dao/async/AsyncOperationListener;

    move-result-object v0

    return-object v0
.end method

.method public getListenerMainThread()Lde/greenrobot/dao/async/AsyncOperationListener;
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncSession;->executor:Lde/greenrobot/dao/async/AsyncOperationExecutor;

    invoke-virtual {v0}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->getListenerMainThread()Lde/greenrobot/dao/async/AsyncOperationListener;

    move-result-object v0

    return-object v0
.end method

.method public getMaxOperationCountToMerge()I
    .registers 2

    .prologue
    .line 34
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncSession;->executor:Lde/greenrobot/dao/async/AsyncOperationExecutor;

    invoke-virtual {v0}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->getMaxOperationCountToMerge()I

    move-result v0

    return v0
.end method

.method public getSessionFlags()I
    .registers 2

    .prologue
    .line 327
    iget v0, p0, Lde/greenrobot/dao/async/AsyncSession;->sessionFlags:I

    return v0
.end method

.method public getWaitForMergeMillis()I
    .registers 2

    .prologue
    .line 42
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncSession;->executor:Lde/greenrobot/dao/async/AsyncOperationExecutor;

    invoke-virtual {v0}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->getWaitForMergeMillis()I

    move-result v0

    return v0
.end method

.method public insert(Ljava/lang/Object;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 3
    .param p1, "entity"    # Ljava/lang/Object;

    .prologue
    .line 89
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lde/greenrobot/dao/async/AsyncSession;->insert(Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public insert(Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 4
    .param p1, "entity"    # Ljava/lang/Object;
    .param p2, "flags"    # I

    .prologue
    .line 94
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->Insert:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-direct {p0, v0, p1, p2}, Lde/greenrobot/dao/async/AsyncSession;->enqueueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public varargs insertInTx(Ljava/lang/Class;I[Ljava/lang/Object;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 5
    .param p2, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TE;>;I[TE;)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 104
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    .local p3, "entities":[Ljava/lang/Object;, "[TE;"
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->InsertInTxArray:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-direct {p0, v0, p1, p3, p2}, Lde/greenrobot/dao/async/AsyncSession;->enqueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Class;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public insertInTx(Ljava/lang/Class;Ljava/lang/Iterable;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TE;>;",
            "Ljava/lang/Iterable",
            "<TE;>;)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 109
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    .local p2, "entities":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TE;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lde/greenrobot/dao/async/AsyncSession;->insertInTx(Ljava/lang/Class;Ljava/lang/Iterable;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public insertInTx(Ljava/lang/Class;Ljava/lang/Iterable;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 5
    .param p3, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TE;>;",
            "Ljava/lang/Iterable",
            "<TE;>;I)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 114
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    .local p2, "entities":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TE;>;"
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->InsertInTxIterable:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-direct {p0, v0, p1, p2, p3}, Lde/greenrobot/dao/async/AsyncSession;->enqueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Class;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public varargs insertInTx(Ljava/lang/Class;[Ljava/lang/Object;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TE;>;[TE;)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 99
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    .local p2, "entities":[Ljava/lang/Object;, "[TE;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lde/greenrobot/dao/async/AsyncSession;->insertInTx(Ljava/lang/Class;I[Ljava/lang/Object;)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public insertOrReplace(Ljava/lang/Object;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 3
    .param p1, "entity"    # Ljava/lang/Object;

    .prologue
    .line 119
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lde/greenrobot/dao/async/AsyncSession;->insertOrReplace(Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public insertOrReplace(Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 4
    .param p1, "entity"    # Ljava/lang/Object;
    .param p2, "flags"    # I

    .prologue
    .line 124
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->InsertOrReplace:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-direct {p0, v0, p1, p2}, Lde/greenrobot/dao/async/AsyncSession;->enqueueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public varargs insertOrReplaceInTx(Ljava/lang/Class;I[Ljava/lang/Object;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 5
    .param p2, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TE;>;I[TE;)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 134
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    .local p3, "entities":[Ljava/lang/Object;, "[TE;"
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->InsertOrReplaceInTxArray:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-direct {p0, v0, p1, p3, p2}, Lde/greenrobot/dao/async/AsyncSession;->enqueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Class;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public insertOrReplaceInTx(Ljava/lang/Class;Ljava/lang/Iterable;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TE;>;",
            "Ljava/lang/Iterable",
            "<TE;>;)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 139
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    .local p2, "entities":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TE;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lde/greenrobot/dao/async/AsyncSession;->insertOrReplaceInTx(Ljava/lang/Class;Ljava/lang/Iterable;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public insertOrReplaceInTx(Ljava/lang/Class;Ljava/lang/Iterable;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 5
    .param p3, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TE;>;",
            "Ljava/lang/Iterable",
            "<TE;>;I)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 144
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    .local p2, "entities":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TE;>;"
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->InsertOrReplaceInTxIterable:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-direct {p0, v0, p1, p2, p3}, Lde/greenrobot/dao/async/AsyncSession;->enqueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Class;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public varargs insertOrReplaceInTx(Ljava/lang/Class;[Ljava/lang/Object;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TE;>;[TE;)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 129
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    .local p2, "entities":[Ljava/lang/Object;, "[TE;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lde/greenrobot/dao/async/AsyncSession;->insertOrReplaceInTx(Ljava/lang/Class;I[Ljava/lang/Object;)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public isCompleted()Z
    .registers 2

    .prologue
    .line 66
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncSession;->executor:Lde/greenrobot/dao/async/AsyncOperationExecutor;

    invoke-virtual {v0}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->isCompleted()Z

    move-result v0

    return v0
.end method

.method public load(Ljava/lang/Class;Ljava/lang/Object;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 4
    .param p2, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 269
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lde/greenrobot/dao/async/AsyncSession;->load(Ljava/lang/Class;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public load(Ljava/lang/Class;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 5
    .param p2, "key"    # Ljava/lang/Object;
    .param p3, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            "I)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 274
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->Load:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-direct {p0, v0, p1, p2, p3}, Lde/greenrobot/dao/async/AsyncSession;->enqueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Class;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public loadAll(Ljava/lang/Class;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 279
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lde/greenrobot/dao/async/AsyncSession;->loadAll(Ljava/lang/Class;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public loadAll(Ljava/lang/Class;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 5
    .param p2, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;I)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 284
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->LoadAll:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1, p2}, Lde/greenrobot/dao/async/AsyncSession;->enqueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Class;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public queryList(Lde/greenrobot/dao/query/Query;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/greenrobot/dao/query/Query",
            "<*>;)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 249
    .local p1, "query":Lde/greenrobot/dao/query/Query;, "Lde/greenrobot/dao/query/Query<*>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lde/greenrobot/dao/async/AsyncSession;->queryList(Lde/greenrobot/dao/query/Query;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public queryList(Lde/greenrobot/dao/query/Query;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 4
    .param p2, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/greenrobot/dao/query/Query",
            "<*>;I)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 254
    .local p1, "query":Lde/greenrobot/dao/query/Query;, "Lde/greenrobot/dao/query/Query<*>;"
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->QueryList:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-direct {p0, v0, p1, p2}, Lde/greenrobot/dao/async/AsyncSession;->enqueueDatabaseOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public queryUnique(Lde/greenrobot/dao/query/Query;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/greenrobot/dao/query/Query",
            "<*>;)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 259
    .local p1, "query":Lde/greenrobot/dao/query/Query;, "Lde/greenrobot/dao/query/Query<*>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lde/greenrobot/dao/async/AsyncSession;->queryUnique(Lde/greenrobot/dao/query/Query;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public queryUnique(Lde/greenrobot/dao/query/Query;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 4
    .param p2, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/greenrobot/dao/query/Query",
            "<*>;I)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 264
    .local p1, "query":Lde/greenrobot/dao/query/Query;, "Lde/greenrobot/dao/query/Query<*>;"
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->QueryUnique:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-direct {p0, v0, p1, p2}, Lde/greenrobot/dao/async/AsyncSession;->enqueueDatabaseOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public refresh(Ljava/lang/Object;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 3
    .param p1, "entity"    # Ljava/lang/Object;

    .prologue
    .line 299
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lde/greenrobot/dao/async/AsyncSession;->refresh(Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public refresh(Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 4
    .param p1, "entity"    # Ljava/lang/Object;
    .param p2, "flags"    # I

    .prologue
    .line 304
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->Refresh:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-direct {p0, v0, p1, p2}, Lde/greenrobot/dao/async/AsyncSession;->enqueueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public runInTx(Ljava/lang/Runnable;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 3
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 229
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lde/greenrobot/dao/async/AsyncSession;->runInTx(Ljava/lang/Runnable;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public runInTx(Ljava/lang/Runnable;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 4
    .param p1, "runnable"    # Ljava/lang/Runnable;
    .param p2, "flags"    # I

    .prologue
    .line 234
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->TransactionRunnable:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-direct {p0, v0, p1, p2}, Lde/greenrobot/dao/async/AsyncSession;->enqueueDatabaseOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public setListener(Lde/greenrobot/dao/async/AsyncOperationListener;)V
    .registers 3
    .param p1, "listener"    # Lde/greenrobot/dao/async/AsyncOperationListener;

    .prologue
    .line 54
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncSession;->executor:Lde/greenrobot/dao/async/AsyncOperationExecutor;

    invoke-virtual {v0, p1}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->setListener(Lde/greenrobot/dao/async/AsyncOperationListener;)V

    .line 55
    return-void
.end method

.method public setListenerMainThread(Lde/greenrobot/dao/async/AsyncOperationListener;)V
    .registers 3
    .param p1, "listenerMainThread"    # Lde/greenrobot/dao/async/AsyncOperationListener;

    .prologue
    .line 62
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncSession;->executor:Lde/greenrobot/dao/async/AsyncOperationExecutor;

    invoke-virtual {v0, p1}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->setListenerMainThread(Lde/greenrobot/dao/async/AsyncOperationListener;)V

    .line 63
    return-void
.end method

.method public setMaxOperationCountToMerge(I)V
    .registers 3
    .param p1, "maxOperationCountToMerge"    # I

    .prologue
    .line 38
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncSession;->executor:Lde/greenrobot/dao/async/AsyncOperationExecutor;

    invoke-virtual {v0, p1}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->setMaxOperationCountToMerge(I)V

    .line 39
    return-void
.end method

.method public setSessionFlags(I)V
    .registers 2
    .param p1, "sessionFlags"    # I

    .prologue
    .line 332
    iput p1, p0, Lde/greenrobot/dao/async/AsyncSession;->sessionFlags:I

    .line 333
    return-void
.end method

.method public setWaitForMergeMillis(I)V
    .registers 3
    .param p1, "waitForMergeMillis"    # I

    .prologue
    .line 46
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncSession;->executor:Lde/greenrobot/dao/async/AsyncOperationExecutor;

    invoke-virtual {v0, p1}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->setWaitForMergeMillis(I)V

    .line 47
    return-void
.end method

.method public update(Ljava/lang/Object;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 3
    .param p1, "entity"    # Ljava/lang/Object;

    .prologue
    .line 149
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lde/greenrobot/dao/async/AsyncSession;->update(Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public update(Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 4
    .param p1, "entity"    # Ljava/lang/Object;
    .param p2, "flags"    # I

    .prologue
    .line 154
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->Update:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-direct {p0, v0, p1, p2}, Lde/greenrobot/dao/async/AsyncSession;->enqueueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public varargs updateInTx(Ljava/lang/Class;I[Ljava/lang/Object;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 5
    .param p2, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TE;>;I[TE;)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 164
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    .local p3, "entities":[Ljava/lang/Object;, "[TE;"
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->UpdateInTxArray:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-direct {p0, v0, p1, p3, p2}, Lde/greenrobot/dao/async/AsyncSession;->enqueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Class;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public updateInTx(Ljava/lang/Class;Ljava/lang/Iterable;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TE;>;",
            "Ljava/lang/Iterable",
            "<TE;>;)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 169
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    .local p2, "entities":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TE;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lde/greenrobot/dao/async/AsyncSession;->updateInTx(Ljava/lang/Class;Ljava/lang/Iterable;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public updateInTx(Ljava/lang/Class;Ljava/lang/Iterable;I)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 5
    .param p3, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TE;>;",
            "Ljava/lang/Iterable",
            "<TE;>;I)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 174
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    .local p2, "entities":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TE;>;"
    sget-object v0, Lde/greenrobot/dao/async/AsyncOperation$OperationType;->UpdateInTxIterable:Lde/greenrobot/dao/async/AsyncOperation$OperationType;

    invoke-direct {p0, v0, p1, p2, p3}, Lde/greenrobot/dao/async/AsyncSession;->enqueEntityOperation(Lde/greenrobot/dao/async/AsyncOperation$OperationType;Ljava/lang/Class;Ljava/lang/Object;I)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public varargs updateInTx(Ljava/lang/Class;[Ljava/lang/Object;)Lde/greenrobot/dao/async/AsyncOperation;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TE;>;[TE;)",
            "Lde/greenrobot/dao/async/AsyncOperation;"
        }
    .end annotation

    .prologue
    .line 159
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    .local p2, "entities":[Ljava/lang/Object;, "[TE;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lde/greenrobot/dao/async/AsyncSession;->updateInTx(Ljava/lang/Class;I[Ljava/lang/Object;)Lde/greenrobot/dao/async/AsyncOperation;

    move-result-object v0

    return-object v0
.end method

.method public waitForCompletion()V
    .registers 2

    .prologue
    .line 74
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncSession;->executor:Lde/greenrobot/dao/async/AsyncOperationExecutor;

    invoke-virtual {v0}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->waitForCompletion()V

    .line 75
    return-void
.end method

.method public waitForCompletion(I)Z
    .registers 3
    .param p1, "maxMillis"    # I

    .prologue
    .line 84
    iget-object v0, p0, Lde/greenrobot/dao/async/AsyncSession;->executor:Lde/greenrobot/dao/async/AsyncOperationExecutor;

    invoke-virtual {v0, p1}, Lde/greenrobot/dao/async/AsyncOperationExecutor;->waitForCompletion(I)Z

    move-result v0

    return v0
.end method
