.class abstract Lde/greenrobot/dao/query/AbstractQuery;
.super Ljava/lang/Object;
.source "AbstractQuery.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected final dao:Lde/greenrobot/dao/AbstractDao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/AbstractDao",
            "<TT;*>;"
        }
    .end annotation
.end field

.field protected final daoAccess:Lde/greenrobot/dao/InternalQueryDaoAccess;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/InternalQueryDaoAccess",
            "<TT;>;"
        }
    .end annotation
.end field

.field protected final ownerThread:Ljava/lang/Thread;

.field protected final parameters:[Ljava/lang/String;

.field protected final sql:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;[Ljava/lang/String;)V
    .registers 5
    .param p2, "sql"    # Ljava/lang/String;
    .param p3, "parameters"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/greenrobot/dao/AbstractDao",
            "<TT;*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lde/greenrobot/dao/query/AbstractQuery;, "Lde/greenrobot/dao/query/AbstractQuery<TT;>;"
    .local p1, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lde/greenrobot/dao/query/AbstractQuery;->dao:Lde/greenrobot/dao/AbstractDao;

    .line 54
    new-instance v0, Lde/greenrobot/dao/InternalQueryDaoAccess;

    invoke-direct {v0, p1}, Lde/greenrobot/dao/InternalQueryDaoAccess;-><init>(Lde/greenrobot/dao/AbstractDao;)V

    iput-object v0, p0, Lde/greenrobot/dao/query/AbstractQuery;->daoAccess:Lde/greenrobot/dao/InternalQueryDaoAccess;

    .line 55
    iput-object p2, p0, Lde/greenrobot/dao/query/AbstractQuery;->sql:Ljava/lang/String;

    .line 56
    iput-object p3, p0, Lde/greenrobot/dao/query/AbstractQuery;->parameters:[Ljava/lang/String;

    .line 57
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lde/greenrobot/dao/query/AbstractQuery;->ownerThread:Ljava/lang/Thread;

    .line 58
    return-void
.end method

.method protected static toStringArray([Ljava/lang/Object;)[Ljava/lang/String;
    .registers 6
    .param p0, "values"    # [Ljava/lang/Object;

    .prologue
    .line 39
    array-length v1, p0

    .line 40
    .local v1, "length":I
    new-array v3, v1, [Ljava/lang/String;

    .line 41
    .local v3, "strings":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    if-ge v0, v1, :cond_17

    .line 42
    aget-object v2, p0, v0

    .line 43
    .local v2, "object":Ljava/lang/Object;
    if-eqz v2, :cond_13

    .line 44
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v0

    .line 41
    :goto_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 46
    :cond_13
    const/4 v4, 0x0

    aput-object v4, v3, v0

    goto :goto_10

    .line 49
    .end local v2    # "object":Ljava/lang/Object;
    :cond_17
    return-object v3
.end method


# virtual methods
.method protected checkThread()V
    .registers 3

    .prologue
    .line 77
    .local p0, "this":Lde/greenrobot/dao/query/AbstractQuery;, "Lde/greenrobot/dao/query/AbstractQuery<TT;>;"
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lde/greenrobot/dao/query/AbstractQuery;->ownerThread:Ljava/lang/Thread;

    if-eq v0, v1, :cond_10

    .line 78
    new-instance v0, Lde/greenrobot/dao/DaoException;

    const-string v1, "Method may be called only in owner thread, use forCurrentThread to get an instance for this thread"

    invoke-direct {v0, v1}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 81
    :cond_10
    return-void
.end method

.method public setParameter(ILjava/lang/Object;)V
    .registers 5
    .param p1, "index"    # I
    .param p2, "parameter"    # Ljava/lang/Object;

    .prologue
    .line 68
    .local p0, "this":Lde/greenrobot/dao/query/AbstractQuery;, "Lde/greenrobot/dao/query/AbstractQuery<TT;>;"
    invoke-virtual {p0}, Lde/greenrobot/dao/query/AbstractQuery;->checkThread()V

    .line 69
    if-eqz p2, :cond_e

    .line 70
    iget-object v0, p0, Lde/greenrobot/dao/query/AbstractQuery;->parameters:[Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, p1

    .line 74
    :goto_d
    return-void

    .line 72
    :cond_e
    iget-object v0, p0, Lde/greenrobot/dao/query/AbstractQuery;->parameters:[Ljava/lang/String;

    const/4 v1, 0x0

    aput-object v1, v0, p1

    goto :goto_d
.end method
