.class abstract Lorg/dmfs/provider/tasks/SQLiteContentProvider;
.super Landroid/content/ContentProvider;


# static fields
.field private static final MAX_OPERATIONS_PER_YIELD_POINT:I = 0x1f4

.field private static final SLEEP_AFTER_YIELD_DELAY:I = 0xfa0

.field private static final TAG:Ljava/lang/String; = "SQLiteContentProvider"


# instance fields
.field private final mApplyingBatch:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mChangedUris:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;


# direct methods
.method constructor <init>()V
    .registers 2

    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->mApplyingBatch:Ljava/lang/ThreadLocal;

    return-void
.end method

.method private applyingBatch()Z
    .registers 2

    iget-object v0, p0, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->mApplyingBatch:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_18

    iget-object v0, p0, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->mApplyingBatch:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_18

    const/4 v0, 0x1

    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method


# virtual methods
.method public applyBatch(Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ContentProviderOperation;",
            ">;)[",
            "Landroid/content/ContentProviderResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/OperationApplicationException;
        }
    .end annotation

    const/4 v5, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v7

    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_b
    iget-object v0, p0, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->mApplyingBatch:Ljava/lang/ThreadLocal;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v9, v8, [Landroid/content/ContentProviderResult;
    :try_end_1b
    .catchall {:try_start_b .. :try_end_1b} :catchall_84

    move v6, v2

    move v1, v2

    move v3, v2

    move v4, v2

    :goto_1f
    if-ge v6, v8, :cond_71

    add-int/lit8 v3, v3, 0x1

    const/16 v0, 0x1f4

    if-lt v3, v0, :cond_40

    :try_start_27
    new-instance v0, Landroid/content/OperationApplicationException;

    const-string v3, "Too many content provider operations between yield points. The maximum number of operations per yield point is 500"

    invoke-direct {v0, v3, v4}, Landroid/content/OperationApplicationException;-><init>(Ljava/lang/String;I)V

    throw v0
    :try_end_2f
    .catchall {:try_start_27 .. :try_end_2f} :catchall_2f

    :catchall_2f
    move-exception v0

    :goto_30
    iget-object v3, p0, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->mApplyingBatch:Ljava/lang/ThreadLocal;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    invoke-virtual {p0, v1}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->onEndTransaction(Z)V

    throw v0

    :cond_40
    :try_start_40
    invoke-virtual {p1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentProviderOperation;

    if-nez v1, :cond_53

    invoke-virtual {v0}, Landroid/content/ContentProviderOperation;->getUri()Landroid/net/Uri;

    move-result-object v10

    invoke-virtual {p0, v10}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->isCallerSyncAdapter(Landroid/net/Uri;)Z

    move-result v10

    if-eqz v10, :cond_53

    move v1, v5

    :cond_53
    if-lez v6, :cond_67

    invoke-virtual {v0}, Landroid/content/ContentProviderOperation;->isYieldAllowed()Z

    move-result v10

    if-eqz v10, :cond_67

    const-wide/16 v10, 0xfa0

    invoke-virtual {v7, v10, v11}, Landroid/database/sqlite/SQLiteDatabase;->yieldIfContendedSafely(J)Z

    move-result v3

    if-eqz v3, :cond_87

    add-int/lit8 v3, v4, 0x1

    move v4, v3

    move v3, v2

    :cond_67
    :goto_67
    invoke-virtual {v0, p0, v9, v6}, Landroid/content/ContentProviderOperation;->apply(Landroid/content/ContentProvider;[Landroid/content/ContentProviderResult;I)Landroid/content/ContentProviderResult;

    move-result-object v0

    aput-object v0, v9, v6

    add-int/lit8 v0, v6, 0x1

    move v6, v0

    goto :goto_1f

    :cond_71
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_74
    .catchall {:try_start_40 .. :try_end_74} :catchall_2f

    iget-object v0, p0, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->mApplyingBatch:Ljava/lang/ThreadLocal;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    invoke-virtual {p0, v1}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->onEndTransaction(Z)V

    return-object v9

    :catchall_84
    move-exception v0

    move v1, v2

    goto :goto_30

    :cond_87
    move v3, v2

    goto :goto_67
.end method

.method public bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I
    .registers 8

    array-length v1, p2

    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->isCallerSyncAdapter(Landroid/net/Uri;)Z

    move-result v2

    iget-object v0, p0, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const/4 v0, 0x0

    :goto_f
    if-ge v0, v1, :cond_1c

    :try_start_11
    aget-object v4, p2, v0

    invoke-virtual {p0, v3, p1, v4, v2}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->insertInTransaction(Landroid/database/sqlite/SQLiteDatabase;Landroid/net/Uri;Landroid/content/ContentValues;Z)Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->yieldIfContendedSafely()Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    :cond_1c
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1f
    .catchall {:try_start_11 .. :try_end_1f} :catchall_26

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    invoke-virtual {p0, v2}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->onEndTransaction(Z)V

    return v1

    :catchall_26
    move-exception v0

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0
.end method

.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .registers 10

    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->isCallerSyncAdapter(Landroid/net/Uri;)Z

    move-result v5

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->applyingBatch()Z

    move-result v0

    iget-object v1, p0, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    if-nez v0, :cond_2a

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    :try_start_17
    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->deleteInTransaction(Landroid/database/sqlite/SQLiteDatabase;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;Z)I

    move-result v0

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1e
    .catchall {:try_start_17 .. :try_end_1e} :catchall_25

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    invoke-virtual {p0, v5}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->onEndTransaction(Z)V

    :goto_24
    return v0

    :catchall_25
    move-exception v0

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    :cond_2a
    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->deleteInTransaction(Landroid/database/sqlite/SQLiteDatabase;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;Z)I

    move-result v0

    goto :goto_24
.end method

.method public abstract deleteInTransaction(Landroid/database/sqlite/SQLiteDatabase;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;Z)I
.end method

.method public getDatabaseHelper()Landroid/database/sqlite/SQLiteOpenHelper;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    return-object v0
.end method

.method protected abstract getDatabaseHelper(Landroid/content/Context;)Landroid/database/sqlite/SQLiteOpenHelper;
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .registers 6

    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->isCallerSyncAdapter(Landroid/net/Uri;)Z

    move-result v1

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->applyingBatch()Z

    move-result v0

    iget-object v2, p0, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    if-nez v0, :cond_26

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_13
    invoke-virtual {p0, v2, p1, p2, v1}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->insertInTransaction(Landroid/database/sqlite/SQLiteDatabase;Landroid/net/Uri;Landroid/content/ContentValues;Z)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1a
    .catchall {:try_start_13 .. :try_end_1a} :catchall_21

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    invoke-virtual {p0, v1}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->onEndTransaction(Z)V

    :goto_20
    return-object v0

    :catchall_21
    move-exception v0

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    :cond_26
    invoke-virtual {p0, v2, p1, p2, v1}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->insertInTransaction(Landroid/database/sqlite/SQLiteDatabase;Landroid/net/Uri;Landroid/content/ContentValues;Z)Landroid/net/Uri;

    move-result-object v0

    goto :goto_20
.end method

.method public abstract insertInTransaction(Landroid/database/sqlite/SQLiteDatabase;Landroid/net/Uri;Landroid/content/ContentValues;Z)Landroid/net/Uri;
.end method

.method public isCallerSyncAdapter(Landroid/net/Uri;)Z
    .registers 3

    const/4 v0, 0x0

    return v0
.end method

.method public onCreate()Z
    .registers 2

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->getDatabaseHelper(Landroid/content/Context;)Landroid/database/sqlite/SQLiteOpenHelper;

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->mChangedUris:Ljava/util/Set;

    const/4 v0, 0x1

    return v0
.end method

.method protected onEndTransaction(Z)V
    .registers 7

    iget-object v1, p0, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->mChangedUris:Ljava/util/Set;

    monitor-enter v1

    :try_start_3
    new-instance v0, Ljava/util/HashSet;

    iget-object v2, p0, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->mChangedUris:Ljava/util/Set;

    invoke-direct {v0, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iget-object v2, p0, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->mChangedUris:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->clear()V

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_36

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    if-nez p1, :cond_39

    invoke-virtual {p0, v0}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->syncToNetwork(Landroid/net/Uri;)Z

    move-result v1

    if-eqz v1, :cond_39

    const/4 v1, 0x1

    :goto_31
    const/4 v4, 0x0

    invoke-virtual {v2, v0, v4, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    goto :goto_1c

    :catchall_36
    move-exception v0

    :try_start_37
    monitor-exit v1
    :try_end_38
    .catchall {:try_start_37 .. :try_end_38} :catchall_36

    throw v0

    :cond_39
    const/4 v1, 0x0

    goto :goto_31

    :cond_3b
    return-void
.end method

.method protected postNotifyUri(Landroid/net/Uri;)V
    .registers 4

    iget-object v1, p0, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->mChangedUris:Ljava/util/Set;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->mChangedUris:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    monitor-exit v1

    return-void

    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method protected syncToNetwork(Landroid/net/Uri;)Z
    .registers 3

    const/4 v0, 0x0

    return v0
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .registers 12

    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->isCallerSyncAdapter(Landroid/net/Uri;)Z

    move-result v6

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->applyingBatch()Z

    move-result v0

    iget-object v1, p0, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    if-nez v0, :cond_2b

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    :try_start_18
    invoke-virtual/range {v0 .. v6}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->updateInTransaction(Landroid/database/sqlite/SQLiteDatabase;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;Z)I

    move-result v0

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1f
    .catchall {:try_start_18 .. :try_end_1f} :catchall_26

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    invoke-virtual {p0, v6}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->onEndTransaction(Z)V

    :goto_25
    return v0

    :catchall_26
    move-exception v0

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    :cond_2b
    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v6}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->updateInTransaction(Landroid/database/sqlite/SQLiteDatabase;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;Z)I

    move-result v0

    goto :goto_25
.end method

.method public abstract updateInTransaction(Landroid/database/sqlite/SQLiteDatabase;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;Z)I
.end method
