.class Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter;
.super Ljava/lang/Object;
.source "EnumFieldConverterFactory.java"

# interfaces
.implements Lnl/qbusict/cupboard/convert/FieldConverter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EnumConverter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Enum;",
        ">",
        "Ljava/lang/Object;",
        "Lnl/qbusict/cupboard/convert/FieldConverter",
        "<TE;>;"
    }
.end annotation


# instance fields
.field private final mEnumClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TE;>;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter;, "Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter<TE;>;"
    .local p1, "enumClass":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter;->mEnumClass:Ljava/lang/Class;

    .line 36
    return-void
.end method


# virtual methods
.method public fromCursorValue(Landroid/database/Cursor;I)Ljava/lang/Enum;
    .registers 5
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "columnIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "I)TE;"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter;, "Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter<TE;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter;->mEnumClass:Ljava/lang/Class;

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic fromCursorValue(Landroid/database/Cursor;I)Ljava/lang/Object;
    .registers 4
    .param p1, "x0"    # Landroid/database/Cursor;
    .param p2, "x1"    # I

    .prologue
    .line 30
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter;, "Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter<TE;>;"
    invoke-virtual {p0, p1, p2}, Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter;->fromCursorValue(Landroid/database/Cursor;I)Ljava/lang/Enum;

    move-result-object v0

    return-object v0
.end method

.method public getColumnType()Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;
    .registers 2

    .prologue
    .line 50
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter;, "Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter<TE;>;"
    sget-object v0, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->TEXT:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    return-object v0
.end method

.method public toContentValue(Ljava/lang/Enum;Ljava/lang/String;Landroid/content/ContentValues;)V
    .registers 5
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "values"    # Landroid/content/ContentValues;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Ljava/lang/String;",
            "Landroid/content/ContentValues;",
            ")V"
        }
    .end annotation

    .prologue
    .line 45
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter;, "Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter<TE;>;"
    .local p1, "value":Ljava/lang/Enum;, "TE;"
    invoke-virtual {p1}, Ljava/lang/Enum;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, p2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    return-void
.end method

.method public bridge synthetic toContentValue(Ljava/lang/Object;Ljava/lang/String;Landroid/content/ContentValues;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Landroid/content/ContentValues;

    .prologue
    .line 30
    .local p0, "this":Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter;, "Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter<TE;>;"
    check-cast p1, Ljava/lang/Enum;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter;->toContentValue(Ljava/lang/Enum;Ljava/lang/String;Landroid/content/ContentValues;)V

    return-void
.end method
