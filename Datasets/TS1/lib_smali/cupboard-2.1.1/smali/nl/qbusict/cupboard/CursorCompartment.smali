.class public Lnl/qbusict/cupboard/CursorCompartment;
.super Lnl/qbusict/cupboard/BaseCompartment;
.source "CursorCompartment.java"


# instance fields
.field private final mCursor:Landroid/database/Cursor;


# direct methods
.method protected constructor <init>(Lnl/qbusict/cupboard/Cupboard;Landroid/database/Cursor;)V
    .registers 3
    .param p1, "cupboard"    # Lnl/qbusict/cupboard/Cupboard;
    .param p2, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lnl/qbusict/cupboard/BaseCompartment;-><init>(Lnl/qbusict/cupboard/Cupboard;)V

    .line 46
    iput-object p2, p0, Lnl/qbusict/cupboard/CursorCompartment;->mCursor:Landroid/database/Cursor;

    .line 47
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 67
    .local p1, "clz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, p1}, Lnl/qbusict/cupboard/CursorCompartment;->iterate(Ljava/lang/Class;)Lnl/qbusict/cupboard/QueryResultIterable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnl/qbusict/cupboard/QueryResultIterable;->get(Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public iterate(Ljava/lang/Class;)Lnl/qbusict/cupboard/QueryResultIterable;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lnl/qbusict/cupboard/QueryResultIterable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 56
    .local p1, "clz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, p1}, Lnl/qbusict/cupboard/CursorCompartment;->getConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    .line 57
    .local v0, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<TT;>;"
    new-instance v1, Lnl/qbusict/cupboard/QueryResultIterable;

    iget-object v2, p0, Lnl/qbusict/cupboard/CursorCompartment;->mCursor:Landroid/database/Cursor;

    invoke-direct {v1, v2, v0}, Lnl/qbusict/cupboard/QueryResultIterable;-><init>(Landroid/database/Cursor;Lnl/qbusict/cupboard/convert/EntityConverter;)V

    return-object v1
.end method

.method public list(Ljava/lang/Class;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 78
    .local p1, "clz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, p1}, Lnl/qbusict/cupboard/CursorCompartment;->iterate(Ljava/lang/Class;)Lnl/qbusict/cupboard/QueryResultIterable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnl/qbusict/cupboard/QueryResultIterable;->list(Z)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
