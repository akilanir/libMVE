.class public Lnl/qbusict/cupboard/internal/convert/EntityFieldConverterFactory;
.super Ljava/lang/Object;
.source "EntityFieldConverterFactory.java"

# interfaces
.implements Lnl/qbusict/cupboard/convert/FieldConverterFactory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnl/qbusict/cupboard/internal/convert/EntityFieldConverterFactory$EntityFieldConverter;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method


# virtual methods
.method public create(Lnl/qbusict/cupboard/Cupboard;Ljava/lang/reflect/Type;)Lnl/qbusict/cupboard/convert/FieldConverter;
    .registers 6
    .param p1, "cupboard"    # Lnl/qbusict/cupboard/Cupboard;
    .param p2, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnl/qbusict/cupboard/Cupboard;",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lnl/qbusict/cupboard/convert/FieldConverter",
            "<*>;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 68
    instance-of v1, p2, Ljava/lang/Class;

    if-nez v1, :cond_7

    move-object v1, v2

    .line 75
    .end local p2    # "type":Ljava/lang/reflect/Type;
    :goto_6
    return-object v1

    .restart local p2    # "type":Ljava/lang/reflect/Type;
    :cond_7
    move-object v1, p2

    .line 71
    check-cast v1, Ljava/lang/Class;

    invoke-virtual {p1, v1}, Lnl/qbusict/cupboard/Cupboard;->isRegisteredEntity(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_1f

    move-object v1, p2

    .line 72
    check-cast v1, Ljava/lang/Class;

    invoke-virtual {p1, v1}, Lnl/qbusict/cupboard/Cupboard;->getEntityConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    .line 73
    .local v0, "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<*>;"
    new-instance v1, Lnl/qbusict/cupboard/internal/convert/EntityFieldConverterFactory$EntityFieldConverter;

    check-cast p2, Ljava/lang/Class;

    .end local p2    # "type":Ljava/lang/reflect/Type;
    invoke-direct {v1, p2, v0}, Lnl/qbusict/cupboard/internal/convert/EntityFieldConverterFactory$EntityFieldConverter;-><init>(Ljava/lang/Class;Lnl/qbusict/cupboard/convert/EntityConverter;)V

    goto :goto_6

    .end local v0    # "converter":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<*>;"
    .restart local p2    # "type":Ljava/lang/reflect/Type;
    :cond_1f
    move-object v1, v2

    .line 75
    goto :goto_6
.end method
