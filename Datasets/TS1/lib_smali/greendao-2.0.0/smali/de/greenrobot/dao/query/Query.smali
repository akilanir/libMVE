.class public Lde/greenrobot/dao/query/Query;
.super Lde/greenrobot/dao/query/AbstractQuery;
.source "Query.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/greenrobot/dao/query/Query$1;,
        Lde/greenrobot/dao/query/Query$QueryData;
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
.field private final limitPosition:I

.field private final offsetPosition:I

.field private final queryData:Lde/greenrobot/dao/query/Query$QueryData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/query/Query$QueryData",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lde/greenrobot/dao/query/Query$QueryData;Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;[Ljava/lang/String;II)V
    .registers 7
    .param p3, "sql"    # Ljava/lang/String;
    .param p4, "initialValues"    # [Ljava/lang/String;
    .param p5, "limitPosition"    # I
    .param p6, "offsetPosition"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/greenrobot/dao/query/Query$QueryData",
            "<TT;>;",
            "Lde/greenrobot/dao/AbstractDao",
            "<TT;*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "II)V"
        }
    .end annotation

    .prologue
    .line 71
    .local p0, "this":Lde/greenrobot/dao/query/Query;, "Lde/greenrobot/dao/query/Query<TT;>;"
    .local p1, "queryData":Lde/greenrobot/dao/query/Query$QueryData;, "Lde/greenrobot/dao/query/Query$QueryData<TT;>;"
    .local p2, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;*>;"
    invoke-direct {p0, p2, p3, p4}, Lde/greenrobot/dao/query/AbstractQuery;-><init>(Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;[Ljava/lang/String;)V

    .line 72
    iput-object p1, p0, Lde/greenrobot/dao/query/Query;->queryData:Lde/greenrobot/dao/query/Query$QueryData;

    .line 73
    iput p5, p0, Lde/greenrobot/dao/query/Query;->limitPosition:I

    .line 74
    iput p6, p0, Lde/greenrobot/dao/query/Query;->offsetPosition:I

    .line 75
    return-void
.end method

.method synthetic constructor <init>(Lde/greenrobot/dao/query/Query$QueryData;Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;[Ljava/lang/String;IILde/greenrobot/dao/query/Query$1;)V
    .registers 8
    .param p1, "x0"    # Lde/greenrobot/dao/query/Query$QueryData;
    .param p2, "x1"    # Lde/greenrobot/dao/AbstractDao;
    .param p3, "x2"    # Ljava/lang/String;
    .param p4, "x3"    # [Ljava/lang/String;
    .param p5, "x4"    # I
    .param p6, "x5"    # I
    .param p7, "x6"    # Lde/greenrobot/dao/query/Query$1;

    .prologue
    .line 35
    .local p0, "this":Lde/greenrobot/dao/query/Query;, "Lde/greenrobot/dao/query/Query<TT;>;"
    invoke-direct/range {p0 .. p6}, Lde/greenrobot/dao/query/Query;-><init>(Lde/greenrobot/dao/query/Query$QueryData;Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;[Ljava/lang/String;II)V

    return-void
.end method

.method static create(Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;[Ljava/lang/Object;II)Lde/greenrobot/dao/query/Query;
    .registers 11
    .param p1, "sql"    # Ljava/lang/String;
    .param p2, "initialValues"    # [Ljava/lang/Object;
    .param p3, "limitPosition"    # I
    .param p4, "offsetPosition"    # I
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
            "II)",
            "Lde/greenrobot/dao/query/Query",
            "<TT2;>;"
        }
    .end annotation

    .prologue
    .line 60
    .local p0, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT2;*>;"
    new-instance v0, Lde/greenrobot/dao/query/Query$QueryData;

    invoke-static {p2}, Lde/greenrobot/dao/query/Query;->toStringArray([Ljava/lang/Object;)[Ljava/lang/String;

    move-result-object v3

    move-object v1, p0

    move-object v2, p1

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lde/greenrobot/dao/query/Query$QueryData;-><init>(Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;[Ljava/lang/String;II)V

    .line 62
    .local v0, "queryData":Lde/greenrobot/dao/query/Query$QueryData;, "Lde/greenrobot/dao/query/Query$QueryData<TT2;>;"
    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query$QueryData;->forCurrentThread()Lde/greenrobot/dao/query/AbstractQuery;

    move-result-object v1

    check-cast v1, Lde/greenrobot/dao/query/Query;

    return-object v1
.end method

.method public static internalCreate(Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;[Ljava/lang/Object;)Lde/greenrobot/dao/query/Query;
    .registers 4
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
            "Lde/greenrobot/dao/query/Query",
            "<TT2;>;"
        }
    .end annotation

    .prologue
    .local p0, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT2;*>;"
    const/4 v0, -0x1

    .line 55
    invoke-static {p0, p1, p2, v0, v0}, Lde/greenrobot/dao/query/Query;->create(Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;[Ljava/lang/Object;II)Lde/greenrobot/dao/query/Query;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public forCurrentThread()Lde/greenrobot/dao/query/Query;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lde/greenrobot/dao/query/Query",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 78
    .local p0, "this":Lde/greenrobot/dao/query/Query;, "Lde/greenrobot/dao/query/Query<TT;>;"
    iget-object v0, p0, Lde/greenrobot/dao/query/Query;->queryData:Lde/greenrobot/dao/query/Query$QueryData;

    invoke-virtual {v0, p0}, Lde/greenrobot/dao/query/Query$QueryData;->forCurrentThread(Lde/greenrobot/dao/query/AbstractQuery;)Lde/greenrobot/dao/query/AbstractQuery;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/query/Query;

    return-object v0
.end method

.method public list()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 128
    .local p0, "this":Lde/greenrobot/dao/query/Query;, "Lde/greenrobot/dao/query/Query<TT;>;"
    invoke-virtual {p0}, Lde/greenrobot/dao/query/Query;->checkThread()V

    .line 129
    iget-object v1, p0, Lde/greenrobot/dao/query/Query;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v1}, Lde/greenrobot/dao/AbstractDao;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iget-object v2, p0, Lde/greenrobot/dao/query/Query;->sql:Ljava/lang/String;

    iget-object v3, p0, Lde/greenrobot/dao/query/Query;->parameters:[Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 130
    .local v0, "cursor":Landroid/database/Cursor;
    iget-object v1, p0, Lde/greenrobot/dao/query/Query;->daoAccess:Lde/greenrobot/dao/InternalQueryDaoAccess;

    invoke-virtual {v1, v0}, Lde/greenrobot/dao/InternalQueryDaoAccess;->loadAllAndCloseCursor(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public listIterator()Lde/greenrobot/dao/query/CloseableListIterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lde/greenrobot/dao/query/CloseableListIterator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 159
    .local p0, "this":Lde/greenrobot/dao/query/Query;, "Lde/greenrobot/dao/query/Query<TT;>;"
    invoke-virtual {p0}, Lde/greenrobot/dao/query/Query;->listLazyUncached()Lde/greenrobot/dao/query/LazyList;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/LazyList;->listIteratorAutoClose()Lde/greenrobot/dao/query/CloseableListIterator;

    move-result-object v0

    return-object v0
.end method

.method public listLazy()Lde/greenrobot/dao/query/LazyList;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lde/greenrobot/dao/query/LazyList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 139
    .local p0, "this":Lde/greenrobot/dao/query/Query;, "Lde/greenrobot/dao/query/Query<TT;>;"
    invoke-virtual {p0}, Lde/greenrobot/dao/query/Query;->checkThread()V

    .line 140
    iget-object v1, p0, Lde/greenrobot/dao/query/Query;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v1}, Lde/greenrobot/dao/AbstractDao;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iget-object v2, p0, Lde/greenrobot/dao/query/Query;->sql:Ljava/lang/String;

    iget-object v3, p0, Lde/greenrobot/dao/query/Query;->parameters:[Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 141
    .local v0, "cursor":Landroid/database/Cursor;
    new-instance v1, Lde/greenrobot/dao/query/LazyList;

    iget-object v2, p0, Lde/greenrobot/dao/query/Query;->daoAccess:Lde/greenrobot/dao/InternalQueryDaoAccess;

    const/4 v3, 0x1

    invoke-direct {v1, v2, v0, v3}, Lde/greenrobot/dao/query/LazyList;-><init>(Lde/greenrobot/dao/InternalQueryDaoAccess;Landroid/database/Cursor;Z)V

    return-object v1
.end method

.method public listLazyUncached()Lde/greenrobot/dao/query/LazyList;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lde/greenrobot/dao/query/LazyList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 149
    .local p0, "this":Lde/greenrobot/dao/query/Query;, "Lde/greenrobot/dao/query/Query<TT;>;"
    invoke-virtual {p0}, Lde/greenrobot/dao/query/Query;->checkThread()V

    .line 150
    iget-object v1, p0, Lde/greenrobot/dao/query/Query;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v1}, Lde/greenrobot/dao/AbstractDao;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iget-object v2, p0, Lde/greenrobot/dao/query/Query;->sql:Ljava/lang/String;

    iget-object v3, p0, Lde/greenrobot/dao/query/Query;->parameters:[Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 151
    .local v0, "cursor":Landroid/database/Cursor;
    new-instance v1, Lde/greenrobot/dao/query/LazyList;

    iget-object v2, p0, Lde/greenrobot/dao/query/Query;->daoAccess:Lde/greenrobot/dao/InternalQueryDaoAccess;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v0, v3}, Lde/greenrobot/dao/query/LazyList;-><init>(Lde/greenrobot/dao/InternalQueryDaoAccess;Landroid/database/Cursor;Z)V

    return-object v1
.end method

.method public setLimit(I)V
    .registers 5
    .param p1, "limit"    # I

    .prologue
    .line 107
    .local p0, "this":Lde/greenrobot/dao/query/Query;, "Lde/greenrobot/dao/query/Query<TT;>;"
    invoke-virtual {p0}, Lde/greenrobot/dao/query/Query;->checkThread()V

    .line 108
    iget v0, p0, Lde/greenrobot/dao/query/Query;->limitPosition:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_10

    .line 109
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Limit must be set with QueryBuilder before it can be used here"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 111
    :cond_10
    iget-object v0, p0, Lde/greenrobot/dao/query/Query;->parameters:[Ljava/lang/String;

    iget v1, p0, Lde/greenrobot/dao/query/Query;->limitPosition:I

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 112
    return-void
.end method

.method public setOffset(I)V
    .registers 5
    .param p1, "offset"    # I

    .prologue
    .line 119
    .local p0, "this":Lde/greenrobot/dao/query/Query;, "Lde/greenrobot/dao/query/Query<TT;>;"
    invoke-virtual {p0}, Lde/greenrobot/dao/query/Query;->checkThread()V

    .line 120
    iget v0, p0, Lde/greenrobot/dao/query/Query;->offsetPosition:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_10

    .line 121
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Offset must be set with QueryBuilder before it can be used here"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 123
    :cond_10
    iget-object v0, p0, Lde/greenrobot/dao/query/Query;->parameters:[Ljava/lang/String;

    iget v1, p0, Lde/greenrobot/dao/query/Query;->offsetPosition:I

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 124
    return-void
.end method

.method public setParameter(ILjava/lang/Boolean;)V
    .registers 5
    .param p1, "index"    # I
    .param p2, "parameter"    # Ljava/lang/Boolean;

    .prologue
    .line 98
    .local p0, "this":Lde/greenrobot/dao/query/Query;, "Lde/greenrobot/dao/query/Query<TT;>;"
    if-eqz p2, :cond_13

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_11

    const/4 v1, 0x1

    :goto_9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 99
    .local v0, "converted":Ljava/lang/Integer;
    :goto_d
    invoke-virtual {p0, p1, v0}, Lde/greenrobot/dao/query/Query;->setParameter(ILjava/lang/Object;)V

    .line 100
    return-void

    .line 98
    .end local v0    # "converted":Ljava/lang/Integer;
    :cond_11
    const/4 v1, 0x0

    goto :goto_9

    :cond_13
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public setParameter(ILjava/lang/Object;)V
    .registers 6
    .param p1, "index"    # I
    .param p2, "parameter"    # Ljava/lang/Object;

    .prologue
    .line 86
    .local p0, "this":Lde/greenrobot/dao/query/Query;, "Lde/greenrobot/dao/query/Query<TT;>;"
    if-ltz p1, :cond_23

    iget v0, p0, Lde/greenrobot/dao/query/Query;->limitPosition:I

    if-eq p1, v0, :cond_a

    iget v0, p0, Lde/greenrobot/dao/query/Query;->offsetPosition:I

    if-ne p1, v0, :cond_23

    .line 87
    :cond_a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Illegal parameter index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 89
    :cond_23
    invoke-super {p0, p1, p2}, Lde/greenrobot/dao/query/AbstractQuery;->setParameter(ILjava/lang/Object;)V

    .line 90
    return-void
.end method

.method public setParameter(ILjava/util/Date;)V
    .registers 6
    .param p1, "index"    # I
    .param p2, "parameter"    # Ljava/util/Date;

    .prologue
    .line 93
    .local p0, "this":Lde/greenrobot/dao/query/Query;, "Lde/greenrobot/dao/query/Query<TT;>;"
    if-eqz p2, :cond_e

    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 94
    .local v0, "converted":Ljava/lang/Long;
    :goto_a
    invoke-virtual {p0, p1, v0}, Lde/greenrobot/dao/query/Query;->setParameter(ILjava/lang/Object;)V

    .line 95
    return-void

    .line 93
    .end local v0    # "converted":Ljava/lang/Long;
    :cond_e
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public unique()Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 169
    .local p0, "this":Lde/greenrobot/dao/query/Query;, "Lde/greenrobot/dao/query/Query<TT;>;"
    invoke-virtual {p0}, Lde/greenrobot/dao/query/Query;->checkThread()V

    .line 170
    iget-object v1, p0, Lde/greenrobot/dao/query/Query;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v1}, Lde/greenrobot/dao/AbstractDao;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iget-object v2, p0, Lde/greenrobot/dao/query/Query;->sql:Ljava/lang/String;

    iget-object v3, p0, Lde/greenrobot/dao/query/Query;->parameters:[Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 171
    .local v0, "cursor":Landroid/database/Cursor;
    iget-object v1, p0, Lde/greenrobot/dao/query/Query;->daoAccess:Lde/greenrobot/dao/InternalQueryDaoAccess;

    invoke-virtual {v1, v0}, Lde/greenrobot/dao/InternalQueryDaoAccess;->loadUniqueAndCloseCursor(Landroid/database/Cursor;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public uniqueOrThrow()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 181
    .local p0, "this":Lde/greenrobot/dao/query/Query;, "Lde/greenrobot/dao/query/Query<TT;>;"
    invoke-virtual {p0}, Lde/greenrobot/dao/query/Query;->unique()Ljava/lang/Object;

    move-result-object v0

    .line 182
    .local v0, "entity":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_e

    .line 183
    new-instance v1, Lde/greenrobot/dao/DaoException;

    const-string v2, "No entity found for query"

    invoke-direct {v1, v2}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 185
    :cond_e
    return-object v0
.end method
