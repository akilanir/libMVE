.class public Lnl/qbusict/cupboard/QueryResultIterable;
.super Ljava/lang/Object;
.source "QueryResultIterable.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final mCursor:Landroid/database/Cursor;

.field private final mPosition:I

.field private final mTranslator:Lnl/qbusict/cupboard/convert/EntityConverter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lnl/qbusict/cupboard/convert/EntityConverter",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/database/Cursor;Lnl/qbusict/cupboard/convert/EntityConverter;)V
    .registers 5
    .param p1, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "Lnl/qbusict/cupboard/convert/EntityConverter",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lnl/qbusict/cupboard/QueryResultIterable;, "Lnl/qbusict/cupboard/QueryResultIterable<TT;>;"
    .local p2, "translator":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<TT;>;"
    const/4 v1, -0x1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    invoke-interface {p1}, Landroid/database/Cursor;->getPosition()I

    move-result v0

    if-le v0, v1, :cond_15

    .line 35
    invoke-interface {p1}, Landroid/database/Cursor;->getPosition()I

    move-result v0

    iput v0, p0, Lnl/qbusict/cupboard/QueryResultIterable;->mPosition:I

    .line 39
    :goto_10
    iput-object p1, p0, Lnl/qbusict/cupboard/QueryResultIterable;->mCursor:Landroid/database/Cursor;

    .line 40
    iput-object p2, p0, Lnl/qbusict/cupboard/QueryResultIterable;->mTranslator:Lnl/qbusict/cupboard/convert/EntityConverter;

    .line 41
    return-void

    .line 37
    :cond_15
    iput v1, p0, Lnl/qbusict/cupboard/QueryResultIterable;->mPosition:I

    goto :goto_10
.end method


# virtual methods
.method public close()V
    .registers 2

    .prologue
    .line 50
    .local p0, "this":Lnl/qbusict/cupboard/QueryResultIterable;, "Lnl/qbusict/cupboard/QueryResultIterable<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/QueryResultIterable;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_d

    .line 51
    iget-object v0, p0, Lnl/qbusict/cupboard/QueryResultIterable;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 53
    :cond_d
    return-void
.end method

.method public get()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 60
    .local p0, "this":Lnl/qbusict/cupboard/QueryResultIterable;, "Lnl/qbusict/cupboard/QueryResultIterable<TT;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lnl/qbusict/cupboard/QueryResultIterable;->get(Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public get(Z)Ljava/lang/Object;
    .registers 4
    .param p1, "close"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .prologue
    .line 65
    .local p0, "this":Lnl/qbusict/cupboard/QueryResultIterable;, "Lnl/qbusict/cupboard/QueryResultIterable<TT;>;"
    :try_start_0
    invoke-virtual {p0}, Lnl/qbusict/cupboard/QueryResultIterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 66
    .local v0, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<TT;>;"
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 67
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    :try_end_d
    .catchall {:try_start_0 .. :try_end_d} :catchall_1b

    move-result-object v1

    .line 72
    if-eqz p1, :cond_13

    .line 73
    invoke-virtual {p0}, Lnl/qbusict/cupboard/QueryResultIterable;->close()V

    :cond_13
    :goto_13
    return-object v1

    .line 69
    :cond_14
    const/4 v1, 0x0

    .line 72
    if-eqz p1, :cond_13

    .line 73
    invoke-virtual {p0}, Lnl/qbusict/cupboard/QueryResultIterable;->close()V

    goto :goto_13

    .line 72
    .end local v0    # "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<TT;>;"
    :catchall_1b
    move-exception v1

    if-eqz p1, :cond_21

    .line 73
    invoke-virtual {p0}, Lnl/qbusict/cupboard/QueryResultIterable;->close()V

    :cond_21
    throw v1
.end method

.method public getCursor()Landroid/database/Cursor;
    .registers 2

    .prologue
    .line 56
    .local p0, "this":Lnl/qbusict/cupboard/QueryResultIterable;, "Lnl/qbusict/cupboard/QueryResultIterable<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/QueryResultIterable;->mCursor:Landroid/database/Cursor;

    return-object v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 45
    .local p0, "this":Lnl/qbusict/cupboard/QueryResultIterable;, "Lnl/qbusict/cupboard/QueryResultIterable<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/QueryResultIterable;->mCursor:Landroid/database/Cursor;

    iget v1, p0, Lnl/qbusict/cupboard/QueryResultIterable;->mPosition:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 46
    new-instance v0, Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator;

    iget-object v1, p0, Lnl/qbusict/cupboard/QueryResultIterable;->mCursor:Landroid/database/Cursor;

    iget-object v2, p0, Lnl/qbusict/cupboard/QueryResultIterable;->mTranslator:Lnl/qbusict/cupboard/convert/EntityConverter;

    invoke-direct {v0, v1, v2}, Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator;-><init>(Landroid/database/Cursor;Lnl/qbusict/cupboard/convert/EntityConverter;)V

    return-object v0
.end method

.method public list()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 85
    .local p0, "this":Lnl/qbusict/cupboard/QueryResultIterable;, "Lnl/qbusict/cupboard/QueryResultIterable<TT;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lnl/qbusict/cupboard/QueryResultIterable;->list(Z)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public list(Z)Ljava/util/List;
    .registers 6
    .param p1, "close"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 95
    .local p0, "this":Lnl/qbusict/cupboard/QueryResultIterable;, "Lnl/qbusict/cupboard/QueryResultIterable<TT;>;"
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lnl/qbusict/cupboard/QueryResultIterable;->mCursor:Landroid/database/Cursor;

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 97
    .local v2, "result":Ljava/util/List;, "Ljava/util/List<TT;>;"
    :try_start_b
    invoke-virtual {p0}, Lnl/qbusict/cupboard/QueryResultIterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_24

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 98
    .local v1, "obj":Ljava/lang/Object;, "TT;"
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1c
    .catchall {:try_start_b .. :try_end_1c} :catchall_1d

    goto :goto_f

    .line 102
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "obj":Ljava/lang/Object;, "TT;"
    :catchall_1d
    move-exception v3

    if-eqz p1, :cond_23

    .line 103
    invoke-virtual {p0}, Lnl/qbusict/cupboard/QueryResultIterable;->close()V

    :cond_23
    throw v3

    .line 102
    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_24
    if-eqz p1, :cond_29

    .line 103
    invoke-virtual {p0}, Lnl/qbusict/cupboard/QueryResultIterable;->close()V

    :cond_29
    return-object v2
.end method
