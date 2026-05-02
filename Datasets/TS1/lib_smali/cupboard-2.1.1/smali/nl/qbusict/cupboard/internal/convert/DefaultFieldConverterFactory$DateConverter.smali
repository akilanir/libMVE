.class Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$DateConverter;
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
    name = "DateConverter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lnl/qbusict/cupboard/convert/FieldConverter",
        "<",
        "Ljava/util/Date;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 248
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V
    .registers 2
    .param p1, "x0"    # Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;

    .prologue
    .line 248
    invoke-direct {p0}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$DateConverter;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic fromCursorValue(Landroid/database/Cursor;I)Ljava/lang/Object;
    .registers 4
    .param p1, "x0"    # Landroid/database/Cursor;
    .param p2, "x1"    # I

    .prologue
    .line 248
    invoke-virtual {p0, p1, p2}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$DateConverter;->fromCursorValue(Landroid/database/Cursor;I)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public fromCursorValue(Landroid/database/Cursor;I)Ljava/util/Date;
    .registers 6
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "columnIndex"    # I

    .prologue
    .line 251
    new-instance v0, Ljava/util/Date;

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getColumnType()Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;
    .registers 2

    .prologue
    .line 261
    sget-object v0, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->INTEGER:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    return-object v0
.end method

.method public bridge synthetic toContentValue(Ljava/lang/Object;Ljava/lang/String;Landroid/content/ContentValues;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Landroid/content/ContentValues;

    .prologue
    .line 248
    check-cast p1, Ljava/util/Date;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$DateConverter;->toContentValue(Ljava/util/Date;Ljava/lang/String;Landroid/content/ContentValues;)V

    return-void
.end method

.method public toContentValue(Ljava/util/Date;Ljava/lang/String;Landroid/content/ContentValues;)V
    .registers 6
    .param p1, "value"    # Ljava/util/Date;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 256
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p3, p2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 257
    return-void
.end method
