.class Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ByteArrayConverter;
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
    name = "ByteArrayConverter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lnl/qbusict/cupboard/convert/FieldConverter",
        "<[B>;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 210
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V
    .registers 2
    .param p1, "x0"    # Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;

    .prologue
    .line 210
    invoke-direct {p0}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ByteArrayConverter;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic fromCursorValue(Landroid/database/Cursor;I)Ljava/lang/Object;
    .registers 4
    .param p1, "x0"    # Landroid/database/Cursor;
    .param p2, "x1"    # I

    .prologue
    .line 210
    invoke-virtual {p0, p1, p2}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ByteArrayConverter;->fromCursorValue(Landroid/database/Cursor;I)[B

    move-result-object v0

    return-object v0
.end method

.method public fromCursorValue(Landroid/database/Cursor;I)[B
    .registers 4
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "columnIndex"    # I

    .prologue
    .line 213
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0

    return-object v0
.end method

.method public getColumnType()Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;
    .registers 2

    .prologue
    .line 223
    sget-object v0, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->BLOB:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    return-object v0
.end method

.method public bridge synthetic toContentValue(Ljava/lang/Object;Ljava/lang/String;Landroid/content/ContentValues;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Landroid/content/ContentValues;

    .prologue
    .line 210
    check-cast p1, [B

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ByteArrayConverter;->toContentValue([BLjava/lang/String;Landroid/content/ContentValues;)V

    return-void
.end method

.method public toContentValue([BLjava/lang/String;Landroid/content/ContentValues;)V
    .registers 4
    .param p1, "value"    # [B
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 218
    invoke-virtual {p3, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 219
    return-void
.end method
