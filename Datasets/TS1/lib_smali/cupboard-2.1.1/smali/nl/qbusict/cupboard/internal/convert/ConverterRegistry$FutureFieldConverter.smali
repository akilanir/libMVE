.class Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;
.super Ljava/lang/Object;
.source "ConverterRegistry.java"

# interfaces
.implements Lnl/qbusict/cupboard/convert/FieldConverter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FutureFieldConverter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lnl/qbusict/cupboard/convert/FieldConverter",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private mDelegate:Lnl/qbusict/cupboard/convert/FieldConverter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lnl/qbusict/cupboard/convert/FieldConverter",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 58
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$1;)V
    .registers 2
    .param p1, "x0"    # Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$1;

    .prologue
    .line 58
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter<TT;>;"
    invoke-direct {p0}, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;-><init>()V

    return-void
.end method


# virtual methods
.method public fromCursorValue(Landroid/database/Cursor;I)Ljava/lang/Object;
    .registers 4
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "columnIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "I)TT;"
        }
    .end annotation

    .prologue
    .line 63
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;->mDelegate:Lnl/qbusict/cupboard/convert/FieldConverter;

    if-nez v0, :cond_a

    .line 64
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 66
    :cond_a
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;->mDelegate:Lnl/qbusict/cupboard/convert/FieldConverter;

    invoke-interface {v0, p1, p2}, Lnl/qbusict/cupboard/convert/FieldConverter;->fromCursorValue(Landroid/database/Cursor;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getColumnType()Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;
    .registers 2

    .prologue
    .line 79
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;->mDelegate:Lnl/qbusict/cupboard/convert/FieldConverter;

    if-nez v0, :cond_a

    .line 80
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 82
    :cond_a
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;->mDelegate:Lnl/qbusict/cupboard/convert/FieldConverter;

    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/FieldConverter;->getColumnType()Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    move-result-object v0

    return-object v0
.end method

.method setDelegate(Lnl/qbusict/cupboard/convert/FieldConverter;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnl/qbusict/cupboard/convert/FieldConverter",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 86
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter<TT;>;"
    .local p1, "delegate":Lnl/qbusict/cupboard/convert/FieldConverter;, "Lnl/qbusict/cupboard/convert/FieldConverter<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;->mDelegate:Lnl/qbusict/cupboard/convert/FieldConverter;

    if-eqz v0, :cond_a

    .line 87
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 89
    :cond_a
    iput-object p1, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;->mDelegate:Lnl/qbusict/cupboard/convert/FieldConverter;

    .line 90
    return-void
.end method

.method public toContentValue(Ljava/lang/Object;Ljava/lang/String;Landroid/content/ContentValues;)V
    .registers 5
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "values"    # Landroid/content/ContentValues;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/String;",
            "Landroid/content/ContentValues;",
            ")V"
        }
    .end annotation

    .prologue
    .line 71
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;->mDelegate:Lnl/qbusict/cupboard/convert/FieldConverter;

    if-nez v0, :cond_a

    .line 72
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 74
    :cond_a
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;->mDelegate:Lnl/qbusict/cupboard/convert/FieldConverter;

    invoke-interface {v0, p1, p2, p3}, Lnl/qbusict/cupboard/convert/FieldConverter;->toContentValue(Ljava/lang/Object;Ljava/lang/String;Landroid/content/ContentValues;)V

    .line 75
    return-void
.end method
