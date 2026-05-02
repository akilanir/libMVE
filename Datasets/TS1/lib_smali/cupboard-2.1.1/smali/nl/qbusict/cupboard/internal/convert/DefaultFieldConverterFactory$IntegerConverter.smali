.class Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$IntegerConverter;
.super Ljava/lang/Object;
.source "DefaultFieldConverterFactory.java"

# interfaces
.implements Lnl/qbusict/cupboard/convert/FieldConverter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "IntegerConverter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lnl/qbusict/cupboard/convert/FieldConverter",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V
    .registers 2
    .param p1, "x0"    # Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;

    .prologue
    .line 108
    invoke-direct {p0}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$IntegerConverter;-><init>()V

    return-void
.end method


# virtual methods
.method public fromCursorValue(Landroid/database/Cursor;I)Ljava/lang/Integer;
    .registers 4
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "columnIndex"    # I

    .prologue
    .line 111
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic fromCursorValue(Landroid/database/Cursor;I)Ljava/lang/Object;
    .registers 4
    .param p1, "x0"    # Landroid/database/Cursor;
    .param p2, "x1"    # I

    .prologue
    .line 108
    invoke-virtual {p0, p1, p2}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$IntegerConverter;->fromCursorValue(Landroid/database/Cursor;I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getColumnType()Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;
    .registers 2

    .prologue
    .line 121
    sget-object v0, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->INTEGER:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    return-object v0
.end method

.method public toContentValue(Ljava/lang/Integer;Ljava/lang/String;Landroid/content/ContentValues;)V
    .registers 4
    .param p1, "value"    # Ljava/lang/Integer;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 116
    invoke-virtual {p3, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 117
    return-void
.end method

.method public bridge synthetic toContentValue(Ljava/lang/Object;Ljava/lang/String;Landroid/content/ContentValues;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Landroid/content/ContentValues;

    .prologue
    .line 108
    check-cast p1, Ljava/lang/Integer;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$IntegerConverter;->toContentValue(Ljava/lang/Integer;Ljava/lang/String;Landroid/content/ContentValues;)V

    return-void
.end method
