.class public Lde/greenrobot/dao/AbstractDaoSession;
.super Ljava/lang/Object;
.source "AbstractDaoSession.java"


# instance fields
.field private final db:Landroid/database/sqlite/SQLiteDatabase;

.field private final entityToDao:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lde/greenrobot/dao/AbstractDao",
            "<**>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 3
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lde/greenrobot/dao/AbstractDaoSession;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 52
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lde/greenrobot/dao/AbstractDaoSession;->entityToDao:Ljava/util/Map;

    .line 53
    return-void
.end method


# virtual methods
.method public callInTx(Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<TV;>;)TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 155
    .local p1, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TV;>;"
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDaoSession;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 157
    :try_start_5
    invoke-interface {p1}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v0

    .line 158
    .local v0, "result":Ljava/lang/Object;, "TV;"
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDaoSession;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_e
    .catchall {:try_start_5 .. :try_end_e} :catchall_14

    .line 161
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDaoSession;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-object v0

    .end local v0    # "result":Ljava/lang/Object;, "TV;"
    :catchall_14
    move-exception v1

    iget-object v2, p0, Lde/greenrobot/dao/AbstractDaoSession;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v1
.end method

.method public callInTxNoException(Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<TV;>;)TV;"
        }
    .end annotation

    .prologue
    .line 170
    .local p1, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TV;>;"
    iget-object v2, p0, Lde/greenrobot/dao/AbstractDaoSession;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 174
    :try_start_5
    invoke-interface {p1}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_8} :catch_14
    .catchall {:try_start_5 .. :try_end_8} :catchall_1d

    move-result-object v1

    .line 178
    .local v1, "result":Ljava/lang/Object;, "TV;"
    :try_start_9
    iget-object v2, p0, Lde/greenrobot/dao/AbstractDaoSession;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_e
    .catchall {:try_start_9 .. :try_end_e} :catchall_1d

    .line 181
    iget-object v2, p0, Lde/greenrobot/dao/AbstractDaoSession;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-object v1

    .line 175
    .end local v1    # "result":Ljava/lang/Object;, "TV;"
    :catch_14
    move-exception v0

    .line 176
    .local v0, "e":Ljava/lang/Exception;
    :try_start_15
    new-instance v2, Lde/greenrobot/dao/DaoException;

    const-string v3, "Callable failed"

    invoke-direct {v2, v3, v0}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_1d
    .catchall {:try_start_15 .. :try_end_1d} :catchall_1d

    .line 181
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_1d
    move-exception v2

    iget-object v3, p0, Lde/greenrobot/dao/AbstractDaoSession;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v2
.end method

.method public delete(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)V"
        }
    .end annotation

    .prologue
    .line 90
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lde/greenrobot/dao/AbstractDaoSession;->getDao(Ljava/lang/Class;)Lde/greenrobot/dao/AbstractDao;

    move-result-object v0

    .line 91
    .local v0, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;*>;"
    invoke-virtual {v0, p1}, Lde/greenrobot/dao/AbstractDao;->delete(Ljava/lang/Object;)V

    .line 92
    return-void
.end method

.method public deleteAll(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 97
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, p1}, Lde/greenrobot/dao/AbstractDaoSession;->getDao(Ljava/lang/Class;)Lde/greenrobot/dao/AbstractDao;

    move-result-object v0

    .line 98
    .local v0, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;*>;"
    invoke-virtual {v0}, Lde/greenrobot/dao/AbstractDao;->deleteAll()V

    .line 99
    return-void
.end method

.method public getDao(Ljava/lang/Class;)Lde/greenrobot/dao/AbstractDao;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/Object;",
            ">;)",
            "Lde/greenrobot/dao/AbstractDao",
            "<**>;"
        }
    .end annotation

    .prologue
    .line 130
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Object;>;"
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDaoSession;->entityToDao:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/AbstractDao;

    .line 131
    .local v0, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<**>;"
    if-nez v0, :cond_23

    .line 132
    new-instance v1, Lde/greenrobot/dao/DaoException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No DAO registered for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 134
    :cond_23
    return-object v0
.end method

.method public getDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .registers 2

    .prologue
    .line 187
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDaoSession;->db:Landroid/database/sqlite/SQLiteDatabase;

    return-object v0
.end method

.method public insert(Ljava/lang/Object;)J
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)J"
        }
    .end annotation

    .prologue
    .line 62
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lde/greenrobot/dao/AbstractDaoSession;->getDao(Ljava/lang/Class;)Lde/greenrobot/dao/AbstractDao;

    move-result-object v0

    .line 63
    .local v0, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;*>;"
    invoke-virtual {v0, p1}, Lde/greenrobot/dao/AbstractDao;->insert(Ljava/lang/Object;)J

    move-result-wide v1

    return-wide v1
.end method

.method public insertOrReplace(Ljava/lang/Object;)J
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)J"
        }
    .end annotation

    .prologue
    .line 69
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lde/greenrobot/dao/AbstractDaoSession;->getDao(Ljava/lang/Class;)Lde/greenrobot/dao/AbstractDao;

    move-result-object v0

    .line 70
    .local v0, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;*>;"
    invoke-virtual {v0, p1}, Lde/greenrobot/dao/AbstractDao;->insertOrReplace(Ljava/lang/Object;)J

    move-result-wide v1

    return-wide v1
.end method

.method public load(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "K:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;TK;)TT;"
        }
    .end annotation

    .prologue
    .line 104
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "key":Ljava/lang/Object;, "TK;"
    invoke-virtual {p0, p1}, Lde/greenrobot/dao/AbstractDaoSession;->getDao(Ljava/lang/Class;)Lde/greenrobot/dao/AbstractDao;

    move-result-object v0

    .line 105
    .local v0, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    invoke-virtual {v0, p2}, Lde/greenrobot/dao/AbstractDao;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public loadAll(Ljava/lang/Class;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "K:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 111
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, p1}, Lde/greenrobot/dao/AbstractDaoSession;->getDao(Ljava/lang/Class;)Lde/greenrobot/dao/AbstractDao;

    move-result-object v0

    .line 112
    .local v0, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    invoke-virtual {v0}, Lde/greenrobot/dao/AbstractDao;->loadAll()Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public queryBuilder(Ljava/lang/Class;)Lde/greenrobot/dao/query/QueryBuilder;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lde/greenrobot/dao/query/QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 125
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, p1}, Lde/greenrobot/dao/AbstractDaoSession;->getDao(Ljava/lang/Class;)Lde/greenrobot/dao/AbstractDao;

    move-result-object v0

    .line 126
    .local v0, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;*>;"
    invoke-virtual {v0}, Lde/greenrobot/dao/AbstractDao;->queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v1

    return-object v1
.end method

.method public varargs queryRaw(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;
    .registers 6
    .param p2, "where"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "K:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 118
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, p1}, Lde/greenrobot/dao/AbstractDaoSession;->getDao(Ljava/lang/Class;)Lde/greenrobot/dao/AbstractDao;

    move-result-object v0

    .line 119
    .local v0, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    invoke-virtual {v0, p2, p3}, Lde/greenrobot/dao/AbstractDao;->queryRaw(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public refresh(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lde/greenrobot/dao/AbstractDaoSession;->getDao(Ljava/lang/Class;)Lde/greenrobot/dao/AbstractDao;

    move-result-object v0

    .line 77
    .local v0, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;*>;"
    invoke-virtual {v0, p1}, Lde/greenrobot/dao/AbstractDao;->refresh(Ljava/lang/Object;)V

    .line 78
    return-void
.end method

.method protected registerDao(Ljava/lang/Class;Lde/greenrobot/dao/AbstractDao;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lde/greenrobot/dao/AbstractDao",
            "<TT;*>;)V"
        }
    .end annotation

    .prologue
    .line 56
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;*>;"
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDaoSession;->entityToDao:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    return-void
.end method

.method public runInTx(Ljava/lang/Runnable;)V
    .registers 4
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 141
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDaoSession;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 143
    :try_start_5
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 144
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDaoSession;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_d
    .catchall {:try_start_5 .. :try_end_d} :catchall_13

    .line 146
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDaoSession;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 148
    return-void

    .line 146
    :catchall_13
    move-exception v0

    iget-object v1, p0, Lde/greenrobot/dao/AbstractDaoSession;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0
.end method

.method public startAsyncSession()Lde/greenrobot/dao/async/AsyncSession;
    .registers 2

    .prologue
    .line 194
    new-instance v0, Lde/greenrobot/dao/async/AsyncSession;

    invoke-direct {v0, p0}, Lde/greenrobot/dao/async/AsyncSession;-><init>(Lde/greenrobot/dao/AbstractDaoSession;)V

    return-object v0
.end method

.method public update(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)V"
        }
    .end annotation

    .prologue
    .line 83
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lde/greenrobot/dao/AbstractDaoSession;->getDao(Ljava/lang/Class;)Lde/greenrobot/dao/AbstractDao;

    move-result-object v0

    .line 84
    .local v0, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;*>;"
    invoke-virtual {v0, p1}, Lde/greenrobot/dao/AbstractDao;->update(Ljava/lang/Object;)V

    .line 85
    return-void
.end method
