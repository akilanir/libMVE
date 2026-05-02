.class public Lde/greenrobot/dao/query/DeleteQuery;
.super Lde/greenrobot/dao/query/AbstractQuery;
.source "DeleteQuery.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/greenrobot/dao/query/DeleteQuery$1;,
        Lde/greenrobot/dao/query/DeleteQuery$QueryData;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lde/greenrobot/dao/query/AbstractQuery",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final queryData:Lde/greenrobot/dao/query/DeleteQuery$QueryData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/query/DeleteQuery$QueryData",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lde/greenrobot/dao/query/DeleteQuery$QueryData;Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;[Ljava/lang/String;)V
    .registers 5
    .param p3, "sql"    # Ljava/lang/String;
    .param p4, "initialValues"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/greenrobot/dao/query/DeleteQuery$QueryData",
            "<TT;>;",
            "Lde/greenrobot/dao/AbstractDao",
            "<TT;*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lde/greenrobot/dao/query/DeleteQuery;, "Lde/greenrobot/dao/query/DeleteQuery<TT;>;"
    .local p1, "queryData":Lde/greenrobot/dao/query/DeleteQuery$QueryData;, "Lde/greenrobot/dao/query/DeleteQuery$QueryData<TT;>;"
    .local p2, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;*>;"
    invoke-direct {p0, p2, p3, p4}, Lde/greenrobot/dao/query/AbstractQuery;-><init>(Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;[Ljava/lang/String;)V

    .line 52
    iput-object p1, p0, Lde/greenrobot/dao/query/DeleteQuery;->queryData:Lde/greenrobot/dao/query/DeleteQuery$QueryData;

    .line 53
    return-void
.end method

.method synthetic constructor <init>(Lde/greenrobot/dao/query/DeleteQuery$QueryData;Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;[Ljava/lang/String;Lde/greenrobot/dao/query/DeleteQuery$1;)V
    .registers 6
    .param p1, "x0"    # Lde/greenrobot/dao/query/DeleteQuery$QueryData;
    .param p2, "x1"    # Lde/greenrobot/dao/AbstractDao;
    .param p3, "x2"    # Ljava/lang/String;
    .param p4, "x3"    # [Ljava/lang/String;
    .param p5, "x4"    # Lde/greenrobot/dao/query/DeleteQuery$1;

    .prologue
    .line 30
    .local p0, "this":Lde/greenrobot/dao/query/DeleteQuery;, "Lde/greenrobot/dao/query/DeleteQuery<TT;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Lde/greenrobot/dao/query/DeleteQuery;-><init>(Lde/greenrobot/dao/query/DeleteQuery$QueryData;Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method static create(Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;[Ljava/lang/Object;)Lde/greenrobot/dao/query/DeleteQuery;
    .registers 6
    .param p1, "sql"    # Ljava/lang/String;
    .param p2, "initialValues"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T2:",
            "Ljava/lang/Object;",
            ">(",
            "Lde/greenrobot/dao/AbstractDao",
            "<TT2;*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Lde/greenrobot/dao/query/DeleteQuery",
            "<TT2;>;"
        }
    .end annotation

    .prologue
    .line 44
    .local p0, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT2;*>;"
    new-instance v0, Lde/greenrobot/dao/query/DeleteQuery$QueryData;

    invoke-static {p2}, Lde/greenrobot/dao/query/DeleteQuery;->toStringArray([Ljava/lang/Object;)[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, p0, p1, v1, v2}, Lde/greenrobot/dao/query/DeleteQuery$QueryData;-><init>(Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;[Ljava/lang/String;Lde/greenrobot/dao/query/DeleteQuery$1;)V

    .line 45
    .local v0, "queryData":Lde/greenrobot/dao/query/DeleteQuery$QueryData;, "Lde/greenrobot/dao/query/DeleteQuery$QueryData<TT2;>;"
    invoke-virtual {v0}, Lde/greenrobot/dao/query/DeleteQuery$QueryData;->forCurrentThread()Lde/greenrobot/dao/query/AbstractQuery;

    move-result-object v1

    check-cast v1, Lde/greenrobot/dao/query/DeleteQuery;

    return-object v1
.end method


# virtual methods
.method public executeDeleteWithoutDetachingEntities()V
    .registers 5

    .prologue
    .line 65
    .local p0, "this":Lde/greenrobot/dao/query/DeleteQuery;, "Lde/greenrobot/dao/query/DeleteQuery<TT;>;"
    invoke-virtual {p0}, Lde/greenrobot/dao/query/DeleteQuery;->checkThread()V

    .line 66
    iget-object v1, p0, Lde/greenrobot/dao/query/DeleteQuery;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v1}, Lde/greenrobot/dao/AbstractDao;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 67
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->isDbLockedByCurrentThread()Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 68
    iget-object v1, p0, Lde/greenrobot/dao/query/DeleteQuery;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v1}, Lde/greenrobot/dao/AbstractDao;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iget-object v2, p0, Lde/greenrobot/dao/query/DeleteQuery;->sql:Ljava/lang/String;

    iget-object v3, p0, Lde/greenrobot/dao/query/DeleteQuery;->parameters:[Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 80
    :goto_1c
    return-void

    .line 72
    :cond_1d
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 74
    :try_start_20
    iget-object v1, p0, Lde/greenrobot/dao/query/DeleteQuery;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v1}, Lde/greenrobot/dao/AbstractDao;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iget-object v2, p0, Lde/greenrobot/dao/query/DeleteQuery;->sql:Ljava/lang/String;

    iget-object v3, p0, Lde/greenrobot/dao/query/DeleteQuery;->parameters:[Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 75
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_30
    .catchall {:try_start_20 .. :try_end_30} :catchall_34

    .line 77
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_1c

    :catchall_34
    move-exception v1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v1
.end method

.method public forCurrentThread()Lde/greenrobot/dao/query/DeleteQuery;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lde/greenrobot/dao/query/DeleteQuery",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 56
    .local p0, "this":Lde/greenrobot/dao/query/DeleteQuery;, "Lde/greenrobot/dao/query/DeleteQuery<TT;>;"
    iget-object v0, p0, Lde/greenrobot/dao/query/DeleteQuery;->queryData:Lde/greenrobot/dao/query/DeleteQuery$QueryData;

    invoke-virtual {v0, p0}, Lde/greenrobot/dao/query/DeleteQuery$QueryData;->forCurrentThread(Lde/greenrobot/dao/query/AbstractQuery;)Lde/greenrobot/dao/query/AbstractQuery;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/query/DeleteQuery;

    return-object v0
.end method

.method public bridge synthetic setParameter(ILjava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # I
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 30
    .local p0, "this":Lde/greenrobot/dao/query/DeleteQuery;, "Lde/greenrobot/dao/query/DeleteQuery<TT;>;"
    invoke-super {p0, p1, p2}, Lde/greenrobot/dao/query/AbstractQuery;->setParameter(ILjava/lang/Object;)V

    return-void
.end method
