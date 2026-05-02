.class Lnl/qbusict/cupboard/internal/convert/EntityFieldConverterFactory$EntityFieldConverter;
.super Ljava/lang/Object;
.source "EntityFieldConverterFactory.java"

# interfaces
.implements Lnl/qbusict/cupboard/convert/FieldConverter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnl/qbusict/cupboard/internal/convert/EntityFieldConverterFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EntityFieldConverter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lnl/qbusict/cupboard/convert/FieldConverter",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field private final entityClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final mEntityConverter:Lnl/qbusict/cupboard/convert/EntityConverter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lnl/qbusict/cupboard/convert/EntityConverter",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lnl/qbusict/cupboard/convert/EntityConverter;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Lnl/qbusict/cupboard/convert/EntityConverter",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p1, "clz":Ljava/lang/Class;, "Ljava/lang/Class<Ljava/lang/Object;>;"
    .local p2, "entityConverter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p2, p0, Lnl/qbusict/cupboard/internal/convert/EntityFieldConverterFactory$EntityFieldConverter;->mEntityConverter:Lnl/qbusict/cupboard/convert/EntityConverter;

    .line 37
    iput-object p1, p0, Lnl/qbusict/cupboard/internal/convert/EntityFieldConverterFactory$EntityFieldConverter;->entityClass:Ljava/lang/Class;

    .line 38
    return-void
.end method


# virtual methods
.method public fromCursorValue(Landroid/database/Cursor;I)Ljava/lang/Object;
    .registers 9
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "columnIndex"    # I

    .prologue
    .line 42
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    .line 45
    .local v2, "id":J
    :try_start_4
    iget-object v4, p0, Lnl/qbusict/cupboard/internal/convert/EntityFieldConverterFactory$EntityFieldConverter;->entityClass:Ljava/lang/Class;

    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;
    :try_end_9
    .catch Ljava/lang/IllegalAccessException; {:try_start_4 .. :try_end_9} :catch_14
    .catch Ljava/lang/InstantiationException; {:try_start_4 .. :try_end_9} :catch_1b

    move-result-object v1

    .line 51
    .local v1, "entity":Ljava/lang/Object;
    iget-object v4, p0, Lnl/qbusict/cupboard/internal/convert/EntityFieldConverterFactory$EntityFieldConverter;->mEntityConverter:Lnl/qbusict/cupboard/convert/EntityConverter;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v4, v5, v1}, Lnl/qbusict/cupboard/convert/EntityConverter;->setId(Ljava/lang/Long;Ljava/lang/Object;)V

    .line 52
    return-object v1

    .line 46
    .end local v1    # "entity":Ljava/lang/Object;
    :catch_14
    move-exception v0

    .line 47
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 48
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1b
    move-exception v0

    .line 49
    .local v0, "e":Ljava/lang/InstantiationException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public getColumnType()Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;
    .registers 2

    .prologue
    .line 62
    sget-object v0, Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;->INTEGER:Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;

    return-object v0
.end method

.method public toContentValue(Ljava/lang/Object;Ljava/lang/String;Landroid/content/ContentValues;)V
    .registers 5
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 57
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/EntityFieldConverterFactory$EntityFieldConverter;->mEntityConverter:Lnl/qbusict/cupboard/convert/EntityConverter;

    invoke-interface {v0, p1}, Lnl/qbusict/cupboard/convert/EntityConverter;->getId(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p3, p2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 58
    return-void
.end method
