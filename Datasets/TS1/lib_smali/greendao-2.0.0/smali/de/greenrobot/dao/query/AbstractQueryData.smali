.class abstract Lde/greenrobot/dao/query/AbstractQueryData;
.super Ljava/lang/Object;
.source "AbstractQueryData.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "Q:",
        "Lde/greenrobot/dao/query/AbstractQuery",
        "<TT;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final dao:Lde/greenrobot/dao/AbstractDao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/AbstractDao",
            "<TT;*>;"
        }
    .end annotation
.end field

.field final initialValues:[Ljava/lang/String;

.field final queriesForThreads:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<TQ;>;>;"
        }
    .end annotation
.end field

.field final sql:Ljava/lang/String;


# direct methods
.method constructor <init>(Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;[Ljava/lang/String;)V
    .registers 5
    .param p2, "sql"    # Ljava/lang/String;
    .param p3, "initialValues"    # [Ljava/lang/String;
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
    .line 15
    .local p0, "this":Lde/greenrobot/dao/query/AbstractQueryData;, "Lde/greenrobot/dao/query/AbstractQueryData<TT;TQ;>;"
    .local p1, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lde/greenrobot/dao/query/AbstractQueryData;->dao:Lde/greenrobot/dao/AbstractDao;

    .line 17
    iput-object p2, p0, Lde/greenrobot/dao/query/AbstractQueryData;->sql:Ljava/lang/String;

    .line 18
    iput-object p3, p0, Lde/greenrobot/dao/query/AbstractQueryData;->initialValues:[Ljava/lang/String;

    .line 19
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lde/greenrobot/dao/query/AbstractQueryData;->queriesForThreads:Landroid/util/SparseArray;

    .line 20
    return-void
.end method


# virtual methods
.method protected abstract createQuery()Lde/greenrobot/dao/query/AbstractQuery;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TQ;"
        }
    .end annotation
.end method

.method forCurrentThread()Lde/greenrobot/dao/query/AbstractQuery;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TQ;"
        }
    .end annotation

    .prologue
    .line 33
    .local p0, "this":Lde/greenrobot/dao/query/AbstractQueryData;, "Lde/greenrobot/dao/query/AbstractQueryData<TT;TQ;>;"
    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v2

    .line 34
    .local v2, "threadId":I
    iget-object v4, p0, Lde/greenrobot/dao/query/AbstractQueryData;->queriesForThreads:Landroid/util/SparseArray;

    monitor-enter v4

    .line 35
    :try_start_7
    iget-object v3, p0, Lde/greenrobot/dao/query/AbstractQueryData;->queriesForThreads:Landroid/util/SparseArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 36
    .local v1, "queryRef":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<TQ;>;"
    if-eqz v1, :cond_2d

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lde/greenrobot/dao/query/AbstractQuery;

    move-object v0, v3

    .line 37
    .local v0, "query":Lde/greenrobot/dao/query/AbstractQuery;, "TQ;"
    :goto_18
    if-nez v0, :cond_2f

    .line 38
    invoke-virtual {p0}, Lde/greenrobot/dao/query/AbstractQueryData;->gc()V

    .line 39
    invoke-virtual {p0}, Lde/greenrobot/dao/query/AbstractQueryData;->createQuery()Lde/greenrobot/dao/query/AbstractQuery;

    move-result-object v0

    .line 40
    iget-object v3, p0, Lde/greenrobot/dao/query/AbstractQueryData;->queriesForThreads:Landroid/util/SparseArray;

    new-instance v5, Ljava/lang/ref/WeakReference;

    invoke-direct {v5, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v3, v2, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 44
    :goto_2b
    monitor-exit v4

    return-object v0

    .line 36
    .end local v0    # "query":Lde/greenrobot/dao/query/AbstractQuery;, "TQ;"
    :cond_2d
    const/4 v0, 0x0

    goto :goto_18

    .line 42
    .restart local v0    # "query":Lde/greenrobot/dao/query/AbstractQuery;, "TQ;"
    :cond_2f
    iget-object v3, p0, Lde/greenrobot/dao/query/AbstractQueryData;->initialValues:[Ljava/lang/String;

    const/4 v5, 0x0

    iget-object v6, v0, Lde/greenrobot/dao/query/AbstractQuery;->parameters:[Ljava/lang/String;

    const/4 v7, 0x0

    iget-object v8, p0, Lde/greenrobot/dao/query/AbstractQueryData;->initialValues:[Ljava/lang/String;

    array-length v8, v8

    invoke-static {v3, v5, v6, v7, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2b

    .line 45
    .end local v0    # "query":Lde/greenrobot/dao/query/AbstractQuery;, "TQ;"
    .end local v1    # "queryRef":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<TQ;>;"
    :catchall_3c
    move-exception v3

    monitor-exit v4
    :try_end_3e
    .catchall {:try_start_7 .. :try_end_3e} :catchall_3c

    throw v3
.end method

.method forCurrentThread(Lde/greenrobot/dao/query/AbstractQuery;)Lde/greenrobot/dao/query/AbstractQuery;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TQ;)TQ;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lde/greenrobot/dao/query/AbstractQueryData;, "Lde/greenrobot/dao/query/AbstractQueryData<TT;TQ;>;"
    .local p1, "query":Lde/greenrobot/dao/query/AbstractQuery;, "TQ;"
    const/4 v3, 0x0

    .line 24
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p1, Lde/greenrobot/dao/query/AbstractQuery;->ownerThread:Ljava/lang/Thread;

    if-ne v0, v1, :cond_14

    .line 25
    iget-object v0, p0, Lde/greenrobot/dao/query/AbstractQueryData;->initialValues:[Ljava/lang/String;

    iget-object v1, p1, Lde/greenrobot/dao/query/AbstractQuery;->parameters:[Ljava/lang/String;

    iget-object v2, p0, Lde/greenrobot/dao/query/AbstractQueryData;->initialValues:[Ljava/lang/String;

    array-length v2, v2

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 28
    .end local p1    # "query":Lde/greenrobot/dao/query/AbstractQuery;, "TQ;"
    :goto_13
    return-object p1

    .restart local p1    # "query":Lde/greenrobot/dao/query/AbstractQuery;, "TQ;"
    :cond_14
    invoke-virtual {p0}, Lde/greenrobot/dao/query/AbstractQueryData;->forCurrentThread()Lde/greenrobot/dao/query/AbstractQuery;

    move-result-object p1

    goto :goto_13
.end method

.method gc()V
    .registers 5

    .prologue
    .line 51
    .local p0, "this":Lde/greenrobot/dao/query/AbstractQueryData;, "Lde/greenrobot/dao/query/AbstractQueryData<TT;TQ;>;"
    iget-object v2, p0, Lde/greenrobot/dao/query/AbstractQueryData;->queriesForThreads:Landroid/util/SparseArray;

    monitor-enter v2

    .line 52
    :try_start_3
    iget-object v1, p0, Lde/greenrobot/dao/query/AbstractQueryData;->queriesForThreads:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_b
    if-ltz v0, :cond_29

    .line 53
    iget-object v1, p0, Lde/greenrobot/dao/query/AbstractQueryData;->queriesForThreads:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_26

    .line 54
    iget-object v1, p0, Lde/greenrobot/dao/query/AbstractQueryData;->queriesForThreads:Landroid/util/SparseArray;

    iget-object v3, p0, Lde/greenrobot/dao/query/AbstractQueryData;->queriesForThreads:Landroid/util/SparseArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/util/SparseArray;->remove(I)V

    .line 52
    :cond_26
    add-int/lit8 v0, v0, -0x1

    goto :goto_b

    .line 57
    :cond_29
    monitor-exit v2

    .line 58
    return-void

    .line 57
    .end local v0    # "i":I
    :catchall_2b
    move-exception v1

    monitor-exit v2
    :try_end_2d
    .catchall {:try_start_3 .. :try_end_2d} :catchall_2b

    throw v1
.end method
