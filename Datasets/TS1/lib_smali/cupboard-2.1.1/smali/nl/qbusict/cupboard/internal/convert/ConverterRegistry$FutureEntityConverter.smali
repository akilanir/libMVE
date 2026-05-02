.class Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;
.super Ljava/lang/Object;
.source "ConverterRegistry.java"

# interfaces
.implements Lnl/qbusict/cupboard/convert/EntityConverter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FutureEntityConverter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lnl/qbusict/cupboard/convert/EntityConverter",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private mDelegate:Lnl/qbusict/cupboard/convert/EntityConverter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lnl/qbusict/cupboard/convert/EntityConverter",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 93
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$1;)V
    .registers 2
    .param p1, "x0"    # Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$1;

    .prologue
    .line 93
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter<TT;>;"
    invoke-direct {p0}, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;-><init>()V

    return-void
.end method


# virtual methods
.method public fromCursor(Landroid/database/Cursor;)Ljava/lang/Object;
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
    .line 98
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;->mDelegate:Lnl/qbusict/cupboard/convert/EntityConverter;

    if-nez v0, :cond_a

    .line 99
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 101
    :cond_a
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;->mDelegate:Lnl/qbusict/cupboard/convert/EntityConverter;

    invoke-interface {v0, p1}, Lnl/qbusict/cupboard/convert/EntityConverter;->fromCursor(Landroid/database/Cursor;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getColumns()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lnl/qbusict/cupboard/convert/EntityConverter$Column;",
            ">;"
        }
    .end annotation

    .prologue
    .line 114
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;->mDelegate:Lnl/qbusict/cupboard/convert/EntityConverter;

    if-nez v0, :cond_a

    .line 115
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 117
    :cond_a
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;->mDelegate:Lnl/qbusict/cupboard/convert/EntityConverter;

    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/EntityConverter;->getColumns()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getId(Ljava/lang/Object;)Ljava/lang/Long;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/lang/Long;"
        }
    .end annotation

    .prologue
    .line 130
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter<TT;>;"
    .local p1, "instance":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;->mDelegate:Lnl/qbusict/cupboard/convert/EntityConverter;

    if-nez v0, :cond_a

    .line 131
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 133
    :cond_a
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;->mDelegate:Lnl/qbusict/cupboard/convert/EntityConverter;

    invoke-interface {v0, p1}, Lnl/qbusict/cupboard/convert/EntityConverter;->getId(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public getTable()Ljava/lang/String;
    .registers 2

    .prologue
    .line 138
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;->mDelegate:Lnl/qbusict/cupboard/convert/EntityConverter;

    if-nez v0, :cond_a

    .line 139
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 141
    :cond_a
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;->mDelegate:Lnl/qbusict/cupboard/convert/EntityConverter;

    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/EntityConverter;->getTable()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method setDelegate(Lnl/qbusict/cupboard/convert/EntityConverter;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnl/qbusict/cupboard/convert/EntityConverter",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 145
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter<TT;>;"
    .local p1, "delegate":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;->mDelegate:Lnl/qbusict/cupboard/convert/EntityConverter;

    if-eqz v0, :cond_a

    .line 146
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 148
    :cond_a
    iput-object p1, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;->mDelegate:Lnl/qbusict/cupboard/convert/EntityConverter;

    .line 149
    return-void
.end method

.method public setId(Ljava/lang/Long;Ljava/lang/Object;)V
    .registers 4
    .param p1, "id"    # Ljava/lang/Long;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Long;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 122
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter<TT;>;"
    .local p2, "instance":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;->mDelegate:Lnl/qbusict/cupboard/convert/EntityConverter;

    if-nez v0, :cond_a

    .line 123
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 125
    :cond_a
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;->mDelegate:Lnl/qbusict/cupboard/convert/EntityConverter;

    invoke-interface {v0, p1, p2}, Lnl/qbusict/cupboard/convert/EntityConverter;->setId(Ljava/lang/Long;Ljava/lang/Object;)V

    .line 126
    return-void
.end method

.method public toValues(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .registers 4
    .param p2, "values"    # Landroid/content/ContentValues;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/content/ContentValues;",
            ")V"
        }
    .end annotation

    .prologue
    .line 106
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter<TT;>;"
    .local p1, "object":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;->mDelegate:Lnl/qbusict/cupboard/convert/EntityConverter;

    if-nez v0, :cond_a

    .line 107
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 109
    :cond_a
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;->mDelegate:Lnl/qbusict/cupboard/convert/EntityConverter;

    invoke-interface {v0, p1, p2}, Lnl/qbusict/cupboard/convert/EntityConverter;->toValues(Ljava/lang/Object;Landroid/content/ContentValues;)V

    .line 110
    return-void
.end method
