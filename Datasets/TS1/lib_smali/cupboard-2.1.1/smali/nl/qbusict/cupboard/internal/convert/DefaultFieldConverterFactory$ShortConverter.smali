.class Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ShortConverter;
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
    name = "ShortConverter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lnl/qbusict/cupboard/convert/FieldConverter",
        "<",
        "Ljava/lang/Short;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;)V
    .registers 2
    .param p1, "x0"    # Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$1;

    .prologue
    .line 142
    invoke-direct {p0}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ShortConverter;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic fromCursorValue(Landroid/database/Cursor;I)Ljava/lang/Object;
    .registers 4
    .param p1, "x0"    # Landroid/database/Cursor;
    .param p2, "x1"    # I

    .prologue
    .line 142
    invoke-virtual {p0, p1, p2}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ShortConverter;->fromCursorValue(Landroid/database/Cursor;I)Ljava/lang/Short;

    move-result-object v0

    return-object v0
.end method

.method public fromCursorValue(Landroid/database/Cursor;I)Ljava/lang/Short;
    .registers 4
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "columnIndex"    # I

    .prologue
    .line 145
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getShort(I)S

    move-result v0

    invoke-static {v0}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v0

    return-object v0
.end method

.method public getColumnType()Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;
    .registers 2

    .prologue
    .line 155
    sget-object v0, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->REAL:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    return-object v0
.end method

.method public bridge synthetic toContentValue(Ljava/lang/Object;Ljava/lang/String;Landroid/content/ContentValues;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Landroid/content/ContentValues;

    .prologue
    .line 142
    check-cast p1, Ljava/lang/Short;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory$ShortConverter;->toContentValue(Ljava/lang/Short;Ljava/lang/String;Landroid/content/ContentValues;)V

    return-void
.end method

.method public toContentValue(Ljava/lang/Short;Ljava/lang/String;Landroid/content/ContentValues;)V
    .registers 4
    .param p1, "value"    # Ljava/lang/Short;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 150
    invoke-virtual {p3, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Short;)V

    .line 151
    return-void
.end method
