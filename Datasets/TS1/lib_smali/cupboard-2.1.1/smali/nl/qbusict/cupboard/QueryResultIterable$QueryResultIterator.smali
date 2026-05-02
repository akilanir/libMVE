.class Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator;
.super Ljava/lang/Object;
.source "QueryResultIterable.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnl/qbusict/cupboard/QueryResultIterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "QueryResultIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<TE;>;"
    }
.end annotation


# instance fields
.field private final mCursor:Landroid/database/Cursor;

.field private mHasNext:Z

.field private final mTranslator:Lnl/qbusict/cupboard/convert/EntityConverter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lnl/qbusict/cupboard/convert/EntityConverter",
            "<TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/database/Cursor;Lnl/qbusict/cupboard/convert/EntityConverter;)V
    .registers 5
    .param p1, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "Lnl/qbusict/cupboard/convert/EntityConverter",
            "<TE;>;)V"
        }
    .end annotation

    .prologue
    .line 113
    .local p0, "this":Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator;, "Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator<TE;>;"
    .local p2, "translator":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<TE;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    new-instance v0, Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;

    invoke-interface {p2}, Lnl/qbusict/cupboard/convert/EntityConverter;->getColumns()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;-><init>(Landroid/database/Cursor;Ljava/util/List;)V

    iput-object v0, p0, Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator;->mCursor:Landroid/database/Cursor;

    .line 115
    iput-object p2, p0, Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator;->mTranslator:Lnl/qbusict/cupboard/convert/EntityConverter;

    .line 116
    invoke-interface {p1}, Landroid/database/Cursor;->getPosition()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1e

    .line 118
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    iput-boolean v0, p0, Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator;->mHasNext:Z

    .line 123
    :goto_1d
    return-void

    .line 121
    :cond_1e
    invoke-interface {p1}, Landroid/database/Cursor;->getPosition()I

    move-result v0

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-ge v0, v1, :cond_2c

    const/4 v0, 0x1

    :goto_29
    iput-boolean v0, p0, Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator;->mHasNext:Z

    goto :goto_1d

    :cond_2c
    const/4 v0, 0x0

    goto :goto_29
.end method


# virtual methods
.method public hasNext()Z
    .registers 2

    .prologue
    .line 127
    .local p0, "this":Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator;, "Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator<TE;>;"
    iget-boolean v0, p0, Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator;->mHasNext:Z

    return v0
.end method

.method public next()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 132
    .local p0, "this":Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator;, "Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator<TE;>;"
    iget-boolean v1, p0, Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator;->mHasNext:Z

    if-nez v1, :cond_a

    .line 133
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 135
    :cond_a
    iget-object v1, p0, Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator;->mTranslator:Lnl/qbusict/cupboard/convert/EntityConverter;

    iget-object v2, p0, Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator;->mCursor:Landroid/database/Cursor;

    invoke-interface {v1, v2}, Lnl/qbusict/cupboard/convert/EntityConverter;->fromCursor(Landroid/database/Cursor;)Ljava/lang/Object;

    move-result-object v0

    .line 136
    .local v0, "elem":Ljava/lang/Object;, "TE;"
    iget-object v1, p0, Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator;->mCursor:Landroid/database/Cursor;

    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    iput-boolean v1, p0, Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator;->mHasNext:Z

    .line 137
    return-object v0
.end method

.method public remove()V
    .registers 2

    .prologue
    .line 142
    .local p0, "this":Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator;, "Lnl/qbusict/cupboard/QueryResultIterable$QueryResultIterator<TE;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
