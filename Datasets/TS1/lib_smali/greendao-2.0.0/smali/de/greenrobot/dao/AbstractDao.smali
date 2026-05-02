.class public abstract Lde/greenrobot/dao/AbstractDao;
.super Ljava/lang/Object;
.source "AbstractDao.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected final config:Lde/greenrobot/dao/internal/DaoConfig;

.field protected final db:Landroid/database/sqlite/SQLiteDatabase;

.field protected identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/identityscope/IdentityScope",
            "<TK;TT;>;"
        }
    .end annotation
.end field

.field protected identityScopeLong:Lde/greenrobot/dao/identityscope/IdentityScopeLong;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/identityscope/IdentityScopeLong",
            "<TT;>;"
        }
    .end annotation
.end field

.field protected final pkOrdinal:I

.field protected final session:Lde/greenrobot/dao/AbstractDaoSession;

.field protected statements:Lde/greenrobot/dao/internal/TableStatements;


# direct methods
.method public constructor <init>(Lde/greenrobot/dao/internal/DaoConfig;)V
    .registers 3
    .param p1, "config"    # Lde/greenrobot/dao/internal/DaoConfig;

    .prologue
    .line 70
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lde/greenrobot/dao/AbstractDao;-><init>(Lde/greenrobot/dao/internal/DaoConfig;Lde/greenrobot/dao/AbstractDaoSession;)V

    .line 71
    return-void
.end method

.method public constructor <init>(Lde/greenrobot/dao/internal/DaoConfig;Lde/greenrobot/dao/AbstractDaoSession;)V
    .registers 4
    .param p1, "config"    # Lde/greenrobot/dao/internal/DaoConfig;
    .param p2, "daoSession"    # Lde/greenrobot/dao/AbstractDaoSession;

    .prologue
    .line 74
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iput-object p1, p0, Lde/greenrobot/dao/AbstractDao;->config:Lde/greenrobot/dao/internal/DaoConfig;

    .line 76
    iput-object p2, p0, Lde/greenrobot/dao/AbstractDao;->session:Lde/greenrobot/dao/AbstractDaoSession;

    .line 77
    iget-object v0, p1, Lde/greenrobot/dao/internal/DaoConfig;->db:Landroid/database/sqlite/SQLiteDatabase;

    iput-object v0, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 78
    invoke-virtual {p1}, Lde/greenrobot/dao/internal/DaoConfig;->getIdentityScope()Lde/greenrobot/dao/identityscope/IdentityScope;

    move-result-object v0

    iput-object v0, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    .line 79
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    instance-of v0, v0, Lde/greenrobot/dao/identityscope/IdentityScopeLong;

    if-eqz v0, :cond_1d

    .line 80
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    check-cast v0, Lde/greenrobot/dao/identityscope/IdentityScopeLong;

    iput-object v0, p0, Lde/greenrobot/dao/AbstractDao;->identityScopeLong:Lde/greenrobot/dao/identityscope/IdentityScopeLong;

    .line 82
    :cond_1d
    iget-object v0, p1, Lde/greenrobot/dao/internal/DaoConfig;->statements:Lde/greenrobot/dao/internal/TableStatements;

    iput-object v0, p0, Lde/greenrobot/dao/AbstractDao;->statements:Lde/greenrobot/dao/internal/TableStatements;

    .line 83
    iget-object v0, p1, Lde/greenrobot/dao/internal/DaoConfig;->pkProperty:Lde/greenrobot/dao/Property;

    if-eqz v0, :cond_2c

    iget-object v0, p1, Lde/greenrobot/dao/internal/DaoConfig;->pkProperty:Lde/greenrobot/dao/Property;

    iget v0, v0, Lde/greenrobot/dao/Property;->ordinal:I

    :goto_29
    iput v0, p0, Lde/greenrobot/dao/AbstractDao;->pkOrdinal:I

    .line 84
    return-void

    .line 83
    :cond_2c
    const/4 v0, -0x1

    goto :goto_29
.end method

.method private deleteByKeyInsideSynchronized(Ljava/lang/Object;Landroid/database/sqlite/SQLiteStatement;)V
    .registers 6
    .param p2, "stmt"    # Landroid/database/sqlite/SQLiteStatement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Landroid/database/sqlite/SQLiteStatement;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    const/4 v2, 0x1

    .line 526
    instance-of v0, p1, Ljava/lang/Long;

    if-eqz v0, :cond_12

    .line 527
    check-cast p1, Ljava/lang/Long;

    .end local p1    # "key":Ljava/lang/Object;, "TK;"
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p2, v2, v0, v1}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 533
    :goto_e
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    .line 534
    return-void

    .line 528
    .restart local p1    # "key":Ljava/lang/Object;, "TK;"
    :cond_12
    if-nez p1, :cond_1c

    .line 529
    new-instance v0, Lde/greenrobot/dao/DaoException;

    const-string v1, "Cannot delete entity, key is null"

    invoke-direct {v0, v1}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 531
    :cond_1c
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v2, v0}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    goto :goto_e
.end method

.method private deleteInTxInternal(Ljava/lang/Iterable;Ljava/lang/Iterable;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<TT;>;",
            "Ljava/lang/Iterable",
            "<TK;>;)V"
        }
    .end annotation

    .prologue
    .line 537
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entities":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TT;>;"
    .local p2, "keys":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TK;>;"
    invoke-virtual {p0}, Lde/greenrobot/dao/AbstractDao;->assertSinglePk()V

    .line 538
    iget-object v6, p0, Lde/greenrobot/dao/AbstractDao;->statements:Lde/greenrobot/dao/internal/TableStatements;

    invoke-virtual {v6}, Lde/greenrobot/dao/internal/TableStatements;->getDeleteStatement()Landroid/database/sqlite/SQLiteStatement;

    move-result-object v5

    .line 539
    .local v5, "stmt":Landroid/database/sqlite/SQLiteStatement;
    const/4 v3, 0x0

    .line 540
    .local v3, "keysToRemoveFromIdentityScope":Ljava/util/List;, "Ljava/util/List<TK;>;"
    iget-object v6, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 542
    :try_start_f
    monitor-enter v5
    :try_end_10
    .catchall {:try_start_f .. :try_end_10} :catchall_4a

    .line 543
    :try_start_10
    iget-object v6, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    if-eqz v6, :cond_1f

    .line 544
    iget-object v6, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v6}, Lde/greenrobot/dao/identityscope/IdentityScope;->lock()V

    .line 545
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V
    :try_end_1e
    .catchall {:try_start_10 .. :try_end_1e} :catchall_47

    .end local v3    # "keysToRemoveFromIdentityScope":Ljava/util/List;, "Ljava/util/List<TK;>;"
    .local v4, "keysToRemoveFromIdentityScope":Ljava/util/List;, "Ljava/util/List<TK;>;"
    move-object v3, v4

    .line 548
    .end local v4    # "keysToRemoveFromIdentityScope":Ljava/util/List;, "Ljava/util/List<TK;>;"
    .restart local v3    # "keysToRemoveFromIdentityScope":Ljava/util/List;, "Ljava/util/List<TK;>;"
    :cond_1f
    if-eqz p1, :cond_51

    .line 549
    :try_start_21
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_25
    :goto_25
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_51

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 550
    .local v0, "entity":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v0}, Lde/greenrobot/dao/AbstractDao;->getKeyVerified(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 551
    .local v2, "key":Ljava/lang/Object;, "TK;"
    invoke-direct {p0, v2, v5}, Lde/greenrobot/dao/AbstractDao;->deleteByKeyInsideSynchronized(Ljava/lang/Object;Landroid/database/sqlite/SQLiteStatement;)V

    .line 552
    if-eqz v3, :cond_25

    .line 553
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3b
    .catchall {:try_start_21 .. :try_end_3b} :catchall_3c

    goto :goto_25

    .line 566
    .end local v0    # "entity":Ljava/lang/Object;, "TT;"
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "key":Ljava/lang/Object;, "TK;"
    :catchall_3c
    move-exception v6

    :try_start_3d
    iget-object v7, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    if-eqz v7, :cond_46

    .line 567
    iget-object v7, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v7}, Lde/greenrobot/dao/identityscope/IdentityScope;->unlock()V

    :cond_46
    throw v6

    .line 570
    :catchall_47
    move-exception v6

    monitor-exit v5
    :try_end_49
    .catchall {:try_start_3d .. :try_end_49} :catchall_47

    :try_start_49
    throw v6
    :try_end_4a
    .catchall {:try_start_49 .. :try_end_4a} :catchall_4a

    .line 576
    :catchall_4a
    move-exception v6

    iget-object v7, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v6

    .line 557
    :cond_51
    if-eqz p2, :cond_6a

    .line 558
    :try_start_53
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_57
    :goto_57
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 559
    .restart local v2    # "key":Ljava/lang/Object;, "TK;"
    invoke-direct {p0, v2, v5}, Lde/greenrobot/dao/AbstractDao;->deleteByKeyInsideSynchronized(Ljava/lang/Object;Landroid/database/sqlite/SQLiteStatement;)V

    .line 560
    if-eqz v3, :cond_57

    .line 561
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_69
    .catchall {:try_start_53 .. :try_end_69} :catchall_3c

    goto :goto_57

    .line 566
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "key":Ljava/lang/Object;, "TK;"
    :cond_6a
    :try_start_6a
    iget-object v6, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    if-eqz v6, :cond_73

    .line 567
    iget-object v6, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v6}, Lde/greenrobot/dao/identityscope/IdentityScope;->unlock()V

    .line 570
    :cond_73
    monitor-exit v5
    :try_end_74
    .catchall {:try_start_6a .. :try_end_74} :catchall_47

    .line 571
    :try_start_74
    iget-object v6, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 572
    if-eqz v3, :cond_84

    iget-object v6, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    if-eqz v6, :cond_84

    .line 573
    iget-object v6, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v6, v3}, Lde/greenrobot/dao/identityscope/IdentityScope;->remove(Ljava/lang/Iterable;)V
    :try_end_84
    .catchall {:try_start_74 .. :try_end_84} :catchall_4a

    .line 576
    :cond_84
    iget-object v6, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 578
    return-void
.end method

.method private executeInsert(Ljava/lang/Object;Landroid/database/sqlite/SQLiteStatement;)J
    .registers 7
    .param p2, "stmt"    # Landroid/database/sqlite/SQLiteStatement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/database/sqlite/SQLiteStatement;",
            ")J"
        }
    .end annotation

    .prologue
    .line 337
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    iget-object v2, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->isDbLockedByCurrentThread()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 338
    monitor-enter p2

    .line 339
    :try_start_9
    invoke-virtual {p0, p2, p1}, Lde/greenrobot/dao/AbstractDao;->bindValues(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/Object;)V

    .line 340
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteStatement;->executeInsert()J

    move-result-wide v0

    .line 341
    .local v0, "rowId":J
    monitor-exit p2
    :try_end_11
    .catchall {:try_start_9 .. :try_end_11} :catchall_16

    .line 355
    :goto_11
    const/4 v2, 0x1

    invoke-virtual {p0, p1, v0, v1, v2}, Lde/greenrobot/dao/AbstractDao;->updateKeyAfterInsertAndAttach(Ljava/lang/Object;JZ)V

    .line 356
    return-wide v0

    .line 341
    .end local v0    # "rowId":J
    :catchall_16
    move-exception v2

    :try_start_17
    monitor-exit p2
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v2

    .line 344
    :cond_19
    iget-object v2, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 346
    :try_start_1e
    monitor-enter p2
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_35

    .line 347
    :try_start_1f
    invoke-virtual {p0, p2, p1}, Lde/greenrobot/dao/AbstractDao;->bindValues(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/Object;)V

    .line 348
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteStatement;->executeInsert()J

    move-result-wide v0

    .line 349
    .restart local v0    # "rowId":J
    monitor-exit p2
    :try_end_27
    .catchall {:try_start_1f .. :try_end_27} :catchall_32

    .line 350
    :try_start_27
    iget-object v2, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2c
    .catchall {:try_start_27 .. :try_end_2c} :catchall_35

    .line 352
    iget-object v2, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_11

    .line 349
    .end local v0    # "rowId":J
    :catchall_32
    move-exception v2

    :try_start_33
    monitor-exit p2
    :try_end_34
    .catchall {:try_start_33 .. :try_end_34} :catchall_32

    :try_start_34
    throw v2
    :try_end_35
    .catchall {:try_start_34 .. :try_end_35} :catchall_35

    .line 352
    :catchall_35
    move-exception v2

    iget-object v3, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v2
.end method

.method private executeInsertInTx(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/Iterable;Z)V
    .registers 10
    .param p1, "stmt"    # Landroid/database/sqlite/SQLiteStatement;
    .param p3, "setPrimaryKey"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteStatement;",
            "Ljava/lang/Iterable",
            "<TT;>;Z)V"
        }
    .end annotation

    .prologue
    .line 259
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p2, "entities":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TT;>;"
    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 261
    :try_start_5
    monitor-enter p1
    :try_end_6
    .catchall {:try_start_5 .. :try_end_6} :catchall_39

    .line 262
    :try_start_6
    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    if-eqz v4, :cond_f

    .line 263
    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v4}, Lde/greenrobot/dao/identityscope/IdentityScope;->lock()V
    :try_end_f
    .catchall {:try_start_6 .. :try_end_f} :catchall_36

    .line 266
    :cond_f
    :try_start_f
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_44

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 267
    .local v0, "entity":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p1, v0}, Lde/greenrobot/dao/AbstractDao;->bindValues(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/Object;)V

    .line 268
    if-eqz p3, :cond_40

    .line 269
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->executeInsert()J

    move-result-wide v2

    .line 270
    .local v2, "rowId":J
    const/4 v4, 0x0

    invoke-virtual {p0, v0, v2, v3, v4}, Lde/greenrobot/dao/AbstractDao;->updateKeyAfterInsertAndAttach(Ljava/lang/Object;JZ)V
    :try_end_2a
    .catchall {:try_start_f .. :try_end_2a} :catchall_2b

    goto :goto_13

    .line 276
    .end local v0    # "entity":Ljava/lang/Object;, "TT;"
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "rowId":J
    :catchall_2b
    move-exception v4

    :try_start_2c
    iget-object v5, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    if-eqz v5, :cond_35

    .line 277
    iget-object v5, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v5}, Lde/greenrobot/dao/identityscope/IdentityScope;->unlock()V

    :cond_35
    throw v4

    .line 280
    :catchall_36
    move-exception v4

    monitor-exit p1
    :try_end_38
    .catchall {:try_start_2c .. :try_end_38} :catchall_36

    :try_start_38
    throw v4
    :try_end_39
    .catchall {:try_start_38 .. :try_end_39} :catchall_39

    .line 283
    :catchall_39
    move-exception v4

    iget-object v5, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v4

    .line 272
    .restart local v0    # "entity":Ljava/lang/Object;, "TT;"
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_40
    :try_start_40
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteStatement;->execute()V
    :try_end_43
    .catchall {:try_start_40 .. :try_end_43} :catchall_2b

    goto :goto_13

    .line 276
    .end local v0    # "entity":Ljava/lang/Object;, "TT;"
    :cond_44
    :try_start_44
    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    if-eqz v4, :cond_4d

    .line 277
    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v4}, Lde/greenrobot/dao/identityscope/IdentityScope;->unlock()V

    .line 280
    :cond_4d
    monitor-exit p1
    :try_end_4e
    .catchall {:try_start_44 .. :try_end_4e} :catchall_36

    .line 281
    :try_start_4e
    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_53
    .catchall {:try_start_4e .. :try_end_53} :catchall_39

    .line 283
    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 285
    return-void
.end method


# virtual methods
.method protected assertSinglePk()V
    .registers 4

    .prologue
    .line 765
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->config:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, v0, Lde/greenrobot/dao/internal/DaoConfig;->pkColumns:[Ljava/lang/String;

    array-length v0, v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2f

    .line 766
    new-instance v0, Lde/greenrobot/dao/DaoException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lde/greenrobot/dao/AbstractDao;->config:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v2, v2, Lde/greenrobot/dao/internal/DaoConfig;->tablename:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") does not have a single-column primary key"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 768
    :cond_2f
    return-void
.end method

.method protected attachEntity(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 710
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    return-void
.end method

.method protected final attachEntity(Ljava/lang/Object;Ljava/lang/Object;Z)V
    .registers 5
    .param p3, "lock"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TT;Z)V"
        }
    .end annotation

    .prologue
    .line 692
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "entity":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p2}, Lde/greenrobot/dao/AbstractDao;->attachEntity(Ljava/lang/Object;)V

    .line 693
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    if-eqz v0, :cond_10

    if-eqz p1, :cond_10

    .line 694
    if-eqz p3, :cond_11

    .line 695
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v0, p1, p2}, Lde/greenrobot/dao/identityscope/IdentityScope;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 700
    :cond_10
    :goto_10
    return-void

    .line 697
    :cond_11
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v0, p1, p2}, Lde/greenrobot/dao/identityscope/IdentityScope;->putNoLock(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_10
.end method

.method protected abstract bindValues(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteStatement;",
            "TT;)V"
        }
    .end annotation
.end method

.method public count()J
    .registers 5

    .prologue
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    const/16 v3, 0x27

    .line 771
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lde/greenrobot/dao/AbstractDao;->config:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v2, v2, Lde/greenrobot/dao/internal/DaoConfig;->tablename:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/database/DatabaseUtils;->queryNumEntries(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public delete(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 495
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0}, Lde/greenrobot/dao/AbstractDao;->assertSinglePk()V

    .line 496
    invoke-virtual {p0, p1}, Lde/greenrobot/dao/AbstractDao;->getKeyVerified(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 497
    .local v0, "key":Ljava/lang/Object;, "TK;"
    invoke-virtual {p0, v0}, Lde/greenrobot/dao/AbstractDao;->deleteByKey(Ljava/lang/Object;)V

    .line 498
    return-void
.end method

.method public deleteAll()V
    .registers 4

    .prologue
    .line 487
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DELETE FROM \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lde/greenrobot/dao/AbstractDao;->config:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v2, v2, Lde/greenrobot/dao/internal/DaoConfig;->tablename:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 488
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    if-eqz v0, :cond_2b

    .line 489
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v0}, Lde/greenrobot/dao/identityscope/IdentityScope;->clear()V

    .line 491
    :cond_2b
    return-void
.end method

.method public deleteByKey(Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    .prologue
    .line 502
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    invoke-virtual {p0}, Lde/greenrobot/dao/AbstractDao;->assertSinglePk()V

    .line 503
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDao;->statements:Lde/greenrobot/dao/internal/TableStatements;

    invoke-virtual {v1}, Lde/greenrobot/dao/internal/TableStatements;->getDeleteStatement()Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 504
    .local v0, "stmt":Landroid/database/sqlite/SQLiteStatement;
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->isDbLockedByCurrentThread()Z

    move-result v1

    if-eqz v1, :cond_23

    .line 505
    monitor-enter v0

    .line 506
    :try_start_12
    invoke-direct {p0, p1, v0}, Lde/greenrobot/dao/AbstractDao;->deleteByKeyInsideSynchronized(Ljava/lang/Object;Landroid/database/sqlite/SQLiteStatement;)V

    .line 507
    monitor-exit v0
    :try_end_16
    .catchall {:try_start_12 .. :try_end_16} :catchall_20

    .line 520
    :goto_16
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    if-eqz v1, :cond_1f

    .line 521
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v1, p1}, Lde/greenrobot/dao/identityscope/IdentityScope;->remove(Ljava/lang/Object;)V

    .line 523
    :cond_1f
    return-void

    .line 507
    :catchall_20
    move-exception v1

    :try_start_21
    monitor-exit v0
    :try_end_22
    .catchall {:try_start_21 .. :try_end_22} :catchall_20

    throw v1

    .line 510
    :cond_23
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 512
    :try_start_28
    monitor-enter v0
    :try_end_29
    .catchall {:try_start_28 .. :try_end_29} :catchall_3b

    .line 513
    :try_start_29
    invoke-direct {p0, p1, v0}, Lde/greenrobot/dao/AbstractDao;->deleteByKeyInsideSynchronized(Ljava/lang/Object;Landroid/database/sqlite/SQLiteStatement;)V

    .line 514
    monitor-exit v0
    :try_end_2d
    .catchall {:try_start_29 .. :try_end_2d} :catchall_38

    .line 515
    :try_start_2d
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_32
    .catchall {:try_start_2d .. :try_end_32} :catchall_3b

    .line 517
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_16

    .line 514
    :catchall_38
    move-exception v1

    :try_start_39
    monitor-exit v0
    :try_end_3a
    .catchall {:try_start_39 .. :try_end_3a} :catchall_38

    :try_start_3a
    throw v1
    :try_end_3b
    .catchall {:try_start_3a .. :try_end_3b} :catchall_3b

    .line 517
    :catchall_3b
    move-exception v1

    iget-object v2, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v1
.end method

.method public deleteByKeyInTx(Ljava/lang/Iterable;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<TK;>;)V"
        }
    .end annotation

    .prologue
    .line 607
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "keys":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TK;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lde/greenrobot/dao/AbstractDao;->deleteInTxInternal(Ljava/lang/Iterable;Ljava/lang/Iterable;)V

    .line 608
    return-void
.end method

.method public varargs deleteByKeyInTx([Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TK;)V"
        }
    .end annotation

    .prologue
    .line 617
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "keys":[Ljava/lang/Object;, "[TK;"
    const/4 v0, 0x0

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lde/greenrobot/dao/AbstractDao;->deleteInTxInternal(Ljava/lang/Iterable;Ljava/lang/Iterable;)V

    .line 618
    return-void
.end method

.method public deleteInTx(Ljava/lang/Iterable;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 587
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entities":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lde/greenrobot/dao/AbstractDao;->deleteInTxInternal(Ljava/lang/Iterable;Ljava/lang/Iterable;)V

    .line 588
    return-void
.end method

.method public varargs deleteInTx([Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    .prologue
    .line 597
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entities":[Ljava/lang/Object;, "[TT;"
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lde/greenrobot/dao/AbstractDao;->deleteInTxInternal(Ljava/lang/Iterable;Ljava/lang/Iterable;)V

    .line 598
    return-void
.end method

.method public detach(Ljava/lang/Object;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 174
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    if-eqz v1, :cond_f

    .line 175
    invoke-virtual {p0, p1}, Lde/greenrobot/dao/AbstractDao;->getKeyVerified(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 176
    .local v0, "key":Ljava/lang/Object;, "TK;"
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v1, v0, p1}, Lde/greenrobot/dao/identityscope/IdentityScope;->detach(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    .line 178
    .end local v0    # "key":Ljava/lang/Object;, "TK;"
    :goto_e
    return v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public getAllColumns()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 107
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->config:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, v0, Lde/greenrobot/dao/internal/DaoConfig;->allColumns:[Ljava/lang/String;

    return-object v0
.end method

.method public getDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .registers 2

    .prologue
    .line 790
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    return-object v0
.end method

.method protected abstract getKey(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TK;"
        }
    .end annotation
.end method

.method protected getKeyVerified(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TK;"
        }
    .end annotation

    .prologue
    .line 776
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p1}, Lde/greenrobot/dao/AbstractDao;->getKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 777
    .local v0, "key":Ljava/lang/Object;, "TK;"
    if-nez v0, :cond_18

    .line 778
    if-nez p1, :cond_10

    .line 779
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "Entity may not be null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 781
    :cond_10
    new-instance v1, Lde/greenrobot/dao/DaoException;

    const-string v2, "Entity has no key"

    invoke-direct {v1, v2}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 784
    :cond_18
    return-object v0
.end method

.method public getNonPkColumns()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 115
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->config:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, v0, Lde/greenrobot/dao/internal/DaoConfig;->nonPkColumns:[Ljava/lang/String;

    return-object v0
.end method

.method public getPkColumns()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 111
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->config:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, v0, Lde/greenrobot/dao/internal/DaoConfig;->pkColumns:[Ljava/lang/String;

    return-object v0
.end method

.method public getPkProperty()Lde/greenrobot/dao/Property;
    .registers 2

    .prologue
    .line 103
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->config:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, v0, Lde/greenrobot/dao/internal/DaoConfig;->pkProperty:Lde/greenrobot/dao/Property;

    return-object v0
.end method

.method public getProperties()[Lde/greenrobot/dao/Property;
    .registers 2

    .prologue
    .line 99
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->config:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, v0, Lde/greenrobot/dao/internal/DaoConfig;->properties:[Lde/greenrobot/dao/Property;

    return-object v0
.end method

.method public getSession()Lde/greenrobot/dao/AbstractDaoSession;
    .registers 2

    .prologue
    .line 87
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->session:Lde/greenrobot/dao/AbstractDaoSession;

    return-object v0
.end method

.method getStatements()Lde/greenrobot/dao/internal/TableStatements;
    .registers 2

    .prologue
    .line 91
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->config:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, v0, Lde/greenrobot/dao/internal/DaoConfig;->statements:Lde/greenrobot/dao/internal/TableStatements;

    return-object v0
.end method

.method public getTablename()Ljava/lang/String;
    .registers 2

    .prologue
    .line 95
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->config:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v0, v0, Lde/greenrobot/dao/internal/DaoConfig;->tablename:Ljava/lang/String;

    return-object v0
.end method

.method public insert(Ljava/lang/Object;)J
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)J"
        }
    .end annotation

    .prologue
    .line 293
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->statements:Lde/greenrobot/dao/internal/TableStatements;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/TableStatements;->getInsertStatement()Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lde/greenrobot/dao/AbstractDao;->executeInsert(Ljava/lang/Object;Landroid/database/sqlite/SQLiteStatement;)J

    move-result-wide v0

    return-wide v0
.end method

.method public insertInTx(Ljava/lang/Iterable;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 197
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entities":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TT;>;"
    invoke-virtual {p0}, Lde/greenrobot/dao/AbstractDao;->isEntityUpdateable()Z

    move-result v0

    invoke-virtual {p0, p1, v0}, Lde/greenrobot/dao/AbstractDao;->insertInTx(Ljava/lang/Iterable;Z)V

    .line 198
    return-void
.end method

.method public insertInTx(Ljava/lang/Iterable;Z)V
    .registers 5
    .param p2, "setPrimaryKey"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<TT;>;Z)V"
        }
    .end annotation

    .prologue
    .line 220
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entities":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TT;>;"
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDao;->statements:Lde/greenrobot/dao/internal/TableStatements;

    invoke-virtual {v1}, Lde/greenrobot/dao/internal/TableStatements;->getInsertStatement()Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 221
    .local v0, "stmt":Landroid/database/sqlite/SQLiteStatement;
    invoke-direct {p0, v0, p1, p2}, Lde/greenrobot/dao/AbstractDao;->executeInsertInTx(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/Iterable;Z)V

    .line 222
    return-void
.end method

.method public varargs insertInTx([Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    .prologue
    .line 207
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entities":[Ljava/lang/Object;, "[TT;"
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0}, Lde/greenrobot/dao/AbstractDao;->isEntityUpdateable()Z

    move-result v1

    invoke-virtual {p0, v0, v1}, Lde/greenrobot/dao/AbstractDao;->insertInTx(Ljava/lang/Iterable;Z)V

    .line 208
    return-void
.end method

.method public insertOrReplace(Ljava/lang/Object;)J
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)J"
        }
    .end annotation

    .prologue
    .line 332
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lde/greenrobot/dao/AbstractDao;->statements:Lde/greenrobot/dao/internal/TableStatements;

    invoke-virtual {v0}, Lde/greenrobot/dao/internal/TableStatements;->getInsertOrReplaceStatement()Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lde/greenrobot/dao/AbstractDao;->executeInsert(Ljava/lang/Object;Landroid/database/sqlite/SQLiteStatement;)J

    move-result-wide v0

    return-wide v0
.end method

.method public insertOrReplaceInTx(Ljava/lang/Iterable;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 245
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entities":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TT;>;"
    invoke-virtual {p0}, Lde/greenrobot/dao/AbstractDao;->isEntityUpdateable()Z

    move-result v0

    invoke-virtual {p0, p1, v0}, Lde/greenrobot/dao/AbstractDao;->insertOrReplaceInTx(Ljava/lang/Iterable;Z)V

    .line 246
    return-void
.end method

.method public insertOrReplaceInTx(Ljava/lang/Iterable;Z)V
    .registers 5
    .param p2, "setPrimaryKey"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<TT;>;Z)V"
        }
    .end annotation

    .prologue
    .line 234
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entities":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TT;>;"
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDao;->statements:Lde/greenrobot/dao/internal/TableStatements;

    invoke-virtual {v1}, Lde/greenrobot/dao/internal/TableStatements;->getInsertOrReplaceStatement()Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 235
    .local v0, "stmt":Landroid/database/sqlite/SQLiteStatement;
    invoke-direct {p0, v0, p1, p2}, Lde/greenrobot/dao/AbstractDao;->executeInsertInTx(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/Iterable;Z)V

    .line 236
    return-void
.end method

.method public varargs insertOrReplaceInTx([Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    .prologue
    .line 255
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entities":[Ljava/lang/Object;, "[TT;"
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0}, Lde/greenrobot/dao/AbstractDao;->isEntityUpdateable()Z

    move-result v1

    invoke-virtual {p0, v0, v1}, Lde/greenrobot/dao/AbstractDao;->insertOrReplaceInTx(Ljava/lang/Iterable;Z)V

    .line 256
    return-void
.end method

.method public insertWithoutSettingPk(Ljava/lang/Object;)J
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)J"
        }
    .end annotation

    .prologue
    .line 303
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    iget-object v3, p0, Lde/greenrobot/dao/AbstractDao;->statements:Lde/greenrobot/dao/internal/TableStatements;

    invoke-virtual {v3}, Lde/greenrobot/dao/internal/TableStatements;->getInsertStatement()Landroid/database/sqlite/SQLiteStatement;

    move-result-object v2

    .line 305
    .local v2, "stmt":Landroid/database/sqlite/SQLiteStatement;
    iget-object v3, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->isDbLockedByCurrentThread()Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 306
    monitor-enter v2

    .line 307
    :try_start_f
    invoke-virtual {p0, v2, p1}, Lde/greenrobot/dao/AbstractDao;->bindValues(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/Object;)V

    .line 308
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->executeInsert()J

    move-result-wide v0

    .line 309
    .local v0, "rowId":J
    monitor-exit v2

    .line 323
    :goto_17
    return-wide v0

    .line 309
    .end local v0    # "rowId":J
    :catchall_18
    move-exception v3

    monitor-exit v2
    :try_end_1a
    .catchall {:try_start_f .. :try_end_1a} :catchall_18

    throw v3

    .line 312
    :cond_1b
    iget-object v3, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 314
    :try_start_20
    monitor-enter v2
    :try_end_21
    .catchall {:try_start_20 .. :try_end_21} :catchall_37

    .line 315
    :try_start_21
    invoke-virtual {p0, v2, p1}, Lde/greenrobot/dao/AbstractDao;->bindValues(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/Object;)V

    .line 316
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->executeInsert()J

    move-result-wide v0

    .line 317
    .restart local v0    # "rowId":J
    monitor-exit v2
    :try_end_29
    .catchall {:try_start_21 .. :try_end_29} :catchall_34

    .line 318
    :try_start_29
    iget-object v3, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2e
    .catchall {:try_start_29 .. :try_end_2e} :catchall_37

    .line 320
    iget-object v3, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_17

    .line 317
    .end local v0    # "rowId":J
    :catchall_34
    move-exception v3

    :try_start_35
    monitor-exit v2
    :try_end_36
    .catchall {:try_start_35 .. :try_end_36} :catchall_34

    :try_start_36
    throw v3
    :try_end_37
    .catchall {:try_start_36 .. :try_end_37} :catchall_37

    .line 320
    :catchall_37
    move-exception v3

    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3
.end method

.method protected abstract isEntityUpdateable()Z
.end method

.method public load(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TT;"
        }
    .end annotation

    .prologue
    .line 126
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    invoke-virtual {p0}, Lde/greenrobot/dao/AbstractDao;->assertSinglePk()V

    .line 127
    if-nez p1, :cond_7

    .line 128
    const/4 v1, 0x0

    .line 139
    :cond_6
    :goto_6
    return-object v1

    .line 130
    :cond_7
    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    if-eqz v4, :cond_13

    .line 131
    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v4, p1}, Lde/greenrobot/dao/identityscope/IdentityScope;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 132
    .local v1, "entity":Ljava/lang/Object;, "TT;"
    if-nez v1, :cond_6

    .line 136
    .end local v1    # "entity":Ljava/lang/Object;, "TT;"
    :cond_13
    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->statements:Lde/greenrobot/dao/internal/TableStatements;

    invoke-virtual {v4}, Lde/greenrobot/dao/internal/TableStatements;->getSelectByKey()Ljava/lang/String;

    move-result-object v3

    .line 137
    .local v3, "sql":Ljava/lang/String;
    const/4 v4, 0x1

    new-array v2, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    .line 138
    .local v2, "keyArray":[Ljava/lang/String;
    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4, v3, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 139
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-virtual {p0, v0}, Lde/greenrobot/dao/AbstractDao;->loadUniqueAndCloseCursor(Landroid/database/Cursor;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_6
.end method

.method public loadAll()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 168
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v2, p0, Lde/greenrobot/dao/AbstractDao;->statements:Lde/greenrobot/dao/internal/TableStatements;

    invoke-virtual {v2}, Lde/greenrobot/dao/internal/TableStatements;->getSelectAll()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 169
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-virtual {p0, v0}, Lde/greenrobot/dao/AbstractDao;->loadAllAndCloseCursor(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method protected loadAllAndCloseCursor(Landroid/database/Cursor;)Ljava/util/List;
    .registers 3
    .param p1, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 184
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    :try_start_0
    invoke-virtual {p0, p1}, Lde/greenrobot/dao/AbstractDao;->loadAllFromCursor(Landroid/database/Cursor;)Ljava/util/List;
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_8

    move-result-object v0

    .line 186
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    return-object v0

    :catchall_8
    move-exception v0

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method protected loadAllFromCursor(Landroid/database/Cursor;)Ljava/util/List;
    .registers 7
    .param p1, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 371
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    .line 372
    .local v0, "count":I
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 373
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    instance-of v3, p1, Landroid/database/CrossProcessCursor;

    if-eqz v3, :cond_21

    move-object v3, p1

    .line 374
    check-cast v3, Landroid/database/CrossProcessCursor;

    invoke-interface {v3}, Landroid/database/CrossProcessCursor;->getWindow()Landroid/database/CursorWindow;

    move-result-object v2

    .line 375
    .local v2, "window":Landroid/database/CursorWindow;
    if-eqz v2, :cond_21

    .line 376
    invoke-virtual {v2}, Landroid/database/CursorWindow;->getNumRows()I

    move-result v3

    if-ne v3, v0, :cond_4e

    .line 377
    new-instance p1, Lde/greenrobot/dao/internal/FastCursor;

    .end local p1    # "cursor":Landroid/database/Cursor;
    invoke-direct {p1, v2}, Lde/greenrobot/dao/internal/FastCursor;-><init>(Landroid/database/CursorWindow;)V

    .line 384
    .end local v2    # "window":Landroid/database/CursorWindow;
    .restart local p1    # "cursor":Landroid/database/Cursor;
    :cond_21
    :goto_21
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_4d

    .line 385
    iget-object v3, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    if-eqz v3, :cond_35

    .line 386
    iget-object v3, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v3}, Lde/greenrobot/dao/identityscope/IdentityScope;->lock()V

    .line 387
    iget-object v3, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v3, v0}, Lde/greenrobot/dao/identityscope/IdentityScope;->reserveRoom(I)V

    .line 391
    :cond_35
    const/4 v3, 0x0

    const/4 v4, 0x0

    :try_start_37
    invoke-virtual {p0, p1, v3, v4}, Lde/greenrobot/dao/AbstractDao;->loadCurrent(Landroid/database/Cursor;IZ)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 392
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_41
    .catchall {:try_start_37 .. :try_end_41} :catchall_73

    move-result v3

    if-nez v3, :cond_35

    .line 394
    iget-object v3, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    if-eqz v3, :cond_4d

    .line 395
    iget-object v3, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v3}, Lde/greenrobot/dao/identityscope/IdentityScope;->unlock()V

    .line 399
    :cond_4d
    return-object v1

    .line 379
    .restart local v2    # "window":Landroid/database/CursorWindow;
    :cond_4e
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Window vs. result size: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Landroid/database/CursorWindow;->getNumRows()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lde/greenrobot/dao/DaoLog;->d(Ljava/lang/String;)I

    goto :goto_21

    .line 394
    .end local v2    # "window":Landroid/database/CursorWindow;
    :catchall_73
    move-exception v3

    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    if-eqz v4, :cond_7d

    .line 395
    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v4}, Lde/greenrobot/dao/identityscope/IdentityScope;->unlock()V

    :cond_7d
    throw v3
.end method

.method public loadByRowId(J)Ljava/lang/Object;
    .registers 7
    .param p1, "rowId"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TT;"
        }
    .end annotation

    .prologue
    .line 143
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    const/4 v2, 0x1

    new-array v1, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 144
    .local v1, "idArray":[Ljava/lang/String;
    iget-object v2, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v3, p0, Lde/greenrobot/dao/AbstractDao;->statements:Lde/greenrobot/dao/internal/TableStatements;

    invoke-virtual {v3}, Lde/greenrobot/dao/internal/TableStatements;->getSelectByRowId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 145
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-virtual {p0, v0}, Lde/greenrobot/dao/AbstractDao;->loadUniqueAndCloseCursor(Landroid/database/Cursor;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method protected final loadCurrent(Landroid/database/Cursor;IZ)Ljava/lang/Object;
    .registers 9
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "offset"    # I
    .param p3, "lock"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "IZ)TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    const/4 v0, 0x0

    .line 404
    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->identityScopeLong:Lde/greenrobot/dao/identityscope/IdentityScopeLong;

    if-eqz v4, :cond_3e

    .line 405
    if-eqz p2, :cond_11

    .line 407
    iget v4, p0, Lde/greenrobot/dao/AbstractDao;->pkOrdinal:I

    add-int/2addr v4, p2

    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 451
    :cond_10
    :goto_10
    return-object v0

    .line 412
    :cond_11
    iget v4, p0, Lde/greenrobot/dao/AbstractDao;->pkOrdinal:I

    add-int/2addr v4, p2

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    .line 413
    .local v1, "key":J
    if-eqz p3, :cond_31

    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->identityScopeLong:Lde/greenrobot/dao/identityscope/IdentityScopeLong;

    invoke-virtual {v4, v1, v2}, Lde/greenrobot/dao/identityscope/IdentityScopeLong;->get2(J)Ljava/lang/Object;

    move-result-object v0

    .line 414
    .local v0, "entity":Ljava/lang/Object;, "TT;"
    :goto_20
    if-nez v0, :cond_10

    .line 417
    invoke-virtual {p0, p1, p2}, Lde/greenrobot/dao/AbstractDao;->readEntity(Landroid/database/Cursor;I)Ljava/lang/Object;

    move-result-object v0

    .line 418
    invoke-virtual {p0, v0}, Lde/greenrobot/dao/AbstractDao;->attachEntity(Ljava/lang/Object;)V

    .line 419
    if-eqz p3, :cond_38

    .line 420
    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->identityScopeLong:Lde/greenrobot/dao/identityscope/IdentityScopeLong;

    invoke-virtual {v4, v1, v2, v0}, Lde/greenrobot/dao/identityscope/IdentityScopeLong;->put2(JLjava/lang/Object;)V

    goto :goto_10

    .line 413
    .end local v0    # "entity":Ljava/lang/Object;, "TT;"
    :cond_31
    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->identityScopeLong:Lde/greenrobot/dao/identityscope/IdentityScopeLong;

    invoke-virtual {v4, v1, v2}, Lde/greenrobot/dao/identityscope/IdentityScopeLong;->get2NoLock(J)Ljava/lang/Object;

    move-result-object v0

    goto :goto_20

    .line 422
    .restart local v0    # "entity":Ljava/lang/Object;, "TT;"
    :cond_38
    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->identityScopeLong:Lde/greenrobot/dao/identityscope/IdentityScopeLong;

    invoke-virtual {v4, v1, v2, v0}, Lde/greenrobot/dao/identityscope/IdentityScopeLong;->put2NoLock(JLjava/lang/Object;)V

    goto :goto_10

    .line 426
    .end local v0    # "entity":Ljava/lang/Object;, "TT;"
    .end local v1    # "key":J
    :cond_3e
    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    if-eqz v4, :cond_63

    .line 427
    invoke-virtual {p0, p1, p2}, Lde/greenrobot/dao/AbstractDao;->readKey(Landroid/database/Cursor;I)Ljava/lang/Object;

    move-result-object v3

    .line 428
    .local v3, "key":Ljava/lang/Object;, "TK;"
    if-eqz p2, :cond_4a

    if-eqz v3, :cond_10

    .line 432
    :cond_4a
    if-eqz p3, :cond_5c

    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v4, v3}, Lde/greenrobot/dao/identityscope/IdentityScope;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 433
    .restart local v0    # "entity":Ljava/lang/Object;, "TT;"
    :goto_52
    if-nez v0, :cond_10

    .line 436
    invoke-virtual {p0, p1, p2}, Lde/greenrobot/dao/AbstractDao;->readEntity(Landroid/database/Cursor;I)Ljava/lang/Object;

    move-result-object v0

    .line 437
    invoke-virtual {p0, v3, v0, p3}, Lde/greenrobot/dao/AbstractDao;->attachEntity(Ljava/lang/Object;Ljava/lang/Object;Z)V

    goto :goto_10

    .line 432
    .end local v0    # "entity":Ljava/lang/Object;, "TT;"
    :cond_5c
    iget-object v4, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v4, v3}, Lde/greenrobot/dao/identityscope/IdentityScope;->getNoLock(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_52

    .line 442
    .end local v3    # "key":Ljava/lang/Object;, "TK;"
    :cond_63
    if-eqz p2, :cond_6b

    .line 443
    invoke-virtual {p0, p1, p2}, Lde/greenrobot/dao/AbstractDao;->readKey(Landroid/database/Cursor;I)Ljava/lang/Object;

    move-result-object v3

    .line 444
    .restart local v3    # "key":Ljava/lang/Object;, "TK;"
    if-eqz v3, :cond_10

    .line 449
    .end local v3    # "key":Ljava/lang/Object;, "TK;"
    :cond_6b
    invoke-virtual {p0, p1, p2}, Lde/greenrobot/dao/AbstractDao;->readEntity(Landroid/database/Cursor;I)Ljava/lang/Object;

    move-result-object v0

    .line 450
    .restart local v0    # "entity":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v0}, Lde/greenrobot/dao/AbstractDao;->attachEntity(Ljava/lang/Object;)V

    goto :goto_10
.end method

.method protected final loadCurrentOther(Lde/greenrobot/dao/AbstractDao;Landroid/database/Cursor;I)Ljava/lang/Object;
    .registers 5
    .param p2, "cursor"    # Landroid/database/Cursor;
    .param p3, "offset"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<O:",
            "Ljava/lang/Object;",
            ">(",
            "Lde/greenrobot/dao/AbstractDao",
            "<TO;*>;",
            "Landroid/database/Cursor;",
            "I)TO;"
        }
    .end annotation

    .prologue
    .line 457
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TO;*>;"
    const/4 v0, 0x1

    invoke-virtual {p1, p2, p3, v0}, Lde/greenrobot/dao/AbstractDao;->loadCurrent(Landroid/database/Cursor;IZ)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected loadUnique(Landroid/database/Cursor;)Ljava/lang/Object;
    .registers 6
    .param p1, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 157
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    .line 158
    .local v0, "available":Z
    if-nez v0, :cond_8

    .line 159
    const/4 v1, 0x0

    .line 163
    :goto_7
    return-object v1

    .line 160
    :cond_8
    invoke-interface {p1}, Landroid/database/Cursor;->isLast()Z

    move-result v1

    if-nez v1, :cond_2b

    .line 161
    new-instance v1, Lde/greenrobot/dao/DaoException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected unique result, but count was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 163
    :cond_2b
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, p1, v1, v2}, Lde/greenrobot/dao/AbstractDao;->loadCurrent(Landroid/database/Cursor;IZ)Ljava/lang/Object;

    move-result-object v1

    goto :goto_7
.end method

.method protected loadUniqueAndCloseCursor(Landroid/database/Cursor;)Ljava/lang/Object;
    .registers 3
    .param p1, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 150
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    :try_start_0
    invoke-virtual {p0, p1}, Lde/greenrobot/dao/AbstractDao;->loadUnique(Landroid/database/Cursor;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_8

    move-result-object v0

    .line 152
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    return-object v0

    :catchall_8
    move-exception v0

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method public queryBuilder()Lde/greenrobot/dao/query/QueryBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lde/greenrobot/dao/query/QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 664
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    invoke-static {p0}, Lde/greenrobot/dao/query/QueryBuilder;->internalCreate(Lde/greenrobot/dao/AbstractDao;)Lde/greenrobot/dao/query/QueryBuilder;

    move-result-object v0

    return-object v0
.end method

.method public varargs queryRaw(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;
    .registers 7
    .param p1, "where"    # Ljava/lang/String;
    .param p2, "selectionArg"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 462
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lde/greenrobot/dao/AbstractDao;->statements:Lde/greenrobot/dao/internal/TableStatements;

    invoke-virtual {v3}, Lde/greenrobot/dao/internal/TableStatements;->getSelectAll()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, p2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 463
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-virtual {p0, v0}, Lde/greenrobot/dao/AbstractDao;->loadAllAndCloseCursor(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public varargs queryRawCreate(Ljava/lang/String;[Ljava/lang/Object;)Lde/greenrobot/dao/query/Query;
    .registers 5
    .param p1, "where"    # Ljava/lang/String;
    .param p2, "selectionArg"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Lde/greenrobot/dao/query/Query",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 471
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 472
    .local v0, "argList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-virtual {p0, p1, v0}, Lde/greenrobot/dao/AbstractDao;->queryRawCreateListArgs(Ljava/lang/String;Ljava/util/Collection;)Lde/greenrobot/dao/query/Query;

    move-result-object v1

    return-object v1
.end method

.method public queryRawCreateListArgs(Ljava/lang/String;Ljava/util/Collection;)Lde/greenrobot/dao/query/Query;
    .registers 5
    .param p1, "where"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lde/greenrobot/dao/query/Query",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 480
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p2, "selectionArg":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lde/greenrobot/dao/AbstractDao;->statements:Lde/greenrobot/dao/internal/TableStatements;

    invoke-virtual {v1}, Lde/greenrobot/dao/internal/TableStatements;->getSelectAll()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lde/greenrobot/dao/query/Query;->internalCreate(Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;[Ljava/lang/Object;)Lde/greenrobot/dao/query/Query;

    move-result-object v0

    return-object v0
.end method

.method protected abstract readEntity(Landroid/database/Cursor;I)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "I)TT;"
        }
    .end annotation
.end method

.method protected abstract readEntity(Landroid/database/Cursor;Ljava/lang/Object;I)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "TT;I)V"
        }
    .end annotation
.end method

.method protected abstract readKey(Landroid/database/Cursor;I)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "I)TK;"
        }
    .end annotation
.end method

.method public refresh(Ljava/lang/Object;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 622
    invoke-virtual {p0}, Lde/greenrobot/dao/AbstractDao;->assertSinglePk()V

    .line 623
    invoke-virtual {p0, p1}, Lde/greenrobot/dao/AbstractDao;->getKeyVerified(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 624
    .local v2, "key":Ljava/lang/Object;, "TK;"
    iget-object v5, p0, Lde/greenrobot/dao/AbstractDao;->statements:Lde/greenrobot/dao/internal/TableStatements;

    invoke-virtual {v5}, Lde/greenrobot/dao/internal/TableStatements;->getSelectByKey()Ljava/lang/String;

    move-result-object v4

    .line 625
    .local v4, "sql":Ljava/lang/String;
    new-array v3, v7, [Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v6

    .line 626
    .local v3, "keyArray":[Ljava/lang/String;
    iget-object v5, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v5, v4, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 628
    .local v1, "cursor":Landroid/database/Cursor;
    :try_start_1d
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    .line 629
    .local v0, "available":Z
    if-nez v0, :cond_4f

    .line 630
    new-instance v5, Lde/greenrobot/dao/DaoException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Entity does not exist in the database anymore: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " with key "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_4a
    .catchall {:try_start_1d .. :try_end_4a} :catchall_4a

    .line 638
    .end local v0    # "available":Z
    :catchall_4a
    move-exception v5

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    throw v5

    .line 632
    .restart local v0    # "available":Z
    :cond_4f
    :try_start_4f
    invoke-interface {v1}, Landroid/database/Cursor;->isLast()Z

    move-result v5

    if-nez v5, :cond_72

    .line 633
    new-instance v5, Lde/greenrobot/dao/DaoException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Expected unique result, but count was "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 635
    :cond_72
    const/4 v5, 0x0

    invoke-virtual {p0, v1, p1, v5}, Lde/greenrobot/dao/AbstractDao;->readEntity(Landroid/database/Cursor;Ljava/lang/Object;I)V

    .line 636
    const/4 v5, 0x1

    invoke-virtual {p0, v2, p1, v5}, Lde/greenrobot/dao/AbstractDao;->attachEntity(Ljava/lang/Object;Ljava/lang/Object;Z)V
    :try_end_7a
    .catchall {:try_start_4f .. :try_end_7a} :catchall_4a

    .line 638
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 640
    return-void
.end method

.method public update(Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 643
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0}, Lde/greenrobot/dao/AbstractDao;->assertSinglePk()V

    .line 644
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDao;->statements:Lde/greenrobot/dao/internal/TableStatements;

    invoke-virtual {v1}, Lde/greenrobot/dao/internal/TableStatements;->getUpdateStatement()Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 645
    .local v0, "stmt":Landroid/database/sqlite/SQLiteStatement;
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->isDbLockedByCurrentThread()Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 646
    monitor-enter v0

    .line 647
    const/4 v1, 0x1

    :try_start_13
    invoke-virtual {p0, p1, v0, v1}, Lde/greenrobot/dao/AbstractDao;->updateInsideSynchronized(Ljava/lang/Object;Landroid/database/sqlite/SQLiteStatement;Z)V

    .line 648
    monitor-exit v0

    .line 661
    :goto_17
    return-void

    .line 648
    :catchall_18
    move-exception v1

    monitor-exit v0
    :try_end_1a
    .catchall {:try_start_13 .. :try_end_1a} :catchall_18

    throw v1

    .line 651
    :cond_1b
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 653
    :try_start_20
    monitor-enter v0
    :try_end_21
    .catchall {:try_start_20 .. :try_end_21} :catchall_34

    .line 654
    const/4 v1, 0x1

    :try_start_22
    invoke-virtual {p0, p1, v0, v1}, Lde/greenrobot/dao/AbstractDao;->updateInsideSynchronized(Ljava/lang/Object;Landroid/database/sqlite/SQLiteStatement;Z)V

    .line 655
    monitor-exit v0
    :try_end_26
    .catchall {:try_start_22 .. :try_end_26} :catchall_31

    .line 656
    :try_start_26
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2b
    .catchall {:try_start_26 .. :try_end_2b} :catchall_34

    .line 658
    iget-object v1, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_17

    .line 655
    :catchall_31
    move-exception v1

    :try_start_32
    monitor-exit v0
    :try_end_33
    .catchall {:try_start_32 .. :try_end_33} :catchall_31

    :try_start_33
    throw v1
    :try_end_34
    .catchall {:try_start_33 .. :try_end_34} :catchall_34

    .line 658
    :catchall_34
    move-exception v1

    iget-object v2, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v1
.end method

.method public updateInTx(Ljava/lang/Iterable;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 719
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entities":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TT;>;"
    iget-object v5, p0, Lde/greenrobot/dao/AbstractDao;->statements:Lde/greenrobot/dao/internal/TableStatements;

    invoke-virtual {v5}, Lde/greenrobot/dao/internal/TableStatements;->getUpdateStatement()Landroid/database/sqlite/SQLiteStatement;

    move-result-object v3

    .line 720
    .local v3, "stmt":Landroid/database/sqlite/SQLiteStatement;
    iget-object v5, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 721
    const/4 v4, 0x0

    .line 723
    .local v4, "txEx":Ljava/lang/RuntimeException;
    :try_start_c
    monitor-enter v3
    :try_end_d
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_d} :catch_37
    .catchall {:try_start_c .. :try_end_d} :catchall_68

    .line 724
    :try_start_d
    iget-object v5, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    if-eqz v5, :cond_16

    .line 725
    iget-object v5, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v5}, Lde/greenrobot/dao/identityscope/IdentityScope;->lock()V
    :try_end_16
    .catchall {:try_start_d .. :try_end_16} :catchall_34

    .line 728
    :cond_16
    :try_start_16
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 729
    .local v1, "entity":Ljava/lang/Object;, "TT;"
    const/4 v5, 0x0

    invoke-virtual {p0, v1, v3, v5}, Lde/greenrobot/dao/AbstractDao;->updateInsideSynchronized(Ljava/lang/Object;Landroid/database/sqlite/SQLiteStatement;Z)V
    :try_end_28
    .catchall {:try_start_16 .. :try_end_28} :catchall_29

    goto :goto_1a

    .line 732
    .end local v1    # "entity":Ljava/lang/Object;, "TT;"
    .end local v2    # "i$":Ljava/util/Iterator;
    :catchall_29
    move-exception v5

    :try_start_2a
    iget-object v6, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    if-eqz v6, :cond_33

    .line 733
    iget-object v6, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v6}, Lde/greenrobot/dao/identityscope/IdentityScope;->unlock()V

    :cond_33
    throw v5

    .line 736
    :catchall_34
    move-exception v5

    monitor-exit v3
    :try_end_36
    .catchall {:try_start_2a .. :try_end_36} :catchall_34

    :try_start_36
    throw v5
    :try_end_37
    .catch Ljava/lang/RuntimeException; {:try_start_36 .. :try_end_37} :catch_37
    .catchall {:try_start_36 .. :try_end_37} :catchall_68

    .line 738
    :catch_37
    move-exception v0

    .line 739
    .local v0, "e":Ljava/lang/RuntimeException;
    move-object v4, v0

    .line 742
    :try_start_39
    iget-object v5, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_3e
    .catch Ljava/lang/RuntimeException; {:try_start_39 .. :try_end_3e} :catch_5e

    .line 752
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :goto_3e
    return-void

    .line 732
    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_3f
    :try_start_3f
    iget-object v5, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    if-eqz v5, :cond_48

    .line 733
    iget-object v5, p0, Lde/greenrobot/dao/AbstractDao;->identityScope:Lde/greenrobot/dao/identityscope/IdentityScope;

    invoke-interface {v5}, Lde/greenrobot/dao/identityscope/IdentityScope;->unlock()V

    .line 736
    :cond_48
    monitor-exit v3
    :try_end_49
    .catchall {:try_start_3f .. :try_end_49} :catchall_34

    .line 737
    :try_start_49
    iget-object v5, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_4e
    .catch Ljava/lang/RuntimeException; {:try_start_49 .. :try_end_4e} :catch_37
    .catchall {:try_start_49 .. :try_end_4e} :catchall_68

    .line 742
    :try_start_4e
    iget-object v5, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_53
    .catch Ljava/lang/RuntimeException; {:try_start_4e .. :try_end_53} :catch_54

    goto :goto_3e

    .line 743
    :catch_54
    move-exception v0

    .line 744
    .restart local v0    # "e":Ljava/lang/RuntimeException;
    if-eqz v4, :cond_5d

    .line 745
    const-string v5, "Could not end transaction (rethrowing initial exception)"

    invoke-static {v5, v0}, Lde/greenrobot/dao/DaoLog;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 746
    throw v4

    .line 748
    :cond_5d
    throw v0

    .line 743
    .end local v2    # "i$":Ljava/util/Iterator;
    :catch_5e
    move-exception v0

    .line 744
    if-eqz v4, :cond_67

    .line 745
    const-string v5, "Could not end transaction (rethrowing initial exception)"

    invoke-static {v5, v0}, Lde/greenrobot/dao/DaoLog;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 746
    throw v4

    .line 748
    :cond_67
    throw v0

    .line 741
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catchall_68
    move-exception v5

    .line 742
    :try_start_69
    iget-object v6, p0, Lde/greenrobot/dao/AbstractDao;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_6e
    .catch Ljava/lang/RuntimeException; {:try_start_69 .. :try_end_6e} :catch_6f

    .line 748
    throw v5

    .line 743
    :catch_6f
    move-exception v0

    .line 744
    .restart local v0    # "e":Ljava/lang/RuntimeException;
    if-eqz v4, :cond_78

    .line 745
    const-string v5, "Could not end transaction (rethrowing initial exception)"

    invoke-static {v5, v0}, Lde/greenrobot/dao/DaoLog;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 746
    throw v4

    .line 748
    :cond_78
    throw v0
.end method

.method public varargs updateInTx([Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    .prologue
    .line 761
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entities":[Ljava/lang/Object;, "[TT;"
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lde/greenrobot/dao/AbstractDao;->updateInTx(Ljava/lang/Iterable;)V

    .line 762
    return-void
.end method

.method protected updateInsideSynchronized(Ljava/lang/Object;Landroid/database/sqlite/SQLiteStatement;Z)V
    .registers 8
    .param p2, "stmt"    # Landroid/database/sqlite/SQLiteStatement;
    .param p3, "lock"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/database/sqlite/SQLiteStatement;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 669
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p2, p1}, Lde/greenrobot/dao/AbstractDao;->bindValues(Landroid/database/sqlite/SQLiteStatement;Ljava/lang/Object;)V

    .line 670
    iget-object v2, p0, Lde/greenrobot/dao/AbstractDao;->config:Lde/greenrobot/dao/internal/DaoConfig;

    iget-object v2, v2, Lde/greenrobot/dao/internal/DaoConfig;->allColumns:[Ljava/lang/String;

    array-length v2, v2

    add-int/lit8 v0, v2, 0x1

    .line 671
    .local v0, "index":I
    invoke-virtual {p0, p1}, Lde/greenrobot/dao/AbstractDao;->getKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 672
    .local v1, "key":Ljava/lang/Object;, "TK;"
    instance-of v2, v1, Ljava/lang/Long;

    if-eqz v2, :cond_23

    move-object v2, v1

    .line 673
    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {p2, v0, v2, v3}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 679
    :goto_1c
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    .line 680
    invoke-virtual {p0, v1, p1, p3}, Lde/greenrobot/dao/AbstractDao;->attachEntity(Ljava/lang/Object;Ljava/lang/Object;Z)V

    .line 681
    return-void

    .line 674
    :cond_23
    if-nez v1, :cond_2d

    .line 675
    new-instance v2, Lde/greenrobot/dao/DaoException;

    const-string v3, "Cannot update entity without key - was it inserted before?"

    invoke-direct {v2, v3}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 677
    :cond_2d
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v0, v2}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    goto :goto_1c
.end method

.method protected abstract updateKeyAfterInsert(Ljava/lang/Object;J)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;J)TK;"
        }
    .end annotation
.end method

.method protected updateKeyAfterInsertAndAttach(Ljava/lang/Object;JZ)V
    .registers 8
    .param p2, "rowId"    # J
    .param p4, "lock"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;JZ)V"
        }
    .end annotation

    .prologue
    .line 360
    .local p0, "this":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;TK;>;"
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    const-wide/16 v1, -0x1

    cmp-long v1, p2, v1

    if-eqz v1, :cond_e

    .line 361
    invoke-virtual {p0, p1, p2, p3}, Lde/greenrobot/dao/AbstractDao;->updateKeyAfterInsert(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    .line 362
    .local v0, "key":Ljava/lang/Object;, "TK;"
    invoke-virtual {p0, v0, p1, p4}, Lde/greenrobot/dao/AbstractDao;->attachEntity(Ljava/lang/Object;Ljava/lang/Object;Z)V

    .line 367
    .end local v0    # "key":Ljava/lang/Object;, "TK;"
    :goto_d
    return-void

    .line 365
    :cond_e
    const-string v1, "Could not insert row (executeInsert returned -1)"

    invoke-static {v1}, Lde/greenrobot/dao/DaoLog;->w(Ljava/lang/String;)I

    goto :goto_d
.end method
